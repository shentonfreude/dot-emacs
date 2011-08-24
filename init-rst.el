;;; RST

(autoload 'rst-mode "rst" nil t)
(add-to-list 'auto-mode-alist '("\\.rst$" . rst-mode))
(add-to-list 'auto-mode-alist '("\\.rest$" . rst-mode))
(add-to-list 'auto-mode-alist '("\\.txt$" . rst-mode))

