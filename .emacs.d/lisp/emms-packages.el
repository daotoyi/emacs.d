;;; emms-packages.el — Emms require
;;; Commentary:


;; (use-package emms
;;   :ensure t
;;   :defer 2
;;   :config
;;   (progn
;;    (require 'emms-setup)  ;;Emms 设置
   (require 'emms-source-file)     ;; Emms 文件
   (require 'emms-source-playlist) ;; Emms 列表
   (require 'emms-player-simple)   ;; Emms simple
   (require 'emms-player-vlc)      ;; vlc player
   (require 'emms-player-mplayer)  ;; Emms mplayer播放器
   (setq emms-player-list '(emms-player-mpg321
                            emms-player-ogg123
   			    emms-player-mplayer
   			    emms-player-mplayer-playlist
   			    emms-player-mpv
   			    emms-player-vlc
   			    emms-player-vlc-playlist
                            ))
   ;; below configuration from "https://www.emacswiki.org/emacs/init-emms.el"
   (require 'emms-playlist-mode) ;Emms 播放列表模式
   (require 'emms-info) ;Emms信息模式
   (require 'emms-cache) ;Emms缓存
   (require 'emms-mode-line) ;Emms状态栏
   (require 'emms-playing-time) ;Emms 播放时间
   (require 'emms-volume) ;Emms 声音调节
   (require 'emms-history) ;自动保存和导入上次的播放列表
   (require 'emms-lyrics) ;Emms 歌词
   (require 'emms-browser) ;EMMS 浏览器
   (require 'emms-volume-amixer) ;Emms 声音控制
   (require 'emms-streams) ;Emms 流媒体
   ;  (require 'emms-player-mpg321-remote) ;Emms 远程播放
   ;  (require 'emms-tag-editor) ;EMMS 标签编辑器
   ;  (require 'emms-i18n) ;自动识别音乐标签的编码

   ;; below is not exist in emms.
   ;  (require 'emms-lyrics-download) ;自动下载歌词
   ;  (require 'emms-extension) ;emms扩展
;;    (emms-all)
;;   )
;; )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; iemms-package.el ends here
(provide 'emms-packages)
