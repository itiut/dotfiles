;;;; my own utilities

(defmacro my/with-suppressed-message (&rest body)
  "Suppress new messages temporarily in the echo area and the `*Messages*' buffer while BODY is evaluated."
  (declare (indent 0))
  (let ((message-log-max nil))
    `(with-temp-message (or (current-message) "") ,@body)))

(defun my/find-project-root ()
  "Find and return project root directory when in git project. Otherwise return nil."
  (locate-dominating-file default-directory ".git"))


;;; basic
;;;###autoload
(defun my/revert-buffer ()
  "Interactive call to `revert-buffer'. Ignoring the auto-save file and not requesting for confirmation.
When current buffer is modified, the command refused to revert it, unless you call with prefix arguments."
  (interactive)
  (when (and (buffer-modified-p)
             (not current-prefix-arg))
    (error "Current buffer has been modified"))
  (revert-buffer 'ignore-auto 'noconfirm))


;;; edit
;;;###autoload
(defun my/smart-beginning-of-line (old-point)
  "Move point to the first non-whitespace character or beginning-of-line."
  (interactive "d")
  (back-to-indentation)
  (when (= old-point (point))
    (beginning-of-line)))

;;;###autoload
(defun my/smart-end-of-line ()
  "Move point to end-of-line or the last non-whitespace character."
  (interactive)
  (if (eolp)
      (skip-syntax-backward "-")
    (end-of-line)))

;;;###autoload
(defun my/smart-split-window ()
  "Split current window according to its window size."
  (interactive)
  (let* ((edges (window-pixel-edges))
         (width (- (nth 2 edges) (nth 0 edges)))
         (height (- (nth 3 edges) (nth 1 edges))))
    (if (< width height)
        (split-window-vertically)
      (split-window-horizontally))))

;;;###autoload
(defun my/smart-next-window ()
  (interactive)
  (my/smart-other-window +1))

;;;###autoload
(defun my/smart-previous-window ()
  (interactive)
  (my/smart-other-window -1))

(defun my/smart-other-window (count &optional all-frames)
  "Split window if no more than one window exists, and move other window."
  (let ((do-split-p (one-window-p)))
    (when do-split-p
      (my/smart-split-window))
    (other-window count all-frames)
    (when do-split-p
      (switch-to-buffer (get-buffer (car (helm-buffer-list)))))))

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
(cl-defun my/cd-on-guake (&optional (directory default-directory))
  "Move to current directory on Guake Terminal, then show Guake Terminal."
  (interactive)
  (my/execute-on-guake (format "cd %s" directory))
  (my/toggle-guake))

;;;###autoload
(defun my/cd-project-root-on-guake ()
  "Move to project root directory on Guake Terminal."
  (interactive)
  (let ((project-root (my/find-project-root)))
    (if project-root
        (my/cd-on-guake project-root)
      (my/cd-on-guake))))


;;; iterm
;;;###autoload
(defun my/execute-on-iterm (command)
  "Execute `command' on iTerm."
  (interactive "MCommand: ")
  (do-applescript
   (format "tell application \"iTerm\"
              activate
              tell current session of current terminal
                write text \"%s\"
              end tell
            end tell"
           command)))

;;;###autoload
(cl-defun my/cd-on-iterm (&optional (directory default-directory))
  "Move to current directory on iTerm."
  (interactive)
  (my/execute-on-iterm (format "cd %s" directory)))

;;;###autoload
(defun my/cd-project-root-on-iterm ()
  "Move to project root directory on iTerm."
  (interactive)
  (let ((project-root (my/find-project-root)))
    (if project-root
        (my/cd-on-iterm project-root)
      (my/cd-on-iterm))))

(provide 'my/utils)
