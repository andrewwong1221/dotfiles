;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;
;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"

;; Turn off mouse interface early in startup to avoid momentary display
;; You really don't need these; trust me.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))


;;define some variables

(defvar *emacs-load-start* (current-time))
(setq dotfiles-dir (file-name-directory
		    (or (buffer-file-name) load-file-name)))
(defvar ext-dir (concat dotfiles-dir "vendor/") "The root folder for external packages")



(defun add-subfolders-to-load-path (parent-dir)
  "Adds all first level `parent-dir' subdirs to the Emacs load path."
  (dolist (f (directory-files parent-dir))
    (let ((name (concat parent-dir f)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))



(add-to-list 'load-path dotfiles-dir)
(add-subfolders-to-load-path dotfiles-dir)
(add-subfolders-to-load-path ext-dir)


(setenv "PATH" (concat "~/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/sbin:" (getenv "PATH")))
(setq exec-path (append '("~/bin" "/opt/local/bin" "/opt/local/sbin" "/usr/local/bin" "/sbin" ) exec-path))

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(add-to-list 'load-path "~/.emacs.d/elpa/")
(require 'package)
(setq package-archives '(("marmalade" . "http://marmalade-repo.org/packages/")
                         ("ELPA" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;;(require 'cl)
;;Prevent error message
(eval-when-compile (require 'cl)) 
(require 'recentf)
(require 'linum)
(require 'linum-off)
(require 'ido)
(require 'rainbow-delimiters)

(require 'awong-defun)
(require 'awong-color-theme)
(require 'awong-lisp)
(require 'awong-misc)
(require 'awong-slime)
(require 'awong-clojure)
(require 'awong-org)

(global-linum-mode 1)
(setq inhibit-splash-screen t)
(recentf-mode 1)
(setq column-number-mode t)
(setq linum-disabled-modes-list '(eshell-mode wl-summary-mode compilation-mode erc-mode org-mode))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ido-case-fold t)
 '(ido-mode (quote both) nil (ido)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
