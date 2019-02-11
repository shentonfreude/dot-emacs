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
(add-to-list 'package-archives '("gnu"          . "http://elpa.gnu.org/packages/")) ;official, minimal
(add-to-list 'package-archives '("melpa-stable" . "https://stable.org/packages/")) ;stable
(add-to-list 'package-archives '("melpa"        . "http://melpa.org/packages/")) ;snapshots
;;; marmalade looks abandoned
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
    diminish               ;minor mode with no modeline mods
    ein                    ;for IPython
    elpy                   ;python mode
    exec-path-from-shell   ;use proper PATH from shell
    flycheck               ;PEP8 on the fly
    jedi-direx             ;directory tree
    company-jedi           ; Python autocompletion (uses jedi-core, see pungi for venv)
    magit-gitflow          ;requires magit
    markdown-mode          ;editing .md
    material-theme         ;more attractive than solarized
    pipenv                 ;use Pipfile[.lock], get pipenv shell
    pungi                  ;virtualenv support for jedi: 201502... :-(
    pyenv-mode-auto        ;set by .../.python-version; no virtualenvwrapper support :-(
    realgud                ;modern GDB with PDB IDE-like support
    solarized-theme        ;almost as nice as material-theme?
    tide                   ;TypeScript IDE
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

(defun has-package-not-installed ()
  "Install packages that haven't been installed yet."
  (loop for p in packages-list
        when (not (package-installed-p p)) do (return t)
        finally (return nil)))
(when (has-package-not-installed)
  ;; Check for new packages (package versions)
  (message "%s" "Get latest versions of all packages...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; Install the missing packages
  (dolist (p packages-list)
    (when (not (package-installed-p p))
      (package-install p))))

;;; we still have to install packages (above) on our system manually but
;;; use-package will invoke load them more quickly and self-containedly

(eval-when-compile
(require 'use-package))
(require 'bind-key)                     ;use-package: easier key binding
(require 'diminish)                     ;NOTFOUND minor mode with not modeline

(provide 'init-0-package)
;;; init-0-package.el ends here
