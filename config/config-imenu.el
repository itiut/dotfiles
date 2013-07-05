;;;; imenu
(require 'imenu)

(setq imenu-auto-rescan t)
(setq imenu-after-jump-hook
      '(lambda ()
         (recenter 10)))
