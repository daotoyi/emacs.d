;;; init-org.el ---- org & TODO.
;;; Commentary:
;;; Code:

(use-package org
  :defer nil
  :bind ("<f12>" . org-agenda)
  :config
  (add-hook 'org-mode-hook 'show-alert)
  (require 'org-install)    ;; autoload function, not when start org.
  (require 'org-agenda-gtd)
  (require 'ox-latex)       ;; should be require before org-latex, define usepackage. 
  (require 'org-latex)
  (require 'org-beamer)     ;; should be required after org-latex
  (require 'ox-latex-chinese)
  (setq org-startup-indented t
	org-src-fontify-natively t		;; highlight
	org-directory "E:/Refine/Org/"))

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock)  ;;; not needed when global-font-lock-mode is on
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))   ;; auto word wrap
;; (add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
;; (add-hook 'org-mode-hook 'turn-on-auto-fill)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . t)
   (matlab . t)
   (C . t)
   ;; (sh . t)
   (ditaa . t)
   (python . t)
   (latex . t)
   (js . t)
   ))
;;; org-todo` ----------------------------------------------------------------------------

;; (setq org-enforce-todo-dependencies t)    ;; main task cannot set done if subtask not finished.

(setq	org-todo-keywords '((sequence "TODO(t!)" "NEXT(n)" "WAITING(w)" "|" "CANCELED(c@/!)" "DONE(d!)"))
	org-todo-keyword-faces '(("NEXT"     . "orange")
	                         ("WAITING"  . "purple")
	                         ("DONE"     . "green" )
	                         ("CANCELED" . (:foreground "cyan" :weight bold))))

;;; org-tags ----------------------------------------------------------------------------
(setq org-tag-alist '((:startgroup . nil)
		      ("Inbox" . ?i) ("Context" . ?c) ("Waiting" . ?w) ("Project" . ?p) ("Someday" . ?s) ("Reference" . ?r) ("Transh" . ?t)
		      (:endgroup . nil)
                      ("Work" . ?W)   ("Hobby" . ?H)   ("Refine" . ?R)
		      (:newline . nil)
		      ("ZhouYi" . ?Y) ("ZhongYi" . ?Z) ("Code" . ?C)
		      (:startgroup . nil)
		      ("@Product" . ?P)
		      (:grouptags . nil)
		      ("P@tpe4k" . ?4) ("P@tpe5k" . ?5) ("P@tpe6k" . ?6) ("P@tre" . ?7) ("P@tsw" . ?8) ("P@other" . ?9)
		      (:endgroup . nil)
))

(setq org-tags-exclude-from-inheritance '("Project"))
(setq org-tags-match-list-sublevels nil)

;;; org-capture --------------------------------------------------------------------------
(setq org-default-notes-file (concat org-directory "GTD/inbox.org"))
(setq org-capture-templates
      '(
        ("d" "ToDo"      entry (file+headline org-agenda-file-task "Work&Goal")  "* TODO [#A] %? :Inbox:\n CREATED: %T\n %i\n" :empty-lines 1)
        ("l" "ToLearn"   entry (file+headline org-agenda-file-task "Learning")   "* TODO [#B] %?\n CREATED: %T\n %i\n"         :empty-lines 1)
        ("h" "ToHobby"   entry (file+headline org-agenda-file-task "Hobbies")    "* TODO [#C] %?\n CREATED: %T\n %i\n"         :empty-lines 1)
        ("o" "ToOther"   entry (file+headline org-agenda-file-task "Others")     "* TODO [#D] %?\n CREATED: %T\n %i\n"         :empty-lines 1)
        ("n" "ToNotes"   entry (file+headline org-agenda-file-note "QuickNotes") "* TODO [#D] %t %? :Reference:\n %i\n"        :empty-lines 1)
        ("i" "TOIdeas"   entry (file+headline org-agenda-file-note "QuickIdeas") "* TODO [#D] %t %? :Reference:\n %i\n"        :empty-lines 1)
        ("p" "ToProject" entry (file+headline org-agenda-file-project "Proj@work")  "* TODO [#A] [/] %?\n CREATED: %T\n %i\n"  :empty-lines 1)
        ("P" "ToPROJECT" entry (file+headline org-agenda-file-project "Proj@other") "* TODO [#A] [/] %?\n CREATED: %T\n %i\n"  :empty-lines 1)
        )
      )

;;;; org-remember --->> org-capture
;; (autoload 'remember "remember" nil t)
;; (define-key global-map [f8] 'remember)
;; ;; (org-remember-insinuate)
;; (setq org-remember-templates '(("New"      ?n "* %? %t \n %i\n %a"   "E:/Refine/Org/GTD/inbox.org" )
;; 			       ("Task"     ?t "** TODO %?\n %i\n %a" "E:/Refine/Org/GTD/task.org" "Tasks")
;; 			       ("Calendar" ?c "** TODO %?\n %i\n %a" "E:/Refine/Org/GTD/task.org" "Tasks")
;; 			       ("Idea"     ?i "** %?\n %i\n %a"      "E:/Refine/Org/GTD/task.org" "Ideas")
;; 			       ("Note"     ?r "* %?\n %i\n %a"       "E:/Refine/Org/GTD/note.org" )tps
;; 			       ("Project"  ?p "** %?\n %i\n %a"      "E:/Refine/Org/GTD/project.org" %g)
;; 			       ))

;;; org-refile --------------------------------------------------------------------------
(define-key global-map "\C-cr" 'org-refile)
(setq org-agenda-files (list "E:/Refine/Org/GTD/task.org"
                             "E:/Refine/Org/GTD/note.org"
                             "E:/Refine/Org/GTD/project.org"
			     "E:/Refine/Org/GTD/finished.org"
			     ))
;; (setq org-refile-targets  '((org-agenda-file-finished :maxlevel . 2)
;;                             ;; (org-agenda-file-canceled :maxlevel . 9)
;;                            ))

;; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

(setq org-refile-use-outline-path t)            ;; file directly with IDO
(setq org-outline-path-complete-in-steps nil)   ;; Targets complete directly with IDO
(setq org-refile-allow-creating-parent-nodes (quote confirm))

;; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
;; (setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))
;; Use the current window when visiting files and buffers with ido
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
;; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)

;;; Refile settings
;; Exclude DONE state tasks from refile targets
(defun bh/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function 'bh/verify-refile-target)

;;; Archive --------------------------------------------------------------------------
;;; Command: C-c C-x C-s
;;location for archive
(setq org-archive-location (concat org-directory "GTD/_archive/" (format-time-string "%Y%m") "_archive.org::datetree/* Archive from %s"))
;;information added to property when a subtree is moved
(setq org-archive-save-context-info '(time file ltags itags todo category olpath))

;;; org-mobile
(setq org-mobile-directory  (concat org-directory "GTD/MobileOrg/"))
(setq org-mobile-files (list
			(concat org-directory "GTD/")))
			;; (org-agenda-dir)))
(setq org-mobile-inbox-for-pull
      (concat org-directory "GTD/from_mobile.org"))

;;; org-pomodoro --------------------------------------------------------------------
;; C-c C-x C-i :start clock（donnot show on spaceline）/ clock in
;; C-c C-x C-o :stop clock                             / clock out
;; C-c C-x C-r :make dynamic table
;;  C-c C-x C-r:refresh manual 
(global-set-key "\C-xps" 'org-pomodoro)                       ;; start org-pomodoro
(global-set-key "\C-xpx" 'spaceline-toggle-org-pomodoro-off)  ;; turn-off org-pomodoro
(global-set-key "\C-xpk" 'org-pomodoro-kill)
(use-package org-pomodoro
  :config
  (setq org-pomodoro-audio-player "mplayer")
  (setq org-pomodoro-finished-sound-args "-volume 0.7")
  (setq org-pomodoro-long-break-sound-args "-volume 0.7")
  (setq org-pomodoro-short-break-sound-args "-volume 0.7")
  (setq org-pomodoro-ticking-sound-args "-volume 0.3")
  )

(defun show-alert()
  ";; 解决两个“@”不能生成alert效果"
  (setq org-emphasis-alist (quote (("*" bold "<b>" "</b>")
				   ("/" italic "<i>" "</i>")
				   ("_" underline "<span style=\"text-decoration:underline;\">" "</span>")
				   ("=" org-code "<code>" "</code>" verbatim)
				   ("~" org-verbatim "<code>" "</code>" verbatim)
				   ("+" (:strike-through t) "<del>" "</del>")
				   ("@" org-warning "<b>" "</b>")))
      org-export-latex-emphasis-alist (quote 
                                       (("*" "\\textbf{%s}" nil)
                                        ("/" "\\emph{%s}" nil) 
                                        ("_" "\\underline{%s}" nil)
                                        ("+" "\\texttt{%s}" nil)
                                        ("=" "\\verb=%s=" nil)
                                        ("~" "\\verb~%s~" t)
                                        ("@" "\\alert{%s}" nil)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-org)
;;; init-org.el ends here
