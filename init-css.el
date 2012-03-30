;; why is it not loading/finding css-mode from 
;; /Applications/Emacs.app/Contents/Resources/lisp/textmodes/css-mode.el.gz

(autoload 'css-mode "css-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))

