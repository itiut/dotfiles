;;;; Web mode setting

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

(custom-set-variables '(web-mode-markup-indent-offset 2)
                      '(web-mode-css-indent-offset 2)
                      '(web-mode-code-indent-offset 2))
