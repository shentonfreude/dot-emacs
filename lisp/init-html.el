;; html-mode is built-in, so don't try and load it.
(add-to-list 'auto-mode-alist '("\\.asp$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.pt$" . web-mode))


;; surely there is a sane set that looks good against my 'material' theme
;; but the defaults with 'material' make angle brackets impossible to read
;; make them same as tag color for now
;;
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "Orange")
  (set-variable 'web-mode-enable-engine-detection t) ; look for -*- engine:django -*-
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

