;;; XML, HTML, ZCML
(autoload 'nxml-mode "nxml-mode" nil t)
(setq auto-mode-alist
      (cons '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\|zcml\\|pt\\)\\'" . nxml-mode)
            auto-mode-alist))

;;; Darwinports installs /opt/local/xmlstarlet; brew does /usr/local/bin/xml
(defun flymake-xml-init ()
  (list "/usr/local/bin/xml" (list "val" "-e" "-q" (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))))

