;;;; C/C++ mode setting

(defun my/c-c++-mode-hook ()
  (c-set-style "stroustrup")
  (c-set-offset 'innamespace 0)
  (c-set-offset 'arglist-close 0)

  ;; auto-complete-clang-async
  (when (executable-find "clang-complete")
    (require 'auto-complete-clang-async)  ; TODO: autoload?
    (add-to-list 'ac-sources 'ac-source-clang-async)
    (ac-clang-launch-completion-process))

  ;; c-eldoc
  (c-turn-on-eldoc-mode))

(add-hook 'c-mode-hook 'my/c-c++-mode-hook)
(add-hook 'c++-mode-hook 'my/c-c++-mode-hook)
