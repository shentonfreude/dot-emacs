;;; package -- initialize the packages
;;; Commentary:
;;; Ensure packages installed before doing package-specific configs in init-*.el.

;;; Code:

(require 'cl)                           ;NEEDED?

;; flymake
;; flymake-go
;; go-autocomplete
;; go-direx
;; go-eldoc
;; go-errcheck
;; go-mode
;; go-play
                                        ;
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("gnu"          . "https://elpa.gnu.org/packages/")) ;official, minimal
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t) ;stable
(add-to-list 'package-archives '("melpa"        . "https://melpa.org/packages/"))
(package-initialize)                    ;where was this 'require'd?

; Perhaps useful:
;; - projectile (manage projects): C-c ps switch to project, C-c pf List file s in proj
;; - pyvenv.el: activate and workon supporte
;; - elpy:
;; - - https://elpy.readthedocs.io/en/latest/introduction.html
;; - - http://rakan.me/emacs/python-dev-with-emacs-and-pyenv/
(defvar packages-list                   ;
  '(
    ;; try use-package first then use it later
    ;; dunno if we want to (use-package elpy ...) in their own init files
    use-package            ;deferrable, compact package specs used by elpy docs
    ;;
    blacken                ;use 'black' to format python
    diminish               ;minor mode with no modeline mods
    docker                 ;talk to docker processes https://github.com/Silex/docker.el
    ;; docker-compose      ;edit docker-compose files with completion
    docker-tramp           ;access contents of containers C-x C-f /docker:user@container:/path/to/file
    dockerfile-mode        ;editing Dockerfile
    editorconfig           ;follow .editorconfig file direction
    ein                    ;for IPython
    elpy                   ;python mode
    exec-path-from-shell   ;use proper PATH from shell
    flycheck               ;PEP8 on the fly
    jedi-direx             ;directory tree
    company-jedi           ; Python autocompletion (uses jedi-core, see pungi for venv)
    lorem-ipsum            ; melpa nonstable
    magit-gitflow          ;requires magit
    markdown-mode          ;editing .md
    material-theme         ;more attractive than solarized
    pipenv                 ;use Pipfile[.lock], get pipenv shell
    pungi                  ;virtualenv support for jedi: 201502... :-(
    pyenv-mode-auto        ;set by .../.python-version; no virtualenvwrapper support :-(
    py-isort               ;sort imports, uses isort CLI
    realgud                ;modern GDB with PDB IDE-like support
    tide                   ;TypeScript IDE
    transient              ;needed by Silex's docker
    web-mode               ;HTML files
    yaml-mode              ;ug, YAML syntax, I need all the help I can get
    yasnippet
    ;; zenburn-theme          ;yet another theme
    ;; Do I really want this 'go' stuff? I'm not doing development in it now
    ;; needed by something in another init
    go-autocomplete                     ;needed by something in another init
    go-eldoc
    )
  "List of packages needs to be installed at launch.")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2020-03-24 this seems easier than the below that I was doing
;; https://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifying-a-list-of-package-name
 
; fetch the list of packages available 

(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package packages-list)
  (unless (package-installed-p package)
    (package-install package)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; we still have to install packages (above) on our system manually [WHY?] but
;;; use-package will invoke load them more quickly and self-containedly

(eval-when-compile
(require 'use-package))
(require 'bind-key)                     ;use-package: easier key binding
(require 'diminish)                     ;NOTFOUND minor mode with not modeline

(provide 'init-0-package)
;;; init-0-package.el ends here
