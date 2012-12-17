;;; helm-gtags
(require 'helm-config)
(require 'helm-gtags)

(defun my-helm-gtags-mode-setup ()
  (setq helm-c-gtags-path-style 'relative)
  (setq helm-c-gtags-ignore-case t)
  (helm-gtags-mode))

(add-hook 'c-mode-hook 'my-helm-gtags-mode-setup)
(add-hook 'c++-mode-hook 'my-helm-gtags-mode-setup)

;; key bindings
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-x g t") 'helm-gtags-find-tag)
             (local-set-key (kbd "C-x g r") 'helm-gtags-find-rtag)
             (local-set-key (kbd "C-x g s") 'helm-gtags-find-symbol)
             (local-set-key (kbd "M-t") 'helm-gtags-pop-stack)))
