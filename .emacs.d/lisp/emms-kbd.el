;;; emms-kbd.el —-- EMMS KeyBind Configuration
;;; Commentary:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EMMS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
(defvar one-key-menu-emms-alist nil "The 'one-key' menu alist for EMMS.")
(defvar one-key-menu-emms-alist nil)
(setq one-key-menu-emms-alist '( (("g" . "Playlist Go") . emms-playlist-mode-go)
				 (("d" . "Play Directory Tree") . emms-play-directory-tree)
				 (("f" . "Play File") . emms-play-file)
				 (("i" . "Play Playlist") . emms-play-playlist)
				 (("m" . "Play Matching") . emms-play-matching)
				 (("t" . "Add Directory Tree") . emms-add-directory-tree)
				 (("c" . "Toggle Repeat Track") . emms-toggle-repeat-track)
				 (("v" . "Jump To File") . emms-jump-to-file)
				 (("w" . "Toggle Repeat Playlist") . emms-toggle-repeat-playlist)
				 (("u" . "Play Now") . emms-play-now)
				 (("z" . "Show") . emms-show)
				 (("l" . "Lyrics Toggle Show") . emms-lyrics-toggle-display-on-minibuffer)
				 (("r" . "Lyrics Re download") . emms-lyrics-redownload-lyric)
				 (("e" . "Lyrics Visit") . emms-lyrics-visit-lyric)
				 (("s" . "Emms Streams") . emms-streams)
				 (("b" . "Emms Browser") . emms-browser)
				 (("p" . "Anything Playlist") . anything-emms-playlist)
				 (("o" . "Anything Directory") . anything-emms-directory)
				 ;((";" . "Anything File") . anything-emms-file)
				   ))
