;;; c-mode, c++-mode
(defun my-c-c++-mode-hook ()
  (c-set-style "stroustrup")
  (c-set-offset 'innamespace 0)
  (c-set-offset 'arglist-close 0)

  ;; flymake
  (flymake-mode 1)

  ;; (when (require 'c-eldoc nil t)
  ;;   (set (make-local-variable 'eldoc-idle-delay) 0.2)
  ;;   (c-turn-on-eldoc-mode))

  ;; @name      yasnppet
  ;; @brief     スニペット機能
  ;; @install   http://code.google.com/p/yasnippet/downloads/list からダウンロード
  ;; (require 'yasnippet-bundle))
  )

(add-hook 'c-mode-hook 'my-c-c++-mode-hook)
(add-hook 'c++-mode-hook 'my-c-c++-mode-hook)
