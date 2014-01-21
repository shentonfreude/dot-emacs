;; instructions from https://github.com/magit/magit#installation
;; M-x package-refresh-contents RET
;; M-x package-install RET magit RET
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/") ;minimal, signed
                         ("marmalade" . "http://marmalade-repo.org/packages/") ;stable
                         ("melpa" . "http://melpa.milkbox.net/packages/"))) ;snapshots

(package-initialize)


