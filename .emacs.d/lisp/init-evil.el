;;;---- init-org.el --- Org model settings

(require 'org)
(setq org-src-fontify-natively t)			;;hlight
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)	;;map kbd key


(provide 'init-org)
;;; init-ui.el ends here
