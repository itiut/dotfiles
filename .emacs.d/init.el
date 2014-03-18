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

;; load-path
(add-to-list 'load-path (expand-file-name "rsense/etc" my/site-lisp-directory))

;; init-loader
(require 'init-loader)
(custom-set-variables '(init-loader-show-log-after-init nil))
(init-loader-load)
