;;;; popwin setting
(require 'popwin)

(defvar popwin:special-display-config-backup popwin:special-display-config)
(custom-set-variables '(display-buffer-function 'popwin:display-buffer))

;; direx
(push '(direx:direx-mode :position left :width 40 :dedicated t) popwin:special-display-config)

;; quickrun
(push '("*quickrun*") popwin:special-display-config)
