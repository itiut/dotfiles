;;;; color-moccur
(require 'color-moccur)

(global-set-key (kbd "M-o") 'occur-by-moccur) ; 現在のバッファを検索
(global-set-key (kbd "M-O") 'moccur)          ; 全バッファを検索

;; スペース区切りでAND検索
(setq moccur-split-word t)
