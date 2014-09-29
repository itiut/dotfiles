;;;; look setting

;; disable menu bar
(menu-bar-mode -1)

(when window-system
  ;; disable tool bar, scroll bar
  (tool-bar-mode -1)
  (scroll-bar-mode -1)

  ;; frame title
  (custom-set-variables '(frame-title-format
                          '((buffer-file-name "%f" (dired-directory dired-directory "%b"))
                            " - Emacs"
                            emacs-version)))

  ;; maximize frame
  (add-hook 'emacs-startup-hook '(lambda ()
                                   (set-frame-parameter nil 'fullscreen 'maximized))))

;; disable startup screen
(custom-set-variables '(inhibit-startup-screen t))

;; disable line wrap
(custom-set-variables '(truncate-lines t))

;; highlight
(global-hl-line-mode 1)                              ; current line
(show-paren-mode 1)                                  ; parens
(custom-set-variables '(show-trailing-whitespace t)) ; spaces before EOL

;; uniquify
(require 'uniquify)
(custom-set-variables '(uniquify-buffer-name-style 'post-forward-angle-brackets))

;; anzu
(global-anzu-mode 1)
(custom-set-variables '(anzu-mode-lighter "")
                      '(anzu-deactivate-region t)
                      '(anzu-search-threshold 1000))

;; git-gutter-fringe
(require 'git-gutter-fringe+)
(global-git-gutter+-mode 1)
(custom-set-variables '(git-gutter+-lighter "")
                      '(git-gutter-fr+-side 'right-fringe))

;; yalinum
(global-yalinum-mode 1)

;;; advices
(defadvice smartrep-map-internal (around disable-smartrep-echo-keystrokes activate)
  (let ((echo-keystrokes 0))
    ad-do-it))
