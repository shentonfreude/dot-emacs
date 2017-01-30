(autoload 'yaml-mode "yaml-mode" nil t)

(add-to-list 'auto-mode-alist '("\\.yml$"  . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

;; (setq auto-mode-alist
;;       (cons '("\\.\\(yml\\|yaml\\)") . yaml-mode)
;;             auto-mode-alist))

;;;(add-hook 'yaml-mode-hook
;;;		  '(lambda ()
;;;			 (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
