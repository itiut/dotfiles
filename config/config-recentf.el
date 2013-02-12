;;; recentf
(require 'recentf)
(setq recentf-save-file (expand-file-name (concat ".recentf-" system-name) my-cache-dir))
(setq recentf-max-saved-items 1000)
(recentf-mode 1)
