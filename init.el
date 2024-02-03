(message "\n\n====================")
(message "LOADING UP CONFIG")
(message "------")


(message "load main helpers...")
(load-file "modules/scrappy.el")

(setq scrappy/default_modules_path "modules" )

(message "load modules ...")
;; main modules
(scrappy/load_modules '(
			"base_settings"
			"packaging_setup"
			"theming"
			"keybinds_base"
			))

;; other modules
(scrappy/load_modules '(
			"misc_setup"
			"ivy_setup"
			"evil_setup"
			))

(message "module loading done ...")

;;===============================
;;hydra install and sample usage
(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

(my_conf/leader-keys
  "ts" '(hydra-text-scale/body :which-key "scale text"))

;;==============================
;; startup buffer shenanigans
(setq startup t)

(message "setting up main buffer ? ")


(let ((buffer (generate-new-buffer "*scrappy-start*")))
      (set-buffer-major-mode buffer)
      (set-window-buffer nil buffer))
(switch-to-buffer "*scrappy-start*")
(insert "* Scrappy news\n")
(insert "Welcome to scrappy !\n\n")
(insert "*** Recent\n\n")

(setq my_list recentf-list)
(setq cnt 1)
(while my_list
    (setq tmp_val (car my_list))
    (insert  "- [[" tmp_val "][" tmp_val "]]"  "\n")

    (setq my_list (cdr my_list))
    (setq cnt (+ cnt 1))
    (if (> cnt 5)
	(return)
      )
)

;;(while recentf-listf
  




(org-mode)
(read-only-mode)

(message "======> CONFIG LOADING DONE <=======")
(message "====================================")


