;;;; Go mode setting

(with-eval-after-load 'go-mode
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook 'go-eldoc-setup)
  (add-hook 'go-mode-hook 'my/go-mode-hook)

  (define-key go-mode-map (kbd "M-.") 'godef-jump)

  ;; go-autocomplete
  (require 'go-autocomplete)

  ;; helm-go-package
  (substitute-key-definition 'go-import-add 'helm-go-package go-mode-map))

(defun my/go-mode-hook ()
  (setq indent-tabs-mode t))
