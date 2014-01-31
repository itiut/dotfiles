;;;; recentf setting

(custom-set-variables '(recentf-max-saved-items 1000)
                      '(recentf-auto-cleanup 600)
                      '(recentf-save-file (expand-file-name ".recentf" user-emacs-directory)))

;; recentf-ext
(require 'recentf-ext)
