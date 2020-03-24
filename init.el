;;; package -- emacs configuration
;;; Commentary:
;;; Start initialization, mainly to run lisp/init-*el

;;; Code:
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defvar emacs-dir)
(setq emacs-dir "~/.emacs.d/lisp")      ;warning says not to use .emacs.d
(add-to-list 'load-path emacs-dir)

(setq mac-option-modifier nil)		;for international chars like ü
(setq mac-command-modifier 'meta)	;Command for emacs Meta
(set-language-environment "UTF-8")

;;; Set PAGER and EDITOR so git doesn't complain: terminal is not fully functional
;;; 2013-09-01 REmove EDITOR; new magit fires off new emacs instead of internal on commits
;;;(setenv "EDITOR" "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient")
(setenv "PAGER" "cat")

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

;; Linux shell output in yellow and white unreadable on OldLace background
;; Really should look at Solarized theme: http://ethanschoonover.com/solarized
(setq ansi-color-names-vector
      ;;default: ["black" "red" "green" "yellow" "blue" "magenta" "cyan" "white"]
      ["black" "red" "green" "yellow4" "blue" "magenta" "cyan4" "gray50"])


(global-set-key (kbd "C-x F") 'menu-set-font ) ; or use C-x C-+, C-x C-, C-x C-0
;;(set-face-font 'default "-apple-monaco-medium-r-normal--10-100-72-72-m-100-iso10646-1")
(set-face-font 'default "-apple-monaco-medium-r-normal--12-100-72-72-m-100-iso10646-1")
(setq linum-format "%d ")

;; Want to colorize escape codes; does this really work?
;; M-x ansi-term disables M-x commands :-(
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; (require 'modeline-posn)
;; (setq-default modelinepos-column-limit 79) ;highlights in modeline

;; Try this to highlight long lines
;; https://support.process-one.net/doc/display/MESSENGER/Lines+no+longer+than+80+columns#Linesnolongerthan80columns-Emacs%3Acolumnmaker
;; ONLY WANT THIS IN PYTHON; TAB highlighting is too ugly normally
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(my-long-line-face ((((class color)) (:background "khaki"))) t)
 '(my-trailing-space-face ((((class color)) (:background "OliveDrab1"))) t)
 '(trailing-whitespace ((((class color) (background light)) (:background "cyan")))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(display-time)                          ;clutter's busy modeline
(setq line-move-visual nil)		;use old style next-true-line
(setq-default indent-tabs-mode nil)	;no TABS, use Spaces 
(column-number-mode t)                  ;show col number in mode line

;;; Render Linux shells instead of showing escape codes
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;;; in ipython do %colors lightbg to avoid white on light background
;;; frame-background-mode below doesn't seem ot help
;;; don't know how to specify this since it's not reading my .ipython/ fiels
(ansi-color-for-comint-mode-on)

;; Don't want this for all files -- especially Shell.
;; See init-python (and probalby some init-rst or txt or something.
;;(setq-default show-trailing-whitespace t) ; color set by customization at end of file
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

;;; On big screens, useful to have windows side-by-side
(define-key global-map (kbd "C-x 9") 'split-window-horizontally)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Load all the init-*.el files from our lisp/ directory

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
 '(custom-safe-themes
   (quote
    ("732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "2e5705ad7ee6cfd6ab5ce81e711c526ac22abed90b852ffaf0b316aa7864b11f" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(display-time-mode nil)
 '(frame-background-mode (quote light))
 '(global-flycheck-mode t)
 '(js-indent-level 4 t)
 '(js2-auto-indent-flag nil)
 '(js2-mirror-mode nil)
 '(js2-mode-indent-ignore-first-tab t)
 '(magit-push-arguments nil)
 '(mode-require-final-newline (quote ask))
 '(package-selected-packages
   (quote
    (blacken material-theme ein pipenv default-text-scale pungi zenburn-theme yasnippet yaml-mode web-mode tide solarized-theme markdown-mode magit-gitflow jedi flycheck-pyflakes flycheck-pycheckers exec-path-from-shell editorconfig)))
 '(require-final-newline (quote ask))
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(sql-sqlite-program "sqlite3" t)
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify)))
 ;;'(uniquify-buffer-name-style (quote reverse) nil (uniquify)))


(put 'downcase-region 'disabled t)      ;too dangerous, I keep fucking up, maybe unmap ^x^l so I have to type it?
(put 'narrow-to-region 'disabled nil)
