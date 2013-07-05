;;; zencoding-mode
(autoload 'zencoding-mode "zencoding-mode" nil t)

(define-key zencoding-mode-keymap (kbd "C-j") (lookup-key global-map (kbd "C-j")))
(define-key zencoding-mode-keymap (kbd "C-,") 'zencoding-expand-yas)

(add-hook 'html-mode-hook
          '(lambda ()
             (zencoding-mode)))
