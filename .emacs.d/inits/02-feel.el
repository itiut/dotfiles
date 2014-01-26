;;;; feel setting

;; scroll line by line
(setq scroll-conservatively 10000
      scroll-step 1)

;; yes-no-no-p
(defalias 'yes-or-no-p 'y-or-n-p)
(setq confirm-kill-emacs 'y-or-n-p)

;; ignore case when completion
(setq read-buffer-completion-ignore-case t
      read-file-name-completion-ignore-case t)

;; point-undo
(require 'point-undo)

;; smartrep
(require 'smartrep)
(custom-set-variables
 '(smartrep-mode-line-active-bg nil))

;;; functions
(defun my/smart-beginning-of-line (old-point)
  "Move point to the first non-whitespace character or beginning-of-line."
  (interactive "d")
  (back-to-indentation)
  (when (= old-point (point))
    (beginning-of-line)))

(defun my/smart-other-window ()
  "Split window if no more than one window exists, and move other window."
  (interactive)
  (when (one-window-p)
    (if (< (frame-pixel-width) (frame-pixel-height))
        (split-window-vertically)
      (split-window-horizontally)))
  (other-window 1))

(defun my/kill-region-or-backward-kill-word (beg end)
  "Kill region if region is active and not empty. Otherwise kill a word just before point."
  (interactive "r")
  (if (use-region-p)
      (kill-region beg end)
    (backward-kill-word 1)))

(defun my/open-line-above ()
  "Open a line above the cursor, like 'O' in Vim."
  (interactive)
  (indent-according-to-mode)
  (move-beginning-of-line nil)
  (newline)
  (let ((current-prefix-arg 1))
    (call-interactively 'previous-line))
  (indent-according-to-mode))
