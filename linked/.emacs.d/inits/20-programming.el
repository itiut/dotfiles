;;;; programming mode setting

(defun my/prog-mode-hook ()
  (rainbow-delimiters-mode +1))

(add-hook 'prog-mode-hook 'my/prog-mode-hook)
