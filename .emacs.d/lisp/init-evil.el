;;;---- init-evil.el --- vim model settings

;;; Vim -- evil (also in init-packages.el)
(require-package 'evil)	
(use-package evil
	:config
	(evil-mode 1)
	)

(setq evil-default-state 'emacs)
(define-key evil-emacs-state-map (kbd "C-o") 'evil-execute-in-normal-state)

; (define-key evil-insert-state-map (kbd "C-d") 'evil-change-to-previous-state)
; (define-key evil-normal-state-map (kbd "C-d") 'evil-force-normal-state)
; (define-key evil-replace-state-map (kbd "C-d") 'evil-normal-state)
; (define-key evil-visual-state-map (kbd "C-d") 'evil-exit-visual-state)

(defun evil-execute-in-normal-state ()
"Execute the next command in Normal state. C-o o works in insert-mode"
(interactive)
(evil-delay '(not (memq this-command
'(evil-execute-in-normal-state
evil-use-register
digit-argument
negative-argument
universal-argument
universal-argument-minus
universal-argument-more
universal-argument-other-key)))
`(progn
(if (evil-insert-state-p)
(let ((prev-state (cdr-safe (assoc 'normal evil-previous-state-alist))))
(evil-change-state prev-state)
(setq evil-previous-state 'normal))
(evil-change-to-previous-state))
(setq evil-move-cursor-back ',evil-move-cursor-back))
'post-command-hook)
(setq evil-move-cursor-back nil)
(evil-normal-state)
(evil-echo "Switched to Normal state for the next command ...")) 

(provide 'init-evil)
;;; init-evil.el ends here
