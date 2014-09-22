;; Things like Go need binaries on the PATH
;; but OSX launchers get the default PATH, 
;; so miss custom stuff in my ~/.bash_profile
;; Do this early so other packges find things; is this needed?

(require 'exec-path-from-shell) ;; if not using the ELPA package
(exec-path-from-shell-initialize)
