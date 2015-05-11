;;;; theme setting

;; font
(set-face-attribute 'default nil
                    :family "Source Code Pro for Powerline"
                    :height 110)

;; japanese font
(dolist (charset '(japanese-jisx0208 japanese-jisx0212 katakana-jisx0201))
  (set-fontset-font t charset
                    (font-spec :family "Ricty Diminished")))

;; adjust japanese font width to ascii font
(add-to-list 'face-font-rescale-alist
             '("Ricty.*" . 1.2))

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

;; tabbar
(with-eval-after-load 'tabbar
  (set-face-attribute 'tabbar-default nil
                      :inherit 'default
                      :height 1.0
                      :background monokai/hl-line
                      :box nil)
  (set-face-attribute 'tabbar-button nil
                      :box nil)
  (set-face-attribute 'tabbar-selected nil
                      :weight 'bold
                      :foreground monokai/green
                      :background monokai/bg
                      :box nil)
  (set-face-attribute 'tabbar-unselected nil
                      :foreground monokai/fg
                      :box nil)
  (set-face-attribute 'tabbar-modified nil
                      :inherit 'tabbar-unselected
                      :weight 'bold
                      :foreground monokai/orange
                      :box nil))

;; tabbar-ruler
(with-eval-after-load 'tabbar-ruler
  (set-face-attribute 'tabbar-default nil
                      :height 150)
  (set-face-attribute 'tabbar-selected nil
                      :foreground monokai/green
                      :background monokai/bg)
  (set-face-attribute 'tabbar-unselected nil
                      :foreground monokai/fg
                      :background monokai/hl-line)
  (set-face-attribute 'tabbar-selected-modified nil
                      :foreground monokai/orange)
  (set-face-attribute 'tabbar-unselected-modified nil
                      :foreground monokai/orange))

;; yalinum
(with-eval-after-load 'yalinum
  (set-face-attribute 'yalinum-face nil
                      :foreground monokai/comments
                      :background monokai/bg)
  (set-face-attribute 'yalinum-bar-face nil
                      :foreground monokai/fg
                      :background monokai/hl-line))
