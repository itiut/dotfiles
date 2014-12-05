;;;; theme setting

;; font
(set-face-attribute 'default nil
                    :family "Ricty for Powerline"
                    :height 110)

;; monokai
(load-theme 'monokai t)

(defvar monokai/fg (face-foreground 'default))
(defvar monokai/bg (face-background 'default))
(defvar monokai/comments (face-foreground 'shadow))
(defvar monokai/hl-line (face-background 'hl-line))
(defvar monokai/yellow (face-foreground 'warning))
(defvar monokai/orange (face-foreground 'error))
;; (defvar monokai/red (face-foreground 'compilation-error-face))
;; (defvar monokai/magenta (face-foreground 'ee-marked))
(defvar monokai/violet (face-foreground 'escape-glyph))
(defvar monokai/blue (face-foreground 'link))
;; (defvar monokai/cyan (face-foreground 'compilation-column-face))
(defvar monokai/green (face-foreground 'success))

;; tabbar-ruler
(eval-after-load 'tabbar-ruler
  '(progn
     (set-face-attribute 'tabbar-default nil
                         :height 150)
     (set-face-attribute 'tabbar-selected nil
                         :foreground monokai/green
                         :background monokai/bg)
     (set-face-attribute 'tabbar-unselected nil
                         :foreground monokai/fg
                         :background monokai/hl-line)
     (set-face-attribute 'tabbar-unselected-modified nil
                         :foreground monokai/orange)))

;; yalinum
(eval-after-load 'yalinum
  '(progn
     (set-face-attribute 'yalinum-face nil
                         :foreground monokai/comments
                         :background monokai/bg)
     (set-face-attribute 'yalinum-bar-face nil
                         :foreground monokai/fg
                         :background monokai/hl-line)))
