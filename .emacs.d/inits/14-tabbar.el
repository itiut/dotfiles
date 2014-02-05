;;;; tabbar setting

(eval-after-load 'tabbar
  '(progn
     (defvar my/tabbar-ignored-buffer-names
       '("*Helm" "*helm"))

     (defvar my/tabbar-ignored-buffer-major-modes
       '(direx:direx-mode))

     (defun my/tabbar-buffer-list ()
       (let ((re (regexp-opt my/tabbar-ignored-buffer-names)))
         (delq nil
               (mapcar #'(lambda (b)
                           (cond
                            ((string-match re (buffer-name b)) nil)
                            ((memq (buffer-local-value 'major-mode b) my/tabbar-ignored-buffer-major-modes) nil)
                            (t b)))
                       (tabbar-buffer-list)))))

     (setq tabbar-buffer-list-function 'my/tabbar-buffer-list)))

;; tabbar-ruler
(custom-set-variables '(tabbar-ruler-modified-symbol t))
