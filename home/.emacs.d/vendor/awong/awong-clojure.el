;; Clojure setup

(require 'clojure-mode)

(require 'clojure-test-mode)

; swank-clojure outdated
;(require 'swank-clojure)

(add-hook 'nrepl-interaction-mode-hook
  'nrepl-turn-on-eldoc-mode)
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "*nrepl*") 

(provide 'awong-clojure)
