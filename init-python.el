;;; Python
;;;
;;; In a "bin/instance debug" *shell* mode, you can get completion like:
;;; M-x load-lib ipython
;;; M-x local-set-key <hit TAB> ipython-complete
;;; If you want emacs shell completion back:
;;;  M-x local-set-key <hit TAB> comint-dynamic-complete

(when (load "flymake" t) 
  (defun flymake-pyflakes-init () 
    (let* ((temp-file (flymake-init-create-temp-buffer-copy 
                       'flymake-create-temp-inplace)) 
           (local-file (file-relative-name 
                        temp-file 
                        (file-name-directory buffer-file-name)))) 
      (list "pyflakes" (list local-file)))) 
  
  (add-to-list 'flymake-allowed-file-name-masks 
               '("\\.py\\'" flymake-pyflakes-init))) 

(add-hook 'find-file-hook 'flymake-find-file-hook)
(load-library "flymake-cursor")

;; (add-hook 'python-mode-hook
;; 	  #'(lambda ()
;; 	      (setq yas/mode-symbol 'python-mode)))

