;; load-pathの設定
(add-to-list 'load-path "~/.emacs.d/")

;; 外部ブラウザをgoogle-crhomeに
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

;; 言語設定
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;; バックアップファイルを作成しない
(setq backup-inhibited t)

;; オートセーブファイルを作成しない
(auto-save-mode -1)
(setq delete-auto-save-files t)         ; 終了時に削除
(setq auto-save-list-file-prefix (expand-file-name ".cache/.saves-" user-emacs-directory))

;; abbrevsを ".abbrev_defs" に保存しない
(setq save-abbrevs nil)

;; vc-modeをオフ
(setq vc-handled-backends ())

;; "yes or no"を"y or n"に
(fset 'yes-or-no-p 'y-or-n-p)

;; Find fileの補完で大文字と小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; クリップボードとyankバッファを同期
(setq x-select-enable-clipboard t)

;; 半角スペースでインデント
(setq-default indent-tabs-mode nil)

;; BS,Del,文字入力でリージョン内の文字を削除
(delete-selection-mode 1)

;; 保存時に行末のスペースとファイル末尾のブランクを削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'my-delete-trailing-blank-lines)

(defun my-delete-trailing-blank-lines ()
  "Deletes all blank lines at the end of the file."
  (interactive)
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-max))
      (delete-blank-lines))))



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

;; タイトルにフルパスを表示
(setq frame-title-format
      (concat "%f - emacs@" system-name))

;; 起動画面を表示しない
(setq inhibit-splash-screen t)

;; X Window Systemで起動時に最大化
(defun set-x-full-screen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
(cond
 ((eq window-system 'x)
  (add-hook 'after-init-hook
            '(lambda ()
               (run-with-idle-timer 0.1 nil 'set-x-full-screen)))))

;; 1行ずつスクロール
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)

;; コンパイルウィンドウの高さ
(setq compilation-window-height 15)



;;;; 操作
;; 無効にするキーバインド
(global-unset-key (kbd "C-z"))  ; 最小化
(global-unset-key (kbd "C-\\")) ; 日本語入力

;; C-hをBackspaceに
(keyboard-translate ?\C-h ?\C-?)

;; 有効にするキーバインド
(global-set-key (kbd "C-a")   'beginning-of-visual-indented-line) ; 行頭のインデントを行き来する
(global-set-key (kbd "C-t")   'other-window-or-split)             ; 他のウィンドウへ移動
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)             ; 折り返しのトグル
(global-set-key (kbd "C-x ?") 'help-for-help)                     ; ヘルプ表示
(global-set-key (kbd "C-x K") 'kill-buffer-and-window)            ; windowごとbufferをkill
(global-set-key (kbd "M-g")   'goto-line)                         ; 指定行へ移動
(global-set-key (kbd "C-S-o") 'open-line-above)                   ; vimの'O'
(global-set-key (kbd "<f5>")  'revert-buffer)                     ; ファイルを読み込み直す

;; Shift+カーソルでウインドウの移動
(setq windmove-wrap-around t)
(windmove-default-keybindings)

(defun beginning-of-indented-line (current-point)
  "インデント文字を飛ばした行頭に戻る。ただし、ポイントから行頭までの間にインデント文字しかない場合は、行頭に戻る。"
  (interactive "d")
  (if (string-match
       "^[ \t]+$"
       (save-excursion
         (buffer-substring-no-properties
          (progn (beginning-of-line) (point))
          current-point)))
      (beginning-of-line)
    (back-to-indentation)))

(defun beginning-of-visual-indented-line (current-point)
  "インデント文字を飛ばした行頭に戻る。ただし、ポイントから行頭までの間にインデント文字しかない場合は、行頭に戻る。"
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
  "ウィンドウが1つなら作成し, 他のウインドウへ移動する。"
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
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



;;;; el-get
(add-to-list 'load-path (expand-file-name "el-get/el-get/" user-emacs-directory))
(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (goto-char (point-max))
       (eval-print-last-sexp))))
  (el-get-emacswiki-refresh el-get-recipe-path-emacswiki t))

(add-to-list 'el-get-recipe-path (expand-file-name "recipes/" user-emacs-directory))

(defvar my-el-get-sources
  '(el-get
    auto-async-byte-compile
    auto-complete
    auto-complete-clang
    c-eldoc
    color-moccur
    goto-chg
    helm
    jade-mode
    js-comint
    js2-mode
    key-chord
    markdown-mode
    moccur-edit
    point-undo
    redo+
    smart-compile
    tabbar
    yalinum
    zencoding-mode))

(el-get 'sync my-el-get-sources)



;;;; config
(defvar my-config-file-prefix "config/config-")
(defun my-load-configs (sources)
  "Load config files of sources."
  (dolist (src sources)
    (load (concat my-config-file-prefix (symbol-name src)) t)))

;; el-get
(my-load-configs my-el-get-sources)

;; builtin
(defvar my-builtin-sources
  '(compilation-mode
    dired
    flymake
    recentf
    uniquify
    view-mode
    whitespace

    ;; major-mode
    c-c++-mode
    ))
(my-load-configs my-builtin-sources)

;; site-lisp
(load "config/config-color-theme")
(load "config/config-yasnippet-bundle")

;; face
(load "config/config-face")


;;; my-cofing-mode
(defun my-coding-mode-hook ()
  ;; whitespace
  (whitespace-mode 1)
  ;; yalinum
  (yalinum-mode 1)
  ;; auto-complete
  (auto-complete-mode 1)
  )

(defvar my-coding-mode-hook-list
  (list 'c-mode-hook
        'c++-mode-hook
        'emacs-lisp-mode-hook
        'html-mode-hook
        'jade-mode-hook
        'js2-mode-hook
        'markdown-mode-hook
        'stylus-mode-hook))

(dolist (hook my-coding-mode-hook-list)
  (add-hook hook 'my-coding-mode-hook))



;;; tuareg-mode-custom
;;; (auto-install-from-url "https://bitbucket.org/camlspotter/tuareg-mode-custom/raw/60b617a66e4d/tuareg.el")
;;; (auto-install-from-url "https://bitbucket.org/camlspotter/tuareg-mode-custom/raw/60b617a66e4d/camldebug.el")
;; (when (require 'tuareg nil t)
;;   (setq tuareg-case-arrow-extra-indent 1)
;;   (setq auto-mode-alist
;;         (append '(("\\.ml[ily]?$" . tuareg-mode)
;;                   ("\\.topml$" . tuareg-mode))
;;                 auto-mode-alist)))
