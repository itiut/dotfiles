;;; quickrun
(require 'quickrun)
(global-set-key (kbd "<f5>") 'my/quickrun-depend-on-region)
(global-set-key (kbd "M-<f5>") 'quickrun-compile-only)

(defun my/quickrun-depend-on-region ()
  "If region is active, call quickrun-region. Otherwise call quickrun."
  (interactive)
  (if (region-active-p)
      (quickrun :start (region-beginning) :end (region-end))
    (quickrun)))

(quickrun-add-command "c/gnu99"
                      '((:command . "gcc -std=gnu99")
                        (:exec . ("%c %o -o %e %s"
                                  "%e %a"))
                        (:compile-only . "%c -Wall -Wextra -Werror %o -o %e %s")
                        (:remove . "%e")
                        (:description . "Compile C file with gcc (GNU99) and execute"))
                      :default "c")

(quickrun-add-command "c++/g++"
                      '((:compile-only . "%c -Wall -Wextra -Werror %o -o %e %s"))
                      :override t)
