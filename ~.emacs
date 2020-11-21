;;; ----------------Init.el---Entrance---Summary -------------------

;; Without this comment emacs adds (package-initialize) here,with ";;"
;; (package-initialize)

;;;; General Configure
(setq EamcsDir     "D:/Program Files (x86)/Emacs/")
(setq EamcsVerDir  (concat EamcsDir "emacs-27.1-x86_64/"))		;; (emacs-27.1-x86_64/  emacs-26.3-x86_64/)

;;;;[ Optional : myemacs/  spacemacs-master/  spacemacs-develop/ doom-emacs-develop/ ]
(when (<= emacs-major-version 26)
	(setq EamcsConfDir (concat EamcsDir "myemacs/")))
(when (>= emacs-major-version 27) 
	(setq EamcsConfDir (concat EamcsDir "spacemacs-master/")))
;(setq EamcsConfDir (concat EamcsDir "doom-emacs-develop/"))
;(setq EamcsConfDir (concat EamcsDir "spacemacs-develop/"))

(setenv "HOME" EamcsConfDir)
(setenv "PATH" EamcsVerDir)

(load-file  "~/.emacs.d/init.el")


;;;; init.el END here -----------------------------------------------


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(markdown-mode which-key web-mode use-package smex smart-mode-line projectile popwin parent-mode org-bullets open-junk-file neotree move-text monokai-theme molokai-theme macrostep lv lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-indentation helm-themes helm-swoop helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flycheck flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu emmet-mode elisp-slime-nav dumb-jump diminish define-word crux counsel company column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-mode ace-jump-helm-line)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

