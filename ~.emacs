;;; .emacs --- Entrance of Emacs
;;; Commentary:

;; Without this comment emacs adds (package-initialize) here,with ";;"
;; (package-initialize)

;; General Configure
(setq EamcsDir     "D:/Program Files (x86)/Emacs/")
(setq EamcsVerDir  (concat EamcsDir "emacs-27.1-x86_64/"))		;; (emacs-27.1-x86_64/  emacs-26.3-x86_64/)

;;[ Optional : myemacs/  spacemacs-master/  spacemacs-develop/ doom-emacs-develop/ ]
(when (<= emacs-major-version 26)
	(setq EamcsConfDir (concat EamcsDir "myemacs/")))
(when (>= emacs-major-version 27) 
	(setq EamcsConfDir (concat EamcsDir "spacemacs-master/")))
;(setq EamcsConfDir (concat EamcsDir "doom-emacs-develop/"))
;(setq EamcsConfDir (concat EamcsDir "spacemacs-develop/"))

(setenv "HOME" EamcsConfDir)
;(setenv "PATH" EamcsVerDir)

(load-file  "~/.emacs.d/init.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init.el END here


