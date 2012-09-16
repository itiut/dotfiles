;;; js-comint
(require 'js-comint)
(when (executable-find "node")
  (setq inferior-js-program-command "node"))

(add-hook 'inferior-js-mode-hook
          '(lambda ()
             (ansi-color-for-comint-mode-on)
             (add-to-list 'comint-preoutput-filter-functions
                          '(lambda (output)
                             (replace-regexp-in-string "^.\\[1G.\\[0J\\(.+\\) .\\[[0-9]+G" "\\1 "
                                                       (replace-regexp-in-string "^.\\[1G.\\[0J> .\\[3G" "js> " output t))))))
