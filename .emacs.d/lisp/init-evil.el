;;; package --- Summary --- vim model settings
;;; Commentary:

(use-package evil
  :defer nil 
  :config
  (evil-mode 1)
  (use-package evil-leader
    :defer nil
    :config
    (progn
      (global-evil-leader-mode)			;; activate before  evil-mode, and will be used in all status
      (setq evil-leader/in-all-states t)
        ;; (evil-leader/set-leader ",")
	(setq evil-leader/leader "<SPC>")
        (evil-leader/set-key
		"cl" 'evilnc-comment-or-uncomment-lines
		"cc" 'evilnc-copy-and-comment-lines
         	"cp" 'evilnc-comment-or-uncomment-paragraphs
		
		"ff" 'find-file
		"bb" 'switch-to-buffer

		"0"  'select-window-0
		"1"  'select-window-1
		"2"  'select-window-2
		"3"  'select-window-3
		"w/" 'split-window-right
		"w-" 'split-window-below

		":"  'counsel-M-x
		"wM" 'delete-other-windows
	        
		"jc" 'avy-goto-char
		"jw" 'avy-goto-word
		"jl" 'avy-goto-line
	  )))
  )

(use-package window-numbering
  :defer 2
  :config
  (window-numbering-mode 1))

(use-package evil-surround
  :defer 2
  :config
  (global-evil-surround-mode))

;; Evil-nerd-commenter
(evilnc-default-hotkeys)	;; activate
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

;(setq evil-default-state 'emacs)		;; emacs or vim
(define-key evil-emacs-state-map (kbd "C-o") 'evil-execute-in-normal-state)

;; clear hotkey in insert state map and use Emacs State 
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;(define-key evil-insert-state-map (kbd "C-d") 'evil-change-to-previous-state)
;(define-key evil-normal-state-map (kbd "C-d") 'evil-force-normal-state)
;(define-key evil-replace-state-map (kbd "C-d") 'evil-normal-state)
;(define-key evil-visual-state-map (kbd "C-d") 'evil-exit-visual-state)

;; "Execute the next command in Normal state. C-o o works in insert-mode"
(defun evil-execute-in-normal-state ()
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-evil)
;;; init-evil.el ends here
