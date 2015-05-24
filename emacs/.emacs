;;;;;;;;;;;;;;;;;;;; CUSTOMAZATION ;;;;;;;;;;;;;;;;;;;;

;; To manage package pools: + MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Auto-complete
(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict") ;;dictionary
(ac-config-default)

;; Evil
(require 'evil)
(evil-mode 1)

;;;;;;;;;;;;;;;;;;;; END_CUSTOM ;;;;;;;;;;;;;;;;;;;;
