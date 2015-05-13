;;;; programming mode setting

(custom-set-variables
 ;; whitespace
 '(whitespace-style '(
                      ;; do not visualize by fase because of incompatibility with auto-complete
                      trailing          ; spaces on EOL
                      tabs
                      spaces
                      empty             ; empty lines on BOF/EOF
                      space-mark        ; use display mapping
                      tab-mark
                      ))

 '(whitespace-display-mappings
   '((space-mark ?\u3000 [?\u25a1])
     ;; WARNING: the mapping below has a problem.
     ;; When a TAB occupies exactly one column, it will display the
     ;; character ?\xBB at that column followed by a TAB which goes to
     ;; the next TAB column.
     ;; If this is a problem for you, please, comment the line below.
     (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

 ;; concern only about full-width space
 '(whitespace-space-regexp "\\(\u3000+\\)")

 ;; auto cleanup before saved
 '(whitespace-action '(auto-cleanup)))

(defun my/prog-mode-hook ()
  (helm-gtags-mode +1)
  (highlight-symbol-mode +1)
  (rainbow-delimiters-mode +1)
  (whitespace-mode +1))

(add-hook 'prog-mode-hook 'my/prog-mode-hook)
