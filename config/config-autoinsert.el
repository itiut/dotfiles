;;; autoinsert
(require 'autoinsert)

(setq auto-insert-directory (expand-file-name "insert" my/etc-dir))

(add-to-list 'auto-insert-alist '("\\.rcp\\'" . ["template.rcp" my/template]))

(defvar my/template-replacements-alists
  '(("%file-name%" .
     (lambda ()
       (file-name-nondirectory (buffer-file-name))))
    ("%file-name-without-ext%" .
     (lambda ()
       (file-name-sans-extension (file-name-nondirectory (buffer-file-name)))))))

(defun my/template ()
  (time-stamp)
  (mapc '(lambda (c)
           (progn
             (goto-char (point-min))
             (replace-string (car c) (funcall (cdr c)) nil)))
        my/template-replacements-alists)
  (goto-char (point-max))
  (message "done."))

(add-hook 'find-file-not-found-hooks 'auto-insert)
