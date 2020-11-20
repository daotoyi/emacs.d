# EmacsComfig  emacs.d/init.el

## 1 GiteeClone 
**URL**[ git@gitee.com:daotoyi/emacsemacs.d.git](git@gitee.com:daotoyi/emacsemacs.d.git)


## 2 Config

### Windows or Linux

```js
cd emacsemacs.d/emacs.d
mkdir ~/.emacs.d/
cp -rf * ~/.ecmsc.d/

```

### Config(init.el)

```js
(add-to-list 'load-path (expand-file-name (concat EamcsConfDir ".emacs.d/lisp/")))call plug#end()

;;; Package Management
(require 'init-elpa)
...
(require 'custom)

```

### Config(init-xxx.el)

```js

...
;;; MUST BE 	eg.(provide 'init-elpa)
(provide 'init-xxx)

```

## 3 Install

Running when start! 