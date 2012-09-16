;;; recentf
(require 'recentf)
(setq recentf-save-file (expand-file-name (concat ".cache/.recentf-" system-name)
                                          user-emacs-directory))
(setq recentf-max-saved-items 1000)
(recentf-mode 1)
