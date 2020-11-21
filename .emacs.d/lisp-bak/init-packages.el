;; ----init-package.el---- load the plugin

;;; --- Kind of Install Method---
; (require-package 'use-package)		;; define in elpa.el
; (require 'use-package-autoloads)		;; default
; (package-install 'use-package)			;; default

(setq package-check-signature nil) 			;; Occasionally, a signature verification failure occurs

;;; cl - Common Lisp Extension
;  (require 'cl)		;; deprecated

;;; Add Packages ---  Another Method --->> Option
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; (defvar my/packages '(
;	;; --- Use-package ---
;		use-package
;		emacs
;	 ;; --- Themes ---
;       monokai-theme
;		smart-mode-line
;       ; solarized-theme
;	;; ---Search && Editor ---
;		ivy
;		counsel
;		swiper
;		smartparens
;		smooth-scrolling
;		hungry-delete
;		recent
;		smex
;		; helm
;		ace-jump-mode
;	;; --- Auto-completion ---
;		company
;	;; --- Syntax ---
;		flycheck
;	;; --- Major Mode ---
;		evil
;		; org-mode
;		; js2-mode
;		; markdown-mode
;		exec-path-from-shell
;	;; --- Miojor Mode ---
;		which-key
;		crux
;	;; --- Python ---
;		; elpy
;	;; --- Web ---		
;		; web-mode
;		; emmet-mode
;	;; --- Other ---		
;		vterm
;		magit
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
(eval-and-compile
    (setq use-package-always-ensure t)
;;    (setq use-package-always-defer t)       ;; set it will bug in startup. 
    (setq use-package-always-demand nil)
    (setq use-package-expand-minimally t)
    (setq use-package-verbose t)
)
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require-package 'smex)
(require-package 'ace-jump-mode)
(require-package 'smartparens)


;;; Theme monokai
(require-package 'monokai-theme) 				;;molokai-theme is also exist; good as well.
(use-package monokai-theme 
  :ensure t
  :load-path "themes"
  :init
  (setq monokai-theme-kit t)
  :config
  (load-theme 'monokai t)
  )


;;; Theme smart-mode
(require-package 'smart-mode-line) 
(use-package smart-mode-line
    :init
    (setq sml/no-confirm-load-theme t)
    (setq sml/theme 'respectful)
    (sml/setup))


;;; -----ivy-counsel-swiper----- 
;; 1 Enhance Search---ivy
(use-package ivy
  :defer 1
  :demand
  :hook (after-init . ivy-mode)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-initial-inputs-alist nil
        ivy-count-format "%d/%d "
        enable-recursive-minibuffers t
        ivy-re-builders-alist '((t . ivy--regex-ignore-order))))
  
;;; 2 Enhance Search---counsel
(require-package 'counsel)
(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-c f" . counsel-recentf)
         ("C-c g" . counsel-git)))

;;; 3 Enhance Search---swiper		 
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
  
  
;;; Syntax Check
(require-package 'flycheck)
(use-package flycheck
  :hook (after-init . global-flycheck-mode))		;;Global
  ;  :hook (prog-mode . flycheck-mode))				;; Progress mode
 
 
;;; MapKey
(require-package 'which-key)
(use-package which-key
  :defer 2
  :config (which-key-mode))

  
;;; Text Edit
(require-package 'crux)
(use-package crux
    :bind ("C-c k" . crux-smart-kill-line))			;;delete current line

(require-package 'hungry-delete)	
(use-package hungry-delete
    :bind (("C-c DEL" . hungry-delete-backward)		;;delete 
           ("C-c d" . hungry-delete-forward)))
		   

;;; Open recent files	
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
	
	
;;; Vim -- evil
(require-package 'evil)	
(use-package evil
	:config
	(evil-mode 1)
	)


;;; Org-mode
(use-package org
  :config
  (setq org-startup-indented t
	    org-todo-keywords '((sequence "TODO" "DOING" "DONE"))
	    org-todo-keyword-faces '(("DOING" . "blue")))
  )
  
  
;;; markdown-mode
(require-package 'markdown-mode)
(use-package markdown-mode)


;;; magit
(require-package 'magit)
(use-package magit)


;;; vterm		;;"VTerm needs module support.  Please compile Emacs with\n  the --with-modules option!
; (require-package 'vterm)
; (use-package vterm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; init-package.el ends here
(provide 'init-packages)
