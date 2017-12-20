;; instructions from https://github.com/magit/magit#installation
;; M-x package-refresh-contents RET
;; M-x package-install RET magit RET

;;; Code:

(setq package-archives 
      '(("gnu"          . "http://elpa.gnu.org/packages/") ;official, minimal, signed
        ("melpa"      . "http://melpa.org/packages/") ;snapshots
        ;;("melpa-stable" . "http://stable.melpa.org/packages/") ;stable
        ;; marmalade was OK but unmaintained, may be back now
        ;; elpa was original, not maintained
        ))

(package-initialize)

;; Ensure our desired packages are loaded into ELPA
;; http://blog.zhengdong.me/2012/03/14/how-i-manage-emacs-packages/
;; And you do not need to require them manually, since the packages
;; ships auto-load, if you want to configure the package, use
;; eval-after-load, this will decrease emacs starting time
;; dramatically.

(require 'cl)

;; flymake
;; flymake-go
;; go-autocomplete
;; go-direx
;; go-eldoc
;; go-errcheck
;; go-mode
;; go-play
                                        ;
; Perhaps useful:
;; - projectile (manage projects): C-c ps switch to project, C-c pf List file s in proj
;; - pyvenv.el: activate and workon supporte
(defvar packages-list                   ;
  '(
    exec-path-from-shell                ;use proper PATH from shell
    flycheck
    jedi-direx                          ;directory tree
    company-jedi                        ; Python autocompletion (uses jedi-core, see pungi for venv)
    magit-gitflow                       ;requires magit
    markdown-mode
    pungi                               ;virtualenv support for jedi: 201502... :-(
    pyenv-mode-auto                     ;set by .../.python-version; no virtualenvwrapper support :-(
    solarized-theme
    tide
    web-mode
    yaml-mode
    yasnippet
    zenburn-theme
    ; needed by something in another init
    go-autocomplete                     ;needed by something in another init
    go-eldoc
    )
  "List of packages needs to be installed at launch.")


(defun has-package-not-installed ()
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
