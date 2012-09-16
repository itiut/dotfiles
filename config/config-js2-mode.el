;;; js2-mode
;(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-hook 'js2-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-a") (lookup-key global-map (kbd "C-a")))
             (local-set-key (kbd "C-c C-j") 'run-js)
             (local-set-key (kbd "C-c C-e") 'js-send-last-sexp)
             (local-set-key (kbd "C-c e")   'js-send-last-sexp-and-go)
             (local-set-key (kbd "C-c C-r") 'js-send-region)
             (local-set-key (kbd "C-c r")   'js-send-region-and-go)
             (local-set-key (kbd "C-c C-b") 'js-send-buffer)
             (local-set-key (kbd "C-c b")   'js-send-buffer-and-go)
             (local-set-key (kbd "C-c C-l") 'js-load-file-and-go)

             (setq js2-basic-offset 2)))
