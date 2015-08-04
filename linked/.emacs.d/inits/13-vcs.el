;;;; VCS setting

;; automatically revert buffer when changed
(global-auto-revert-mode +1)
(custom-set-variables '(auto-revert-check-vc-info t))

;; vc
(custom-set-variables '(vc-handled-backends '(Git))
                      '(vc-follow-symlinks t)
                      '(vc-ignore-dir-regexp (format "\\(%s\\)\\|\\(%s\\)"
                                                     vc-ignore-dir-regexp
                                                     tramp-file-name-regexp)))

;; git-gutter-fringe
(require 'git-gutter-fringe+)
(global-git-gutter+-mode +1)
(custom-set-variables '(git-gutter+-lighter "")
                      '(git-gutter-fr+-side 'right-fringe))
