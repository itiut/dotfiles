;;;; Markdown mode setting

(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))

(eval-after-load 'markdown-mode
  '(progn
     (when (= (call-process-shell-command "which" nil nil nil "ghpreview") 0)
       (defun my/run-ghpreview ()
         (interactive)
         (if (not buffer-file-name)
             (error "Must be visiting a file")
           (start-process-shell-command "ghpreview" nil
                                        (format "ghpreview %s" buffer-file-name)))
         (message "run ghpreview!"))

       (define-key markdown-mode-map (kbd "C-c C-c p") 'my/run-ghpreview))))
