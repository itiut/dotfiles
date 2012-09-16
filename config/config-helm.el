;;; helm
(require 'helm-config)
(global-set-key (kbd "C-x b") 'helm-for-files)
(global-set-key (kbd "C-x C-b") 'helm-mini)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(helm-mode 1)
