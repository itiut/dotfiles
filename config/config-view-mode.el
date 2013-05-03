;;; view-mode
(setq view-read-only t)

(add-hook 'view-mode-hook
          '(lambda ()
             (local-set-key (kbd "h") 'backward-char)
             (local-set-key (kbd "l") 'forward-char)
             (local-set-key (kbd "j") 'next-line)
             (local-set-key (kbd "k") 'previous-line)
             (local-set-key (kbd "0") 'beginning-of-line)
             (local-set-key (kbd "^") 'back-to-indentation)
             (local-set-key (kbd "$") 'end-of-line)
             (local-set-key (kbd "G") 'end-of-buffer)
             (local-set-key (kbd "N") 'View-search-last-regexp-backward)))
