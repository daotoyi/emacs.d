;;; ------------------init-private.el---Summary -------------------------

(add-to-list 'load-path (expand-file-name (concat EamcsConfDir ".emacs.d/lisp/")))		;;user-emacs-directory = ~/.emacs.d/
;;(setq custom-file (expand-file-name ".emacs.d/lisp/custom.el" load-path))				;;custom_config

;;; Shell Bash Env
(setq explicit-shell-file-name "D:/Program Files (x86)/Git/bin/bash.exe")
(setq shell-file-name explicit-shell-file-name)				;;Emacs default shell name: shell-file-name
(add-to-list 'exec-path "D:/Program Files (x86)/Git/bin/")


;;; Package Management
(require 'init-elpa)
(require 'init-utils)
(require 'init-startup)
(require 'init-packages)
(require 'init-ui)
(require 'init-kbd)
;(require 'init-org)
;(require 'init-python)
;(require 'init-init-web)
(require 'custom)


;;; init.el ends here
;;(provide 'init-private)


















