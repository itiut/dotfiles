;;;; dired setting

(eval-after-load 'dired
  '(progn
     ;; enable dired-find-alternate-file
     (put 'dired-find-alternate-file 'disabled nil)
     (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file) ; open in current buffer

     ;; wdired
     (require 'wdired)
     (define-key dired-mode-map (kbd "r") 'wdired-change-to-wdired-mode)))

;; dired-x
;; automatically bind dired-jump to C-x C-j
(require 'dired-x)

;; direx
(defun my/dired-jump ()
  (interactive)
  (cond (current-prefix-arg
         (dired-jump))
        (t
         (or (ignore-errors
                 (direx-project:jump-to-project-root-other-window) t)
               (direx:jump-to-directory-other-window)))))
