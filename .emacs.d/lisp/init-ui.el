;;; init-ui.el --- settings for the Emacs UI
;;; Commentary: Settings for system windows


;;(when (string-equal system-type "windows-nt")
;;(menu-bar-mode -1)				;; close menu bar in Windows
(tool-bar-mode -1)				;; close tool-bar
;;(scroll-bar-mode -1)				;; closs scroll-bar

(setq initial-frame-alist (quote ((fullscreen . maximized))))	;;fullscreen
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)		;;auto match {}()[]


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

;;; iimage mode, show picture or not.[M-x iimage-mode RET]
(autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
(autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Setting Font ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set-face-attribute
  'default nil :font "Monaco 9")
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font
    (frame-parameter nil 'font)
    charset
    (font-spec :family "微软雅黑" :size 20)))
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
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-ui)
;;; init-ui.el ends here
