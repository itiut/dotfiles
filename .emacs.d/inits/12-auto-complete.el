;;;; auto-complete setting
(require 'auto-complete-config)

(ac-config-default)

(custom-set-variables '(ac-use-menu-map t)
                      '(ac-quick-help-delay 0.25))

;; enable auto-complete mode other than default enable modes
(dolist (mode '(enh-ruby-mode))
  (add-to-list 'ac-modes mode))
