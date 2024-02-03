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


