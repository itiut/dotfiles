;;; yasnippet
(require 'yasnippet)
(define-key yas-minor-mode-map (kbd "C-i") (lookup-key global-map (kbd "C-i")))
(yas-global-mode 1)
