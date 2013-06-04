;;; quickrun
(require 'quickrun)
(global-set-key (kbd "<f5>") 'my/quickrun-depend-on-region)
(global-set-key (kbd "M-<f5>") 'quickrun-compile-only)

(defun my/quickrun-depend-on-region ()
  "If region is active, call quickrun-region. Otherwise call quickrun."
  (interactive)
  (if (region-active-p)
      (quickrun :start (region-beginning) :end (region-end))
    (quickrun)))
