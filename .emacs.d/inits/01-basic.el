;;;; basic setting

;; history
(custom-set-variables '(history-length 1000)
                      '(history-delete-duplicates t))

;; desktop-save
(desktop-save-mode 1)
(add-to-list 'desktop-globals-to-save '(extended-command-history . 100))
(add-to-list 'desktop-globals-to-save '(kill-ring . 100))
(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(add-to-list 'desktop-modes-not-to-save 'fundamental-mode)

;; do not create auto-save files, backup files, lock files
(custom-set-variables '(auto-save-default nil)
                      '(backup-inhibited t)
                      '(create-lockfiles nil)
                      '(delete-auto-save-files t)
                      '(make-backup-files nil))

;; automatically revert buffer when changed
(global-auto-revert-mode 1)
(custom-set-variables '(auto-revert-check-vc-info t))

;; vc-mode
(custom-set-variables '(vc-handled-backends '(Git))
                      '(vc-follow-symlinks t))

;; server
(require 'server)
(unless (server-running-p)
  (server-start))
