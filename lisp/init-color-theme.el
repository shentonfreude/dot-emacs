;;; package: -- Summary


;;; 2015-08-04 try Solarized or Zenburn instead

;;; Code:

(load-theme 'material t)               ; dark, easy on the eyes

;; Customize

                                        ; yellow, chartreuse, magenta, ...
(set-cursor-color "yellow")             ; material default orange hard to find
(blink-cursor-mode 1)			;-1 off, 1 on
(setq blink-cursor-interval 0.25)	;default is 0.5 seconds
(setq blink-cursor-delay 1)             ;default 0.25
(setq blink-cursor-blinks 1000)         ;stop after 1000 blinks, default 10 too short
(global-hl-line-mode t)                 ;hilight active buffer line

;;; init-color-theme.el ends here

