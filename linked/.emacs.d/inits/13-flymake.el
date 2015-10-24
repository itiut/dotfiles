;;;; flymake setting

;; flycheck
(custom-set-variables '(flycheck-mode-line " fc")
                      '(flycheck-display-errors-delay 0.5)
                      '(flycheck-disabled-checkers '(
                                                     emacs-lisp-checkdoc
                                                     )))
(global-flycheck-mode 1)
