;;;; dired
(require 'dired)

;; dired-find-alternate-file を有効化
(put 'dired-find-alternate-file 'disabled nil)

(define-key dired-mode-map (kbd "<return>") 'dired-find-alternate-file) ; 同じバッファで開く
(define-key dired-mode-map (kbd "C-<return>") 'dired-find-file) ; 新しいバッファで開く
(define-key dired-mode-map (kbd "C-t") (lookup-key global-map (kbd "C-t")))


;;;; wdired
(require 'wdired)

(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
