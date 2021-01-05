;;; init-packages.el --- load the plugin
;;; Commentary:

;;; --- Kind of Install Method---
; (require-package 'use-package)		;; define in elpa.el
; (require 'use-package-autoloads)		;; default
; (package-install 'use-package)		;; default

;;; cl - Common Lisp Extension
;  (require 'cl)		;; deprecated

;;;; Load use-package manager
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(eval-and-compile                       ;; avoid warning when compile
    (setq use-package-always-ensure t)
    (setq use-package-always-defer t)
    (setq use-package-always-demand nil)
    (setq use-package-expand-minimally t)
    (setq use-package-verbose t)
)
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'unicad)            ;;; recognize encoding automaticly
(require 'lazy-set-key)      ;;; unavalible from source install

(use-package fcitx)          ;;; fcixt --- switch ficxt when in or out evi-mode 
(use-package magit)
(use-package unicad)         ;;; recognize encoding automaticly
(use-package markdown-mode)
(use-package smartparens)

(use-package ido
  :config
  (ido-mode t)
  (ido-everywhere t)
  (setq ido-enable-flex-matching t)
  (setq ido-use-virtual-buffers t))

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))


;;; molokai-theme is also exist; good as well.
(use-package monokai-theme 
  :ensure t
  :defer nil
  :load-path "themes"
  :init
  (setq monokai-theme-kit t)
  :config
  (load-theme 'monokai t))

(use-package smooth-scrolling
  :config
  (smooth-scrolling-mode 1)
  (setq smooth-scroll-margin 5))

(use-package popwin
  :config
  (popwin-mode 1))

;;; MapKey
(use-package which-key
    :defer 1 
    :config (which-key-mode))
  
(use-package flycheck
  :hook (after-init . global-flycheck-mode))		        ;; Global
  ;; :hook (prog-mode . flycheck-mode))				;; Progress mode

;; (ido-mode t)   ;; projectile need it
(use-package projectile
  :defer 1 
  :config
  (setq projectile-cache-file (expand-file-name ".cache/projectile.cache" user-emacs-directory))
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map))    ;; define leader key

(use-package helm-projectile
  :defer 2 
  :if (functionp 'helm)                ;; if use helm, show projectile option with helm
  :config
  (helm-projectile-on))

;; dired+ settings.
(require 'dired)
; (require 'dired+)        ;; need install
; (require 'dired-sort)    ;; need install
;; (ido-mode 1)    ;; dired need it
; (global-dired-hide-details-mode -1)           ;; set after dired+
; (setq dired-recursive-deletes 'always)	;; delete without confirm
; (setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'top)             ;; top directory need confirm 
(setq dired-recursive-copies 'top)
(setq dired-isearch-filenames t)
(put 'dired-find-alternate-file 'disabled nil)	;; Dired Mode cache

; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
(with-eval-after-load 'dired			;; delay load
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Text Edit ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package drag-stuff
  :bind (("<M-up>". drag-stuff-up)
         ("<M-down>" . drag-stuff-down)))
		   
;; (use-package helm
;;   :bind (("M-x" . helm-M-x)    ;; = (bind-key "M-x" #'helm-M-x) 
;;         ("C-x C-f" . helm-find-files))
;;   :config
;;   (helm-mode 1))   ;; global set

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

;;; 2 Enhance Search---swiper		 
(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper-isearch-backward))
  :config (setq swiper-action-recenter t
                swiper-include-line-number-in-search t))
  
;;; 3 Enhance Search---counsel
(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-c f" . counsel-recentf)
         ("C-c g" . counsel-git)))

;; (use-package smex
;;   :config
;;   ;; (smex-initialize)  ;; Can be omitted. This might cause a (minimal) delay
;;   ;;; below M-x can be replaced by counsel-M-x.
;;   (global-set-key(kbd "M-x") 'smex)
;;   (global-set-key(kbd "M-X") 'smex-major-mode-commands)
;;   (global-set-key(kbd "C-c C-c M-x") 'execute-extended-command)   ;; go back old M-x.
;;   )


;;; this function maybe replaced by  counsel 
;;  (use-package recentf
;;      :defer 2 
;;      :config
;;      (recentf-mode 1 )
;;      (setq recentf-max-saved-items 200
;;  	recentf-max-menu-items 15)				;; visit NO. files 10
;;      (global-set-key (kbd "<F10>") 'recentf-open-files)
;;      (global-set-key (kbd "C-x C-r") 'recentf-open-files)	;; replaced by  counsel 
;;      (setq kill-ring-max 200))			;; record of files deleted 200

(use-package ace-jump-mode
  :defer 2 
  :config
  (define-key global-map (kbd "C-c SPC" ) 'ace-jump-mode)
  (add-to-list 'load-path "which-folder-ace-jump-mode-file-in/"))

(use-package avy 
  :defer 2 
  :config
  ;;; below be set in init-evil, Leader <SPC>.
  ;; (global-set-key (kbd "SPC j c") 'avy-goto-char)
  ;; (global-set-key (kbd "SPC j w") 'avy-goto-word)
  ;; (global-set-key (kbd "PSC j l") 'avy-goto-line)
  )

(use-package ace-pinyin
  :defer 2 
  :config
  ;; ace-pinyin-use-avy should be set BEFORE ace-pinyin-globa-mode or turn-on-ace-pinyin-mode or turn-off-ace-pinyin-mode
  (setq ace-pinyin-use-avy t) ;; uncomment if you want to use `avy'
  (ace-pinyin-global-mode +1)
  )

(use-package smart-mode-line
    :init
    (setq sml/no-confirm-load-theme t)
    (setq sml/theme 'respectful)
    (sml/setup))

;;; add space between English and Chines.
(use-package pangu-spacing
  :config
  (global-pangu-spacing-mode 1)
  ;; only insert real whitespace in some specific mode, but just add virtual space in other mode
  (add-hook 'org-mode-hook
            '(lambda ()
               (set (make-local-variable 'pangu-spacing-real-insert-separtor) t)))
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; yasnippet --- tempaltes ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package yasnippet
  :defer 1 
  :config
  ; (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
    ;; default ("~/.emacs.d/snippets" yas-installed-snippets-dir) in yasnippet new version, maybe need not mannually set. 
    ;; if set it, yasnippet only query thsi path, or will query default path and ~/.emacs.d/snippets.
  (yas-global-mode 1))    ;; global

(use-package yasnippet-snippets   ;; tempaltes lib
  :defer 1 
  :after (yasnippet))

;; tempaltes
(setq template-home-directory '"~/.emacs.d/templates")

(use-package auto-yasnippet
  :defer 1 
  :bind
  (("C-c & w" . aya-create)
   ("C-c & y" . aya-expand))
     ;; (global-set-key (kbd "H-w") #'aya-create)
     ;; (global-set-key (kbd "H-y") #'aya-expand)
  :config
  (setq aya-persist-snippets-dir (concat user-emacs-directory "/snippets")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; completion ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; gccsense or semantic, but gccsense suppourt C/C++
;;  if choose gccsense. only replace (ac-complete-semantic）with (ac-complete-gccsense)
(defun ac-complete-semantic-self-insert (arg)
  (interactive "p")
  (self-insert-command arg)
  (ac-complete-semantic))

(defun my-c-mode-ac-complete-hook ()
  (local-set-key "." 'ac-complete-semantic-self-insert)
  (local-set-key ">" 'ac-complete-semantic-self-insert))

(add-hook 'c-mode-common-hook 'my-c-mode-ac-complete-hook)

(use-package popup) 
(use-package auto-complete
  :defer
  :config
  (ac-config-default)
  (global-auto-complete-mode t)
  (setq tab-always-indent 'complete)  ;; tab, first indent, second complete.
  )

(use-package company
  :defer 2 
  :config
  (setq company-dabbrev-code-everywhere t
        company-dabbrev-code-modes t
        company-dabbrev-code-other-buffers 'all
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case t
        company-dabbrev-other-buffers 'all
        company-require-match nil
        company-minimum-prefix-length 1 
        company-show-numbers t
        company-tooltip-limit 20
        company-tooltip-align-annotations t
        company-tooltip-offset-display 'scrollbar
	company-idle-delay 0
        company-echo-delay 0
        company-begin-commands '(self-insert-command))
  (push '(company-semantic :with company-yasnippet) company-backends)
  :hook ((after-init . global-company-mode)))        ;; =  (add-hook 'after-init-hook #'global-company-mode) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package lsp-mode
  :commands (lsp)   ;; defer load, when lsp called
  :hook (((ruby-mode
           php-mode
           python-mode
           typescript-mode
           ) . lsp))
  :init 
  (setq lsp-auto-configure t    ;; try automaticly config itself
        lsp-auto-guess-root t   ;; try automaticly guess root/dir
        lsp-idle-delay 0.500    ;; how much time, after refresh info form server
        lsp-session-file "~/.emacs.d/.cache/lsp-sessions") ;; cache location
  )

(use-package lsp-ui   ;; show content
  :after (lsp-mode)
  :commands (lsp-ui-mode)
  :bind
  (:map lsp-ui-mode-map
        ([remap xref-find-references] . lsp-ui-peek-find-references)    ;; query symbol reference.(use  LSP ,generally M-. )
        ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)  ;; query symbol define (use  lsp ,generally m-? )
        ("c-c u" . lsp-ui-imenu))
  :hook (lsp-mode . lsp-ui-mode)   ;; auto activate when lsp activated
  :init
  ;; https://github.com/emacs-lsp/lsp-mode/blob/master/docs/tutorials/how-to-turn-off.md
  (setq lsp-enable-symbol-highlighting t
        lsp-ui-doc-enable t
        lsp-lens-enable t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vterm    ;;"VTerm needs module support.  Please compile Emacs with\n  the --with-modules option!
;; (use-package vterm)
;; (vterm-module-compile) 

;; (use-package multi-term)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; init-package.el ends here
(provide 'init-packages)
