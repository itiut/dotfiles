;;;; tabbar setting

;; tabbar-ruler
(custom-set-variables '(tabbar-ruler-modified-symbol t))

(eval-after-load 'tabbar-ruler
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

     (setq tabbar-buffer-list-function 'my/tabbar-buffer-list)

     (defun my/tabbar-buffer-groups ()
       (if buffer-file-name
           (progn
             (let ((project-root (locate-dominating-file default-directory ".git")))
               (and project-root
                    (list (file-name-nondirectory (directory-file-name project-root))))))
         (tabbar-buffer-groups)))

     (setq tabbar-buffer-groups-function 'my/tabbar-buffer-groups)))
