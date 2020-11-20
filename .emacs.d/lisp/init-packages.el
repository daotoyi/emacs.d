;; ----init-package.el---- load the plugin

(setq package-check-signature nil) 			;; Occasionally, a signature verification failure occurs

;; cl - Common Lisp Extension
(require 'cl)

;;; Add Packages
;(defvar my/packages '(
;	;; --- Use-package ---
;		use-package
;		emacs
;	 ;; --- Themes ---
;       monokai-theme
;		molokai-theme
;       ;; solarized-theme
;	;; ---Search && Editor ---
;		ivy
;		counsel
;		swiper
;		smartparens
;		smooth-scrolling
;		hungry-delete
;		popwin
;		recent
;		smex
;		helm
;		ace-jump-mode
;	;; --- Auto-completion ---
;		company
;	;; --- Syntax ---
;		flycheck
;	;; --- Major Mode ---
;		evil
;		org-mode
;		;;js2-mode
;		;;markdown-mode
;		exec-path-from-shell
;	;; --- Miojor Mode ---
;		which-key
;		crux
;	;; --- Python ---
;		anaconda-mode
;		elpy
;	;; --- Web ---		
;		web-mode
;		emmet-mode
;    ) 
;	"Default packages")
;
; (defun my/packages-installed-p ()
;     (loop for pkg in my/packages
;           when (not (package-installed-p pkg)) do (return nil)
;           finally (return t)))
;
; (unless (my/packages-installed-p)
;     (message "%s" "Refreshing package database...")
;     (package-refresh-contents)
;     (dolist (pkg my/packages)
;       (when (not (package-installed-p pkg))
;         (package-install pkg))))
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; Load use-package manager
(require-package 'use-package)
;;(require 'use-package-autoloads)


;;(setq ring-bell-function 'ignore)		;;close Emacs ring-bell
(use-package emacs :config (defalias 'yes-or-no-p 'y-or-n-p))
(use-package emacs
    :config										;; display line num
    (setq display-line-numbers-type 'relative)	;; or visual
    (global-display-line-numbers-mode t)		;;(global-linum-mode t)
	(defalias 'yes-or-no-p 'y-or-n-p)
	(setq linum-format "%4d "))

;;; Theme Color
(require-package 'monokai-theme) 		;;molokai-theme is also exist.good as well.
;;(require 'monokai-theme-autoloads)
(use-package monokai-theme 
  :ensure t
  :load-path "themes"
  :init
  (setq monokai-theme-kit t)
  :config
  (load-theme 'monokai t)
  )


;;;; Enhance Search---ivy
;(require-package 'ivy)
;;;(require 'ivy-autoloads)
;(use-package ivy
;  :defer 1
;  :demand
;  :hook (after-init . ivy-mode)
;  :config
;  (ivy-mode 1)
;  (setq ivy-use-virtual-buffers t
;        ivy-initial-inputs-alist nil
;        ivy-count-format "%d/%d "
;        enable-recursive-minibuffers t
;        ivy-re-builders-alist '(t . ivy--regex-ignore-order))
;	;;(ivy-posframe-mode 1)
;)
;

;;; Enhance Search---counsel
(require-package 'counsel)
;;(require 'counsel-autoloads)
(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-c f" . counsel-recentf)
         ("C-c g" . counsel-git)))

;;; Enhance Search---swiper		 
(require-package 'swiper)
(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper-isearch-backward))
  :config (setq swiper-action-recenter t
                swiper-include-line-number-in-search t))

				
;;; Auto-complete	
(require-package 'company)		
(use-package company
  :config
  (setq company-dabbrev-code-everywhere t
        company-dabbrev-code-modes t
        company-dabbrev-code-other-buffers 'all
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case t
        company-dabbrev-other-buffers 'all
        company-require-match nil
        company-minimum-prefix-length 2
        company-show-numbers t
        company-tooltip-limit 20
        company-idle-delay 0
        company-echo-delay 0
        company-tooltip-offset-display 'scrollbar
        company-begin-commands '(self-insert-command))
  (push '(company-semantic :with company-yasnippet) company-backends)
  :hook ((after-init . global-company-mode)))
  
  
;; Syntax Check
(require-package 'flycheck)
(use-package flycheck
  :hook (after-init . global-flycheck-mode))		;;Global
  ;; :hook (prog-mode . flycheck-mode))				;; Progress mode
 
 
;; MapKey
(require-package 'which-key)
(use-package which-key
  :defer 2
  :config (which-key-mode))

  
;; Text Edit
(require-package 'crux)
(use-package crux
    :bind ("C-c k" . crux-smart-kill-line))			;;delete current line

(require-package 'hungry-delete)	
(use-package hungry-delete
    :bind (("C-c DEL" . hungry-delete-backward)		;;delete 
           ("C-c d" . hungry-delete-forward)))
		   

;; Curson move to new window
(require-package 'popwin)
;(use-package popwin
;	:defer nil 
;	:config (popwin-mode 1 t ))
;; Bug in this el.file. popwin/:config: Symbol’s function definition is void: popwin-mode;	


;; Open recent files	
(require-package 'recentf)
(use-package recentf
	:defer 1
	:config
	(recentf-mode 1 )
	(setq recentf-max-saved-items 200
		recentf-max-menu-items 10)							;; visit NO. files 10
	(global-set-key (kbd "<F10>") 'recentf-open-files)		;; this function maybe replaced by  counsel 
	;;(global-set-key (kbd "C-x C-r") 'recentf-open-files)
	(setq kill-ring-max 200))								;; record of files deleted 200
	
	
;; Vim -- evil
(require-package 'evil)	
(use-package evil
	:config
	(evil-mode 1)
	)
	
;(require-package 'ido-mode)

(require-package 'smex)

;;(require-package 'Org-mode t)
;;(require-package 'org-mode)

;;(require-package 'helm)

(require-package 'ace-jump-mode)

(require-package 'smartparens)
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; init-package.el ends here
(provide 'init-packages)
