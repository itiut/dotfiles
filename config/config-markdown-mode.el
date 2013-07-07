;;;; markdown-mode
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; whitespaceのauto-cleanupをオフに
(add-hook 'markdown-mode-hook
          '(lambda ()
             (set (make-local-variable 'whitespace-action) nil)))


(define-key markdown-mode-map (kbd "C-c C-c p") 'my/toggle-markdown-preview)

(defun my/toggle-markdown-preview ()
  "カレントバッファをmarkupでプレビュー/プレビューをやめる."
  (interactive)
  (let ((proc (get-buffer-process "*markup*")))
    (if (and (processp proc)
             (process-live-p proc))
        (progn
          (message "Finish markdown preview")
          (kill-process proc))
      (when (= (call-process-shell-command "which" nil nil nil "markup") 0)
        (progn
          (message "Start markdowp preview")
          (start-process "markup" "*markup*" "markup" buffer-file-name)
          (run-at-time 1 nil 'browse-url "http://localhost:3000"))))))
