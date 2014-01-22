;;; smart-compile
(require 'smart-compile)

(global-set-key (kbd "C-c c") 'smart-compile)

(setq smart-compile-alist
      (append '(
                ("\\.c\\'"          . "clang -Wall -Wextra -O2 -std=c99 %f")
                ("\\.[Cc]+[Pp]*\\'" . "clang++ -Wall -Wextra -O2 -std=c++11 %f")
                ("\\.jade\\'"       . "jade %f")
                ("\\.styl\\'"       . "stylus %f")
                ) smart-compile-alist))
