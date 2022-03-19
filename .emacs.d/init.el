;;; init.el --- ConfigEntrance
;;; Commentary:

;; user-emacs-directory = ~/.emacs.d/
(when (eq system-type 'windows-nt)
  (add-to-list 'load-path (expand-file-name (concat EamcsConfDir ".emacs.d/lisp/")))
  (add-to-list 'load-path (expand-file-name (concat EamcsConfDir ".emacs.d/lisp/extra-el/"))))
(when (eq system-type 'gnu/linux)
  (add-to-list 'load-path (expand-file-name (concat "/home/daoyi/" ".emacs.d/lisp/")))
  (add-to-list 'load-path (expand-file-name (concat "/home/daoyi/" ".emacs.d/lisp/extra-el/"))))
  ;; (add-to-list 'load-path (expand-file-name (concat ~ ".emacs.d/lisp/")))

;; Shell Bash Env
(when (eq system-type 'windows-nt)
  (setq shell-file-name (executable-find "C:/Windows/System32/bash.exe"))
  ;; When install msys64, mintty is used to SHELL & MOBILE-ORG-PUSH.
  ;; (setq shell-file-name (executable-find "d:/msys64/usr/bin/bash.exe"))    ;; not msys2.exe, MUST be bash, when install msys.
  ;; (setenv "PATH" (concat
  ;; 		  "/mingw64/bin:/usr/local/bin:/usr/bin:/bin:/mingw64/bin:/opt/bin:/:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
  ;; 		  (getenv "PATH")))
)

;;; Package Management
(require 'init-elpa)
(require 'init-utils)
(require 'init-packages)
(require 'init-startup)
(require 'init-config)
(require 'init-ui)
; (require 'init-evil)
; (require 'init-kbd)
;; (require 'init-shell)
;; (require 'init-roll)
(require 'init-org)
;; (require 'init-web)
;; (require 'init-emms)
; (require 'init-python)
(require 'init-translate)
;; (require 'test-startup)
;; (require 'test-emms)
;; (require 'test-bongo)
;; (require 'test-roll)

(require 'custom)
(setq custom-file "~/.emacs.d/lisp/custom.el")
(unless (file-exists-p custom-file)     ;; confirm custom.el if exist
  (write-region "" nil custom-file))    ;; write blank content.
(load custom-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
