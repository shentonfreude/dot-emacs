;;; Package -- left nave browser

;;; Commentary:
;;;
;;; It wants to eval (background dark) to set sane fonts but I don't know if this is var or function.
;;; (defface neo-banner-face
;;;  '((((background dark)) (:foreground "lightblue" :weight bold))
;;;    (t                   (:foreground "DarkMagenta")))
;;;
;;; I've manually set some faces so it's readable in init.el:
;;;(custom-set-faces
;;; '(neo-dir-link-face ((t (:foreground "dark cyan"))))
;;; '(neo-file-link-face ((t (:foreground "light green"))))
;;; '(neo-header-face ((t (:foreground "SlateBlue1"))))
;;; '(neo-root-dir-face ((t (:foreground "cyan1"))))
;;;
;;; But there must be a better way, the neotree color picker seems to
;;; be looking for a 'dark' attribute in whatever theme I have:
;;; ((background dark)) (:foreground "lightblue" :weight bold))
;;;     (t                   (:foreground "DarkMagenta")))


;;; Code:

(require 'neotree)

(global-set-key [f8] 'neotree-toggle)

(provide 'init-neotree)

;;; init-neotree.el ends here

