;;; Python
;;;
;;; In a "bin/instance debug" *shell* mode, you can get completion like:
;;; M-x load-lib ipython
;;; M-x local-set-key <hit TAB> ipython-complete
;;; If you want emacs shell completion back:
;;;  M-x local-set-key <hit TAB> comint-dynamic-complete
;;; pyflakes doesn't do PEP8 check, but we can use a wrapper that adds pep8.
;;; flake8 doesn't appear to check test_*.py files at all so we don't
;;; get help about bad format, unused imports. etc.
;;; use pychecker with both pep8 and flake8, which works but is slower.
;;;  pyflakes "$1"
;;;  pep8 --repeat "$1"
;;;  flake8
;;;  true

;;; 2015-08-04 Switch from flymake to flycheck
;;; http://flycheck.readthedocs.org/en/0.22/guide/installation.html
;;; pip install flake8 (or pylint)
;;; Add flycheck to init-0-packages.el and install manually

;; (when (load "flymake" t)
;;   (defun flymake-pyflakes-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list "pychecker" (list local-file))))

;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pyflakes-init)))

;;(add-hook 'find-file-hook 'flymake-find-file-hook)
;;(load-library "flymake-cursor")

(defun my-python-mode-common-hook ()
  (flycheck-mode t)
  (linum-mode t)
  (set-fill-column 79)
  (setq show-trailing-whitespace t) ; color set by customization at end of file
  )
(add-hook 'python-mode-common-hook 'my-python-mode-common-hook)
(add-hook 'python-mode-hook 'my-python-mode-common-hook)

;; flag lines longer than 80; this should be done by flycheck.
;; (add-hook 'python-mode-common-hook
;;           (function
;;            (lambda ()
;;              (setq font-lock-keywords
;;                    (append font-lock-keywords
;;                            '(("\t+" (0 'my-tab-face append))
;;                              ("^.\\{81,\\}$" (0 'my-long-line-face append))
;;                              ("^.\\{81\\}\\(.+\\)$" (0 'my-long-line-facee append))
;; ;;                             ("[ \t]+$"      (0 'my-trailing-space-face append))
;;                              ))))))




;; (add-hook 'python-mode-hook
;; 	  #'(lambda ()
;; 	      (setq yas/mode-symbol 'python-mode)))

;;; 2010-02-18 python with ipython autocompletion
(setq ipython-completion-command-string
      "print(';'.join(__IP.Completer.all_completions('%s')))\n")

;;; http://www.questionhub.com/StackOverflow/2658475
(defun python-reinstate-current-directory ()
 "When running Python, add the current directory ('') to the head of sys.path.
For reasons unexplained, run-python passes arguments to the
interpreter that explicitly remove '' from sys.path. This means
that, for example, using `python-send-buffer' in a buffer
visiting a module's code will fail to find other modules in the
same directory.
Adding this function to `inferior-python-mode-hook' reinstates
the current directory in Python's search path."
 (python-send-string "sys.path[0:0] = ['']"))
(add-hook 'inferior-python-mode-hook 'python-reinstate-current-directory)

