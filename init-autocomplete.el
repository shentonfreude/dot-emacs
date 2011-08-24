;;; autocomplete

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(define-key ac-mode-map (kbd "C-TAB") 'auto-complete) ;yas is on TAB
;; fix with emacs-dir
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
;;(define-key ac-mode-map (kbd "C-TAB") 'auto-complete) ;yas is on TAB: BROKEN??



