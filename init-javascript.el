;;; javascript validation via rhino jar and jslint
(defun my-js-validate ()
  (interactive)
  (if (string-match "\\.js$" (buffer-file-name))
      (shell-command
       (concat
        "java -jar ~/Projects/rhino1_7R3pre/js.jar ~/Projects/rhino1_7R3pre/jslint.js "
        (buffer-file-name (current-buffer))))))

(defun my-js-hooks ()
  (progn
    (message "Entered Javascript Mode")
    (add-hook 'after-save-hook 'my-js-validate)))

;; this could get very annoying, with my errors!
(add-hook 'javascript-mode-hook 'my-js-hooks)
(add-hook 'espresso-mode-hook 'my-js-hooks)
(add-hook 'js2-mode-hook 'my-js-hooks)

;;; jslint with flymake: flymake-jslint.el can't find/run java -jar ...
(require 'flymake-jslint)
(add-hook 'javascript-mode-hook
 	  (lambda () (flymake-mode t)))


;;; json editing (just one of several)
(add-to-list 'auto-mode-alist '("\\.js\\'" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . espresso-mode))
(autoload 'espresso-mode "espresso" nil t)

