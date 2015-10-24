;;;; mode-line setting

(defvar mode-line-cleaner-alist
  '(
    ;; minor modes
    (abbrev-mode . " ab")
    (auto-complete-mode . " ac")
    (auto-fill-function . " af")
    (flyspell-mode . "fs")
    (global-whitespace-mode . "")
    (guide-key-mode . "")
    (helm-gtags-mode . "")
    (highlight-symbol-mode . "")
    (isearch-mode . "")
    (ruby-end-mode . "")
    (visual-line-mode . " vline")
    (whitespace-mode . "")
    ;; major modes
    (emacs-lisp-mode . "elisp")
    (fundamental-mode . "fund")
    (lisp-interaction-mode . "lisp-i")
    ))

(defun clean-mode-line ()
  (cl-loop for cleaner in mode-line-cleaner-alist
           do (let* ((mode (car cleaner))
                     (mode-str (cdr cleaner))
                     (old-mode-str (cdr (assq mode minor-mode-alist))))
                (when old-mode-str
                  (setcar old-mode-str mode-str))
                ;; major mode
                (when (eq mode major-mode)
                  (setq mode-name mode-str)))))

(defun downcase-mode-line ()
  ;; minor mode
  (dolist (li minor-mode-alist)
    (let* ((cell (cdr li))
           (str (car cell)))
      (when (char-or-string-p str)
        (setcar cell (downcase str)))))
  ;; major mode
  (when (char-or-string-p mode-name)
    (setq mode-name (downcase mode-name))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)
(add-hook 'after-change-major-mode-hook 'downcase-mode-line)

;;; powerline
(require 'powerline)

;; faces
(defface powerline-active-input
  '((t (:weight bold :inherit mode-line)))
  "Powerline active input face."
  :group 'powerline)

(defface powerline-inactive-input
  `((t (:foreground ,monokai/bg :inherit mode-line-inactive)))
  "Powerline inactive input face."
  :group 'powerline)

(defface powerline-active-input-us
  `((t (:background ,monokai/violet :inherit powerline-active-input)))
  "Powerline active input us face."
  :group 'powerline)

(defface powerline-inactive-input-us
  `((t (:background ,monokai/violet :inherit powerline-inactive-input)))
  "Powerline inactive input us face."
  :group 'powerline)

(defface powerline-active-input-ja
  '((t (:background "#FC5C94" :inherit powerline-active-input)))
  "Powerline active input ja face."
  :group 'powerline)

(defface powerline-inactive-input-ja
  '((t (:background "#FC5C94" :inherit powerline-inactive-input)))
  "Powerline inactive input ja face."
  :group 'powerline)

(defface powerline-active-input-smartrep
  '((t (:background "#A45E0A" :inherit powerline-active-input)))
  "Powerline active input smartrep face."
  :group 'powerline)

(defface powerline-inactive-input-smartrep
  '((t (:background "#A45E0A" :inherit powerline-inactive-input)))
  "Powerline inactive input smartrep face."
  :group 'powerline)

(defface powerline-active-left-2
  '((t (:background "#49483E" :inherit mode-line)))
  "Powerline active right face 2."
  :group 'powerline)

(defface powerline-inactive-left-2
  '((t (:background "#3E3D31" :inherit mode-line-inactive)))
  "Powerline inactive right face 2."
  :group 'powerline)

(defface powerline-active-right-1
  '((t (:inherit powerline-active-left-2)))
  "Powerline active left face 1."
  :group 'powerline)

(defface powerline-inactive-right-1
  '((t (:inherit powerline-inactive-left-2)))
  "Powerline inactive left face 1."
  :group 'powerline)

(defface powerline-active-right-2
  '((t (:background "#75715E" :inherit mode-line)))
  "Powerline active right face 2."
  :group 'powerline)

(defface powerline-inactive-right-2
  '((t (:background "#49483E" :inherit mode-line-inactive)))
  "Powerline inactive right face 2."
  :group 'powerline)

(defface powerline-active-hud-bar
  '((t (:background "#A6E22E" :inherit mode-line)))
  "Powerline active hud bar face."
  :group 'powerline)

(defface powerline-inactive-hud-bar
  '((t (:background "#67930F" :inherit mode-line-inactive)))
  "Powerline inactive hud bar face."
  :group 'powerline)

;; functions
(defun get-powerline-input-mode (&optional active)
  (cond ((< 0 (length smartrep-mode-line-string)) (cons "SR" (if active
                                                                 'powerline-active-input-smartrep
                                                               'powerline-inactive-input-smartrep)))
        (current-input-method (cons "あ" (if active
                                             'powerline-active-input-ja
                                           'powerline-inactive-input-ja)))
        (t (cons "Aa"  (if active
                           'powerline-active-input-us
                         'powerline-inactive-input-us)))))

;; defpowerlins
(defpowerline powerline-input-mode
  (car (get-powerline-input-mode)))

(powerline-input-mode)


(defpowerline powerline-vc-1
  (when (and (buffer-file-name (current-buffer))
             vc-mode)
    (propertize (replace-regexp-in-string " Git[-:@]" " " (format-mode-line '(vc-mode vc-mode)))
                'face `((:foreground ,monokai/blue :weight bold)))))

(defpowerline powerline-file-status
  (let ((str (cond
              (buffer-read-only "")
              ((buffer-modified-p) "*")
              (t ""))))
    (if (buffer-modified-p)
        (propertize str
                    'face `((:foreground ,monokai/orange :weight bold)))
      str)))

(defpowerline powerline-file-format
  (cl-case (coding-system-eol-type buffer-file-coding-system)
    (0 "unix")                          ; LF
    (1 "dos")                           ; CRLF
    (2 "mac")                           ; CR
    (otherwise "?")))

(defpowerline powerline-file-encoding
  (let ((encoding (coding-system-type buffer-file-coding-system)))
    (if (eq encoding 'undecided)
        "utf-8"
      (symbol-name encoding))))

;; powerline-theme
(defun my/powerline-theme ()
  "Setup the default mode-line."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face-input (cdr (get-powerline-input-mode active)))
                          (face-left-2 (if active 'powerline-active-left-2 'powerline-inactive-left-2))
                          (face-right-1 (if active 'powerline-active-right-1 'powerline-inactive-right-1))
                          (face-right-2 (if active 'powerline-active-right-2 'powerline-inactive-right-2))
                          (face-hud (if active 'powerline-active-hud-bar 'powerline-inactive-hud-bar))
                          (lhs (list (powerline-input-mode face-input 'l)
                                     (powerline-raw " " face-input)
                                     (powerline-vc-1 face-left-2 'l)
                                     (powerline-buffer-id face-left-2 'l)
                                     ;; (powerline-raw "%*" face-left-2 'l)
                                     (powerline-file-status face-left-2)
                                     ;; (when (and (boundp 'which-func-mode) which-func-mode)
                                     ;;   (powerline-raw which-func-format nil 'l))
                                     (powerline-major-mode face-left-2 'l)
                                     (powerline-raw " " face-left-2)
                                     (powerline-process)
                                     (powerline-minor-modes nil 'l)
                                     (powerline-narrow nil 'l)
                                     (powerline-raw " ")))
                          (rhs (list (powerline-raw global-mode-string nil 'r)
                                     (powerline-file-format face-right-1 'l)
                                     (powerline-raw " " face-right-1)
                                     (powerline-file-encoding face-right-1 'r)
                                     (powerline-raw "\uE0A1" face-right-2 'l)
                                     (powerline-raw "%3l" face-right-2 'l)
                                     (powerline-raw ":" face-right-2)
                                     (powerline-raw "%2c" face-right-2 'r)
                                     (powerline-hud face-hud mode-line))))
                     (concat (powerline-render lhs)
                             (powerline-fill nil (powerline-width rhs))
                             (powerline-render rhs)))))))

(my/powerline-theme)
