
(setq scrappy/default_modules_path "modules")

(defun scrappy/load_modules ( module_list )
  (message "   loading modules ?")
  (message "   Modules %s" module_list)
  (mapcar (lambda (mod_name)
	    ( message "    load mod %s" mod_name  )
	    (setq full_name (concat scrappy/default_modules_path "/" mod_name ".el" )) 
	    ( message "    %s" full_name )
	    (load-file full_name)
	  )
	  module_list)
)

;; BUFFER HELPERS
(defun scrappy/kill-this-buffer (&optional arg)
  "Kill the current buffer.
If the universal prefix argument is used then kill also the window."
  (interactive "P")
  (if (window-minibuffer-p)
      (abort-recursive-edit)
    (if (equal '(4) arg)
        (kill-buffer-and-window)
      (kill-buffer))))




;;(message "---hi test")
;;(scrappy/load_modules '( "a" "b" "c" )  )
;;(message "---done")
