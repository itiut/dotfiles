;;;; quickrun setting
(quickrun-add-command "c/clang99"
                      '((:command . "clang")
                        (:cmdopt . "-std=c99 -O2")
                        (:exec    . ("%c %o -o %e %s" "%e %a"))
                        (:compile-only . "%c -Wall -Wextra -Werror %o -o %e %s")
                        (:remove  . ("%e"))
                        (:description . "Compile C99 file with llvm/clang and execute"))
                      :default "c")

(quickrun-add-command "c++/clang++11"
                      '((:command . "clang++")
                        (:cmdopt . "-std=c++11 -O2")
                        (:exec    . ("%c %o -o %e %s" "%e %a"))
                        (:compile-only . "%c -Wall -Wextra -Werror %o -o %e %s")
                        (:remove  . ("%e"))
                        (:description . "Compile C++11 file with llvm/clang++ and execute"))
                      :default "c++")
