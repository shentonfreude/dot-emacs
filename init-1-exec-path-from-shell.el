;; Things like Go need binaries on the PATH
;; but OSX launchers get the default PATH, 
;; so miss custom stuff in my ~/.bash_profile
;; Do this early so other packges find things; is this needed?
;; Only do this on OS X, it hangs on FreeBSD

;; 2015-03-17 https://github.com/bradleywright/exec-path-from-shell
;; from Marmalade and MELPA
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
