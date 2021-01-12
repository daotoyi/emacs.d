;;; init-org.el ---- org/templates/p
;;; Commentary:

(use-package org
  :config
  (setq org-startup-indented t
		org-src-fontify-natively t		;; highlight
		org-directory "~/org"
	    org-todo-keywords '((sequence "TODO" "DOING" "DONE"))
	    org-todo-keyword-faces '(("DOING" . "blue")))
  )

(setq org-agenda-files '("E:/Refine/Org/GTD/"))

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))   ;; auto word wrap
;; (add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
;; (add-hook 'org-mode-hook 'turn-on-auto-fill)

;;; org-mode
(global-set-key "\C-ca" 'org-agenda)
; (global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cc" 'org-capture)
; (global-set-key (kbd "C-c c") 'org-capture)
; (define-key global-map "\C-cc" 'org-capture)
(global-set-key "\C-cl" 'org-store-link)


;;; org-agenda
(setq org-agenda-custom-commands
        '(												
          ("w" . "TakScheme")
          ("wa" "    important &&     urgent" tags-todo "+PRIORITY=\"A\"")
          ("wb" "    important && not urgent" tags-todo "-weekly-monthly-daily+PRIORITY=\"B\"")
          ("wc" "not important && not urgent" tags-todo "+PRIORITY=\"C\"")
          ("W" "Weekly Review"
           ((stuck "") ;; review stuck projects as designated by org-stuck-projects
            (tags-todo "project")
            (tags-todo "daily")
            (tags-todo "weekly")
            (tags-todo "huaxia")
            (tags-todo "code")
            (tags-todo "theory")
            ))
          ))
		  
  
(defvar org-agenda-dir "" "gtd org files location")
  (setq-default org-agenda-dir "E:/Refine/Org/GTD/")
  (setq org-agenda-file-note (expand-file-name "notes.org" org-agenda-dir))
  (setq org-agenda-file-task (expand-file-name "task.org" org-agenda-dir))
  (setq org-agenda-file-calendar (expand-file-name "calendar.org" org-agenda-dir))
  (setq org-agenda-file-finished (expand-file-name "finished.org" org-agenda-dir))
  (setq org-agenda-file-canceled (expand-file-name "canceled.org" org-agenda-dir))

  (setq org-capture-templates
        '(
          ("t" "ToDo" entry (file+headline org-agenda-file-task "Work")
           "* TODO [#B] %?\n  %i\n"
           :empty-lines 1)
          ("l" "ToLearn" entry (file+headline org-agenda-file-task "Learning")
           "* TODO [#B] %?\n  %i\n"
           :empty-lines 1)
          ("h" "ToHobby" entry (file+headline org-agenda-file-task "Hobbies")
           "* TODO [#C] %?\n  %i\n"
           :empty-lines 1)
          ("o" "ToOther" entry (file+headline org-agenda-file-task "Others")
           "* TODO [#C] %?\n  %i\n"
           :empty-lines 1)
          ("n" "ToNotes" entry (file+headline org-agenda-file-note "Quick notes")
           "* %?\n  %i\n %U"
           :empty-lines 1)
          ("i" "TOIdeas" entry (file+headline org-agenda-file-note "Quick ideas")
           "* %?\n  %i\n %U"
           :empty-lines 1)
          )
        )


;;; org-refile
(define-key global-map "\C-cr" 'org-refile)
(setq org-refile-targets  '((org-agenda-file-finished :maxlevel . 1)
                            (org-agenda-file-canceled :maxlevel . 1)
                           ))
						   

;;; pomodoro
(require-package 'org-pomodoro)
(use-package org
  :config
  (setq org-pomodoro-audio-player "mplayer")
  (setq org-pomodoro-finished-sound-args "-volume 0.7")
  (setq org-pomodoro-long-break-sound-args "-volume 0.7")
  (setq org-pomodoro-short-break-sound-args "-volume 0.7")
  (setq org-pomodoro-ticking-sound-args "-volume 0.3")
  )
  

;;; org-latex
(setq org-latex-pdf-process
 '("xelatex -interaction nonstopmode %f"
  "xelatex -interaction nonstopmode %f"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-org)
;;; init-org.el ends here