(defun one-key-menu-emms ()
 "The 'one-key' menu for EMMS."
      (interactive)
      (one-key-menu "EMMS" one-key-menu-emms-alist t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EMMS Playlist Sort ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
(defvar one-key-menu-emms-playlist-sort-alist nil
  "The 'one-key' menu alist for EMMS-PLAYLIST-SORT.")

(setq one-key-menu-emms-playlist-sort-alist '( (("h" . "Shuffle") . emms-shuffle)
					       (("n" . "Name") . emms-playlist-sort-by-name)
					       (("t" . "Title") . emms-playlist-sort-by-info-title)
					       (("a" . "Artist") . emms-playlist-sort-by-info-artist)
					       (("b" . "Album") . emms-playlist-sort-by-info-album)
					       (("y" . "Year") . emms-playlist-sort-by-info-year)
					       (("e" . "Note") . emms-playlist-sort-by-info-note)
					       (("s" . "Scroe") . emms-playlist-sort-by-score)
					       (("i" . "List") . emms-playlist-sort-by-list)
					       (("o" . "Natural Order") . emms-playlist-sort-by-natural-order)
					       (("l" . "Last Played") . emms-playlist-sort-by-last-played)
					       (("c" . "Play Count") . emms-playlist-sort-by-play-count)
					       ))
 (defun one-key-menu-emms-playlist-sort ()
   "The 'one-key' menu for EMMS-PLAYLIST-SORT."
    (interactive)
    (one-key-menu "EMMS-PLAYLIST-SORT" one-key-menu-emms-playlist-sort-alist t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EMMS Playlist Mark ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-menu-emms-playlist-mark-alist nil
   "The 'one-key' menu alist for EMMS-PLAYLIST-MARK.")

(setq one-key-menu-emms-playlist-mark-alist '( (("m" . "Mark Current and Move Next") . emms-mark-track-and-move-next)
					       (("a" . "Mark All") . emms-mark-all)
					       (("r" . "Mark Regexp") . emms-mark-regexp)
					       (("c" . "Mark Copy") . emms-mark-copy-marked-tracks)
					       (("x" . "Mark Delete") . emms-mark-delete-marked-tracks)
					       (("d" . "Mark Duplicate") . emms-mark-duplicate-track)
					       (("t" . "Mark Toggle") . emms-mark-toggle)
					       (("u" . "Umark Current") . emms-mark-unmark-track-and-move-next)
					       (("U" . "Umark All") . emms-mark-unmark-all)
					       ))
(defun one-key-menu-emms-playlist-mark ()
  "The 'one-key' menu for EMMS-PLAYLIST-MARK."
   (interactive)
   (one-key-menu "EMMS-PLAYLIST-MARK" one-key-menu-emms-playlist-mark-alist t))

;;; # Emms Playlist # EMMS 播放列表
(lazy-unset-key '("s" "m" "u" "M-<" "M->") emms-playlist-mode-map) ;卸载按键
(lazy-set-key '( ("C-x C-s" . emms-playlist-save) ;保存播放列表
		 ("C-y" . emms-playlist-mode-yank) ;剪切
		 ("C-k" . emms-playlist-mode-kill-track) ;删除当前TRACK
		 ("C-w" . emms-playlist-mode-kill) ;删除
		 ("C-/" . emms-playlist-mode-undo) ;撤销
		 ("J" . scroll-up-one-line) ;向上滚动一行
		 ("K" . scroll-down-one-line) ;向下滚动一行
		 ("." . emms-playlist-mode-first) ;浏览最上面一行
		 ("," . emms-playlist-mode-last) ;浏览最下面一行
		 ("C-j" . emms-playlist-mode-insert-newline) ;新建一行
		 ("M-y" . emms-playlist-mode-yank-pop) ;YANK弹出
		 ("M-n" . emms-playlist-mode-next) ;下一个播放列表
		 ("M-p" . emms-playlist-mode-previous) ;上一个播放列表
		 ("a" . emms-playlist-mode-add-contents) ;向当前播放列表添加内容
		 ("d" . emms-playlist-mode-kill-entire-track) ;从播放列表中移除当前TRACK
		 ("C" . emms-playlist-mode-clear) ;清空当前的播放列表
		 ("f" . emms-playlist-mode-play-smart) ;播放当前TRACK
		 ("b" . emms-playlist-set-playlist-buffer) ;设定当前播放列表BUFFER
		 ("n" . emms-next) ;播放下一首
		 ("p" . emms-previous) ;播放上一首
		 ("r" . emms-random) ;随机播放下一首
		 (">" . emms-seek-forward) ;前进
		 ("<" . emms-seek-backward) ;后退
		 ("X" . emms-pause) ;暂停
		 ("T" . emms-stop) ;停止
		 ("Z" . emms-show) ;显示播放信息
		 ("q" . emms-playlist-mode-bury-buffer) ;退出
		 ("?" . describe-mode) ;帮助
		 ("g" . emms-playlist-mode-center-current) ;跳转到当前播放TRACK
		 ("G" . emms-jump-to-file) ;定位当前音乐文件的位置
		 ("D" . emms-delete-file-from-disk) ;丛磁盘删除当前的文件
		; (";" . emms-tag-editor-edit-marked-tracks) ;编辑标记的TAG
		  ("H" . emms-last-mark-track) ;最后一个标记
		  ("L" . emms-first-mark-track) ;第一个标记
		  ("N" . emms-next-mark-track) ;下一个标记
		  ("P" . emms-prev-mark-track) ;上一个标记
		  ("s" . one-key-menu-emms-playlist-sort) ;列表排序菜单
		  ("m" . one-key-menu-emms-playlist-mark) ;列表标记菜单
		  ) emms-playlist-mode-map )
; (lazy-set-key vi-move-key-alist emms-playlist-mode-map) ;vi-move 的局部按键

;;; # Emms Tag Editor # — Emms 标签编辑器
(lazy-set-key '( ("C-c C-j" . emms-tag-editor-next-same-field) ;下一个相同的区域
		 ("C-c C-k" . emms-tag-editor-prev-same-field) ;上一个相同的区域
		 ("C-c C-r" . emms-tag-editor-set-all+) ;替换所有标签
		 ("C-c C-i" . emms-tag-editor-set-tracknumber+) ;插入轨迹序号, 不用确认
		 ) emms-tag-editor-mode-map )

;;; # EMMS Browser # — EMMS 浏览器
(lazy-set-key '( ("J" . emms-browser-next-non-track) ;下一个节点
		 ("K" . emms-browser-prev-non-track) ;上一个节点
		 ("f" . emms-browser-toggle-subitems) ;显示
		 ("s" . one-key-menu-emms-browser-search) ;搜索菜单
		 ("L" . one-key-menu-emms-browser-lookup) ;查询菜单
		 ) emms-browser-mode-map )
