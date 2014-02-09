;;;; mode-line setting

(defvar mode-line-cleaner-alist
  '(
    ;; minor modes
    (auto-complete-mode . " ac")
    (auto-fill-function . " af")
    (flyspell-mode . "fs")
    (isearch-mode . "")
    (whitespace-mode . "")
    (global-whitespace-mode . "")
    ;; major modes
    (emacs-lisp-mode . "elisp")
    (fundamental-mode . "text")
    (git-gutter+-commit-mode . "git-commit")
    (lisp-interaction-mode . "lisp-i")))

(defun clean-mode-line ()
  (interactive)
  (loop for cleaner in mode-line-cleaner-alist
        do (let* ((mode (car cleaner))
                  (mode-str (cdr cleaner))
                  (old-mode-str (cdr (assq mode minor-mode-alist))))
             (when old-mode-str
               (setcar old-mode-str mode-str))
             ;; major mode
             (when (eq mode major-mode)
               (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)

;; powerline
(require 'powerline)
(custom-set-variables '(powerline-default-separator 'nil))

(defpowerline powerline-input-mode
  (cond
   (current-input-method "あ")
   (t "Aa")))

(defpowerline powerline-file-format
  (case (coding-system-eol-type buffer-file-coding-system)
    (0 "unix")                          ; LF
    (1 "dos")                           ; CRLF
    (2 "mac")                           ; CR
    (otherwise "?")))

(defpowerline powerline-file-encoding
  (let ((encoding
         (replace-regexp-in-string "-\\(dos\\|unix\\|mac\\)$" "" (symbol-name buffer-file-coding-system))))
    (cond
     ((string= "undecided" encoding) "ascii")
     (t encoding))))

(defun my/powerline-theme ()
  "Setup the default mode-line."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          powerline-default-separator
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           powerline-default-separator
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (powerline-input-mode nil 'l)
                                     (powerline-buffer-id nil 'l)
                                     (powerline-raw "%*" nil 'l)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format nil 'l))
                                     (powerline-raw " ")
                                     (funcall separator-left mode-line face1)
                                     (when (boundp 'erc-modified-channels-object)
                                       (powerline-raw erc-modified-channels-object face1 'l))
                                     (powerline-major-mode face1 'l)
                                     (powerline-process face1)
                                     (powerline-minor-modes face1 'l)
                                     (powerline-narrow face1 'l)
                                     (powerline-raw " " face1)
                                     (funcall separator-left face1 face2)
                                     (powerline-vc face2 'r)))
                          (rhs (list (powerline-raw global-mode-string face2 'r)
                                     (powerline-file-format nil 'l)
                                     (powerline-raw " | ")
                                     (powerline-file-encoding nil 'r)
                                     (funcall separator-right face2 face1)
                                     (powerline-raw "\uE0A1" face1 'l)
                                     (powerline-raw "%4l" face1 'l)
                                     (powerline-raw ":" face1 'l)
                                     (powerline-raw "%3c" face1 'r)
                                     (funcall separator-right face1 mode-line)
                                     (powerline-hud face2 face1))))
                     (concat (powerline-render lhs)
                             (powerline-fill face2 (powerline-width rhs))
                             (powerline-render rhs)))))))

(my/powerline-theme)
