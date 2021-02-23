;;; init-translate.el ---- translate
;;; Commentary:
;;; Code:
(use-package google-translate)
;; (use-package google-translate-default-ui)
;; modify the '.com'to '.cn',or it is not accessible domestic.
(setq google-translate-base-url   "http://translate.google.cn/translate_a/single")
(setq google-translate-listen-url "http://translate.google.cn/translate_tts")
(setq google-translate--tkk-url   "http://translate.google.cn")

(setq google-translate-default-source-language "en")
(setq google-translate-default-target-language "zh-CN")
(setq-default google-translate-enable-ido-completion t)

(global-set-key "\C-ct" 'google-translate-at-point)
(global-set-key "\C-cT" 'google-translate-query-translate)
(global-set-key (kbd "\C-cq") 'google-translate-smooth-translate)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package youdao-dictionary
  :defer nil
  :config
  (setq url-automatic-caching t)
  (global-set-key (kbd "C-q") 'youdao-dictionary-search-at-point+))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'sdcv)
(setq sdcv-say-word-p t)               ;say word after translation
(setq sdcv-dictionary-data-dir "startdict_dictionary_directory") ;setup directory of stardict dictionary

(setq sdcv-dictionary-simple-list    ;setup dictionary list for simple search
      '("懒虫简明英汉词典"
        "懒虫简明汉英词典"
        "KDic11万英汉词典"))

(setq sdcv-dictionary-complete-list     ;setup dictionary list for complete search
      '(
        "懒虫简明英汉词典"
        "英汉汉英专业词典"
        "XDICT英汉辞典"
        "stardict1.3英汉辞典"
        "WordNet"
        "XDICT汉英辞典"
        "Jargon"
        "懒虫简明汉英词典"
        "FOLDOC"
        "新世纪英汉科技大词典"
        "KDic11万英汉词典"
        "朗道汉英字典5.0"
        "CDICT5英汉辞典"
        "新世纪汉英科技大词典"
        "牛津英汉双解美化版"
        "21世纪双语科技词典"
        "quick_eng-zh_CN"
        ))

;;;; Manual
;; Command	        Description
;; sdcv-search-pointer	Search around word and display with buffer.
;; sdcv-search-pointer+	Search around word and display with tooltip.
;; sdcv-search-input	Search input word and display with buffer.
;; sdcv-search-input+	Search input word and display with tooltip.
(global-set-key (kbd "C-x t p") 'sdcv-search-pointer)
(global-set-key (kbd "C-x t P") 'sdcv-search-pointer+)
(global-set-key (kbd "C-x t w") 'sdcv-search-input)
(global-set-key (kbd "C-x t W") 'sdcv-search-input+)

(require 'company-english-helper)
;; base on Emacs company-mode.
;; Execute command `toggle-company-english-helper' to write english on the fly!
(global-set-key (kbd "C-x t c") 'toggle-company-english-helper)

(require 'insert-translated-name)
(global-set-key (kbd "C-x t i") 'insert-translated-name-insert)

;; Execute command `insert-translated-name-insert' activate, automatically actions Chines.
;; Input Chines, and input space, will automatically translate english comment.

;;;; Manual
;; 命令	                                        描述
;; insert-translated-name-insert            	按照当前语言风格自动插入翻译后的名字
;; insert-translated-name-insert-with-underline	按照下划线风格自动插入翻译后的名字
;; insert-translated-name-insert-with-camel	按照骆驼风格自动插入翻译后的名字
;; insert-translated-name-insert-with-line	按照连接线风格自动插入翻译后的名字
;; insert-translated-name-insert-original-translation按照当前语言风格自动插入翻译
;; insert-translated-name-replace	        按照当前语言风格自动替换中文为翻译后的名字
;; insert-translated-name-replace-with-underline按照下划线风格自动替换中文为翻译后的名字
;; insert-translated-name-replace-with-camel	按照骆驼风格自动替换中文为翻译后的名字
;; insert-translated-name-replace-with-line	按照连接线风格自动替换中文为翻译后的名字

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-translate)
;;; init-org.el ends here
