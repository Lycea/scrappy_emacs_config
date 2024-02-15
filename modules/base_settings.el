;;================================
;; BASE SETTINGS
;;----

;; Don't show startup screen
(setq inhibit-startup-screen t)

;;disable various parts of ui (unneeded)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode t)
(set-fringe-mode 10)
(menu-bar-mode -1)

					;enable recentf-mode
(recentf-mode t)

(display-line-numbers-mode)

;;line numbers
(column-number-mode)
(global-display-line-numbers-mode t)
(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hook
		shell-mode-hook
		treemacs-mode-hook
		))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


;;set font size / type (have to check it works ....)
;;TODO: fix
(set-face-attribute 'default nil :font "Hack Nerd Font" :height  75)

;;set theming
;;(load-theme 'leuven-dark)



;;single key cancle
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

