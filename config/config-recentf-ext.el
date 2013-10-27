;;; recentf-ext
(require 'recentf-ext)

(custom-set-variables `(recentf-save-file (expand-file-name (concat ".recentf-" system-name) my/cache-dir)))
(setq recentf-max-saved-items 1000)
