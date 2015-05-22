;;;; Python mode setting

(custom-set-variables '(python-shell-interpreter "python3"))

(with-eval-after-load 'python-environment
  (custom-set-variables '(python-environment-virtualenv
                          (append python-environment-virtualenv '("--python" "python3")))))

;; jedi
(custom-set-variables '(jedi:complete-on-dot t)
                      '(jedi:tooltip-method nil))
(add-hook 'python-mode-hook 'jedi:setup)

;; quickrun
(quickrun-add-command "python"
                      '((:command . "python3")) :override t)
