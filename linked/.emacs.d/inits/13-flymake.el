;;;; flymake setting

;; flycheck
(custom-set-variables '(flycheck-mode-line " fc")
                      '(flycheck-display-errors-delay 0.5)
                      '(flycheck-disabled-checkers '(
                                                     emacs-lisp-checkdoc
                                                     )))

(defvar my/flycheck-enable-modes '(
                                   c-mode
                                   c++-mode
                                   emacs-lisp-mode
                                   js2-mode
                                   ruby-mode
                                   ))

(dolist (mode my/flycheck-enable-modes)
  (add-hook (intern (format "%s-hook" mode)) 'flycheck-mode))
