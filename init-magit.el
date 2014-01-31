;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-
;;; https://github.com/philjackson/magit/downloads
;;; See also github-specific extensions: https://github.com/nex3/magithub/

(add-to-list 'load-path (concat emacs-dir "/magit"))
(add-to-list 'process-coding-system-alist '("git" . utf-8))

(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map "V" 'magit-status)))
(add-to-list 'auto-coding-alist '("COMMIT_EDITMSG" . utf-8-unix)
             )

(add-hook 'magit-log-edit-mode-hook 'turn-on-auto-fill)

;; 2013-11-26 Prevent popup of /usr/bin/emacsclient
;; http://stackoverflow.com/questions/18856047/emacs-magit-commit-opens-new-emacs-client
(set-variable 'magit-emacsclient-executable "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient")


;; git : magit
(autoload 'magit-status "magit" nil t)
(global-set-key (kbd "M-s M-s") 'magit-status) ;doesn't work -nox11 terminal
(global-set-key (kbd "C-x C-g") 'magit-status) ;for -nox11 terminals
