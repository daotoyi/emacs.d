;;; package.el --- plugin packages
;;; Commentary:
;;; Code:

;; cl - Common Lisp Extension
;; (require 'cl)	     ;; deprecated

;; .emacs.d/lisp/extra-el
(require 'unicad)            ;; recognize encoding automaticly
(require 'lazy-set-key)      ;; unavalible from source install
(require 'ox-jekyll-md)      ;; org export md. ;;(eval-after-load "org" '(require 'ox-md nil t))

(when (eq system-type 'windows-nt)
  (require 'find-by-pinyin-dired)
  )

(use-package magit)
(use-package htmlize)
(use-package unicad)         ;; recognize encoding automaticly
(use-package smartparens)
(use-package markdown-mode)
(use-package markdown-toc
  :after(markdown-mode)
  :bind(("C-c C-m g" . markdown-toc-generate-toc)
	("C-c C-m r" . markdown-toc-refresh-toc)
	("C-c C-m d" . markdown-toc-delete-toc)))

(electric-pair-mode 1)

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

  ; :defer nil
  ; :after exec-path-from-shell
  ; :config
  ; (fcitx-prefix-keys-setup)    ;;  (fcitx-prefix-keys-add "C-c") and "C-x"
  ; (fcitx-prefix-keys-turn-on)
  ; (fcitx-evil-turn-on)
;
  ; (fcitx-M-x-turn-on)
  ; (fcitx-shell-command-turn-on)
;
  ; (fcitx-eval-expression-turn-on)
  ; (fcitx-isearch-turn-on)
  ; (fcitx-read-funcs-turn-on)
  ; (fcitx-aggressive-setup)
  ; (fcitx-prefix-keys-turn-off)
  ; )

; (use-package sis   ;; smart-input-source（ensure each language only one input method)
  ; :config
  ; (sis-global-cursor-color-mode t)
  ; (sis-ism-lazyman-config nil "rime" 'native)
  ; (sis-global-respect-mode t)
  ; (sis-global-context-mode t)
  ; (sis-global-inline-mode t))

(use-package smooth-scrolling
  :defer nil
  :config
  (setq scroll-margin 3
	scroll-conservatively 10000)
  )

(use-package popwin
  :config
  (popwin-mode 1))

(use-package which-key
    :defer 1 
    :config (which-key-mode))
  
(use-package ido
  :config
  (ido-mode t)
  ;; (ido-everywhere t)  ;; if set, auto add d:/ before  emms-play-directory
  (setq ido-enable-flex-matching t)
  (setq ido-use-virtual-buffers t))

;; dired+ settings.
(require 'dired)
(with-eval-after-load 'dired
  (require 'dired+)
  (require 'dired-x)    ;; go back upper directory(c-x c-j)
  (require 'dired-sort)
  ;; (ido-mode 1)    ;; dired need it && set in (use-package ido).
  (global-dired-hide-details-mode -1)           ;; set after dired+
  (setq dired-recursive-deletes 'always)	;; recursive（递归）
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'top)           ;; top directory need confirm 
  (setq dired-recursive-copies 'top)
  (setq dired-isearch-filenames t)

  ;; dired mode hold on 1 buffer section
  (put 'dired-find-alternate-file 'disabled nil)	;; Dired Mode cache
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  )

(use-package flycheck
  :hook (after-init . global-flycheck-mode))		        ;; Global
  ;; :hook (prog-mode . flycheck-mode))				;; Progress mode

;;;; (ido-mode t)   ;; projectile need it
; (use-package projectile
  ; :defer 1
  ; :config
  ; (setq projectile-cache-file (expand-file-name ".cache/projectile.cache" user-emacs-directory))
  ; (projectile-mode 1)
  ; (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map))    ;; define leader key

(use-package helm-projectile
  :defer nil
  :if (functionp 'helm)          ;; if use helm, show projectile option with helm
  :config
  (helm-projectile-on))

;; this function maybe replaced by  counsel 
 (use-package recentf
     :defer 2 
     :config
     (recentf-mode 1 )
     (setq recentf-max-saved-items 200
 	recentf-max-menu-items 15)				;; visit NO. files 10
     (global-set-key (kbd "<F10>") 'recentf-open-files)
     (global-set-key (kbd "C-x C-r") 'recentf-open-files)	;; replaced by  counsel 
     (setq kill-ring-max 200))			;; record of files deleted 200

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Text Edit ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package drag-stuff
  :bind (("<M-up>". drag-stuff-up)
         ("<M-down>" . drag-stuff-down)))
		   
;; (use-package helm
  :bind (("M-x" . helm-M-x)    ;; = (bind-key "M-x" #'helm-M-x)
        ("C-x C-f" . helm-find-files))
  :config
  (helm-mode 1))   ;; global set

;;;; -----ivy-counsel-swiper----- 
;;; 1 Enhance Search---ivy
(use-package ivy
  :defer 1
  :demand
  :hook (after-init . ivy-mode)  ;; set, it show list file in buffer.
  :config
  ;; (ivy-mode 1)    ;; if set it, emms-play-directory dir will go back upper.
  (setq ivy-use-virtual-buffers t
        ivy-initial-inputs-alist nil
        ivy-count-format "%d/%d "
        enable-recursive-minibuffers t
        ivy-re-builders-alist '((t . ivy--regex-ignore-order)))
  )

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

;;; consel-etags
; (use-package counsel-etags
; (require 'counsel-etags)
  ; :ensure t
  ; :bind (("c-]" . counsel-etags-find-tag-at-point))
  ; :init
  ; (add-hook 'prog-mode-hook
        ; (lambda ()
          ; (add-hook 'after-save-hook
            ; 'counsel-etags-virtual-update-tags 'append 'local)))
  ; :config
  ; (setq counsel-etags-update-interval 60)
  ; (push "build" counsel-etags-ignore-directories)
; )

;;; ggtags (recommander universal-ctags)
; (use-package ggtags
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))
  (define-key ggtags-mode-map (kbd "C-x g d") 'ggtags-find-definition)
  (define-key ggtags-mode-map (kbd "C-x g s") 'ggtags-find-other-symbol)
  (define-key ggtags-mode-map (kbd "C-x g h") 'ggtags-view-tag-history)
  (define-key ggtags-mode-map (kbd "C-x g r") 'ggtags-find-reference)
  (define-key ggtags-mode-map (kbd "C-x g f") 'ggtags-find-file)
  (define-key ggtags-mode-map (kbd "C-x g c") 'ggtags-create-tags)
  (define-key ggtags-mode-map (kbd "C-x g u") 'ggtags-update-tags)
; )

;;; gtags.el from globle(gtags/share/gtags)
(require 'gtags)
(setq c-mode-hook
      '(lambda ()
       (gtags-mode 1)))

;; (use-package smex
  :config
  ;; (smex-initialize)  ;; Can be omitted. This might cause a (minimal) delay
  ;;; below M-x can be replaced by counsel-M-x.
  (global-set-key(kbd "M-x") 'smex)
  (global-set-key(kbd "M-X") 'smex-major-mode-commands)
  (global-set-key(kbd "C-c C-c M-x") 'execute-extended-command)   ;; go back old M-x.
  )

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

(use-package popup) 
(use-package auto-complete
  :defer 2
  :config
  (ac-config-default)
  (global-auto-complete-mode t)
  (setq tab-always-indent 'complete)  ;; tab, first indent, second complete.
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; bongo ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'general)
(when (eq system-type 'windows-nt)
  (add-to-list 'exec-path "d:/Program Files/MPlayer for Windows/"))
(when (eq system-type 'gnu/linux)
  (add-to-list 'exec-path "/mnt/d/Program Files/MPlayer for Windows/"))
(use-package bongo
  :commands bongo-playlist
  :general
  (:states 'normal
	   :keymaps 'bongo-playlist-mode-map
	   "<return>" 'bongo-dwim
	   "i" 'bongo-insert-file
	   "p" 'bongo-play-previous
	   "n" 'bongo-play-next
	   "w" 'bongo-pause/resume
	   "d" 'bongo-dired-line
	   "a" 'bongo-append-enqueue
	   "s" 'bongo-seek
	   "r" 'bongo-rename-line
	   "v" 'volume)
  :custom
  (when (eq system-type 'windows-nt)
    (bongo-default-directory "e:/Recreation/Music/"))
  (when (eq system-type 'gnu/linux)
    (bongo-default-directory "/mnt/e/Recreation/Music/"))
  (bongo-enabled-backends '(mplayer))
  (bongo-insert-album-covers t)
  (bongo-album-cover-size 100)
  (bongo-mode-line-indicator-mode nil)
  )

; (setq bongo-custom-backend-matchers
           ; '((vlc local-file "mp3")
             ; (speexdec local-file "speex")
             ; (ignore local-file "wav")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (eq system-type 'windows-nt)
  (use-package pdf-tools
    :pin manual  ;; manual update
    :config
    (pdf-tools-install)
    ;; (setenv "PATH" (concat "d:\\msys64\\mingw64\\bin;" (getenv "PATH")))
    (setq-default pdf-view-display-size 'fit-width)
    (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)

    ;; make it default
    (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
	  TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
	  TeX-source-correlate-start-server t)
    (add-hook 'TeX-after-compilation-finished-functions
	      #'TeX-revert-document-buffer)

    ;; play well with Emacs linum-mode. 
    (add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))
  
    :custom
    ;; automatically annotate highlights
    (pdf-annot-activate-created-annotations t "automatically annotate highlights")
    ;; or (setq pdf-annot-activate-created-annotations t)
 ))

;;; vterm    ;;"VTerm needs module support. compile Emacs with the --with-modules option!
;; (use-package vterm)
;; (vterm-module-compile) 

;; (use-package multi-term)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; init-package.el ends here
(provide 'init-packages)
