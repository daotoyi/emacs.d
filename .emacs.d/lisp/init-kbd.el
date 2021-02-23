;;; init-kbd --- KeyBoad Bind
;;; Commentary:

;; Global key bind
(require-package 'emacs)
(use-package emacs
  :bind (("M-/" . comment-line)
         ("M-?" . comment-or-uncomment-region)
	 ("M-S-<return>" . toggle-frame-fullscreen)
         ("M-<return>" . toggle-frame-maximized)))


(global-set-key (kbd "C-c j") 'goto-line)		;;vim n-G
(global-set-key (kbd "<f5>") 'load-file )

(defun open-init-file()
    (interactive)
    (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f6>") 'open-init-file)

;; (global-set-key [(f7)] 'emms-smart-browse)  ;; set in init-emms.el
;; <f10> set for rename buffer.
;; <f12> set for org-agenda.

;; (global-set-key (kbd "C-c p s") 'helm-do-ag-project-root) 		;; ag search

;; adjust text-scale
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C-=") 'text-scale-decrease)
(global-set-key (kbd "C-0") 'text-scale-adjust)

;; mutil-media
(global-set-key (kbd "C-c m e") 'emms-play-directory-tree)
(global-set-key (kbd "C-c m b") 'bongo-playlist)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst my-projects-path "e:\\Refine\\Org" "My projects dir") 
(defun goto-my-projects-dir ()
  (interactive)
  (dired my-projects-path)) 
;;(define-key-list global-map '(("C-x G p" goto-my-projects-dir)))
(global-set-key (kbd "C-x G p") 'goto-my-projects-dir)

(defconst my-tmp-path "e:/TMP/" "My tmp dir") 
(defun goto-tmp-dir ()
  (interactive)
  (dired my-tmp-path)) 
(global-set-key (kbd "C-x G t") 'goto-tmp-dir)


;; Open dir
(defconst my-Cdisk-path "c:/" "My Cdisk dir") 
(defun goto-Cdisk-dir ()
  (interactive)
  (dired my-Cdisk-path)) 
(global-set-key (kbd "C-x G C") 'goto-Cdisk-dir)

(defconst my-Ddisk-path "d:/" "My Ddisk dir") 
(defun goto-Ddisk-dir ()
  (interactive)
  (dired my-Ddisk-path)) 
(global-set-key (kbd "C-x G D") 'goto-Ddisk-dir)

(defconst my-Edisk-path "e:/" "My Edisk dir") 
(defun goto-Edisk-dir ()
  (interactive)
  (dired my-Edisk-path)) 
(global-set-key (kbd "C-x G E") 'goto-Edisk-dir)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-kbd)
;;; init-kbd.el ends here
