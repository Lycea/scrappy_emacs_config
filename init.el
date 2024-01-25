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

(display-line-numbers-mode)

;;line numbers
(column-number-mode)
(global-display-line-numbers-mode t)
(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hook
		shell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


;;set font size / type (have to check it works ....)
;;TODO: fix
(set-face-attribute 'default nil :font "Hack Nerd Font" :height  100)

;;set theming
;;(load-theme 'leuven-dark)



;;single key cancle
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;====================
;; PACKAGING SETUP
;;----

;;setup base packaging / package installer
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

;;load available packages
(package-initialize)
;;get packge infos if not there
(unless package-archive-contents
  (package-refresh-contents))

;;install use-package if not installed
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


;;====================
;; IVY SETUP
;;setup ivy, a buffer /completion /helper package
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))


;;----
;; Counsel setup
;;----

(use-package counsel
  :bind (( "M-x" . counsel-M-x)
	 ( "C-x b" . counsel-ibuffer)
	 ( "C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil))


;; IVY rich ?
;; documentation strings for M-x, verry nice
;; helper
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))


;;---
;;all the icons setup
;; first time run all-the-icons-install-fonts
(use-package all-the-icons)

;;---
;;DOOM modeline
  (use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  )


(use-package doom-themes)
(use-package monokai-theme)

(load-theme 'monokai t)

;;--------
;; OTHERS
;;-----
;; Rainbow braces
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)) ;;run rainbow-delim in any programming language mode
;;---
;; General helpfull ui stuff
;;---
;; which-key

(use-package which-key
  :init (which-key-mode);;before loaded
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.1))


;;--
;;helpfull
;; shows better help information in help
(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))


;;fancy key bindings - always available ones
(global-set-key (kbd "C-<tab>") 'counsel-switch-buffer )


;;local per mode keys
;; (define-key  MAP KEY DEF)


;;unset mark key ... it is not needed atm
;(keymap-global-unset  "C-SPC" )



;;setup via general
(use-package general

;;setup own main key!
:config
(general-create-definer my_conf/leader-keys
  :keymaps '(normal insert visual emacs)
  :prefix "SPC"
  :global-prefix "C-SPC")

(my_conf/leader-keys
 "t" '(:ignore t :which-key "toggles")
 "tt" '(counsel-load-theme :which-key "choose theme")))

(my_conf/leader-keys
  "w" '(:ignore t :which-key "window")
  "w-" '(evil-window-split :which-key "split horizontally")
  "w/" '(evil-window-vsplit :which-key "split horizontally")
  )


;;-----------
;; EVIL setup

(defun my_config/evil-hook ()
  (dolist (mode '(custom-mode
		  eshell-mode
		  git-rebase-mode
		  erc-mode
		  circe-server-mode
		  circe-chat-mode
		  circe-query-mode
		  sauron-mode
		  term-mode))
    (add-to-list 'evil-emacs-state-modes mode)))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll nil)
  (setq evil-want-C-i-jump nil)
  ;;:hook
  ;;(evil-mode . my_config/evil-hook)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
;;  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-nerd-commenter)

;;hydra install and sample usage
(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

(my_conf/leader-keys
  "ts" '(hydra-text-scale/body :which-key "scale text"))
