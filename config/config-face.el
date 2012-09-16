;;;; face
(defvar my-bg-color "#232323")
(defvar my-fg-color "#E6E1DC")

;; フォント(要Ricty)
(set-face-attribute 'default nil
                    :family "Ricty"
                    :height 130)

;; カーソル
(add-to-list 'default-frame-alist '(cursor-color . "HotPink"))

;; カーソル行
(set-face-attribute 'hl-line nil
                    :background "gray25")

;; whitespace
(set-face-attribute 'whitespace-trailing nil
                    :background my-bg-color
                    :foreground "DeepPink"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :background my-bg-color
                    :foreground "LightSkyBlue"
                    :underline t)
(set-face-attribute 'whitespace-space nil
                    :background my-bg-color
                    :foreground "GreenYellow"
                    :weight 'bold)

;; yalinum
(set-face-attribute 'yalinum-face nil
                    :background my-bg-color)
(set-face-attribute 'yalinum-bar-face nil
                    :background "DarkOliveGreen"
                    :foreground my-fg-color)

;; tabbar
(set-face-attribute 'tabbar-default nil
                    :family "Ricty"
                    :height 0.95
                    :background "gray40")
(set-face-attribute 'tabbar-unselected nil
                    :background "gray70"
                    :foreground "gray15"
                    :box nil)
(set-face-attribute 'tabbar-selected nil
                    :background "LightSteelBlue2"
                    :foreground "gray10"
                    :weight 'bold
                    :box nil)
(set-face-attribute 'tabbar-separator nil
                    :height 1.05)
