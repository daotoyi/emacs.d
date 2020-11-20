;;;---- init-evil.el --- Org model settings

(require 'org)
(setq org-src-fontify-natively t)			;;hlight
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)	;;map kbd key


(provide 'init-org)
;;; init-ui.el ends here


(setq evil-default-state 'emacs)
;这个是打开文件后默认进入emacs模式
;我还要在emacs和vim模式里面切换：C-z，换来换去啊

(define-key evil-emacs-state-map (kbd "C-o") 'evil-execute-in-normal-state)
; C-o按键调用vim功能（就是临时进入normal模式，然后自动回来）
; 比如，你要到第一行，可以使用emacs的 M-<，也可以使用evil的C-o gg
; 其中C-o是进入vim模式 gg是去第一行，命令之后自动还原emacs模式！
; "Fuck you!" 如何删除""里面的内容呢？Emacs的话，默认文本对象能力不强
; 有了evil的拓展 C-o di" 轻轻松松搞定~
; 比如C-o 3dd C-o dib C-o yy C-o p C-o f * 舒服啊~发挥想象力吧

; 下面4行是设置使用C-d作为ESC按键，这个自己看吧
(define-key evil-insert-state-map (kbd "C-d") 'evil-change-to-previous-state)
(define-key evil-normal-state-map (kbd "C-d") 'evil-force-normal-state)
(define-key evil-replace-state-map (kbd "C-d") 'evil-normal-state)
(define-key evil-visual-state-map (kbd "C-d") 'evil-exit-visual-state)

; 以下设置时使用t作为多剪贴板的起始按键，比如 tay(不是 "ay哦) tap(就是"ap啦)~
(define-key evil-normal-state-map "t" 'evil-use-register)

; 注意，如果有什么bug的话，把这个函数也添加了
; evil作者给的代码，不知道有没有添加到插件里面去
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
