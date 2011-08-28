(require 'color-theme)
(require 'color-theme-zenburn)
;;(require 'color-theme-emacs-revert-theme)
(require 'color-theme-github)


(eval-after-load "color-theme"
  '(progn
     ;;(color-theme-initialize)
     (color-theme-zenburn)))

(provide 'awong-color-theme)