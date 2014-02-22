;;;; my own utilities

(defun my/find-project-root ()
  "Find and return project root directory when in git project. Otherwise return nil."
  (locate-dominating-file default-directory ".git"))


;;; edit
;;;###autoload
(defun my/smart-beginning-of-line (old-point)
  "Move point to the first non-whitespace character or beginning-of-line."
  (interactive "d")
  (back-to-indentation)
  (when (= old-point (point))
    (beginning-of-line)))

;;;###autoload
(defun my/smart-other-window ()
  "Split window if no more than one window exists, and move other window."
  (interactive)
  (if (one-window-p)
      (progn
        (if (< (frame-pixel-width) (frame-pixel-height))
            (split-window-vertically)
          (split-window-horizontally))
        (other-window 1)
        (switch-to-buffer (get-buffer (car (helm-buffer-list)))))
    (other-window 1)))

;;;###autoload
(defun my/kill-region-or-backward-kill-word ()
  "Kill region if region is active and not empty. Otherwise kill a word just before point."
  (interactive)
  (if (use-region-p)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word 1)))

;;;###autoload
(defun my/open-line-above ()
  "Open a line above the cursor, like 'O' in Vim."
  (interactive)
  (beginning-of-line)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))


;;; guake
;;;###autoload
(defun my/execute-on-guake (command)
  "Execute `command' on Guake Terminal."
  (interactive "MCommand: ")
  (start-process-shell-command "guake" nil (format "guake -e '%s'" command)))

;;;###autoload
(defun my/toggle-guake ()
  "Toggle visibility of Guake Terminal."
  (interactive)
  (start-process-shell-command "guake" nil "guake -t"))

;;;###autoload
(defun my/cd-on-guake (&optional directory)
  "Move to current directory in Guake Terminal, then show Guake Terminal."
  (interactive)
  (let ((directory (or directory default-directory)))
    (my/execute-on-guake (format "cd %s" directory)))
  (my/toggle-guake))

;;;###autoload
(defun my/cd-project-root-on-guake ()
  "Move to project root directory in Guake Terminal."
  (interactive)
  (my/cd-on-guake (my/find-project-root)))

(provide 'my/utils)
