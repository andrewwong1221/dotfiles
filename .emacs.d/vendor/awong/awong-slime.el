;;Slime setup

;;load slime support
(require 'slime)

;;remove warning
(eval-after-load 'slime
  '(setq slime-protocol-version 'ignore))

;; Load REPL support in slime
(slime-setup '(slime-repl))




(provide 'awong-slime)