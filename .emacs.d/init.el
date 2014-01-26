(require 'cl)

;; Emacs package system
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; exec-path-from-shell
(exec-path-from-shell-initialize)

;; user site-lisp
(defvar my/site-lisp-directory
  (expand-file-name "site-lisp" user-emacs-directory))

(add-to-list 'load-path (expand-file-name "rsense/etc" my/site-lisp-directory))

;; init-loader
(require 'init-loader)
(init-loader-load)
