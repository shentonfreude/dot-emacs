;;; There are other virtualenv.el out there but they expect
;;; Doug Hellman's virtualenvwrapper which I rarely use.
;;; This one seems simpler, try it first.
;;;
;;; http://dreid.org/2010/02/mimicing-source-virtualenvbinactivate.html/

(defun add-to-PATH (dir)
  "Add the specified path element to the Emacs PATH"
  (interactive "DEnter directory to be added to PATH: ")
  (if (file-directory-p dir)
      (setenv "PATH"
              (concat (expand-file-name dir)
                      path-separator
                      (getenv "PATH")))))

(defun activate-virtualenv (dir)
  (setenv "VIRTUAL_ENV" dir)
  (add-to-PATH (concat dir "/bin"))
  (add-to-list 'exec-path (concat dir "/bin")))
