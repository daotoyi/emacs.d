;;; init-ui.el --- settings for the Emacs UI

;; Settings for system windows
;;(when (string-equal system-type "windows-nt")
;;(menu-bar-mode -1))				;; close menu bar in Windows
;;(tool-bar-mode -1)				;; close tool-bar
;;(scroll-bar-mode -1)				;; closs scroll-bar

(setq initial-frame-alist (quote ((fullscreen . maximized))))	;;fullscreen
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)				;;auto match {}()[]

(provide 'init-ui)
;;; init-ui.el ends here
