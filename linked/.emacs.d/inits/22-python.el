;;;; Python mode setting

;; jedi
(custom-set-variables '(jedi:complete-on-dot t)
                      '(jedi:tooltip-method nil))
(add-hook 'python-mode-hook 'jedi:setup)
