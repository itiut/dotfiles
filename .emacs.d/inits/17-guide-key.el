;;;; guide-key setting

(guide-key-mode 1)
(custom-set-variables '(guide-key/guide-key-sequence '("C-x r"
                                                       (flycheck-mode "C-c !")))
                      '(guide-key/highlight-command-regexp "rectangle")
                      '(guide-key/popup-window-position 'bottom)
                      '(guide-key/text-scale-amount -0.25))
