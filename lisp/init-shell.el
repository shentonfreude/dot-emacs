;;; package -- Make shell track python pdb so we can debug proc with embedded pdb
;;; Commentary:
;;; Should this go into init-python.el instead?

;;; Code:

(require 'python)                       ; to get the python-* function

;; 2018-04-18
;; Shell is getting WAY too slow, doing compiles, pip builds, etc.
;; Try removing all my extension.

(defun my-shell-mode-hook ()
  (add-hook 'comint-output-filter-functions 'python-pdbtrack-comint-output-filter-function t)
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
  )
;;(add-hook 'shell-mode-hook 'my-shell-mode-hook)

(provide 'init-shell)
;;; init-shell.el ends here


