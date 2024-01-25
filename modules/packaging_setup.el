;;====================
;; PACKAGING SETUP
;;----

(message "=======> LOADING PACKAGING <=======")

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
