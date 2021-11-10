# EmacsCofig  emacs.d/init.el

## 1 GiteeClone 
**URL**[ git@gitee.com:daotoyi/emacs.d.git](https://gitee.com/daotoyi/emacs.d.git)


## 2 Config

### Windows or Linux

```shell
cd emacs.d/emacs.d
mkdir ~/.emacs.d/
cp -rf * ~/.ecmsc.d/

```
### NOTE

#### 1 the load-path on Linux 

can't load .el file when statup, 

>Please have a look at the accompanying `default.el` customisation example. 
It can be used as a configuration file (after moving it e. g. to`/usr/share/emacs/site-lisp` or `c:\EMACS_INSTALLDIR\site-lisp`,
hint: The directory site-lisp/ in the Emacs installation tree is in its default load-path). 
Yet default.el is loaded AFTER your personal Emacs configuration file (if there is any) `~/.emacs` (or`~/.emacs.d/init.el`)! 
If you intend to change the following settings with Emacs customisation system or changing them directly in your personal configuration file, 
you must either set the variable `inhibit-default-init` to (setq inhibit-default-init t) in your personal configuration file 
or remove `default.el` otherwise your settings might be overwritten!

**[refer]**[Debugger entered--Lisp error: (file-error "Cannot open load file" "/home/andre/a-m")](https://www.it1352.com/2062686.html)

##### Resolve 
1. move init-xxx.el to other path
>moving init-xxx.el to '/usr/share/emacs/site-lisp’ or c:\EMACS_INSTALLDIR\site-lisp’

2. added (setq inhibit-default-init t) to the init file
Try it but not work.

#### 2 Platform diff

Configuration in different platfrom is distiguished, such as: 

```lisp
(when (eq system-type 'windows-nt)
   (add-to-list 'exec-path "d:/Program Files/MPlayer for Windows/"))
(when (eq system-type 'gnu/linux)
   (add-to-list 'exec-path "/mnt/d/Program Files/MPlayer for Windows/"))
```

### Config(init.el)

```lisp
(add-to-list 'load-path (expand-file-name (concat EamcsConfDir ".emacs.d/lisp/")))

;;; Package Management
(require 'init-elpa)
...
(require 'custom)

```

### Config(init-xxx.el)

```lisp

...
;;; MUST BE, eg.(provide 'init-elpa)
(provide 'init-xxx)

```

## 3 Install

Running when start! 
