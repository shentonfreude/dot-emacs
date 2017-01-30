;; instructions from https://github.com/magit/magit#installation
;; M-x package-refresh-contents RET
;; M-x package-install RET magit RET
(setq package-archives '(("gnu"          . "http://elpa.gnu.org/packages/") ;minimal, signed
                         ;;("melpa-stable" . "http://stable.melpa.org/packages/") ;stable
                         ("melpa"      . "http://melpa.org/packages/") ;snapshots
                         ))

(package-initialize)

;; Ensure our desired packages are loaded into ELPA
;; http://blog.zhengdong.me/2012/03/14/how-i-manage-emacs-packages/
;; And you do not need to require them manually, since the packages
;; ships auto-load, if you want to configure the package, use
;; eval-after-load, this will decrease emacs starting time
;; dramatically.

(require 'cl)
(defvar packages-list
  '(auto-complete      
    direx              
    exec-path-from-shell
    flycheck
;;    flymake            
;;    flymake-go         
    git-commit    
    go-autocomplete    
    go-direx           
    go-eldoc           
    go-errcheck        
    go-mode            
    go-play            
    magit              
    magit-gitflow      
    markdown-mode      
    popup              
    solarized-theme
    yaml-mode          
    yasnippet
    zenburn-theme
    )
  "List of packages needs to be installed at launch")

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
