;;; init-emms.el --— Emmsconfiguration
;;; Commentary: customize based on EMMS default setting.
;;; Code:

(add-to-list 'load-path (expand-file-name (concat EamcsConfDir ".emacs.d/emms")))
(add-to-list 'exec-path "d:/Program Files/MPlayer for Windows/")

(setq emmsdir (concat EamcsConfDir ".emacs.d/emms"))
(make-directory emmsdir t)
(setq emms-directory emmsdir) 

(use-package emms
  :ensure t 
  :defer t 
  :config
  (progn
   (require 'emms-setup)  ;; Emms set 
   (emms-standard)        ;; minimalistic, standard, all/devel 
  ))

;;; emms package entrance.
(require 'emms-packages)
;; (require 'emms-kbd)
;;;;;;;;;;;;;;;;;;;;;;;;;;

(with-eval-after-load 'emms
  ; (emms-standard)    ;;  minimalistic, standard, all/devel

  ; (if (executable-find "d:/program files/videolan/vlc/vlc.exe")
  ;   (setq emms-player-vlc-command-name "d:/program files/videolan/vlc/vlc.exe"))

  (setq emms-player-list '(emms-player-mplayer)
        emms-player-mplayer-command-name "d:/Program Files/MPlayer for Windows/mplayer.exe"
        emms-player-mplayer-parameters '("-slave"))
    
  (emms-default-players)

  (setq emms-repeat-playlist nil
      emms-show-format "♪ %s"
      emms-info-asynchronously nil
      emms-playlist-buffer-name "*Emms*"
      emms-lyrics-coding-system t
      emms-lyrics-dir "e:/Recreation/Music/lyrics/"
      emms-source-file-default-directory "e:/Recreation/Music/"
  )

  (add-hook 'emms-player-started-hook 'emms-show)
  (add-to-list 'emms-track-initialize-functions 'emms-info-initialize-track)

  ;;;; defun function
  ;; Get info from the music filename.
  (add-to-list 'emms-info-functions 'kid-emms-info-simple) 
  ;; Customize Playlist format.
  ;; (setq emms-track-description-function 'kid-emms-info-track-description)
  
  ;;; mode line format
  (setq emms-mode-line-format " [ %s "
        emms-playing-time-display-format "%s ]")
  ;; (setq global-mode-string
  ;;       '("" emms-mode-line-string " " emms-playing-time-string))
  
  ;; ;;; faster finding facility if you have GNU find
  ;; it affect M-x emms-play-directory-tree, cannot encode playlist && play corredtly 
  ;; (setq emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)
  (setq emms-playlist-default-major-mode 'emms-playlist-mode)
  
  (when (fboundp 'emms-cache)
    (emms-cache 1))
  
  (define-emms-simple-player mplayer '(file url) 
       (regexp-opt '(".ogg" ".mp3" ".wav" ".mpg" ".mpeg" ".wmv" ".wma" 
          ".mov" ".avi" ".divx" ".ogm" ".asf" ".mkv" "http://" "mms://" 
          ".rm" ".rmvb" ".mp4" ".flac" ".vob" ".m4a" ".flv" ".ogv" ".pls")) 
       "mplayer" "-slave" "-quiet" "-really-quiet" "-fullscreen") 
  
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

)  ;; end of with-eval-after-load

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; defun section ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun kid-emms-info-simple (track)
  "Get info from the filename."
  (when (eq 'file (emms-track-type track))
    (let ((regexp "/\\([^/]+\\)/\\([^/]+\\)\\.[^.]+$")
          (name (emms-track-name track)))
      (if (string-match regexp name)
          (progn
            (emms-track-set track 'info-artist (match-string 1 name))
            (emms-track-set track 'info-title (match-string 2 name)))
          (emms-track-set track
                          'info-title
                          (file-name-nondirectory name))))))

(defun kid-emms-info-track-description (track)
 "Return a description of the current track."
  (let ((artist (emms-track-get track 'info-artist))
        (title (emms-track-get track 'info-title)))
    (format "%-10s +| %s"
	    (or artist "")
	    title)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-emms.el ends here
(provide 'init-emms)
