;;; ------------------init-private.el---Summary -------------------------

;;user-emacs-directory = ~/.emacs.d/
(when (eq system-type 'windows-nt)
	(add-to-list 'load-path (expand-file-name (concat EamcsConfDir ".emacs.d/lisp/"))))
(when (eq system-type 'gnu/linux)
	(add-to-list 'load-path (expand-file-name (concat ~ ".emacs.d/lisp/")))
	(load-file  "~/.emacs.d/init.el"))

;; Shell Bash Env
(when (eq system-type 'windows-nt)
(setq explicit-shell-file-name "D:/Program Files (x86)/Git/bin/bash.exe")
(setq shell-file-name explicit-shell-file-name)				;;Emacs default shell name: shell-file-name
(add-to-list 'exec-path "D:/Program Files (x86)/Git/bin/"))


;;; Package Management
(require 'init-elpa)
(require 'init-utils)
(require 'init-startup)
(require 'init-packages)
(require 'init-ui)
(require 'init-evil)
(require 'init-kbd)
(require 'init-web)
;(require 'init-python)
;(require 'custom)


;;; init.el ends here
;;(provide 'init)


















