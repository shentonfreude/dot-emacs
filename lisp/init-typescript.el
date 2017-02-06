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

(add-hook 
 'typescript-mode-hook (lambda ()
                         (linum-mode t)
))
;; (add-hook 
;;  'typescript-mode-hook (lambda ()
;;                          (tide-setup)
;;                          (flycheck-mode t)
;;                          (setq flycheck-check-syntax-automatically
;;                                '(save mode-enabled)) 
;;                          (eldoc-mode t)

;; company is an optional dependency. You have to 
;; install it separately via package-install (company-mode-on)))
;; aligns annotation to the right hand side (setq company-tooltip-align-annotations t)

