;;;; dired setting

(eval-after-load 'dired
  '(progn
     (define-key dired-mode-map (kbd "q") 'kill-this-buffer)

     ;; enable dired-find-alternate-file
     (put 'dired-find-alternate-file 'disabled nil)
     (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file) ; open in current buffer

     ;; dired-x
     (custom-set-variables '(dired-bind-jump nil))
     (require 'dired-x)

     ;; wdired
     (require 'wdired)
     (define-key dired-mode-map (kbd "r") 'wdired-change-to-wdired-mode)))

;; direx
(defun my/dired-jump ()
  (interactive)
  (cond (current-prefix-arg
         (dired-jump))
        (t
         (or (ignore-errors
                 (direx-project:jump-to-project-root-other-window) t)
               (direx:jump-to-directory-other-window)))))
