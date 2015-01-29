;;;; tabbar setting

(tabbar-mode 1)
(custom-set-variables '(tabbar-separator '(1.0)))

(with-eval-after-load 'tabbar
  (defvar my/tabbar-ignored-buffer-names
    '("*Helm" "*helm" "*guide-key*"))

  (defvar my/tabbar-ignored-buffer-major-modes
    '(direx:direx-mode))

  (defun my/tabbar-buffer-list ()
    "Ignore buffers depending on buffer name and major mode."
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
    "Group tabs by project name firstly when in project."
    (let ((project-root (my/find-project-root)))
      (if (and buffer-file-name project-root)
          (list (file-name-nondirectory (directory-file-name project-root)))
        (tabbar-buffer-groups))))

  (setq tabbar-buffer-groups-function 'my/tabbar-buffer-groups))
