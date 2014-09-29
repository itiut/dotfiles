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
(defvar monokai/red (face-foreground 'compilation-error-face))
(defvar monokai/magenta (face-foreground 'ee-marked))
(defvar monokai/violet (face-foreground 'escape-glyph))
(defvar monokai/blue (face-foreground 'link))
(defvar monokai/cyan (face-foreground 'compilation-column-face))
(defvar monokai/green (face-foreground 'success))

;; helm-ls-git
(eval-after-load 'helm-ls-git
  '(progn
     (set-face-attribute 'helm-ls-git-modified-not-staged-face nil
                         :foreground monokai/orange)
     (set-face-attribute 'helm-ls-git-modified-and-staged-face nil
                         :foreground monokai/green)
     (set-face-attribute 'helm-ls-git-renamed-modified-face nil
                         :foreground monokai/cyan)
     (set-face-attribute 'helm-ls-git-untracked-face nil
                         :foreground monokai/red)
     (set-face-attribute 'helm-ls-git-added-copied-face nil
                         :foreground monokai/green)
     (set-face-attribute 'helm-ls-git-added-modified-face nil
                         :foreground monokai/orange)
     (set-face-attribute 'helm-ls-git-deleted-not-staged-face nil
                         :foreground monokai/violet)
     (set-face-attribute 'helm-ls-git-deleted-and-staged-face nil
                         :foreground monokai/comments)
     (set-face-attribute 'helm-ls-git-conflict-face nil
                         :foreground monokai/magenta)))

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
