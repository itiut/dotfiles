(require 'cl)

;; Emacs package system
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; exec-path-from-shell
(exec-path-from-shell-initialize)

;; init-loader
(require 'init-loader)
(init-loader-load)
