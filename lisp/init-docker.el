;;; Package -- summary
;;; Commentary:
;;; Enable, settings for docker-related packages
;;; Code:

;;; docker
;;; https://github.com/Silex/docker.el
;;; Works like Magit; M-x docker ...
;;; BROKEN: Seems to want Magit's "transient" but still says:
;;; "require: Symbol’s value as variable is void: docker-compose-build"

(use-package docker
  :ensure t
  :bind ("C-c d" . docker))
(provide 'init-docker)

;;; docker-tramp
;;; https://www.emacswiki.org/emacs/TrampAndDocker
;;; /docker:user@container:/path/to/filey
;;; Seems to work without the configs in the EmacsWiki

;;; init-docker.el ends here
