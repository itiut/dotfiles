;;; auto-complete
(require 'auto-complete-config)
;; デフォルトの情報源の設定
(ac-config-default)
(setq ac-comphist-file (expand-file-name ".cache/ac-comphist.dat" user-emacs-directory))
(add-to-list 'ac-dictionary-directories (expand-file-name "etc/ac-dict/" user-emacs-directory))

(setq ac-use-menu-map t)
(global-set-key (kbd "M-/") 'ac-start)
(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)

;; 3文字以上で自動補完開始
(setq ac-auto-start 4)
;; 補完を出してからヘルプを出すまでの遅延(秒)
(setq ac-quick-help-delay 0.25)


;;; auto-complete-clang
(when (and (executable-find "clang")
           (require 'auto-complete-clang nil t))

  (defun my-ac-cc-mode-setup ()
    ;; プリコンパイルヘッダの設定
    ;; これだとC++/Cの両方では動かせなさそう
    ;; (setq ac-clang-prefix-header (expand-file-name "etc/ac-clang/stdafx.pch" user-emacs-directory))

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
    (setq ac-sources (append '(ac-source-clang
                               ac-source-yasnippet) ac-sources)))

  (add-hook 'c++-mode-hook 'my-ac-cc-mode-setup)
  (add-hook 'c-mode-hook 'my-ac-cc-mode-setup))


;; @name            ac-slime
;; @brief           SLIMEでの補完機能の拡張
;; @install         (auto-install-from-url "https://github.com/purcell/ac-slime/raw/master/ac-slime.el")
;; (when (require 'ac-slime nil t)
;;   (add-hook 'slime-mode-hook 'set-up-slime-ac)
;;   (add-hook 'slime-repl-mode-hook 'set-up-slime-ac))
