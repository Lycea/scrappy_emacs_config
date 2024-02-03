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
)


(my_conf/leader-keys
 "t" '(:ignore t :which-key "toggles")
 "tt" '(counsel-load-theme :which-key "choose theme"))

(my_conf/leader-keys
  "w" '(:ignore t :which-key "window")
  "w-" '(evil-window-split :which-key "split horizontally")
  "w/" '(evil-window-vsplit :which-key "split horizontally")
  "wd" '(delete-window :which-key "delete window (not buffer)")
  )
(my_conf/leader-keys
  "e" '(:ignore t :which-key "eval")
  "eb" '(eval-buffer :which-key "eval buffer")
  "ed" '(eval-defun :which-key "eval defun")
  "ee" '(eval-expression :which-key "eval expression"))

(my_conf/leader-keys
  "f" '(:ignore t :which-key "file")
  "ff" '( counsel-find-file :which-key "find file")
) 

(my_conf/leader-keys
 "buffer" '(:ignore t :which-key "buffer options")
 "bb" '(counsel-switch-buffer :which-key "switch buffers")
 "bd" '(kill-current-buffer :which-key "kill buffer only")
 "bk" '(kill-buffer-and-window :which-key "kill buffer + window"))

