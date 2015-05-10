;;;; view setting

(custom-set-variables '(view-read-only t))

(with-eval-after-load 'view
  (define-key view-mode-map (kbd "h") 'backward-char)
  (define-key view-mode-map (kbd "j") 'next-line)
  (define-key view-mode-map (kbd "k") 'previous-line)
  (define-key view-mode-map (kbd "l") 'forward-char)
  (define-key view-mode-map (kbd "0") 'beginning-of-line)
  (define-key view-mode-map (kbd "^") 'back-to-indentation)
  (define-key view-mode-map (kbd "$") 'end-of-line)
  (define-key view-mode-map (kbd "G") 'end-of-buffer)
  (define-key view-mode-map (kbd "?") 'View-search-regexp-backward)
  (define-key view-mode-map (kbd "N") 'View-search-last-regexp-backward))

(add-hook 'Man-mode-hook 'view-mode)
