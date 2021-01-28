;;; Package -- projectile

;;; Commentary:
;;;  project management https://projectile.mx/
;;;  Enable projectile-mode, open a file in one of your projects and type a command such as C-c p f.
;;;  See the user manual for more details.

;;; Code:

(require 'projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;;; init-projectile.el ends here
