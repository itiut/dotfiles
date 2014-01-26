;;;; theme setting

;; font
(set-face-attribute 'default nil
                    :family "Ricty"
                    :height 110)

;; monokai
(load-theme 'monokai t)

(let ((monokai-fg (face-foreground 'default))
      (monokai-bg (face-background 'default))
      (monokai-hi-line (face-background 'hl-line))
      (monokai-comments (face-foreground 'shadow)))

  ;; yalinum
  (set-face-attribute 'yalinum-face nil
                      :foreground monokai-comments
                      :background monokai-bg)
  (set-face-attribute 'yalinum-bar-face nil
                      :foreground monokai-fg
                      :background monokai-hi-line))
