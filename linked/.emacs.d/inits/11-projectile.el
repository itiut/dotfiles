;;;; projectile setting

(custom-set-variables '(projectile-enable-caching t)
                      '(projectile-mode-line
                        '(:eval (format " pt[%s]" (projectile-project-name)))))
(projectile-global-mode +1)
