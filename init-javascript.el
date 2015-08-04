;;; Old espresso mode is now built-in javascript mode, js-mode.
;;; IMHO the js2 mode is too heavy handed and comlex and slow.
;;; TODO: how to trim trailing whitespace?

;; (defun before-save-hook ()
;;   (delete-trailing-whitespace)
;;   )

;; We get .js -> js-mode (not javascript-mode) for free, so add .json.
;; Why does the var have .js with squote instead of dollar?
;; ("\\.js\\'" . js-mode)
;; TODO: Can't get flymake to run with json anyway, why?? inappropriate?
(add-to-list 'auto-mode-alist '("\\.json\\'" . js-mode))

;; (require 'flymake-node-jshint)
;; (add-hook 'javascript-mode-hook
;;  	  (lambda () (flymake-mode t)))

