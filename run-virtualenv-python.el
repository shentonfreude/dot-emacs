;;; http://forrst.com/posts/Easily_run_Python_virtualenv_REPLs_in_Emacs-0fs

(defun absolute-dirname (path)
  "Return the directory name portion of a path.

If PATH is local, return it unaltered.
If PATH is remote, return the remote diretory portion of the path."
  (if (tramp-tramp-file-p path)
      (elt (tramp-dissect-file-name path) 3)
    path))

(defun run-virtualenv-python (&optional env)
  "Run Python in this virtualenv."
  (interactive)
  (let ((env-root (locate-dominating-file
                   (or env default-directory) "bin/python")))
    (apply 'run-python
           (when env-root
             (list (concat (absolute-dirname env-root) "bin/python"))))))

(defun python-generate-repl-name (&optional buffer)
  "Generate a better name for a Python buffer."
  (let ((buffer (or buffer (window-buffer))))
    (with-current-buffer buffer
      (concat
       "*Python-"
       (file-name-nondirectory
        (substring default-directory 0
                   (when (equal (substring default-directory -1) "/") -1)))
       "@"
       (car (split-string (if (tramp-tramp-file-p default-directory)
                              (with-parsed-tramp-file-name default-directory py
                                py-host)
                            (system-name)) "\\."))
       "*"))))

(add-hook 'inferior-python-mode-hook
          (lambda () (rename-buffer (python-generate-repl-name))))