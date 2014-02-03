;;;; helm setting

(eval-after-load 'helm
  '(progn
     (helm-descbinds-mode)

     (define-key helm-map (kbd "C-w") 'backward-kill-word)
     (define-key helm-map (kbd "C-M-n") 'helm-next-source)
     (define-key helm-map (kbd "C-M-p") 'helm-previous-source)))
