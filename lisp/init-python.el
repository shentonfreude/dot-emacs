;;; Python

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



;;; Code:

;; Installation: https://elpy.readthedocs.io/en/latest/introduction.html

(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  (add-to-list 'auto-mode-alist '("\\.py$" .python-mode))
  :bind (:map elpy-mode-map
              ("<M-left>" . nil)
              ("<M-right>" . nil)
              ("<M-S-left>" . elpy-nav-indent-shift-left)
              ("<M-S-right>" . elpy-nav-indent-shift-right)
              ("M-." . elpy-goto-definition)
              ("M-," . pop-tag-mark))
  :config
  (setq elpy-rpc-backend "jedi")
  (setq elpy-rpc-virtualenv-path 'current) ; 'default .emacs/elpy/private-old-stuff
)


(use-package python
  :mode ("\\.py" . python-mode)
  :config
  (setq python-indent-offset 4)
  (when (executable-find "ipython")
    (setq python-interpreter "ipython")
    (setq python-interpreter-args "-i --simple-prompt"))
)


;;; 2018-07-18 ipython, numpy, pandas, matplotlib
;;; On macOS (perhaps with pyenv-installed pythons), if you try:
;;;   In [1]: import matplotlib.pyplot as plt
;;; and get an error about "Python is not installed as a Framework",
;;; then add to ~/.matplotlib/matplotlibrc:
;;;   backend: TkAgg

;;; To make pyflakes allow longer lines, in ~/.config/flake8:
;;;   [flake8]
;;;   max-line-length=100

;;; if you try to use Emacs with Elpy, you'll notice that Elpy does
;;; not recognize that you've already installed the dependencies it
;;; requires into your current virtualenv because it doesn't see your
;;; virtualenv in the first place. This is where the package
;;; pyenv-mode comes into play, let's set it up:

(use-package pyenv-mode
  :init
  (add-to-list 'exec-path "~/.pyenv/shims")
  (setenv "WORKON_HOME" "~/.pyenv/versions/")
  :config
  (pyenv-mode)
  :bind
  ("C-x p e" . pyenv-activate-current-project)
)

;; C-c C-u pyenv-unset shadows elpy C-c C-u ... for pdb tools
(eval-after-load "pyenv-mode"
  '(define-key pyenv-mode-map (kbd "C-c C-u") nil)
)


;; Now what we'll need is a way to tell Emacs to update the currently
;; activated pyenv version every time we switch projects. You'll
;; notice in the :bind section of the above snippet that i configured
;; C-x p e to activate current project's pyenv configuration.

;; 2022-01-25 this hasn't worked for months,
;; use pyvenv-activate ~/.pyenv/versions/<version name>
;; or pyenv-mode-set <version name>

(defun pyenv-activate-current-project ()
  "Automatically activates pyenv version if .python-version file exists."
  (interactive)
  (let ((python-version-directory (locate-dominating-file (buffer-file-name) ".python-version")))
    (if python-version-directory
        (let* ((pyenv-version-path (f-expand ".python-version" python-version-directory))
               (pyenv-current-version (s-trim (f-read-text pyenv-version-path 'utf-8))))
          (pyenv-mode-set pyenv-current-version)
          (message (concat "Setting virtualenv to " pyenv-current-version))))))

;; The above code base, would traverse the directories starting from
;; the current buffer's directory all the way up to root looking for
;; the ~.python-version~ file. If it finds this file, it reads the
;; content and set's both pyenv-mode and pyvenv mode to use that
;; version. At the end, it'll emit a message saying that the
;; virtualenv was set to the version found when you press that
;; keystroke C-x p e.

;; In addition to that, we also need to activate the global version when we load Emacs.

(defvar pyenv-current-version nil nil)
(defun pyenv-init()
  "Initialize pyenv's current version to the global one."
  (let ((global-pyenv (replace-regexp-in-string "\n" "" (shell-command-to-string "pyenv global"))))
    (message (concat "Setting pyenv version to " global-pyenv))
    ;;(pyenv-mode-set global-pyenv) ;; UNDEFINED2 pyenv-mode-set
    (setq pyenv-current-version global-pyenv)))
(add-hook 'after-init-hook 'pyenv-init)
;; Which will initialize pyenv to use the global version at initialization.


;; (require 'pyenv-mode-auto)
;; (require 'pungi)                        ;for virtualenv in jedi
;; (add-hook #'python-mode-hook
;;           '(lambda ()
;;              (pungi:setup-jedi)))

;; 2020-01-03 Not finding pipenv reliable, don't confuse pyenv
;; (add-hook 'python-mode-hook #'pipenv-mode)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)           ;start completion after inserting dot

(defun my-python-mode-common-hook ()
  "Customize the python mode hook."
  (flycheck-mode t)
  (linum-mode t)
  (set-fill-column 79)
  (setq show-trailing-whitespace t) ; color set by customization at end of file
  (setq require-final-newline 'ask) ; gratuitous whitespace commits piss off Pyramid
  (setq gud-pdb-command-name "python -m pdb") ; 2020-01-03 pdb not on PATH
  (define-key python-mode-map "\C-x n c" 'python-narrow-to-class)
  
  )
(add-hook 'python-mode-common-hook 'my-python-mode-common-hook)
(add-hook 'python-mode-hook 'my-python-mode-common-hook)
;; .               jedi:dot-complete
;; C-c ,           jedi:goto-definition-pop-marker
;; C-c .           jedi:goto-definition
;; C-c ?           jedi:show-doc

;;; 2010-02-18 python with ipython autocompletion
;; (setq ipython-completion-command-string
;;       "print(';'.join(__IP.Completer.all_completions('%s')))\n")

;;; http://www.questionhub.com/StackOverflow/2658475
;; (defun python-reinstate-current-directory ()
;;   "When running Python, add the current directory ('') to the head of sys.path.
;; For reasons unexplained, `run-python` passes arguments to the
;; interpreter that explicitly remove '' from sys.path. This means
;;    that, for example, using `python-send-buffer' in a buffer
;;    visiting a module's code will fail to find other modules in the
;;    same directory.
;;    Adding this function to `inferior-python-mode-hook' reinstates
;;    the current directory in Python's search path."
;;  (python-send-string "sys.path[0:0] = ['']")) ;obsolete: use python-shell-internal-send-string
;; (add-hook 'inferior-python-mode-hook 'python-reinstate-current-directory)

;;; Instead use: elpy C-x n d -- narrow to current function (defun)?
;;; http://emacs.stackexchange.com/questions/13304/how-to-narrow-to-python-class
;; (defun python-narrow-to-class ()
;;   (interactive)
;;   (save-excursion
;;     (python-nav-beginning-of-block)
;;     (python-nav-backward-up-list)
;;     (python-nav-backward-up-list)
;;     (forward-line)
;;     (narrow-to-defun)))

;;; py-isort: pip install isort; use: M-x py-isort-buffer, M-x py-isort-region
(require 'py-isort)
;;(add-hook 'before-save-hook 'py-isort-before-save)

(provide 'init-python)
;;; init-python.el ends here
