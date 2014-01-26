;;;; editing setting

;; 4-space indent
(setq-default indent-tabs-mode nil
              tab-width 4
              tab-stop-list (number-sequence 4 120 4))

;; auto indent
(electric-indent-mode 1)

;; auto insert pair
(electric-pair-mode 1)

;; delete region by BS, DEL, typing text
(delete-selection-mode 1)

;; undo-tree
(global-undo-tree-mode 1)
(custom-set-variables
 '(undo-tree-mode-lighter ""))
