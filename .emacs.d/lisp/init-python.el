;;; init-python.el --- python environment
;;; Commentary:
;;; Code:

(use-package python-mode
  :init (setq fill-column 72)
  (setq-default python-indent-offset 4
                      python-indent-guess-indent-offset-verbose nil))
;; rope && flake8 && importmagic && yapf need pip install 
;;;; (use-package rope)
;;;; (use-package flake8)        ;; check syntax
;;;; (use-package importmagic)   ;; import package needed automatically
;;;; (use-package yapf)          ;; format code
(use-package jedi-core)
(use-package jedi
  :config
  (autoload 'jedi:setup "jedi" nil t)
  (setq jedi:setup-keys t)
  (setq jedi:complete-on-dot t)
  (add-hook 'python-mode-hook 'jedi:setup))

(use-package elpy
  :config (elpy-enable)
  (when (require 'flycheck nil t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode)))
;; run: ``C-c C-c
;; debug: M-x elpy-config

(use-package py-autopep8
  :config (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

;;; IPython/Jupyter
;; (elpy-use-ipython)
(use-package ein)    ;; Jupyter

(use-package pyvenv)
;; M-x pyvenv-[de]activate

(use-package py-isort
  :init (setq python-sort-imports-on-save t))


(use-package lsp-python-ms
  :init (setq lsp-python-ms-auto-install-server t)
  :after lsp-mode python-mode
  :hook (python-mode . (lambda()
                         (require 'lsp-python-ms)
                          (lsp-deferred))))
;;; -------------------------------------------------------------------------------------

;; (use-package lsp-mode
;;   :commands (lsp)        ;; defer load, when lsp called
;;   :hook (((python-mode   ;; call lsp when launch ruby/php/python-mode 
;;            ;; php-mode
;;            ;; ruby-mode
;;            ;; typescript-mode
;; 	   ) . lsp))
;;   :init 
;;   (setq lsp-auto-configure t    ;; try automaticly config itself
;;         lsp-auto-guess-root t   ;; try automaticly guess root/dir
;;         lsp-idle-delay 0.500    ;; how much time, after refresh info form server
;;         lsp-session-file "~/.emacs.d/.cache/lsp-sessions") ;; cache location
;;   )

;; (use-package lsp-imenu
;;     :init
;;     (add-hook 'lsp-after-open-hook 'lsp-enable-imenu))  ;; launch lsp-imenu(集成)

;; (use-package lsp-ui   ;; sh;; ow content
;;   :after (lsp-mode)
;;   :commands (lsp-ui-mode)
;;   :bind
;;   (:map lsp-ui-mode-map
;; 	;; query symbol reference.(use  LSP ,generally M-. )
;;         ([remap xref-find-references] . lsp-ui-peek-find-references)
;; 	;; query symbol define (use  lsp ,generally m-? )
;;         ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)  
;;         ("c-c u" . lsp-ui-imenu))
;;   :hook (lsp-mode . lsp-ui-mode)   ;; auto activate when lsp activated
;;   ;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)
;;   ;; (add-hook 'python-mode-hook 'flycheck-mode)  ;; launch flycheck
;;   :init
;;   ;; https://github.com/emacs-lsp/lsp-mode/blob/master/docs/tutorials/how-to-turn-off.md
;;   (setq lsp-enable-symbol-highlighting t
;;         lsp-ui-doc-enable t
;;         lsp-lens-enable t))

;; (use-package company-lsp
;;     :config
;;     (push 'company-lsp company-backends))    ;; set company-lsp as backends

;; (use-package lsp-python-ms
;;   :ensure t
;;   :hook (python-mode . (lambda ()
;; 			 (require 'lsp-python-ms)
;; 			 (lsp)))
;;   :init
;;   (setq lsp-python-ms-executable (executable-find "python-language-server")))

;; -------------------------------------------------------------------------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-python)
;;; init-python.el ends here
