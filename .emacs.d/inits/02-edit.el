;;;; editing setting

(custom-set-variables
 ;; 4-space indent
 '(indent-tabs-mode nil)
 '(tab-width 4)
 '(tab-stop-list (number-sequence 4 120 4))

 ;; ensure newline is inserted before EOF when saved
 '(require-final-newline t))

;; auto indent
(electric-indent-mode 1)

(defvar my/electric-indent-disable-modes '(
                                           gfm-mode
                                           markdown-mode
                                           yaml-mode
                                           ))

(defun my/electric-indent-hook (c)
  (when (memq major-mode my/electric-indent-disable-modes)
    'no-indent))

(add-hook 'electric-indent-functions 'my/electric-indent-hook)

;; auto insert pair
(electric-pair-mode 1)

;; delete region by BS, DEL, typing text
(delete-selection-mode 1)

;; undo-tree
(global-undo-tree-mode 1)
(custom-set-variables '(undo-tree-mode-lighter ""))
