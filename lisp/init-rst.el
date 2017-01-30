;;; RST

(autoload 'rst-mode "rst" nil t)
(add-to-list 'auto-mode-alist '("\\.rst$" . rst-mode))
(add-to-list 'auto-mode-alist '("\\.rest$" . rst-mode))
(add-to-list 'auto-mode-alist '("\\.txt$" . rst-mode))


(defun my-whitespace-killer-hook ()
  (setq show-trailing-whitespace t)     ; color set in init.el
  )
(add-hook 'rst-mode-hook 'my-whitespace-killer-hook)

