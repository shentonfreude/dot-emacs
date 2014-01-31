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

;; * use 'jshint' to get single-line output format
;; * Regex and masks from https://github.com/jegbjerg/flymake-node-jshint

;; INSTALL JSHINT:
;; * use "brew install node" to get 'node', 'npm', then 'jslint' with -g global flag::
;;     brew install node
;;     npm install -g jshint   # does NOT install in /usr/local/bin/ for some reason
;;   As of node-v0.8.8, 'npm' installs jshint in a library dir, not
;;   /usr/local/bin/, you will need to add that to your path:
;;     export PATH=${PATH}:/usr/local/share/npm/bin/jshint
;;   My Alfred-launched Emacs is not finding that, then symlink it from
;;   /usr/local/bin/ so our hard-coded paths here work::
;;     ln -s /usr/local/share/npm/bin/jshint /usr/local/bin/
;;   jshint will look for ~/.jshintrc but I can't figure out how
;;   to allow "++" to be tolerated in my .js files.

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
