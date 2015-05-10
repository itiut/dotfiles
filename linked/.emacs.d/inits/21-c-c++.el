;;;; C/C++ mode setting

(defun my/c-c++-mode-hook ()
  (c-set-style "stroustrup")
  (c-set-offset 'innamespace 0)
  (c-set-offset 'arglist-close 0)

  ;; auto-complete-clang
  (require 'auto-complete-clang)
  (add-to-list 'ac-sources 'ac-source-clang)
  (setq-local ac-delay 0.5)             ; Default value 0.1 is too fast.

  ;; auto-complete-clang-async
  ;; (when (executable-find "clang-complete")
  ;;   (require 'auto-complete-clang-async)  ; TODO: autoload?
  ;;   (add-to-list 'ac-sources 'ac-source-clang-async)
  ;;   (ac-clang-launch-completion-process))

  ;; c-eldoc
  (c-turn-on-eldoc-mode))

(defun my/c-mode-hook ()
  (setq flycheck-clang-language-standard "c99")
  (setq-local quickrun-option-cmdopt "-std=c99 -O2"))

(defun my/c++-mode-hook ()
  (setq flycheck-clang-language-standard "c++11")
  (setq-local quickrun-option-cmdopt "-std=c++11 -O2"))

(add-hook 'c-mode-hook 'my/c-c++-mode-hook)
(add-hook 'c++-mode-hook 'my/c-c++-mode-hook)
(add-hook 'c-mode-hook 'my/c-mode-hook)
(add-hook 'c++-mode-hook 'my/c++-mode-hook)
