;;; Package -- summary
;;; Commentary:
;;; IMHO the js2 mode is too heavy handed and comlex and slow.
;;; This is executing FlyCheck fine now, but without trailing white complaints.

;;; Code:

;; javascript-mode is free, so do it for .json.
(add-to-list 'auto-mode-alist '("\\.json\\'" . js-mode))

(add-hook 'js-mode-hook
          (lambda ()
            (setq show-trailing-whitespace t)
            (setq js-indent-level 2)    ; better with code's .editorconfig
            (linum-mode t)
            )
          )

(provide 'init-javascript)
;;; init-javascript.el ends here
