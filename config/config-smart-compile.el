;;; s
(require 'smart-compile)
(global-set-key (kbd "C-c c") 'smart-compile)

(setq smart-compile-alist
      (append '(
                ("\\.c\\'"          . "gcc -Wall -Wextra -O2 -std=gnu99 %f -lm")
                ("\\.[Cc]+[Pp]*\\'" . "g++ -Wall -Wextra -O2 %f -lm")
                ) smart-compile-alist))
