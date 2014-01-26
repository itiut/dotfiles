;;;; dired setting
(require 'dired)

(put 'dired-find-alternate-file 'disabled nil)

(define-key dired-mode-map (kbd "<return>") 'dired-find-alternate-file) ; open in current buffer
(define-key dired-mode-map (kbd "C-<return>") 'dired-find-file) ; open in new buffer

;; wdired
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
