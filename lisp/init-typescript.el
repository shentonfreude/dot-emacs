;;; Let's try basic typescript-mode first
;;; Use Typescript IDE (tide)
;;; https://github.com/ananthakumaran/tide
;;; M-x tide-restart-server Restart tsserver. Currently tsserver
;;; doesn't pickup tsconfig.json file changes. This would come in
;;; handy after you edit tsconfig.json.
;;; M-x tide-references List all references to the symbol at point in
;;; a buffer. References can be navigated using n and p. Press enter
;;; to open the file.
;;; M-x tide-rename-symbol Rename all occurrences of the symbol at point.

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (linum-mode t)
  (setq typescript-indent-level 2)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
