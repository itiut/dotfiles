;;;; helm setting

(custom-set-variables '(helm-truncate-lines t)
                      '(helm-ls-git-show-abs-or-relative 'relative))

(with-eval-after-load 'helm
  (helm-descbinds-mode)

  (define-key helm-map (kbd "C-w") 'backward-kill-word)
  (define-key helm-map (kbd "C-M-n") 'helm-next-source)
  (define-key helm-map (kbd "C-M-p") 'helm-previous-source))

;; helm-gtags
(with-eval-after-load 'helm-gtags
  (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
  (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
  (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
  (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
  (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
  (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack))

;; helm-ls-git-ls
(with-eval-after-load 'helm-ls-git
  (defadvice helm-ls-git-ls (around use-show-abs-or-relative-by-default activate)
    (let ((helm-ff-transformer-show-only-basename nil))
      ad-do-it)))
