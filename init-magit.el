;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-
;;; https://github.com/philjackson/magit/downloads
;;; See also github-specific extensions: https://github.com/nex3/magithub/

(autoload 'magit-status "magit" nil t)

(add-to-list 'process-coding-system-alist '("git" . utf-8))

(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map "V" 'magit-status)))
(add-to-list 'auto-coding-alist '("COMMIT_EDITMSG" . utf-8-unix)
             )

(add-hook 'magit-log-edit-mode-hook 'turn-on-auto-fill)

;; git : magit
(autoload 'magit-status "magit" nil t)
(global-set-key (kbd "M-s M-s") 'magit-status)
