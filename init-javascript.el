;;; Switch from built-in espresso/javascript to js2/javascript-ide for better 'var' indents.

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
    (set-variable 'indent-tabs-mode nil)
    (add-hook 'after-save-hook 'my-js-validate)))

(defun before-save-hook ()
  (delete-trailing-whitespace)
  )

;; this could get very annoying, with my errors!
(add-hook 'javascript-mode-hook 'my-js-hooks)
(add-hook 'espresso-mode-hook 'my-js-hooks)
(add-hook 'js2-mode-hook 'my-js-hooks)

;;; jslint with flymake: flymake-jslint.el can't find/run java -jar ...
(require 'flymake-jslint)
(add-hook 'javascript-mode-hook
 	  (lambda () (flymake-mode t)))


;;; json editing (just one of several)
;;; As of Emacs-23.2, js-mode is included (else use espresso-mode)
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js2-mode))
(autoload 'espresso-mode "espresso" nil t)
(autoload 'js2-mode "js2" nil t)
(autoload 'js2-mode "espresso" nil t)   ;for the espresso--proper-indentation

;;; espresso is now emacs 'js'
;;; javascript-ide is now emacs 'js2'

;http://mihai.bazon.net/projects/editing-javascript-with-emacs-js2-mode
;; (defun my-js2-indent-function ()
;;   (interactive)
;; ;;  (require 'espresso)
;;   (save-restriction
;;     (widen)
;;     (let* ((inhibit-point-motion-hooks t)
;;            (parse-status (save-excursion (syntax-ppss (point-at-bol))))
;;            (offset (- (current-column) (current-indentation)))
;;            (indentation (espresso--proper-indentation parse-status))
;;            node)

;;       (save-excursion

;;         ;; I like to indent case and labels to half of the tab width
;;         ;; (back-to-indentation)
;;         ;; (if (looking-at "case\\s-")
;;         ;;     (setq indentation (+ indentation (/ espresso-indent-level 2))))

;;         ;; consecutive declarations in a var statement are nice if
;;         ;; properly aligned, i.e:
;;         ;;
;;         ;; var foo = "bar",
;;         ;;     bar = "foo";
;;         (setq node (js2-node-at-point))
;;         (when (and node
;;                    (= js2-NAME (js2-node-type node))
;;                    (= js2-VAR (js2-node-type (js2-node-parent node))))
;;           (setq indentation (+ 4 indentation))))

;;       (indent-line-to indentation)
;;       (when (> offset 0) (forward-char offset)))))

