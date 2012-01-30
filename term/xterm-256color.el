;;; Over ssh to Centos this gives me colors but not 256.
;;; Much better thos.
;;;http://www.xvx.ca/~awg/emacs-colors-howto.txt

;;; This is for GNU Emacs 22
(defun terminal-init-screen ()
  "Terminal initialization function for screen."
  ;; Use the xterm color initialization code.
  (load "term/xterm")
  (xterm-register-default-colors)
  (tty-set-up-initial-frame-faces))
