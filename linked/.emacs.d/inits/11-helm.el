;;;; helm setting

(custom-set-variables '(helm-truncate-lines t)
                      '(helm-gtags-suggested-key-mapping t)
                      '(helm-ls-git-show-abs-or-relative 'relative))

(with-eval-after-load 'helm
  (helm-descbinds-mode)
  (helm-projectile-on)

  (define-key helm-map (kbd "C-w") 'backward-kill-word)
  (define-key helm-map (kbd "C-M-n") 'helm-next-source)
  (define-key helm-map (kbd "C-M-p") 'helm-previous-source))

;; helm-gtags
(with-eval-after-load 'helm-gtags
  (smartrep-define-key
      helm-gtags-mode-map "C-c" '((">" . 'helm-gtags-next-history)
                                  ("<" . 'helm-gtags-previous-history))))

;; helm-ls-git-ls
(with-eval-after-load 'helm-ls-git
  (defadvice helm-ls-git-ls (around use-show-abs-or-relative-by-default activate)
    (let ((helm-ff-transformer-show-only-basename nil))
      ad-do-it)))
