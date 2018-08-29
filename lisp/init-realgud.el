;;; package -- Summary: Setup realgud, a replacement for gud debugger
;;; Commentary:
;;; load it, then set it up
;;; Code:
(load-library "realgud")

;;; for pipenv virtualenvs there's not 'pdb' command
(setq realgud:pdb-command-name "python -m pdb")

(provide 'init-realgud)

;;; init-realgud.el ends here
