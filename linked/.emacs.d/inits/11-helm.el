;;;; helm setting

(custom-set-variables '(helm-truncate-lines t)
                      '(helm-ls-git-show-abs-or-relative 'relative))

(eval-after-load 'helm
  '(progn
     (helm-descbinds-mode)

     (define-key helm-map (kbd "C-w") 'backward-kill-word)
     (define-key helm-map (kbd "C-M-n") 'helm-next-source)
     (define-key helm-map (kbd "C-M-p") 'helm-previous-source)))

;; helm-ls-git-ls
(eval-after-load 'helm-ls-git
  '(progn
     (defadvice helm-ls-git-ls (around use-show-abs-or-relative-by-default activate)
       (let ((helm-ff-transformer-show-only-basename nil))
         ad-do-it))))
