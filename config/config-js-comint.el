;;; js-comint
(require 'js-comint)

(setq inferior-js-program-command "~/.nodebrew/current/bin/node")

(add-hook 'inferior-js-mode-hook
          '(lambda ()
             (ansi-color-for-comint-mode-on)
             (add-to-list 'comint-preoutput-filter-functions
                          '(lambda (output)
                             (replace-regexp-in-string "^.\\[1G.\\[0J\\(>\\|\\.+\\) .\\[[0-9]+G" "\\1 " output)))))
