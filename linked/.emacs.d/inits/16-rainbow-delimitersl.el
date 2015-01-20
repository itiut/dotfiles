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

(my/add-hook-to-modes my/rainbow-delimiters-enable-modes 'rainbow-delimiters-mode)
