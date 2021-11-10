;;; init-config.el --- some APP set for emacs.
;;; Commentary:
;;; Code:

;; mail
(setq send-mail-function (quote smtpmail-send-it))
(setq smtpmail-smtp-server "smtp.qq.com")
(setq smtpmail-smtp-service 25)
(setq user-full-name "daoyi") 
(setq user-mail-address "1392429831@qq.com")

;; code fold
(load-library "hideshow")
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'php-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
;; fold code block, open it when need
;; M-x hs-minor-mode
;; C-c @ ESC C-s show all
;; C-c @ ESC C-h hide all
;; C-c @ C-s show block
;; C-c @ C-h hide block
;; C-c @ C-c toggle hide/show

;; (global-set-key [f5] 'complile)
;; (setq-default compile-command "make")
;; (global-set-key [f6] 'speedbar)
;; (global-set-key [f7] 'gdb)
;; (global-set-key [f8] 'previous-error)
;; (global-set-key [f9] 'next-error)

;;; -------------------------------------------------------------------------------------

;; auto-complete ({[]})
(electric-pair-mode 1)
(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist '(
    (?` ?` _ "''")
    (?\( ? _ " )")
    (?\[ ? _ " ]")
    (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)

;;; -------------------------------------------------------------------------------------
;; calendar
;; (setq calendar-load-hook
;;       '(lambda ()
;; 	 (set-face-foreground 'diary-face "skyblue")
;; 	 (set-face-background 'holiday-face "slate blue")
;; 	 (set-face-foreground 'holiday-face "white")))

;; 设置所在地方的经纬度，calendar日月食的预测功能，和经纬度相联系。
;; emacs能计算日出日落的时间，在 calendar 上用 S 即可看到
(setq calendar-latitude +39.54)
(setq calendar-longitude +116.28)
(setq calendar-location-name "北京")

;; lunar calendar show, on calendar, "pC" for show
(setq chinese-calendar-celestial-stem
  ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
  ["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])

;; calendar show
(setq calendar-remove-frame-by-deleting t)
(setq calendar-week-start-day 1)            ;; Monday is first day of weak.
(setq mark-holidays-in-calendar nil)        
(setq mark-diary-entries-in-calendar t)     ;; mark the day for diary
(setq view-calendar-holidays-initially nil) ;; donot view holidays when open calendar

;; delete holidays donnot care, calendar "h" show holidays.
(setq christian-holidays nil)
(setq hebrew-holidays nil)
(setq islamic-holidays nil)
(setq solar-holidays nil)
(setq general-holidays '((holiday-fixed 1 1 "元旦")
                         (holiday-fixed 2 14 "情人节")
                         (holiday-fixed 3 14 "白色情人节")
                         (holiday-fixed 4 1 "愚人节")
                         (holiday-fixed 5 1 "劳动节")
                         (holiday-float 5 0 2 "母亲节")
                         (holiday-fixed 6 1 "儿童节")
                         (holiday-float 6 0 3 "父亲节")
                         (holiday-fixed 7 1 "建党节")
                         (holiday-fixed 8 1 "建军节")
                         (holiday-fixed 9 10 "教师节")
                         (holiday-fixed 10 1 "国庆节")
                         (holiday-fixed 12 25 "圣诞节")))

;;; -------------------------------------------------------------------------------------
;;; jump back the position.
(global-set-key [(control ?\.)] 'ska-point-to-register)
(global-set-key [(control ?\,)] 'ska-jump-to-register)
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register.
Use ska-jump-to-register to jump back to the stored position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register))

(defun ska-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
    (jump-to-register
     (set-register 8 tmp))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-config)
;;; init-config.el ends here
