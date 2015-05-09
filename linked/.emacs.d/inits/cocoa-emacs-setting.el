;;;; Cocoa Emacs setting

;; font
(set-face-attribute 'default nil
                    :family "Source Code Pro for Powerline"
                    :height 150)

;; japanese font
(dolist (charset '(japanese-jisx0208 japanese-jisx0212 katakana-jisx0201))
  (set-fontset-font nil charset
                    (font-spec :family "Ricty Diminished")))

;; adjust japanese font width to ascii font
(add-to-list 'face-font-rescale-alist
             '("Ricty.*" . 1.2))

;; assign Meta to command key, Super to option key
(setq mac-command-modifier 'meta
      mac-option-modifier 'super)

;; type a backslash on a JIS keyboard
(define-key global-map [165] [92])
;; use M-\ key binding on a JIS keyboard
(global-set-key (kbd "M-¥") (global-key-binding (kbd "M-\\")))
