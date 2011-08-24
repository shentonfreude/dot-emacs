;;; Formerly ~/.emacs for Carbon Emacs, but also ready by AquaEmacs.
;;; AquaEmacs prefers ~/Library/Preferences/Aquamacs Emacs/Preferences.el

(setq emacs-dir "~/.emacs.d")
(add-to-list 'load-path emacs-dir)

(setq mac-option-modifier nil)		;for international chars like ü
(setq mac-command-modifier 'meta)	;Command for emacs Meta
(set-language-environment "UTF-8")

;;; Set PAGER and EDITOR so git doesn't complain: terminal is not fully functional
(setenv "PAGER" "cat")
(setenv "EDITOR" "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient")

(server-start)

;;; WHY AM I GETTING DOUBLED LINE NUMBERS ON VARIABLE COMPLETION?
(if window-system
  (if (functionp 'scroll-bar-mode) (scroll-bar-mode -1))
  (if (functionp 'tool-bar-mode) (tool-bar-mode -1))
;;  (setq global-linum-mode t)              ;maybe only in .py?
)
(if (functionp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (functionp 'tool-bar-mode) (tool-bar-mode -1))
(menu-bar-mode 0)
(set-background-color "OldLace") ;"AntiqueWhite2"  "ivory2" "ivory3
(set-cursor-color "red")
(set-face-font 'default "-apple-monaco-medium-r-normal--10-100-72-72-m-100-iso10646-1")
(blink-cursor-mode 1)			;-1 off, 1 on
(setq blink-cursor-interval 0.25)	;default is 0.5 seconds
(setq blink-cursor-delay 5)             ;default 0.5
(setq linum-format "%d ")

(require 'modeline-posn)
(setq-default modelinepos-column-limit 80) ;highlights in modeline

;; Try this to highlight long lines
;; https://support.process-one.net/doc/display/MESSENGER/Lines+no+longer+than+80+columns#Linesnolongerthan80columns-Emacs%3Acolumnmaker
;; ONLY WANT THIS IN PYTHON; TAB highlighting is too ugly normally
(custom-set-faces
;; '(my-tab-face            ((((class color)) (:background "orange"))) t)
 '(my-trailing-space-face ((((class color)) (:background "OliveDrab1"))) t)  
 '(my-long-line-face ((((class color)) (:background "khaki"))) t))

;; (add-hook 'font-lock-mode-hook
;;           (function
;;            (lambda ()
;;              (setq font-lock-keywords
;;                    (append font-lock-keywords
;;                            '(("\t+" (0 'my-tab-face append))
;;                              ("^.\\{81,\\}$" (0 'my-long-line-face append))
;;                              ("^.\\{81\\}\\(.+\\)$" (0 'my-long-line-facee append))
;; ;;                             ("[ \t]+$"      (0 'my-trailing-space-face append))
;;                              ))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(display-time)
(setq line-move-visual nil)		;use old style next-true-line
(setq-default indent-tabs-mode nil)	;no TABS, use Spaces 
(column-number-mode t)
;;;

;;; Render Linux shells instead of showing escape codes
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;;; in ipython do %colors lightbg to avoid white on light background
;;; frame-background-mode below doesn't seem ot help
;;; don't know how to specify this since it's not reading my .ipython/ fiels
(ansi-color-for-comint-mode-on)

(setq-default show-trailing-whitespace t) ; color set by customization at end of file
(setq-default indicate-empty-lines t)
;;(add-hook 'before-save-hook 'delete-trailing-whitespace) ; don't mess with other's code, yet

;;; Sometimes Emacs hangs on the Mac, apparently when trying to pop a
;;; Flymake can't run and is being switched off, Cancel OK dialog. Try
;;; and prevent the popup box, per Reed's suggestion
;;; (http://superuser.com/questions/125569/how-to-fix-emacs-popup-dialogs-on-mac-os-x)
;;; but a different method.  I found these vars in the y-or-no-p docs.
(setq use-dialog-box nil)               ;no help for flymake, elsewhere?
(setq flymake-gui-warnings-enabled nil)

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
 '(display-time-mode t)
 '(frame-background-mode (quote light))
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(transient-mark-mode t)
 '(sql-sqlite-program "sqlite3")
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify)))
 ;;'(uniquify-buffer-name-style (quote reverse) nil (uniquify)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(trailing-whitespace ((((class color) (background light)) (:background "cyan"))))
 )

