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
(defvar my/green (face-foreground 'success))
(defvar my/orange (face-foreground 'error))

;; helm-ls-git
(eval-after-load 'helm-ls-git
  '(progn
     (set-face-attribute 'helm-ls-git-modified-not-staged-face nil
                         :foreground my/orange)
     (set-face-attribute 'helm-ls-git-modified-and-staged-face nil
                         :foreground my/green)
     (set-face-attribute 'helm-ls-git-renamed-modified-face nil
                         :foreground (face-foreground 'compilation-column-face)) ; cyan
     (set-face-attribute 'helm-ls-git-untracked-face nil
                         :foreground (face-foreground 'compilation-error-face)) ; red
     (set-face-attribute 'helm-ls-git-added-copied-face nil
                         :foreground my/green)
     (set-face-attribute 'helm-ls-git-added-modified-face nil
                         :foreground my/orange)
     (set-face-attribute 'helm-ls-git-deleted-not-staged-face nil
                         :foreground (face-foreground 'escape-glyph)) ; violet
     (set-face-attribute 'helm-ls-git-deleted-and-staged-face nil
                         :foreground (face-foreground 'shadow)) ; gray
     (set-face-attribute 'helm-ls-git-conflict-face nil
                         :foreground (face-foreground 'ee-marked)))) ; magenta

;; tabbar-ruler
(eval-after-load 'tabbar-ruler
  '(progn
     (set-face-attribute 'tabbar-default nil
                         :height 150)
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
