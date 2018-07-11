;;; Package -- summary
;;; Commentary:
;;; Old espresso mode is now built-in javascript mode, js-mode.
;;; IMHO the js2 mode is too heavy handed and comlex and slow.
;;; This is executing FlyCheck fine now, but without trailing white complaints.
;;; TODO:
;;; - how to trim trailing whitespace?
;;; (defun before-save-hook ()
;;;   (delete-trailing-whitespace)
;;;   )

;;; Code:

;; javascript-mode is free, so do it for .json.
(add-to-list 'auto-mode-alist '("\\.json\\'" . js-mode))

(add-hook 'javascript-mode-hook
          (linum-mode t)
          (setq show-trailing-whitespace t)
          (setq js-indent-level 2)
          )

(provide 'init-javascript)
;;; init-javascript.el ends here
