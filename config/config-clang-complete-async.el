;;; clang-complete-async
(require 'auto-complete-clang-async)

(defun my/ac-clang-async-setup ()
  (add-to-list 'ac-sources ac-source-clang-async)
  (ac-clang-launch-completion-process))

(add-hook 'c-mode-hook 'my/ac-clang-async-setup)
(add-hook 'c++-mode-hook 'my/ac-clang-async-setup)
