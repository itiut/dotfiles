;;;; look setting

;; disable menu bar
(menu-bar-mode -1)

(when window-system
  ;; disable tool bar, scroll bar
  (tool-bar-mode -1)
  (scroll-bar-mode -1)

  ;; frame title
  (setq frame-title-format
        '((buffer-file-name "%f" (dired-directory dired-directory "%b"))
          " - Emacs"
          emacs-version)))

;; disable startup screen
(setq inhibit-startup-screen t)

;; mode line
(line-number-mode 1)                    ; line number
(column-number-mode 1)                  ; colum number
(size-indication-mode 1)                ; file size

;; disable line wrap
(setq-default truncate-lines t)

;; highlight
(global-hl-line-mode 1)                 ; current line
(show-paren-mode 1)                     ; parens
(custom-set-variables
 '(show-trailing-whitespace t))         ; spaces before EOL

;; uniquify
(require 'uniquify)
(custom-set-variables
 '(uniquify-buffer-name-style 'post-forward-angle-brackets))

;; anzu
(global-anzu-mode 1)
(custom-set-variables
 '(anzu-mode-lighter "")
 '(anzu-deactivate-region t)
 '(anzu-search-threshold 1000))

;; git-gutter-fringe
(require 'git-gutter-fringe)
(global-git-gutter-mode 1)
(setq git-gutter-fr:side 'right-fringe)

;; yalinum
(global-yalinum-mode 1)
