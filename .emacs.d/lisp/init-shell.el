;;; init-shell.el --- SHELL environment setting
;;; Commentary:

;; Shell Mode(Show Chinese)
(setq ansi-color-for-comint-mode t)	;; shell Chines show
(defun change-shell-mode-coding ()
  (progn
    (set-terminal-coding-system 'gbk)
    (set-keyboard-coding-system 'gbk)
    (set-selection-coding-system 'gbk)
    (set-buffer-file-coding-system 'gbk)
    (set-file-name-coding-system 'gbk)
    (modify-coding-system-alist 'process "*" 'gbk)
    (set-buffer-process-coding-system 'gbk 'gbk)
    (set-file-name-coding-system 'gbk)))

(add-hook 'shell-mode-hook 'change-shell-mode-coding t)
(add-hook 'Eshell-mode-hook 'change-shell-mode-coding t)


(global-set-key (kbd "C-c s") 'shell) 
(global-set-key (kbd "<f10>") 'rename-buffer)


;; rename shell when open new shell
(defun rename-buffer-in-ssh-login (cmd) 
  "Rename buffer to the destination hostname in ssh login"
  (if (string-match "ssh [-_a-z0-9A-Z]+@[-_a-z0-9A-Z.]+[ ]*[^-_a-z0-9-A-Z]*$" cmd) 
        or
        (string-match "plink [-_a-z0-9A-Z]+@[-_a-z0-9A-Z.]+[ ]*[^-_a-z0-9-A-Z]*$" cmd)
      (let (( host (nth 2 (split-string cmd "[ @\n]" t) ))) 
      (rename-buffer (concat "*" host)) 
	; (let ((shell-buffer-name-list 'host)))
        ; (add-to-list 'shell-buffer-name-list (concat "*" host))
        ;        (message "%s" shell-buffer-name-list)
      ) 
    ) 
  )

(add-hook 'comint-input-filter-functions 'rename-buffer-in-ssh-login)


;; go to shell quickly and go in the dirctory contain current buffer.
(defun kid-switch-to-shell ()
  (interactive)
  (when (null (cdr (window-list)))
    (split-window-vertically))
  (let ((file buffer-file-name))
    (other-window 1)
    (shell)
    (when file
      (end-of-buffer)
      (when (looking-back shell-prompt-pattern)
        (insert "cd " (file-name-directory file))
        (call-interactively 'comint-send-input)))))

(global-set-key (kbd "<C-f9>") 'kid-switch-to-shell)
				

;;;;;;;;;;;;;;;;;;;;;;;;;;;; kill-shell-buffer-after-exit ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun kill-shell-buffer(process event) 
  "The one actually kill shell buffer when exit. "
  (kill-buffer (process-buffer process)) 
) 

(defun kill-shell-buffer-after-exit() 
  "kill shell buffer when exit."
  (set-process-sentinel (get-buffer-process (current-buffer)) 
                #'kill-shell-buffer) 
  )

(add-hook 'shell-mode-hook 'kill-shell-buffer-after-exit t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; outline-mode  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq outline-regexp ".*[bB]ash.*[#\$]")    ;;; global variables, replaced by below func
(defun set-outline-minor-mode-regexp () 
    ""
    (let ((find-regexp 
           (lambda 
             (lst mode) 
             ""
             (let 
                 ((innerList 
                   (car lst))) 
               (if innerList 
                   (if 
                       (string= 
                        (car innerList) 
                        mode) 
                       (car 
                        (cdr innerList)) 
                     (progn 
                       (pop lst) 
                       (funcall find-regexp lst mode)))))))) 
      (outline-minor-mode 1) 
      (make-local-variable 'outline-regexp) 
      (setq outline-regexp (funcall find-regexp outline-minor-mode-list major-mode))))

 (setq outline-minor-mode-list 
      (list '(emacs-lisp-mode "(defun") 
	    '(shell-mode ".*[bB]ash.*[#\$] ") 
	    '(sh-mode "function .*{") 
	    '(perl-mode "sub ") 
 )) 

(add-hook 'shell-mode-hook      'set-outline-minor-mode-regexp t ) 
(add-hook 'sh-mode-hook         'set-outline-minor-mode-regexp t ) 
(add-hook 'emacs-lisp-mode-hook 'set-outline-minor-mode-regexp t ) 
(add-hook 'perl-mode-hook       'set-outline-minor-mode-regexp t )

				
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-shell)
;;; init-shell.el ends here
