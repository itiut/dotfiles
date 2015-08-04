;;;; key binding

;; Backspace by C-h
(keyboard-translate ?\C-h ?\C-?)

;; move windows by S-{cursor}
(windmove-default-keybindings)

;; disable minimize
(global-unset-key (kbd "C-z"))

;; built-in, basic, feel
(global-set-key (kbd "<f5>") 'my/revert-buffer)
(global-set-key (kbd "C-a") 'my/smart-beginning-of-line)
(global-set-key (kbd "C-e") 'my/smart-end-of-line)
(global-set-key (kbd "C-w") 'my/kill-region-or-backward-kill-word)
(global-set-key (kbd "C-S-k") 'kill-whole-line)
(global-set-key (kbd "C-S-o") 'my/open-line-above)
(global-set-key (kbd "C-x t") 'my/smart-split-window)
(global-set-key (kbd "C-x K") 'kill-this-buffer)
(global-set-key (kbd "C-x C-j") 'my/dired-jump)
(global-set-key (kbd "M-[") 'my/smart-previous-window)
(global-set-key (kbd "M-]") 'my/smart-next-window)

;; helm
(global-set-key (kbd "C-x a") 'helm-apropos)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x m") 'helm-man-woman)
(global-set-key (kbd "C-x C-b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-i") 'helm-semantic-or-imenu)
(global-set-key (kbd "C-x C-l") 'helm-ls-git-ls)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "C-x M-l") 'helm-ghq)
(global-set-key (kbd "C-z") 'helm-resume)
(global-set-key (kbd "M-o") 'helm-occur)
(global-set-key (kbd "M-O") 'helm-multi-occur)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;; auto-complete
(global-set-key (kbd "M-/") 'auto-complete)

;; tabbar-ruler
(global-set-key (kbd "<C-tab>") 'tabbar-forward-tab)
(global-set-key (kbd "<C-S-tab>") 'tabbar-backward-tab)
(global-set-key (kbd "<C-S-iso-lefttab>") 'tabbar-backward-tab)

;; C-q map
(defvar my/ctrl-q-map (make-sparse-keymap)
  "My original keymap binded to C-q.")
(defalias 'my/ctrl-q-prefix my/ctrl-q-map)
(define-key global-map (kbd "C-q") 'my/ctrl-q-prefix)

(define-key my/ctrl-q-map (kbd "C-q") 'quoted-insert) ; default C-q
(define-key my/ctrl-q-map (kbd "b") 'describe-bindings)
(define-key my/ctrl-q-map (kbd "k") 'describe-key)
(define-key my/ctrl-q-map (kbd "?") 'zeal-at-point)
(define-key my/ctrl-q-map (kbd "C-a") 'align-regexp)
(define-key my/ctrl-q-map (kbd "C-s") 'sort-lines)

;; expand-region
(global-set-key (kbd "C-@") 'er/expand-region)
(global-set-key (kbd "C-`") 'er/contract-region)

;; multiple-cursors
(global-set-key (kbd "C-M-c") 'mc/edit-lines)
(smartrep-define-key
    global-map "C-q" '(("n" . 'mc/mark-next-like-this)
                       ("p" . 'mc/mark-previous-like-this)
                       ("m" . 'mc/mark-more-like-this-extended)
                       ("u" . 'mc/unmark-next-like-this)
                       ("U" . 'mc/unmark-previous-like-this)
                       ("s" . 'mc/skip-to-next-like-this)
                       ("S" . 'mc/skip-to-previous-like-this)
                       ("*" . 'mc/mark-all-like)
                       ("d" . 'mc/mark-all-like-this-dwim)
                       ("i" . 'mc/insert-numbers)
                       ("o" . 'mc/sort-regions)
                       ("O" . 'mc/reverse-regions)))

;; ace-jump-mode
(global-set-key (kbd "C-;") 'ace-jump-mode)
(global-set-key (kbd "C-+") 'ace-jump-mode-pop-mark)

;; goto-chg
(smartrep-define-key
    global-map "C-q" '(("-" . 'goto-last-change)
                       ("+" . 'goto-last-change-reverse)))

;; jump-char
(global-set-key (kbd "M-m") 'jump-char-forward)
(global-set-key (kbd "M-M") 'jump-char-backward)

;; point-undo
(smartrep-define-key
    global-map "C-q" '(("<" . 'point-undo)
                       (">" . 'point-redo)))

;; anzu
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)
(global-set-key (kbd "C-x M-%") 'anzu-query-replace-at-cursor)
(global-set-key (kbd "C-x %") 'anzu-query-replace-at-cursor-thing)

;; vc
(global-set-key (kbd "C-x v d") 'vc-diff)

;; git-gutter
(global-set-key (kbd "C-x v =") 'git-gutter+-show-hunk)
(global-set-key (kbd "C-x v c") 'git-gutter+-commit)
(global-set-key (kbd "C-x v p") 'git-gutter+-stage-hunks)
(global-set-key (kbd "C-x v r") 'git-gutter+-revert-hunks)
(global-set-key (kbd "C-x v u") '(lambda () (interactive) (git-gutter+-refresh)))
(smartrep-define-key
    global-map "C-x" '(("n" . 'git-gutter+-next-hunk)
                       ("p" . 'git-gutter+-previous-hunk)))

;; magit
(global-set-key (kbd "M-g M-g") 'magit-status)
(global-set-key (kbd "C-x v b") 'magit-blame)
(global-set-key (kbd "C-x v f") 'magit-log-buffer-file)
(global-set-key (kbd "C-x v l") 'magit-log-current)


;; highlight-symbol
(global-set-key (kbd "<f3>") 'highlight-symbol-next)
(global-set-key (kbd "<S-f3>") 'highlight-symbol-prev)
(global-set-key (kbd "<M-f3>") 'highlight-symbol-query-replace)

;; M-g map
(global-set-key (kbd "M-g .") 'helm-ag)
(global-set-key (kbd "M-g >") 'helm-ag-pop-stack)
(global-set-key (kbd "M-g M-f") 'ffap)
(global-set-key (kbd "M-g M-q") 'quickrun)
(global-set-key (kbd "M-g M-w") 'quickrun-with-arg)
(global-set-key (kbd "M-g M-s") 'quickrun-shell)

(smartrep-define-key
    global-map "M-g" '(("M-n" . 'flycheck-tip-cycle)
                       ("M-p" . 'flycheck-tip-cycle-reverse)))
