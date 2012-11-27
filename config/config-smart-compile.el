;;; smart-compile
(require 'smart-compile)
(global-set-key (kbd "C-c c") 'smart-compile)

(setq smart-compile-alist
      (append '(
                ("\\.c\\'"          . "gcc -Wall -Wextra -O2 -std=gnu99 %f")
                ("\\.[Cc]+[Pp]*\\'" . "g++ -Wall -Wextra -O2 %f")
                ("\\.jade\\'"       . "jade %f")
                ("\\.styl\\'"       . "stylus %f")
                ) smart-compile-alist))
