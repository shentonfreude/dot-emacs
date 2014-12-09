;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-
;;; https://github.com/philjackson/magit/downloads
;;; See also github-specific extensions: https://github.com/nex3/magithub/

;;; 2014-01-21 Install from Melpa


(add-to-list 'process-coding-system-alist '("git" . utf-8))

(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map "V" 'magit-status)))
(add-to-list 'auto-coding-alist '("COMMIT_EDITMSG" . utf-8-unix)
             )

(add-hook 'magit-log-edit-mode-hook 'turn-on-auto-fill)

;; 2013-11-26 Prevent popup of /usr/bin/emacsclient
;; http://stackoverflow.com/questions/18856047/emacs-magit-commit-opens-new-emacs-client
;;(set-variable 'magit-emacsclient-executable "/usr/local/bin/emacsclient") ;hand-installed
;;(set-variable 'magit-emacsclient-executable "/usr/local/Cellar/emacs/24.3/bin/emacsclient") ;brew-installed
;;(set-variable 'magit-emacsclient-executable "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient") ;downloaded pre-built
(if (eq system-type 'darwin)
    (set-variable 'magit-emacsclient-executable "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient") ;downloaded pre-built
  )

;; git : magit
(autoload 'magit-status "magit" nil t)
;; TOO easy to hit: (global-set-key (kbd "M-s M-s") 'magit-status) ;doesn't work -nox11 terminal
(global-set-key (kbd "C-x C-g") 'magit-status) ;for -nox11 terminals

;; 2014-08-15 Add gitflow (C-f in magit status buffer)
(require 'magit-gitflow)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
