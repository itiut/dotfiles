;;;; flymake
(require 'flymake)

(add-hook 'flymake-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-p") 'flymake-goto-prev-error)
             (local-set-key (kbd "M-n") 'flymake-goto-next-error)))

(defun flymake-simple-generic-init (cmd &optional opts)
  (let* ((temp-file  (flymake-init-create-temp-buffer-copy
                      'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list cmd (append opts (list local-file)))))

;; Makefile が無くてもC/C++のチェック
(defun flymake-simple-make-or-generic-init (cmd &optional opts)
  (if (file-exists-p "Makefile")
      (flymake-simple-make-init)
    (flymake-simple-generic-init cmd opts)))

(defun flymake-c-init ()
  (flymake-simple-make-or-generic-init
   "gcc" '("-Wall" "-Wextra" "-pedantic" "-fsyntax-only" "-std=gnu99")))

(defun flymake-cc-init ()
  (flymake-simple-make-or-generic-init
   "g++" '("-Wall" "-Wextra" "-pedantic" "-Wno-long-long" "-fsyntax-only")))

;; Verilog HDL
(defun flymake-verilog-init ()
  (let* ((temp (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
         (local (file-relative-name temp (file-name-directory buffer-file-name))))
    (list "iverilog" (list "-tnull" local))))

(push '("\\.c\\'" flymake-c-init) flymake-allowed-file-name-masks)
(push '("\\.cpp\\'" flymake-cc-init) flymake-allowed-file-name-masks)
(push '("\\.v\\'" flymake-verilog-init) flymake-allowed-file-name-masks)

(defun my-flymake-mode-setup ()
  (flymake-mode 1))

(add-hook 'c-mode-hook 'my-flymake-mode-setup)
(add-hook 'c++-mode-hook 'my-flymake-mode-setup)
(add-hook 'verilog-mode-hook 'my-flymake-mode-setup)
