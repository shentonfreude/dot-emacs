;; See go-mode author's posts
;; http://dominik.honnef.co/posts/2013/03/writing_go_in_emacs/
;; http://dominik.honnef.co/posts/2013/08/writing_go_in_emacs__cont__/
;; I'm using it from emacs packages, manually installing/updating them.

;; TODO: doc which emacs packages names that implement these
;; TODO: eldoc fights with flymake for mode line

;; goimports acts like gofmt but updates your Go import lines, adding
;; missing ones and removing unreferenced ones.
;;  go get code.google.com/p/go.tools/cmd/goimports

;;; Code:

(setq gofmt-command "goimports")
;;(add-to-list 'load-path "/home/you/somewhere/emacs/")
;;(require 'go-mode-load)
;;(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c i") 'go-goto-imports)))

;; For godef: go get code.google.com/p/rog-go/exp/cmd/godef
;; C-c C-d: godef-describe
;; C-c C-j: godef-jump

;; 2015-08-04 use Flycheck instead of flymake
;; goflymake       (https://github.com/dougm/goflymake)
;;(eval-after-load "go-mode"
;;  '(require 'flymake-go))

;; Autocomplete
;; TODO: doesn't work (yet, why)
;; go get -u github.com/nsf/gocode (-u flag for "update")
(require 'auto-complete-config)

;; Show docs on modeline of oject at point
;; go-eldoc        (github.com/syohex/emacs-go-eldoc)
;; go get -u github.com/nsf/gocode
(require 'go-eldoc) ;; Don't need to require, if you install by package.el
(add-hook 'go-mode-hook 'go-eldoc-setup)


;; yasnippet-go    (https://github.com/dominikh/yasnippet-go)
;; BROKEN: coordinate yas-snippet-dir with packages-installed yasnippets variable
;; (add-to-list 'yas-snippet-dirs "/tmp/snippets")

;; go-mode supports beginning-of-defun (C-M-a) and end-of-defun (C-M-e),


;; If you want to, you can bind godef-jump to M-., which is the
;; default key for find-tag, something you might already be using for
;; other programming languages:

;; Also:
;; - go-play-*
;; - flymake
;; - autocompletion
;; - snippets
;; - go-errcheck
;; - go-eldoc: show method signature in mode line
;; - coverage analysis

;;; init-go.el ends here
