;;;; key binding

;; Backspace by C-h
(keyboard-translate ?\C-h ?\C-?)

;; move windows by S-{cursor}
(windmove-default-keybindings)

;; disable minimize
(global-unset-key (kbd "C-z"))

;; built-in, feel
(global-set-key (kbd "C-a") 'my/smart-beginning-of-line)
(global-set-key (kbd "C-t") 'my/smart-other-window)
(global-set-key (kbd "C-w") 'my/kill-region-or-backward-kill-word)
(global-set-key (kbd "C-x K") 'kill-this-buffer)
(global-set-key (kbd "C-x C-j") 'my/dired-jump)
(global-set-key (kbd "C-S-k") 'kill-whole-line)
(global-set-key (kbd "C-S-o") 'my/open-line-above)

;; helm
(global-set-key (kbd "C-x a") 'helm-apropos)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x m") 'helm-man-woman)
(global-set-key (kbd "C-x C-b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-i") 'helm-imenu)
(global-set-key (kbd "C-x C-l") 'helm-ls-git-ls)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "C-z") 'helm-resume)
(global-set-key (kbd "M-o") 'helm-occur)
(global-set-key (kbd "M-O") 'helm-multi-occur)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;; auto-complete
(global-set-key (kbd "M-/") 'auto-complete)

;; tabbar-ruler
(global-set-key (kbd "<C-tab>")           'tabbar-ruler-forward)
(global-set-key (kbd "<C-S-iso-lefttab>") 'tabbar-ruler-backward)
(smartrep-define-key
    global-map "C-x" '(("<up>"    . 'tabbar-ruler-up)
                       ("<down>"  . 'tabbar-ruler-up)
                       ("<right>" . 'tabbar-ruler-forward)
                       ("<left>"  . 'tabbar-ruler-backward)))

;; C-q map
(defvar my/ctrl-q-map (make-sparse-keymap)
  "My original keymap binded to C-q.")
(defalias 'my/ctrl-q-prefix my/ctrl-q-map)
(define-key global-map (kbd "C-q") 'my/ctrl-q-prefix)

(define-key my/ctrl-q-map (kbd "C-q") 'quoted-insert) ; default C-q
(define-key my/ctrl-q-map (kbd "b") 'describe-bindings)
(define-key my/ctrl-q-map (kbd "k") 'describe-key)
(define-key my/ctrl-q-map (kbd "v") 'view-mode)

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

;; git-gutter
(global-set-key (kbd "C-x v p") 'git-gutter:stage-hunk)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)
(smartrep-define-key
    global-map "C-x" '(("n" . 'git-gutter:next-diff)
                       ("p" . 'git-gutter:previous-diff)))

;; highlight-symbol
(smartrep-define-key
    global-map "M-s" '(("M-s" . 'highlight-symbol-next)
                       ("n"   . 'highlight-symbol-next)
                       ("p"   . 'highlight-symbol-prev)
                       ("j"   . 'highlight-symbol-next-in-defun)
                       ("k"   . 'highlight-symbol-prev-in-defun)
                       ("l"   . 'highlight-symbol-list-all)
                       ("o"   . 'highlight-symbol-occur)
                       ("%"   . 'highlight-symbol-query-replace)
                       ("."   . 'highlight-symbol-at-point)
                       ("?"   . 'highlight-symbol-remove-all)))

;; M-g map
(global-set-key (kbd "M-g M-f") 'ffap)
(global-set-key (kbd "M-g M-q") 'quickrun)
(global-set-key (kbd "M-g M-w") 'quickrun-with-arg)

(smartrep-define-key
    global-map "M-g" '(("M-n" . 'flycheck-tip-cycle)
                       ("M-p" . 'flycheck-tip-cycle-reverse)))
