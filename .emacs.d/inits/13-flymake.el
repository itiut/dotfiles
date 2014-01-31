;;;; flymake setting

;; flycheck
(custom-set-variables '(flycheck-display-errors-delay 0.5))

(defvar my/flycheck-enable-modes '(
                                   ruby-mode
                                   enh-ruby-mode
                                   ))

(dolist (mode my/flycheck-enable-modes)
  (add-hook (intern (format "%s-hook" mode)) 'flycheck-mode))
