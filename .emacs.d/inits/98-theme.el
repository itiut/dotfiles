;;;; theme setting

;; font
(set-face-attribute 'default nil
                    :family "Ricty"
                    :height 110)

;; monokai
(load-theme 'monokai t)

(defvar my/fg-color (face-foreground 'default))
(defvar my/bg-color (face-background 'default))
(defvar my/comments-color (face-foreground 'shadow))
(defvar my/hl-line-color (face-background 'hl-line))

;; tabbar-ruler
(eval-after-load 'tabbar-ruler
  '(progn
     (set-face-attribute 'tabbar-selected nil
                         :foreground (face-foreground 'mode-line-buffer-id)
                         :background my/bg-color)
     (set-face-attribute 'tabbar-unselected nil
                         :foreground my/fg-color
                         :background my/hl-line-color)
     (set-face-attribute 'tabbar-unselected-modified nil
                         :foreground (face-foreground 'error))))

;; yalinum
(eval-after-load 'yalinum
  '(progn
     (set-face-attribute 'yalinum-face nil
                         :foreground my/comments-color
                         :background my/bg-color)
     (set-face-attribute 'yalinum-bar-face nil
                         :foreground my/fg-color
                         :background my/hl-line-color)))
