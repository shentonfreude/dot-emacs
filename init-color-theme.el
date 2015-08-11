;;; package: -- Summary


;;; 2015-08-04 try Solarized or Zenburn instead

;;; Code:

;; (add-to-list 'load-path (concat emacs-dir "/color-theme-6.6.0"))
;; (add-to-list 'load-path (concat emacs-dir "/emacs-color-theme-solarized"))
;; (require 'color-theme-solarized)
;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;;      ;; text is too light, cursor should be red, trailing white shouldn't be red
;;      ;;(color-theme-solarized-light)
;;      )
;;   )

;;;(load-theme 'zenburn t)

;;; SOLARIZED: Do these before load-theme solarized:
;;
;; make the fringe stand out from the background
(setq solarized-distinct-fringe-background t)
;; Don't change the font for some headings and titles
;;(setq solarized-use-variable-pitch nil)
;; make the modeline high contrast
(setq solarized-high-contrast-mode-line t)
;; Use less bolding
;;(setq solarized-use-less-bold t)
;; Use more italics
(setq solarized-use-more-italic t)
;; Use less colors for indicators such as git:gutter, flycheck and similar
;;(setq solarized-emphasize-indicators nil)
;; Don't change size of org-mode headlines (but keep other size-changes)
;;(setq solarized-scale-org-headlines nil)
;; Avoid all font-size changes
;; (setq solarized-height-minus-1 1)
;; (setq solarized-height-plus-1 1)
;; (setq solarized-height-plus-2 1)
;; (setq solarized-height-plus-3 1)
;; (setq solarized-height-plus-4 1)
;;
(load-theme 'solarized-light t)

;; Customize

(set-cursor-color "red")
(blink-cursor-mode 1)			;-1 off, 1 on
(setq blink-cursor-interval 0.25)	;default is 0.5 seconds
(setq blink-cursor-delay 5)             ;default 0.5


;;; init-color-theme.el ends here

