;; PROBLEMS
;; * jslint for rhino no longer supported by crockford,
;;   output format seems to be changing, possibly multiline.
;; * Alfred doesn't set PATH from .bashrc or .macOSX/environment.plist
;;   so we must specify full paths
;; * Node installs 'binary' /usr/local/bin/jshint
;;   but we can't find required 'node' without PATH
;; * http://www.thoughtspark.org/node/59 says flymake can't use
;;   multiline output, so we use jshint with its format, regex.

;; DEBUG
;; * use "M-x set-var flymake-log-level 3" and watch *Messages*

;; APPROACH
;; * use "brew install node" to get 'node', 'jslint', and 'jshint'
;;   installed into /usr/local/bin/
;; * use 'jshint' to get single-line output format
;; * Regex and masks from https://github.com/jegbjerg/flymake-node-jshint

(require 'flymake)

(defun flymake-jshint-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
         (local-file (file-relative-name temp-file (file-name-directory buffer-file-name))))
    (list "/usr/local/bin/node" (list "/usr/local/bin/jshint" local-file)) ;I MAY NEED CUSTOMIZATION
    ))

(add-to-list 'flymake-allowed-file-name-masks
             '("\\.js\\'" flymake-jshint-init)
             '("\\.json\\'" flymake-jshint-init))

;; We don't really need to get the filename for flymake since
;; it's using a temp file, but do it non-greedy anyway; slower? 
(setq flymake-err-line-patterns 
      (cons '("^\\(.*?\\): line \\([[:digit:]]+\\), col \\([[:digit:]]+\\), \\(.+\\)$"
	      1 2 3 4)
	    flymake-err-line-patterns))

(provide 'flymake-node-jshint)


;; and import it from your DotEmacs init-javascript.el like so:

;; (require 'flymake-node-jshint)
;; (add-hook 'javascript-mode-hook
;; 	  (lambda () (flymake-mode t)))