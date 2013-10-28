;; pathの設定
(setq user-emacs-directory (expand-file-name "~/.emacs.d/"))
(add-to-list 'load-path user-emacs-directory)

;; ディレクトリの設定
(defvar my/cache-dir (concat user-emacs-directory ".cache/"))
(defvar my/config-dir (concat user-emacs-directory "config/"))
(defvar my/config-file-prefix "config-")
(defvar my/etc-dir (concat user-emacs-directory "etc/"))

;; 言語設定
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8-unix)

;; 起動時に必要ならinit.elをバイトコンパイル
(add-hook 'after-init-hook
          '(lambda ()
             (let* ((el (expand-file-name "init.el" user-emacs-directory))
                    (elc (concat el "c")))
               (when (file-newer-than-file-p el elc)
                 (byte-compile-file el)))))

;; 終了時に確認
(setq confirm-kill-emacs 'y-or-n-p)

;; 外部ブラウザをgoogle-crhomeに
(when (= (call-process-shell-command "which" nil nil nil "google-chrome") 0)
  (setq browse-url-browser-function 'browse-url-generic browse-url-generic-program "google-chrome"))

;; バックアップファイルを作成しない
(setq backup-inhibited t)

;; オートセーブファイルを作成しない
(auto-save-mode -1)
(setq delete-auto-save-files t)         ; 終了時に削除
(setq auto-save-list-file-prefix (expand-file-name ".saves-" my/cache-dir))

;; abbrevsを ".abbrev_defs" に保存しない
(setq save-abbrevs nil)

;; vc-modeをオフ
(setq vc-handled-backends ())

;; 更新時に自動でrevert-buffer
(global-auto-revert-mode 1)

;; "yes or no"を"y or n"に
(fset 'yes-or-no-p 'y-or-n-p)

;; Find fileの補完で大文字と小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; クリップボードとyankバッファを同期
(setq x-select-enable-clipboard t)

;; タブを半角スペース4つ分で表示
(setq-default tab-width 4)

;; 半角スペースでインデント
(setq-default indent-tabs-mode nil)

;; オートインデント
(electric-indent-mode 1)

;; 対応する括弧などを自動で挿入
(electric-pair-mode 1)

;; BS,Del,文字入力でリージョン内の文字を削除
(delete-selection-mode 1)



;;;; 外観
;; カーソル行のハイライト
(global-hl-line-mode t)

;; 対応する括弧のハイライト
(show-paren-mode t)

;; 行を折り返さない
(setq-default truncate-lines t)

;; ツールバーとメニューバーを表示しない
(when window-system
  (tool-bar-mode 0)
  (menu-bar-mode 0))

;; スクロールバーを表示しない
(set-scroll-bar-mode nil)

;; カーソルの行と列を表示
(setq line-number-mode t)
(setq column-number-mode t)

;; ファイルサイズを表示
(setq size-indication-mode t)

;; タイトルにフルパスまたはバッファ名を表示
(setq frame-title-format
      '("%S" (buffer-file-name "%f"
                               (dired-directory dired-directory "%b"))
        " - Emacs "
        emacs-version))

;; 起動画面を表示しない
(setq inhibit-splash-screen t)

;; 起動時に最大化
(when window-system
  (add-hook 'after-init-hook
            '(lambda ()
               (run-with-idle-timer 0.1 nil '(lambda () (set-frame-parameter nil 'fullscreen 'maximized))))))

;; 1行ずつスクロール
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)

;; コンパイルウィンドウの高さ
(setq compilation-window-height 15)



;;;; 操作
;; C-hをBackspaceに
(keyboard-translate ?\C-h ?\C-?)

;; Shift+カーソルでウインドウの移動
(setq windmove-wrap-around t)
(windmove-default-keybindings)

;; 無効にするキーバインド
(global-unset-key (kbd "C-z"))          ; 最小化
(global-unset-key (kbd "C-\\"))         ; 日本語入力

;; 有効にするキーバインド
(global-set-key (kbd "C-a") 'beginning-of-visual-indented-line)
(global-set-key (kbd "C-t") 'other-window-or-split)
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)
(global-set-key (kbd "C-x ?") 'help-for-help)
(global-set-key (kbd "C-x K") 'kill-buffer-and-window)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-S-o") 'open-line-above)
(global-set-key (kbd "C-w") 'kill-region-or-backward-kill-word)
(global-set-key (kbd "M-d") 'kill-word-or-delete-horizontal-space)
(global-set-key (kbd "<f11>") 'toggle-fullscreen-maximized)
(global-set-key (kbd "C-x C-t") 'open-current-directory-in-tmux-new-window)


(defun beginning-of-visual-indented-line (current-point)
  "インデント文字を飛ばした行頭に戻る. ただし, ポイントから行頭までの間にインデント文字しかない場合は, 行頭に戻る."
  (interactive "d")
  (let ((vhead-pos (save-excursion (progn (beginning-of-visual-line) (point))))
        (head-pos (save-excursion (progn (beginning-of-line) (point)))))
    (cond
     ;; 物理行の1行目にいる場合
     ((eq vhead-pos head-pos)
      (if (string-match
           "^[ \t]+$"
           (buffer-substring-no-properties vhead-pos current-point))
          (beginning-of-visual-line)
        (back-to-indentation)))
     ;; 物理行の2行目以降の先頭にいる場合
     ((eq vhead-pos current-point)
      (backward-char)
      (beginning-of-visual-indented-line (point)))
     ;; 物理行の2行目以降の途中にいる場合
     (t (beginning-of-visual-line)))))

(defun other-window-or-split ()
  "ウィンドウが1つなら作成し, 他のウインドウへ移動."
  (interactive)
  (when (one-window-p)
    (if (< (frame-pixel-width) (frame-pixel-height))
        (split-window-vertically)
      (split-window-horizontally)))
  (other-window 1))

(defun open-line-above ()
  "vimの'O'."
  (interactive)
  (indent-according-to-mode)
  (move-beginning-of-line 1)
  (newline)
  (let ((current-prefix-arg 1))
    (call-interactively 'previous-line))
  (indent-according-to-mode))

(defun kill-region-or-backward-kill-word ()
  "リージョンが活性化していればリージョン削除. 非活性であれば, 直前の単語を削除."
  (interactive)
  (if (use-region-p)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word 1)))

(defun kill-word-or-delete-horizontal-space (arg)
  "カーソール位置前後が空白であれば空白削除. 空白でなければ単語削除."
  (interactive "p")
  (let ((pos (point)))
    (if (and (not (eobp))
             (= (char-syntax (char-after pos)) 32)
             (= (char-syntax (char-after (1+ pos))) 32))
        (prog1 (delete-horizontal-space)
          (unless (memq (char-after pos) '(?( ?) ?{ ?} ?[ ?]))
            (insert " ")))
      (kill-word arg))))

(defun toggle-fullscreen-maximized ()
  "フルスクリーンと最大化をトグル."
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (eq 'fullboth (frame-parameter nil 'fullscreen)) 'maximized 'fullboth)))

(defun open-current-directory-in-tmux-new-window ()
  "カレントディレクトリをtmuxの新しいwindowで開く."
  (interactive)
  (let* ((dir (if buffer-file-name
                  (file-name-directory buffer-file-name)
                (expand-file-name "~/")))
         (cmd (concat "tmux new-window \"cd " dir "; exec $SHELL\"")))
    (cond ((eq (shell-command cmd) 0)
           (message "Open directory %s in tmux new window." dir))
          (t
           (message "Failed to create new window in tmux.")))))



;;;; el-get
(add-to-list 'load-path (expand-file-name "el-get/el-get/" user-emacs-directory))

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch el-get-install-skip-emacswiki-recipes)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(add-to-list 'el-get-recipe-path (expand-file-name "recipes/" my/etc-dir))

(defvar my/el-get-sources
  '(
    anzu
    arduino-mode
    auto-async-byte-compile
    auto-complete
    c-eldoc
    clang-complete-async
;    color-moccur
;    deferred
    exec-path-from-shell
;    flycheck
    flymake-ruby
;    gnuplot-mode
    goto-chg
    haml-mode
    haskell-mode
    helm
    helm-c-yasnippet
    helm-descbinds
;    helm-gtags
    highlight-symbol
    inf-ruby
    jade-mode
    js-comint
    js2-mode
    key-chord
    mark-multiple
    markdown-mode
;    moccur-edit
    point-undo
    quickrun
    railscasts-theme
    recentf-ext
    redo+
    rsense
    ruby-end
    smart-compile
    tabbar
;    tuareg-mode
    yalinum
    yasnippet
;    zencoding-mode
    ))

(el-get 'sync my/el-get-sources)



;;;; config
(defun my/load-configs (sources)
  "Load config files of sources."
  (dolist (src sources)
    (my/load-config (symbol-name src))))

(defun my/load-config (name)
  "Load config file."
  (my/compile-and-load (expand-file-name (concat my/config-file-prefix name) my/config-dir)))

(defun my/compile-and-load (path)
  "Byte-compile if necessary, and load."
  (let* ((el (concat path ".el"))
         (elc (concat path ".elc")))
    (when (file-newer-than-file-p el elc)
      (byte-compile-file el))
    (load path 'noerror)))

;; el-get
(my/load-configs my/el-get-sources)

;; builtin
(defvar my/builtin-sources
  '(
;    autoinsert
    compilation-mode
    c-c++-mode
    dired
    emacs-lisp-mode
    flymake
    imenu
    notifications
    ruby-mode
    server
    uniquify
    verilog-mode
    view-mode
    whitespace
    ))
(my/load-configs my/builtin-sources)

;; face
(my/load-config "face")


;;; my/coding-mode
(defun my/coding-mode-setup ()
  ;; whitespace
  (whitespace-mode 1)
  ;; yalinum
  (yalinum-mode 1)
  ;; auto-complete
  (auto-complete-mode 1)
  )

(defvar my/coding-mode-hook-list
  (list 'arduino-mode-hook
        'c-mode-hook
        'c++-mode-hook
        'emacs-lisp-mode-hook
;        'gnuplot-mode-hook
        'haml-mode-hook
        'haskell-mode-hook
        'html-mode-hook
        'jade-mode-hook
        'js2-mode-hook
        'markdown-mode-hook
        'ruby-mode-hook
        'stylus-mode-hook
;        'tuareg-mode-hook
        'verilog-mode-hook))

(dolist (hook my/coding-mode-hook-list)
  (add-hook hook 'my/coding-mode-setup))
