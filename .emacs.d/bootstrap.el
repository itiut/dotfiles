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

    quickrun
    recentf-ext

    ;;; programming
    ;; Emacs Lisp
    auto-async-byte-compile

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
