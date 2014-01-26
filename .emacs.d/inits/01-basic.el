;;;; basic setting

;; encoding
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8-unix)

;; history
(setq history-length 200
      history-delete-duplicates t)
(savehist-mode 1)

;; no backup and no auto save file
(setq backup-inhibited t
      delete-auto-save-files t)

;; automatically revert buffer when changed
(global-auto-revert-mode 1)

;; disable vc-mode
(custom-set-variables
 '(vc-handled-backends nil))

;; server
(require 'server)
(unless (server-running-p)
  (server-start))
