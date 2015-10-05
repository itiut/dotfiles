(require 'cl-lib)

;; Emacs package system
(require 'cask)
(cask-initialize)

;; exec-path-from-shell
(exec-path-from-shell-copy-envs '("GOPATH" "LANG"))
(exec-path-from-shell-initialize)

(defvar my/site-lisp-directory
  (expand-file-name "site-lisp" user-emacs-directory)
  "user directory for site-lisp")

;; load-path
(let ((default-directory my/site-lisp-directory))
  (normal-top-level-add-subdirs-to-load-path))

;; init-loader
(custom-set-variables '(init-loader-show-log-after-init 'error-only))
(init-loader-load)
