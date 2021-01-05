;;; init-emms.el --— Emms configuration
;;; Commentary: customize based on EMMS default setting.

(add-to-list 'load-path (expand-file-name (concat EamcsConfDir ".emacs.d/emms")))
(add-to-list 'exec-path "/D:/Program Files/MPlayer for Windows/")
(add-to-list 'exec-path "/D:/Program Files/VideoLAN/VLC/")

(setq emmsdir (concat EamcsConfDir ".emacs.d/emms"))
(make-directory emmsdir t)
(setq emms-directory emmsdir) 

(use-package emms
  :ensure t 
  :defer t ;; nil   
  :config
  (progn
   (require 'emms-setup)  ;; Emms set 
   (emms-standard)        ;; minimalistic, standard, all/devel 
  )
)

(with-eval-after-load 'emms
;  (emms-standard)    ;;  minimalistic, standard, all/devel
  (setq emms-repeat-playlist nil
      emms-lyrics-dir "/e:/Recreation/Music/lyrics"
      emms-lyrics-coding-system t
      emms-info-asynchronously t  ;; nil
      emms-show-format "♪ %s"
      emms-playlist-buffer-name "*EMMS*"    ;; or *Music*
      emms-source-file-default-directory "/e:/Recreation/Music"
  )
  
  (if (executable-find "mplayer")    ;; smplayer replaced mplayer below.
     (setq emms-player-list '(emms-player-mplayer)
           emms-player-mplayer-command-name "mplayer"
           emms-player-mplayer-parameters '("-slave"))
	   (emms-default-players)
  )
;;  (if (executable-find "vlc")    
;;     (setq emms-player-list '(emms-player-mplayer)
;;           emms-player-mplayer-command-name "vlc"
;;	   (emms-default-players)

  (add-to-list 'emms-track-initialize-functions 'emms-info-initialize-track)
  (add-to-list 'emms-info-functions 'kid-emms-info-simple)
  (add-to-list 'emms-info-functions 'kid-emms-info-simple)

(define-emms-simple-player mplayer '(file url) 
     (regexp-opt '(".ogg" ".mp3" ".wav" ".mpg" ".mpeg" ".wmv" ".wma" 
        ".mov" ".avi" ".divx" ".ogm" ".asf" ".mkv" "http://" "mms://" 
        ".rm" ".rmvb" ".mp4" ".flac" ".vob" ".m4a" ".flv" ".ogv" ".pls")) 
     "mplayer" "-slave" "-quiet" "-really-quiet" "-fullscreen") 

(setq emms-playlist-default-major-mode 'emms-playlist-mode)
;(setq emms-track-description-function 'kid-emms-info-track-description)
(when (fboundp 'emms-cache)
  (emms-cache 1))

;;; use faster finding facility if you have GNU find
;(setq emms-source-file-directory-tree-function 
;    emms-source-file-directory-tree-find)

(add-hook 'emms-player-started-hook 'emms-show)

;;; mode line format
(setq emms-mode-line-format "[ %s "
      emms-playing-time-display-format "%s ]")
(setq global-mode-string
      '("" emms-mode-line-string " " emms-playing-time-string))

;;; Emms-lyrics set
;(ad-activate 'emms-lyrics-find-lyric) ;download lyrics automaticlly
(setq emms-lyrics-dir "/e:/Recreation/Music/lyrcis") 
(setq emms-lyrics-display-format "%s") 
(setq emms-lyrics-scroll-timer-interval 1.0) ;lysrics scrolldelay
(setq emms-lyrics-display-on-minibuffer nil) 
(setq emms-lyrics-display-on-modeline nil) 

;;; Emms-browser
(autoload 'emms-smart-browse "emms-browser.el" "Browse with EMMS" t)
(global-set-key [(f7)] 'emms-smart-browse)

(setq emms-browser-info-genre-format "%i● %n"
      emms-browser-info-artist-format "%i● %n"
      emms-browser-info-album-format "%i◎ %n"
      emms-browser-info-title-format "%i♪ %n") ;; time display formate
(setq emms-last-played-format-alist            ;; formate the time of played last 
      '(((emms-last-played-seconds-today) . "%H:%M")  ;; today
	(604800 . "W%w %H:%M")                        ;; this week
	((emms-last-played-seconds-month) . "%d")     ;; this month
	((emms-last-played-seconds-year) . "%m-%d")   ;; this year
	(t . "")))

)   ;; with-eval-after-load

;;  (emms-player-set emms-player-mplayer 'regex "
;;  		 .ogg|.mp3|.wav| .mpg | .mpeg | .wmv | .wma | .mov | .avi | .divx | .ogm | .asf | .mkv |http:// |mms:// | .rm | .rmvb | .mp4 | .flac | .vob | .m4a | .ape | .mpc")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'emms-packages)
(require 'emms-kbd)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-emms.el ends here
(provide 'init-emms)
