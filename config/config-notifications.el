;;;; notifications
(require 'notifications)

(add-hook 'after-revert-hook
          '(lambda ()
             (notifications-notify :title "file reverted" :body buffer-file-name :urgency 'normal)))
