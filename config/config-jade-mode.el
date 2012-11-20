;;; jade-mode
(autoload 'jade-mode "jade-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;;; stylus-mode
(autoload 'stylus-mode "stylus-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.styl$" . stylus-mode))
