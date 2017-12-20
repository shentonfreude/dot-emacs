;;; autocomplete

(require 'auto-complete-config)
(global-auto-complete-mode t)           ;ensure on for Jedi
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(define-key ac-mode-map (kbd "C-TAB") 'auto-complete) ;yas is on TAB
