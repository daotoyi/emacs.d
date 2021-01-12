;;; init-startup.el --- start stting
;;; Commentary:

;;;; Adapte operate system
(defconst *is-mac* (eq system-type 'darwin))
(defconst *is-linux* (eq system-type 'gnu/linux))
(defconst *is-windows* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Settings for system encoding ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (set-language-environment "UTF-8")
;; (set-locale-environment "utf-8")
;; (set-default-coding-systems 'utf-8)
;; (modify-coding-system-alist 'process "*" 'utf-8-unix)
;; (setq default-process-coding-system '(utf-8-unix . utf-8-unix))
;; (prefer-coding-system 'utf-8-unix)   ;; default when read or new
;;;;; above settings, emms cannot play mutilmedio with Chinese.
(setq locale-coding-system 'utf-8)    ;; emacs use encode

;; keyboard input encode
(set-keyboard-coding-system 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(set-next-selection-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)  ;; terminal encode

(set-buffer-file-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8-unix)

;;; default when write && save
(setq default-buffer-file-coding-system 'utf-8-unix)  ;; (set-default buffer-file-coding-system 'utf-8)

;; file path(Show Chinese)
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8-unix)
(setq file-name-coding-system 'utf-8-unix)

(when (eq system-type 'windows-nt)
  (setq ; w32-unicode-filenames 'nil
	locale-coding-system 'gb18030     	;;gb18030; MATCH “微软雅黑” font
        file-name-coding-system 'gb18030)	;;gb18030
  (set-next-selection-coding-system 'utf-16-le)
  (set-selection-coding-system 'utf-16-le)
  (set-clipboard-coding-system 'utf-16-le)) 	;;MUST BE utf-16-le;copy Chinese from outside to emacs.

;; cmdproxy.exe code.(MS-Windows, cmd tool, UTF-8 maybe paly well.)
(when (eq system-type 'windows-nt)
  (set-default 'process-coding-system-alist
	       '(("[pP][lL][iI][nN][kK]" gbk-dos . gbk-dos)
		 ("[cC][mM][dD][pP][rR][oO][xX][yY]" gbk-dos . gbk-dos))))

(when (string-equal current-language-environment "Chinese-GBK")
  (setq default-process-coding-system '(utf-8-unix . chinese-gbk-dos)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; close Emacs ring-bel
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
(define-advice show-paren-function
  (:around (fn) fix-show-paren-function)
  (cond ((looking-at-p "\\s(") (funcall fn))
        (t (save-excursion
             (ignore-errors (backward-up-list))
             (funcall fn)))))
			 
;;  "Replace DOS eolns CR LF with Unix eolns CR"
(defun remove-dos-eol ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; hold cursor at end of lines when move cursor.
(setq track-eol t)

;; Adjust garbage collection thresholds during startup
(setq gc-cons-threshold most-positive-fixnum)

(setq default-directory "e:/Refine/")

;; Other settings
(setq tab-width 4)			;; tab space
(toggle-truncate-lines t)		;; auto-turncate
(global-hl-line-mode 1)			;; hlight current line
(delete-selection-mode 1)		;; the input replace the selected section
(global-auto-revert-mode 1)		;; autorelead files modified by other APP
(setq x-select-enable-clipboard t)      ;; outside progress - paste for gui-emacs
(setq mouse-yank-at-point t)            ;; mouse middle key yank

(setq default-major-mode 'text-mode)    ;; text-mode when open emacs.

(setq-default frame-title-format '("%f"))
(setq frame-title-format "Emacs@%b")
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 10)
(setq display-time-use-mail-icon t)

(global-font-lock-mode t)
(transient-mark-mode t)
(mouse-avoidance-mode 'animate)
(show-paren-mode t)

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
