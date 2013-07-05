;;;; tabbar
(require 'tabbar)

(global-set-key (kbd "<C-tab>") 'tabbar-forward-tab)
(global-set-key (kbd "<C-S-tab>") 'tabbar-backward-tab)
(global-set-key (kbd "<C-S-iso-lefttab>") 'tabbar-backward-tab)

;; グループを使わない
(setq tabbar-buffer-groups-function nil)

;; タブ上でホイール操作無効化
(tabbar-mwheel-mode -1)

;; タブをスクロールさせる
(setq tabbar-auto-scroll-flag t)

;; タブ間の幅
(setq tabbar-separator '(0.8))

;; 左側のボタンを非表示
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

;; タブに表示させるバッファ
(defvar my/tabbar-displayed-buffers
  '("*scratch*" "*Backtrace*" "*Colors*" "*Faces*" "*vc-")
  "*Regexps matches buffer names always included tabs.")

(defun my/tabbar-buffer-list ()
  "Return the list of buffers to show in tabs.
Exclude buffers whose name starts with a space or an asterisk.
The current buffer and buffers matches `my/tabbar-displayed-buffers'
are always included."
  (let* ((hides (list ?\  ?\*))
         (re (regexp-opt my/tabbar-displayed-buffers))
         (cur-buf (current-buffer))
         (tabs (delq nil
                     (mapcar (lambda (buf)
                               (let ((name (buffer-name buf)))
                                 (when (or (string-match re name)
                                           (not (memq (aref name 0) hides)))
                                   buf)))
                             (buffer-list)))))
    ;; Always include the current buffer.
    (if (memq cur-buf tabs)
        tabs
      (cons cur-buf tabs))))
(setq tabbar-buffer-list-function 'my/tabbar-buffer-list)

(tabbar-mode t)
