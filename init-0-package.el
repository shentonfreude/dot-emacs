;; instructions from https://github.com/magit/magit#installation
;; M-x package-refresh-contents RET
;; M-x package-install RET magit RET
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/") ;minimal, signed
                         ("marmalade" . "http://marmalade-repo.org/packages/") ;stable
                         ("melpa" . "http://melpa.milkbox.net/packages/") ;snapshots
                         ))

(package-initialize)


;; how do we require our packages, so that other packages we want find them? 
;; On Vampyre, I now have:
  ;; auto-complete      20140824.... installed  Auto Completion for GNU Emacs
  ;; direx              20140323.908 installed  Simple Directory Explorer
  ;; exec-path-from-... 20140731.907 installed  Get environment variables such as $PATH from the shell
  ;; flymake            0.4.16       installed  a universal on-the-fly syntax checker
  ;; flymake-go         20130314.741 installed  A flymake handler for go-mode files
  ;; git-commit-mode    20140831.... installed  Major mode for editing git commit messages
  ;; git-rebase-mode    20140605.520 installed  Major mode for editing git rebase files
  ;; go-autocomplete    20140527.... installed  auto-complete-mode backend for go-mode
  ;; go-direx           20140701.826 installed  Tree style source code viewer for Go language
  ;; go-eldoc           20140919.329 installed  eldoc for go-mode
  ;; go-errcheck        20140107.... installed  errcheck integration for go-mode
  ;; go-mode            20140905.... installed  Major mode for the Go programming language
  ;; go-play            20120914.... installed  Paste to play.golang.org
  ;; go-snippets        20130821.844 installed  Yasnippets for go
  ;; magit              20140908.... installed  control Git from Emacs
  ;; magit-gitflow      20140512.... installed  gitflow extension for magit
  ;; markdown-mode      20140914.... installed  Emacs Major mode for Markdown-formatted text files
  ;; popup              20140815.629 installed  Visual Popup User Interface
  ;; yaml-mode          20140824.... installed  Major mode for editing YAML files
  ;; yasnippet          20140911.312 installed  Yet another snippet extension for Emacs.
