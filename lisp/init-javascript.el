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
            ))

;; 2020-08-05 Use web-mode instead, and activate JSX for React
;; I think I need to set the engine
(add-to-list 'auto-mode-alist 
             '("\\.jsx?$" . web-mode) ;; auto-enable for .js/.jsx files
             ) 
(setq web-mode-content-types-alist
      '(
        ("jsx"  . ".js[x]?\\'")             ;do I always want this React-mode?
        ;; ("json" . "/some/path/.*\\.api\\'")
        ;; ("xml"  . "/other/path/.*\\.api\\'")
        ))

(provide 'init-javascript)
;;; init-javascript.el ends here
