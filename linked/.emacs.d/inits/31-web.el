;;;; Web mode setting

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

(custom-set-variables '(css-indent-offset 2)
                      '(web-mode-markup-indent-offset 2)
                      '(web-mode-css-indent-offset 2)
                      '(web-mode-code-indent-offset 2))

(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
