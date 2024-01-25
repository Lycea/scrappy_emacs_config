;;setup doom themes and or monokai theme
;;(use-package doom-themes)
(use-package monokai-theme)

(load-theme 'monokai t)

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

