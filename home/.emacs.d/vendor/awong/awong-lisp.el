
;;;
;;; paredit
;;;  * http://mumble.net/~campbell/emacs/paredit.el
;;;
(autoload 'paredit-mode "paredit" "Minor mode for pseudo-structurally editing Lisp code." t)

;;
;; clojure-mode
;;  * http://github.com/technomancy/clojure-mode
;;  * find . -name '*.clj' | xargs etags --regex=@/Users/ffailla/bin/clojure.tags
;;
(defun clojure-mode-setup ()
  (slime-mode t)
  (show-paren-mode t)
  (paredit-mode t)
  (outline-minor-mode t)
  (column-number-mode t)
  (rainbow-delimiters-mode t))

(autoload 'clojure-mode "clojure-mode" nil t)

(add-hook 'clojure-mode-hook #'clojure-mode-setup)
(add-hook 'slime-repl-mode-hook #'clojure-mode-setup)
(add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))

(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)


;;;
;;; Emacs lisp mode setup
;;;
(defun emacs-lisp-mode-setup ()
  (paredit-mode t)
  (show-paren-mode t)
  (outline-minor-mode t)
  (column-number-mode t)
  (rainbow-delimiters-mode t))

(add-hook 'emacs-lisp-mode-hook #'emacs-lisp-mode-setup)

(provide 'awong-lisp)