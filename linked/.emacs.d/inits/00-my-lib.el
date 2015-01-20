;;;; my own library

(defun my/add-hook-to-modes (modes function &optional append local)
  "Add the function `function' to hooks of every major or minor mode in `modes'."
  (dolist (mode modes)
    (add-hook (intern (format "%s-hook" mode)) function)))
