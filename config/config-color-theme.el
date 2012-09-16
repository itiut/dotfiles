;;; color-theme
;;; website: http://download.savannah.gnu.org/releases/color-theme/
;;;
;;; color-theme-railscasts
;;; website: https://github.com/olegshaldybin/color-theme-railscasts
(add-to-list 'load-path (expand-file-name "site-lisp/color-theme/" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/color-theme/themes/" user-emacs-directory))

(require 'color-theme)
(color-theme-initialize)
(color-theme-railscasts)
