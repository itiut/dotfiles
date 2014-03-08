;;;; feel setting

;; scroll line by line
(custom-set-variables '(scroll-conservatively 10000)
                      '(scroll-step 1))

;; yes-no-no-p
(defalias 'yes-or-no-p 'y-or-n-p)
(custom-set-variables '(confirm-kill-emacs 'y-or-n-p))

;; ignore case when completing
(custom-set-variables '(read-buffer-completion-ignore-case t)
                      '(read-file-name-completion-ignore-case t))

;; point-undo
(require 'point-undo)

;; smartrep
(require 'smartrep)
(custom-set-variables '(smartrep-mode-line-active-bg nil))


;;; advices
;; region based isearch when region is active
(defadvice isearch-mode (around isearch-mode-default-string (forward &optional regexp op-fun recursive-edit word-p) activate)
  (if (and transient-mark-mode mark-active (not (eq (mark) (point))))
      (progn
        (isearch-update-ring (buffer-substring-no-properties (mark) (point)))
        (deactivate-mark)
        ad-do-it
        (if (not forward)
            (isearch-repeat-backward)
          (goto-char (mark))
          (isearch-repeat-forward)))
    ad-do-it))
