;;;; Ruby mode setting

(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\Gemfile\\'" . enh-ruby-mode))

(custom-set-variables
 ;; ruby-mode
 '(ruby-deep-indent-paren nil)
 '(ruby-deep-indent-paren-style nil)
 '(ruby-insert-encoding-magic-comment nil)

 ;; enh-ruby-mode
 '(enh-ruby-deep-indent-paren nil)

 ;; rsense
 '(rsense-home (expand-file-name "rsense" my/site-lisp-directory))

 ;; ruby-end
 '(ruby-end-insert-newline nil))

(defun my/eval-after-load-ruby-mode-common ()
  (require 'rsense)
  (require 'ruby-end))

(eval-after-load 'ruby-mode
  '(progn
     (my/eval-after-load-ruby-mode-common)

     (defadvice ruby-indent-line (after unindent-closing-paren activate)
       (let ((column (current-column))
             indent offset)
         (save-excursion
           (back-to-indentation)
           (let ((state (syntax-ppss)))
             (setq offset (- column (current-column)))
             (when (and (or (eq (char-after) ?\))
                            (and (eq (char-after) ?\})
                                 (eq (char-after (1+ (point))) ?\))))
                        (not (zerop (car state))))
               (goto-char (cadr state))
               (setq indent (current-indentation)))))
         (when indent
           (indent-line-to indent)
           (when (> offset 0)
             (forward-char offset)))))))

(eval-after-load 'enh-ruby-mode '(my/eval-after-load-ruby-mode-common))

(defun my/ruby-mode-common-hook ()
  (add-to-list 'ac-sources 'ac-source-rsense)
  (rubocop-mode 1))

(add-hook 'ruby-mode-hook 'my/ruby-mode-common-hook)
(add-hook 'enh-ruby-mode-hook 'my/ruby-mode-common-hook)
