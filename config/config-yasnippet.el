;;;; yasnippet
(require 'yasnippet)

(add-to-list 'yas-snippet-dirs (expand-file-name "snippets/" my-etc-dir))
(define-key yas-minor-mode-map (kbd "C-i") (lookup-key global-map (kbd "C-i")))
(yas-global-mode 1)
