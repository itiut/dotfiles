;;; quickrun
(require 'quickrun)

(global-set-key (kbd "<f5>") 'my/quickrun-depending-on-region)
(global-set-key (kbd "<C-f5>") 'quickrun-compile-only)
(global-set-key (kbd "<M-f5>") 'quickrun-with-arg)

(defun my/quickrun-depending-on-region ()
  "If region is active, call quickrun-region. Otherwise call quickrun."
  (interactive)
  (if (use-region-p)
      (quickrun :start (region-beginning) :end (region-end))
    (quickrun)))

(quickrun-add-command "c/clang99"
                      '((:command . "clang")
                        (:cmdopt . "-std=c99 -O2")
                        (:exec    . ("%c %o -o %e %s" "%e %a"))
                        (:compile-only . "%c -Wall -Wextra -Werror %o -o %e %s")
                        (:remove  . ("%e"))
                        (:description . "Compile C file with llvm/clang and execute"))
                      :default "c")

(quickrun-add-command "c++/clang++11"
                      '((:command . "clang++")
                        (:cmdopt . "-std=c++11 -O2")
                        (:exec    . ("%c %o -o %e %s" "%e %a"))
                        (:compile-only . "%c -Wall -Wextra -Werror %o -o %e %s")
                        (:remove  . ("%e"))
                        (:description . "Compile C++ file with llvm/clang++ and execute"))
                      :default "c++")
