(add-to-list 'load-path (concat emacs-dir "/color-theme-6.6.0"))
(add-to-list 'load-path (concat emacs-dir "/emacs-color-theme-solarized"))
(require 'color-theme-solarized)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     ;; text is too light, cursor should be red, trailing white shouldn't be red
     ;;(color-theme-solarized-light)
     )
  )
