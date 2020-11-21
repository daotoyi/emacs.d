;; ----init-startup.el---- Emacs start settings

;; Adapte operate system
(defconst *is-mac* (eq system-type 'darwin))
(defconst *is-linux* (eq system-type 'gnu/linux))
(defconst *is-windows* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))


;; Settings for system encoding
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(when (eq system-type 'windows-nt)
  (setq locale-coding-system 'gbk     			;;gb18030
        w32-unicode-filenames 'nil
        file-name-coding-system 'gbk)		 	;;gb18030
  (set-next-selection-coding-system 'utf-8)
  (set-selection-coding-system 'utf-8)
  (set-clipboard-coding-system 'utf-8)) 	   	;;utf-16-le

;;close Emacs ring-bell
; (setq ring-bell-function 'ignore)				

;; Settings for backup files
(setq make-backup-files nil
      auto-save-default nil)			;;close auto-save && auto-backup files 


;; Other settings 
;;(setq dired-recursive-deletes 'always)	;;delete not confirm
(setq dired-recursive-copies 'always)
(setq tab-width 4)						;; tab space
(toggle-truncate-lines t)				;; auto-turncate
(global-hl-line-mode 1)					;; hlight current line


;;Settings for Dired Mode ;;file manager
(put 'dired-find-alternate-file 'disabled nil)	;; Dired Mode cache
;; (require 'dired)								;; load Dired Mode
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
(with-eval-after-load 'dired					;; delay load
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
	  
	  
;; Adjust garbage collection thresholds during startup
(setq-default frame-title-format '("%f"))
(setq gc-cons-threshold most-positive-fixnum)


;; Resolve Emacs not fluency on windows 
(use-package emacs
  :if (display-graphic-p)
  :config
;;  (if *is-windows*		 ;; Font settings
;;    (progn
;;      (set-face-attribute 'default nil :font "Inconsolata 12")
;;      (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;        (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "Inconsolata" :size 12))))
;;  (set-face-attribute 'default nil :font "Inconsolata 12"))
;;;; this part on linux cannot pass well.
  (setq display-line-numbers-type 'relative)	;; or visual
  (global-display-line-numbers-mode t)			;; (global-linum-mode t)
  (defalias 'yes-or-no-p 'y-or-n-p)				;; yes = y; no = n-p
  (setq linum-format "%4d ")
  )


(setq inhibit-startup-screen t)					;; close startup windows
(setq initial-scratch-message "\n;; Configuration by Daoyi <gitee.com:daotoyi/emacsemacs.d>.\n;; Enjoy!\n\n")


(provide 'init-startup)
;;; init-startup.el ends here
