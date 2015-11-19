;;;; Cocoa Emacs setting

;; adjust font size for retina display
(set-face-attribute 'default nil :height 150)

;; enable menu bar
(menu-bar-mode +1)

;; type a backslash on a JIS keyboard
(define-key global-map [165] [92])
;; use M-\ key binding on a JIS keyboard
(global-set-key (kbd "M-¥") (global-key-binding (kbd "M-\\")))

;; make helm-man compatible with man 1.6
(custom-set-variables '(helm-man-format-switches "%s"))

;; key binding
(global-set-key (kbd "C-\\") 'my/cd-on-iterm)
(global-set-key (kbd "C-M-\\") 'my/cd-project-root-on-iterm)
