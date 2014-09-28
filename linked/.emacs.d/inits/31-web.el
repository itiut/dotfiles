;;;; Web mode setting

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

(custom-set-variables '(web-mode-script-padding 2)
                      '(web-mode-style-padding 2))
