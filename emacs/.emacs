;;------------------ CUSTOMAZATION ------------------;;

;; Basics
(setq inhibit-startup-message t) ;; turn off welcome buffer
(tool-bar-mode -1) 
;(menu-bar-mode -1) ; bars off

(setq make-backup-files nil) ;; turn off adding backup file

(column-number-mode t)
(line-number-mode t) ;; mode line: line & column numbering
(global-linum-mode t) ;; global line numbering
(global-visual-line-mode t) ;; word wrap
(show-paren-mode t) ;; parentheses matching

;; Manage package repositories: +MELPA Stable +Marmalade
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") )
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") )
(package-initialize)

;;---------- My Package List
;; Automatically installation:		#Need to update for a list later!
(when (not (package-installed-p 'auto-complete))
  (package-install 'auto-complete))
(when (not (package-installed-p 'evil))
  (package-install 'evil))
(when (not (package-installed-p 'monokai-theme))
  (package-install 'monokai-theme))
(when (not (package-installed-p 'smex))
  (package-install 'smex))
;; Specific settings of packages
;;----- monokai theme
(load-theme 'monokai t)
;;----- Auto-complete
;(require 'auto-complete-config)
(ac-config-default)
;;----- ido
;(require 'ido) 
(ido-mode t)
;;----- smex
;(require 'smex) 
(smex-initialize)
(global-set-key (kbd "M-x") 'smex) ; make smex triggered by M-x 
;;----- Evil
;(require 'evil) ; this could be omit when package.el used
;(evil-mode 1)
;(evil-set-initial-state 'dired-mode 'emacs)
;(evil-set-initial-state 'eww-mode 'emacs)
;(evil-set-initial-state 'eww-bookmark-mode 'emacs)

;;------------------ END_CUSTOM ------------------;;
