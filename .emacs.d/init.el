(require 'cl)

;; Emacs package system
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; exec-path-from-shell
(exec-path-from-shell-initialize)

(defvar my/site-lisp-directory
  (expand-file-name "site-lisp" user-emacs-directory)
  "user directory for site-lisp")
(defvar my/development-directory
  (expand-file-name "development" user-emacs-directory)
  "user directory for development")

;; load-path
(add-to-list 'load-path (expand-file-name "rsense/etc" my/site-lisp-directory))
(let ((default-directory my/development-directory))
  (normal-top-level-add-subdirs-to-load-path))

;; init-loader
(require 'init-loader)
(custom-set-variables '(init-loader-show-log-after-init nil))
(init-loader-load)
