;;;; Markdown mode setting

(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))

(add-hook 'markdown-mode-hook 'flyspell-mode)