; (lazy-set-key sdcv-key-alist emms-browser-mode-map) ;sdcv 的局部按键
; (lazy-set-key vi-move-key-alist emms-browser-mode-map) ;vi-move 的局部按键

;;; # EMMS Stream # — EMMS 流媒体 
; (lazy-set-key '( ("a" . emms-stream-add-bookmark) ;添加
; 		 ("d" . emms-stream-delete-bookmark) ;删除
; 		 ("E" . emms-stream-edit-bookmark) ;编辑
; 		 ("q" . emms-stream-quit) ;退出
; 		 ("s" . emms-stream-save-bookmarks-file) ;保存
; 		 ("t" . emms-stream-toggle-default-action) ;切换
; 		 ("i" . emms-stream-info-bookmark) ;信息
; 		 ("f" . emms-stream-play) ;播放
; 		 ) emms-stream-mode-map )
; (lazy-set-key vi-move-key-alist emms-stream-mode-map) ;vi-move 的局部按键

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  
;;  (global-set-key (kbd "H-x") 'emms-playlist-mode-go)
;;  
;;  (global-set-key (kbd "C-c e t") 'emms-play-directory-tree)
;;  (global-set-key (kbd "C-c e g") 'emms-play-directory)
;;  (global-set-key (kbd "C-c e d") 'emms-play-dired)
;;  (global-set-key (kbd "C-c e x") 'emms-start)
;;  (global-set-key (kbd "C-c e v") 'emms-stop)
;;  (global-set-key (kbd "C-c e n") 'emms-next)
;;  (global-set-key (kbd "C-c e p") 'emms-previous)
;;  (global-set-key (kbd "C-c e o") 'emms-show)
;;  (global-set-key (kbd "C-c e h") 'emms-shuffle)
;;  (global-set-key (kbd "C-c e e") 'emms-play-file)
;;  (global-set-key (kbd "C-c e f") 'emms-play-playlist)
;;  (global-set-key (kbd "C-c e SPC") 'emms-pause)
;;  (global-set-key (kbd "C-c e a") 'emms-add-directory-tree)
;;  
;;  (global-set-key (kbd "C-c e r")   'emms-toggle-repeat-track)
;;  (global-set-key (kbd "C-c e R")   'emms-toggle-repeat-playlist)
;;  
;;  (global-set-key (kbd "C-c e s u") 'emms-score-up-playing)
;;  (global-set-key (kbd "C-c e s d") 'emms-score-down-playing)
;;  (global-set-key (kbd "C-c e s o") 'emms-score-show-playing)
;;  ;; playlist-mode-map
;;  (define-key emms-playlist-mode-map (kbd "SPC") 'emms-pause)
;;  (define-key emms-playlist-mode-map (kbd "+") 'emms-volume-raise)
;;  (define-key emms-playlist-mode-map (kbd "-") 'emms-volume-lower)
;;  (define-key emms-playlist-mode-map (kbd "<right>")
;;    (lambda () (interactive) (emms-seek +10)))
;;  (define-key emms-playlist-mode-map (kbd "<left>")
;;    (lambda () (interactive) (emms-seek -10)))
;;  (define-key emms-playlist-mode-map (kbd "<up>")
;;    (lambda () (interactive) (emms-seek +60)))
;;  (define-key emms-playlist-mode-map (kbd ("<down>"))
;;    (lambda () (interactive) (emms-seek -60)))
;;  (define-key emms-playlist-mode-map (kbd "S u") 'emms-score-up-file-on-line)
;;  (define-key emms-playlist-mode-map (kbd "S d") 'emms-score-down-file-on-line)
;;  (define-key emms-playlist-mode-map (kbd "S o") 'emms-score-show-file-on-line)
;;  (define-key emms-playlist-mode-map (kbd "S l") 'emms-score-less-tolerant)
;;  (define-key emms-playlist-mode-map (kbd "S m") 'emms-score-more-tolerant)
;;  (define-key emms-playlist-mode-map (kbd "S t") 'emms-score-set-tolerance)
;;  (define-key emms-playlist-mode-map (kbd "S s") 'emms-score-show-playing)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; emms-kbd.el ends here
(provide 'emms-kbd)
