;;; Formerly ~/.emacs for Carbon Emacs, but also ready by AquaEmacs.
;;; AquaEmacs prefers ~/Library/Preferences/Aquamacs Emacs/Preferences.el

(setq emacs-dir "~/.emacs.d")

(add-to-list 'load-path emacs-dir)
(tool-bar-mode -1)
(menu-bar-mode 0)
(scroll-bar-mode -1)
(set-cursor-color "red")
(set-face-font 'default "-apple-monaco-medium-r-normal--10-100-72-72-m-100-iso10646-1")
(set-background-color "OldLace") ;"AntiqueWhite2"  "ivory2" "ivory3
(display-time)
(setq line-move-visual nil)		;use old style next-true-line
(setq-default indent-tabs-mode nil)	;no TABS, use Spaces 


;;; in ipython do %colors lightbg to avoid white on light background
;;; frame-background-mode below doesn't seem ot help
;;; don't know how to specify this since it's not reading my .ipython/ fiels
(ansi-color-for-comint-mode-on)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;  Kapil's full-screen for CarbonEmacs
(defun mac-toggle-max-window ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                           'fullboth)))
(define-key global-map [(M-return)] 'mac-toggle-max-window)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun load-directory-files (dir &optional regex)
  (let*
      ((regex (or regex ".+"))
       (files (and
               (file-accessible-directory-p dir)
               (directory-files dir 'full regex))))

    (mapc (lambda (file)
            (when (load file nil t)
              (message "`%s' LOADED." file))) files)))

(load-directory-files emacs-dir "^init-.+el$")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(frame-background-mode (quote light))
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(sql-sqlite-program "sqlite3")
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

