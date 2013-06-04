;;; quickrun
(require 'quickrun)
(global-set-key (kbd "C-c C-c") 'my/quickrun-depend-on-region)
(global-set-key (kbd "C-c c") 'quickrun-with-arg)

(defun my/quickrun-depend-on-region (start end)
  "If region is active, call quickrun-region. Otherwise call quickrun."
  (interactive "r")
  (if (region-active-p)
      (quickrun :start start :end end)
    (quickrun)))
