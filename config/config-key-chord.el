;;; key-chord
(require 'key-chord)
(setq key-chord-two-keys-delay 0.04)

(key-chord-define-global "jk" 'view-mode)
(key-chord-define-global "hb" 'describe-bindings)
(key-chord-define-global "hf" 'describe-function)
(key-chord-define-global "hk" 'describe-key)
(key-chord-define-global "hv" 'describe-variable)

(key-chord-mode 1)
