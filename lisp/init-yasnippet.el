;; Basic steps to setup:

;;  (add-to-list 'load-path
;;               "~/path-to-yasnippet")

;; 0.7.0 looks in ~/.emacs.d/snippets and the package snippets automatically
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-prompt-funcdtions
;;;      '(yas-dropdown-prompt))
      '(yas-x-prompt yas-dropdown-prompt yas-completing-prompt yas-ido-prompt yas-no-prompt))
