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
    ace-jump-mode
    goto-chg
    jump-char
    point-undo
    smartrep

    ;; look
    anzu
    git-gutter-fringe+
    highlight-symbol
    rainbow-delimiters
    rainbow-mode
    yalinum

    ;;; utility
    ;; helm
    helm
    helm-ag
    helm-descbinds
    helm-ls-git

    ;; auto-complete
    auto-complete fuzzy popup

    ;; yasnippet
    yasnippet

    ;; flycheck
    flycheck flycheck-tip

    ;; window, buffer management
    popwin
    tabbar tabbar-ruler

    direx
    gist
    guide-key
    quickrun
    recentf-ext

    ;;; programming
    ;; C/C++
    auto-complete-clang-async
    c-eldoc

    ;; Ruby
    enh-ruby-mode
    inf-ruby
    rubocop
    ruby-end

    ;; JavaScript
    js2-mode

    ;;; markup language
    markdown-mode
    yaml-mode
    web-mode

    ;;; theme
    monokai-theme
    powerline
    ))

(dolist (package my/packages)
  (unless (package-installed-p package)
    (package-install package)))

;;; user site-lisp
(defvar my/site-lisp-directory
  (expand-file-name "site-lisp" user-emacs-directory))

;; rsense
(let* ((shell (getenv "SHELL"))
       (script (expand-file-name "rsense/etc/config.rb" my/site-lisp-directory))
       (target (expand-file-name ".rsense" (getenv "HOME")))
       (cmd (format "%s -i -c 'ruby %s > %s'" shell script target)))
  (when (shell-command cmd)
    (message "Wrote %s" target)))
