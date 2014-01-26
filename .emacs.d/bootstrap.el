;; Emacs package system
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(package-refresh-contents)

(defvar my/packages
  '(
    ;;; basic
    exec-path-from-shell
    init-loader

    ;; edit
    expand-region
    multiple-cursors
    undo-tree

    ;; feel
    goto-chg
    point-undo
    smartrep

    ;; look
    anzu
    highlight-symbol
    yalinum

    ;;; utility
    ;; helm
    helm
    helm-descbinds

    ;; auto-complete
    auto-complete fuzzy popup

    ;; flycheck
    flycheck flycheck-tip

    quickrun
    recentf-ext

    ;;; programming
    ;; Emacs Lisp
    auto-async-byte-compile

    ;; Ruby
    enh-ruby-mode
    inf-ruby
    rubocop
    ruby-end

    ;;; markup language
    yaml-mode

    ;;; theme
    monokai-theme
    ))

(dolist (package my/packages)
  (unless (package-installed-p package)
    (package-install package)))

;; byte compile Emacs Lisp files
(require 'init-loader)
(byte-recompile-directory init-loader-directory 0)
(byte-recompile-file (expand-file-name "init.el" user-emacs-directory) nil 0)

;;; user site-lisp
(defvar my/site-lisp-directory
  (expand-file-name "site-lisp" user-emacs-directory))

;; rsense
(let* ((script (expand-file-name "rsense/etc/config.rb" my/site-lisp-directory))
       (target (expand-file-name ".rsense" (getenv "HOME")))
       (cmd (format "ruby %s > %s" script target)))
  (shell-command cmd))