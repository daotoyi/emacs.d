;;; init-startup.el --- start stting
;;; Commentary:

;;;; Adapte operate system
(defconst *is-mac* (eq system-type 'darwin))
(defconst *is-linux* (eq system-type 'gnu/linux))
(defconst *is-windows* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Settings for system encoding ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 'Chines-GB (Chinese environment)
(set-language-environment "UTF-8")    
(set-locale-environment "UTF-8")
(setq locale-coding-system 'utf-8)    ;; emacs use encode

;; keyboard input encode
(set-keyboard-coding-system 'utf-8)   
(set-selection-coding-system 'utf-8)

;; file encode
(prefer-coding-system 'utf-8)   ;; default when read or new
(prefer-coding-system 'gb18030)   ;; default when read or new
(setq default-buffer-file-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
;(set-default buffer-file-coding-system 'utf-8)    ;; default when write && save
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

;; file path(Show Chinese)
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
;(setq file-name-coding-system 'utf-8)
;; terminal encode
(set-terminal-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))


(when (eq system-type 'windows-nt)
  (setq w32-unicode-filenames 'nil
	locale-coding-system 'gb18030     	;;gb18030; MATCH “微软雅黑” font
        file-name-coding-system 'gb18030)	;;gb18030
  (set-next-selection-coding-system 'utf-8)
  (set-selection-coding-system 'utf-8)
  (set-clipboard-coding-system 'utf-16-le)) 	;;MUST BE utf-16-le;copy Chinese from outside to emacs.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Setting Font ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set-face-attribute
  'default nil :font "Monaco 9")
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font
    (frame-parameter nil 'font)
    charset
    (font-spec :family "微软雅黑" :size 22)))
;;(font-spec :family "WenQuanYi Micro Hei Mono" :size 16)))

			 
;; Resolve Emacs not fluency on windows 
(use-package emacs
  :if (display-graphic-p)
  :config
  ;;  (if *is-windows*		                ;; Font settings
  ;;    (progn
  ;;      (set-face-attribute 'default nil :font "Inconsolata 12")
  ;;      (dolist (charset '(kana han symbol cjk-misc bopomofo))
  ;;          (set-fontset-font (frame-parameter nil 'font) charset
  ;;                (font-spec :family "Inconsolata" :size 12))))
  ;;  (set-face-attribute 'default nil :font "Inconsolata_NF 12"))
  ;;;; above on linux cannot pass well.

  ;;  (set-face-attribute 'default nil :font "微软雅黑 11")
  (setq display-line-numbers-type 'relative)	;; or visual
  (global-display-line-numbers-mode t)		;; (global-linum-mode t)
  (defalias 'yes-or-no-p 'y-or-n-p)		;; yes = y; no = n-p
  (setq linum-format "%4d ")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; close Emacs ring-bell
 (setq ring-bell-function 'ignore)				

;; Settings for backup files
(setq make-backup-files nil
      auto-save-default nil)			;;close auto-save && auto-backup files 

;; all backups goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "e:/TMP/TmpFiles"))))

;; go back windows frame with "C-c <LEFT>"
 (when (fboundp 'winner-mode) 
  (winner-mode) 
  (windmove-default-keybindings)) 

;;  "Highlight enclosing parens."
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  (cond ((looking-at-p "\\s(") (funcall fn))
        (t (save-excursion
             (ignore-errors (backward-up-list))
             (funcall fn)))))
			 
;;  "Replace DOS eolns CR LF with Unix eolns CR"
(defun remove-dos-eol ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))


;; Adjust garbage collection thresholds during startup
(setq-default frame-title-format '("%f"))
(setq gc-cons-threshold most-positive-fixnum)

;; Other settings 
(setq tab-width 4)				;; tab space
(toggle-truncate-lines t)			;; auto-turncate
(global-hl-line-mode 1)				;; hlight current line
(delete-selection-mode 1)			;; the input replace the selected section
(global-auto-revert-mode 1)			;; autorelead files modified by other APP
(setq x-select-enable-clipboard t)	        ;; outside progress - paste for gui-emacs


;; mail
(setq send-mail-function (quote smtpmail-send-it))
(setq smtpmail-smtp-server "smtp.qq.com")
(setq smtpmail-smtp-service 25)
(setq user-full-name "daoyi") 
(setq user-mail-address "1392429831@qq.com")

;;; ----------------------------------------------------------------------------
(setq inhibit-startup-screen t)					;; close startup windows
(setq initial-scratch-message "\n;; Configuration by Daoyi <gitee.com:daotoyi/emacsemacs.d>.\n;; Enjoy!\n\n")
;;; ----------------------------------------------------------------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-startup)
;;; init-startup.el ends here
