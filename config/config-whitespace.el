;;; whitespace
(require 'whitespace)
;; 行末ブランク, タブ, 全角スペースを可視化
(setq whitespace-style '(face trailing tabs tab-mark spaces space-mark))

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))

;; スペースは全角のみ
(setq whitespace-space-regexp "\\(\u3000+\\)")
