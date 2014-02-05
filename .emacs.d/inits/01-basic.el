;;;; basic setting

;; history
(setq history-length 1000
      history-delete-duplicates t)

;; desktop-save
(desktop-save-mode 1)
(add-to-list 'desktop-globals-to-save '(extended-command-history . 100))
(add-to-list 'desktop-globals-to-save '(kill-ring . 100))

;; no backup file and no auto save file
(custom-set-variables '(auto-save-default nil)
                      '(backup-inhibited t)
                      '(delete-auto-save-files t)
                      '(make-backup-files nil))

;; automatically revert buffer when changed
(global-auto-revert-mode 1)

;; disable vc-mode
(custom-set-variables '(vc-handled-backends nil))
(remove-hook 'find-file-hooks 'vc-find-file-hook)

;; server
(require 'server)
(unless (server-running-p)
  (server-start))
