;;;; tabbar setting

;; tabbar-ruler
(add-hook 'emacs-startup-hook '(lambda ()
                                 (require 'tabbar-ruler)))

(custom-set-variables '(tabbar-ruler-modified-symbol t))

(eval-after-load 'tabbar-ruler
  '(progn
     ;; https://bitbucket.org/bamanzi/dotemacs-elite/issue/24/tabbar-ruler-not-work-in-emacs-244-keep
     ;; store tabbar-cache into a real hash,
     ;; rather than in frame parameters
     (defvar tabbar-caches (make-hash-table :test 'equal))
     (defun tabbar-create-or-get-tabbar-cache ()
       "Return a frame-local hash table that acts as a memoization
       cache for tabbar. Create one if the frame doesn't have one yet."
       (or (gethash (selected-frame) tabbar-caches)
           (let ((frame-cache (make-hash-table :test 'equal)))
             (puthash (selected-frame) frame-cache tabbar-caches)
             frame-cache)))

     (defvar my/tabbar-ignored-buffer-names
       '("*Helm" "*helm" "*guide-key*"))

     (defvar my/tabbar-ignored-buffer-major-modes
       '(direx:direx-mode))

     (defun my/tabbar-buffer-list ()
       "Ignore buffers depending on buffer name and major mode."
       (let ((re (regexp-opt my/tabbar-ignored-buffer-names)))
         (delq nil
               (mapcar #'(lambda (b)
                           (cond
                            ((string-match re (buffer-name b)) nil)
                            ((memq (buffer-local-value 'major-mode b) my/tabbar-ignored-buffer-major-modes) nil)
                            (t b)))
                       (tabbar-buffer-list)))))

     (setq tabbar-buffer-list-function 'my/tabbar-buffer-list)

     (defun my/tabbar-buffer-groups ()
       "Group tabs by project name firstly when in project."
       (let ((project-root (my/find-project-root)))
         (if (and buffer-file-name project-root)
             (list (file-name-nondirectory (directory-file-name project-root)))
           (tabbar-buffer-groups))))

     (setq tabbar-buffer-groups-function 'my/tabbar-buffer-groups)))
