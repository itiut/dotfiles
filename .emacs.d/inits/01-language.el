;;;; language setting

;; encoding
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8-unix)

;; imput method
(when (require 'mozc nil 'noerror)
  (custom-set-variables
   '(default-input-method "japanese-mozc")
   '(mozc-candidate-style 'echo-area))

  (defun my/activate-input-method ()
    "Activate input method if input method is not active."
    (interactive)
    (unless current-input-method
      (toggle-input-method)))
  (global-set-key (kbd "<henkan>") 'my/activate-input-method)

  (defadvice mozc-handle-event (around intercept-keys (event) activate)
    "Intercept keys muhenkan and zenkaku-hankaku, before passing keys to mozc-server (which the function mozc-handle-event does), to properly disable mozc-mode."
    (if (memq event '(muhenkan zenkaku-hankaku))
        (progn
          (mozc-clean-up-session)
          (deactivate-input-method))
      ad-do-it)))
