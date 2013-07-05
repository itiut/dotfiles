;;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(setq js2-basic-offset 2)

(eval-after-load "js2-mode"
  '(progn
     (define-key js2-mode-map (kbd "C-a") (lookup-key global-map (kbd "C-a")))
     (define-key js2-mode-map (kbd "C-c C-j") 'run-js)
     (define-key js2-mode-map (kbd "C-c C-e") 'js-send-last-sexp)
     (define-key js2-mode-map (kbd "C-c e")   'js-send-last-sexp-and-go)
     (define-key js2-mode-map (kbd "C-c C-r") 'js-send-region)
     (define-key js2-mode-map (kbd "C-c r")   'js-send-region-and-go)
     (define-key js2-mode-map (kbd "C-c C-b") 'js-send-buffer)
     (define-key js2-mode-map (kbd "C-c b")   'js-send-buffer-and-go)
     (define-key js2-mode-map (kbd "C-c C-l") 'js-load-file-and-go)))
