;;;; Cocoa Emacs setting

;; adjust font size for retina display
(set-face-attribute 'default nil :height 150)

;; enable menu bar
(menu-bar-mode +1)

;; assign Meta to command key, Super to option key
(setq mac-command-modifier 'meta
      mac-option-modifier 'super)

;; type a backslash on a JIS keyboard
(define-key global-map [165] [92])
;; use M-\ key binding on a JIS keyboard
(global-set-key (kbd "M-¥") (global-key-binding (kbd "M-\\")))
