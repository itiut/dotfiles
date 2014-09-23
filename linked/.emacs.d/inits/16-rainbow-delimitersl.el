;;;; rainbow-delimiters setting

(defvar my/rainbow-delimiters-enable-modes '(
                                             c-mode
                                             c++-mode
                                             emacs-lisp-mode
                                             gfm-mode
                                             html-mode
                                             js2-mode
                                             ruby-mode
                                             sh-mode
                                             web-mode
                                             yaml-mode
                                             ))

(dolist (mode my/rainbow-delimiters-enable-modes)
  (add-hook (intern (format "%s-hook" mode)) 'rainbow-delimiters-mode))
