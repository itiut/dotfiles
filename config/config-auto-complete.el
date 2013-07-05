;;; auto-complete
(require 'auto-complete-config)

;; デフォルトの情報源の設定
(ac-config-default)
(setq ac-comphist-file (expand-file-name "ac-comphist.dat" my/cache-dir))
(add-to-list 'ac-dictionary-directories (expand-file-name "ac-dict/" my/etc-dir))

(setq ac-use-menu-map t)
(global-set-key (kbd "M-/") 'ac-start)
(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)

;; 3文字以上で自動補完開始
(setq ac-auto-start 4)
;; 補完を出してからヘルプを出すまでの遅延(秒)
(setq ac-quick-help-delay 0.25)
