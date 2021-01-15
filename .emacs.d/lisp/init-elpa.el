;;; --- init-elpa.el ---- elpa Manager
;;; Commentary:
;;; Code:

(require 'package)
;;;; Force initialize ELPA.Default, Emacs initialize the ELPA after load init.el,
;;;; And initialize the .el in init.el,it will be trouble if not initialize the ELPA previously(Mathing .el not load).
(package-initialize)	;;IMPORTANT, initialize package manager.

(when (< emacs-major-version 24)
	(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))  ;; can visit it
(when (>= emacs-major-version 24)
    (require 'package)	
    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")		;;emacs-china mirror melpa
			 ("elpa" . "http://tromey.com/elpa/")
			 ("org" . "http://mirrors.cloud.tencent.com/elpa/org/")
			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
			 ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") 
			 )))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(setq package-check-signature nil) 			;; Occasionally, a signature verification failure occurs

;;;;  "Install given PACKAGE, optionally requiring MIN-VERSION.If NO-REFRESH is non-nil, \
;;;;  the available package lists will not be re-downloaded in order to locate PACKAGE."
(defun require-package (package &optional min-version no-refresh)	;; define function require-package
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;--- Kind of Install Method ---;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; (require-package 'use-package)		;; customize function
; (require 'use-package-autoloads)		;; default
; (package-install 'use-package)		;; default

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
;;; init-elpa.el ends here.
(provide 'init-elpa)
