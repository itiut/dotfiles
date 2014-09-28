;;;; guide-key setting

(guide-key-mode 1)
(custom-set-variables '(guide-key/guide-key-sequence
                        '("C-x r"
                          (flycheck-mode "C-c !")
                          (gfm-mode "C-c"
                                    "C-c C-a"
                                    "C-c C-c"
                                    "C-c C-s"
                                    "C-c C-t"
                                    "C-c C-x")))
                      '(guide-key/highlight-command-regexp
                        (regexp-opt '("rectangle"
                                      "markdown")))
                      '(guide-key/popup-window-position 'bottom)
                      '(guide-key/text-scale-amount -0.25))
