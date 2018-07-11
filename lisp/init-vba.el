;;; package -- Summary

;;; Commentary:
;;; Visual Basic Mode
;;; https://www.emacswiki.org/emacs/download/visual-basic-mode.el

;;; Code:
(autoload 'visual-basic-mode "visual-basic-mode" "Visual Basic mode." t)
(push '("\\.\\(?:frm\\|\\(?:ba\\|cl\\|vb\\)s\\)\\'" . visual-basic-mode)
      auto-mode-alist)

(provide 'init-vba)
;;; init-vba.el ends here
