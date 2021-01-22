;;; package -- Summary: RST processing of .rst files

;;; Commentary:
;;; We don't try to RST .txt files because they're too generic

;;; Code:
(autoload 'rst-mode "rst" nil t)
(add-to-list 'auto-mode-alist '("\\.rst$" . rst-mode))
(add-to-list 'auto-mode-alist '("\\.rest$" . rst-mode))

(defun my-whitespace-killer-hook ()
  (setq show-trailing-whitespace t)     ; color set in init.el
  )
(add-hook 'rst-mode-hook 'my-whitespace-killer-hook)


(provide 'init-rst)
;;; init-rst.el ends here
