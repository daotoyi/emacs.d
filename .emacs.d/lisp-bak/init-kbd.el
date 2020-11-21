;; --- init-kdb.el ---- KeyBoad Bind

;; Global key bind

(global-set-key (kbd "<f5>") 'load-file )		;;refresh init.el

(require-package 'emacs)
(use-package emacs
  :bind (("M-/" . comment-line)
         ("M-?" . comment-or-uncomment-region)
	     ("M-S-<return>" . toggle-frame-fullscreen)
         ("M-<return>" . toggle-frame-maximized)))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(global-set-key (kbd "C-c j") 'goto-line)		;;vim n-G

(provide 'init-kbd)
;;; init-kbd.el ends here
