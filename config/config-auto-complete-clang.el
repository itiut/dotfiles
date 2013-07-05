;;;; auto-complete-clang
(require 'auto-complete-clang)

(defun my-ac-clang-setup ()
  ;; プリコンパイルヘッダの設定
  ;; これだとC++/Cの両方では動かせなさそう
  ;; (setq ac-clang-prefix-header (expand-file-name "ac-clang/stdafx.pch" my-etc-dir))

  (setq ac-clang-flags '("-w" "-ferror-limit" "1"))
  (setq ac-clang-flags (append
                        (mapcar (lambda (item) (concat "-I" item))
                                (list  "/usr/include/c++/4.6"
                                       "/usr/include/c++/4.6/x86_64-linux-gnu"
                                       "/usr/include/c++/4.6/backward"
                                       "/usr/local/include"
                                       "/usr/include/x86_64-linux-gnu"
                                       "/usr/include"
                                       "/usr/include/clang/3.0/include/"
                                       "/usr/lib/gcc/x86_64-linux-gnu/4.6/include/"
                                       "/usr/lib/gcc/x86_64-linux-gnu/4.6/include-fixed/")) ac-clang-flags))
  (add-to-list 'ac-sources ac-source-clang))

(add-hook 'c-mode-hook 'my-ac-clang-setup)
(add-hook 'c++-mode-hook 'my-ac-clang-setup)
