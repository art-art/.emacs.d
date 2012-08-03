;; .emacs config Artem Artemev!
;; art.art.v@gmail.com

(setq custom-file "~/.emacs.d/custom.el")
(setq emacs-dir (file-name-directory (file-truename (or load-file-name buffer-file-name))))
(setq emacs-config-dir (concat emacs-dir "/.emacs.d/configs/"))

(defun load-cfg-files (filelist)
  (dolist (file filelist)
    (load (expand-file-name
           (concat emacs-config-dir file)))
    (message "Loaded config file: %s" file)
    ))

(setq hask-home (concat (getenv "HOME") "/Library/Haskell/bin:"))
(setq path "/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/lib:/opt/local/bin:/opt/local/sbin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/local/git/bin:/usr/X11/bin:/usr:")
(setenv "PATH" (concat path hask-home))

(blink-cursor-mode 1)
(load-cfg-files '(
                  "dired+"
		  "hl-line+"
		  "init-flymake"
		  "init-erlang"
		  "init-windows"
;;		  "init-org"
		  "init-main"
;;                  "init-im"
;;                  "init-haskell"
		))

(require 'cl)
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get/")
(require 'el-get)
(setq el-get-byte-compile nil)
(setq el-get-recipe-path  '("~/.emacs.d/el-get/el-get/recipes/"))

(setq el-get-sources '(magit psvn org-mode auctex scala-mode
                             distel slime bbdb clojure-mode 
			     ess emacs-jabber ahg doxymacs 
                             emacs-w3m geiser planner remember
			     xml-rpc-el n3-mode yasnippet 
                             android-mode elein json tuareg-mode
			     htmlize cmake-mode paredit quack
			     js2-mode oddmuse markdown-mode
			     graphviz-dot-mode google-contacts
			     ghc-mod auto-complete auto-complete-clang
			     auto-complete-emacs-lisp auto-complete-etags
			     auto-complete-latex auto-complete-yasnippet))

;(setq debug-on-error t)
;;(setq artart/packages 'psvn magit haskell-mode ghc-mod
;;      js2-mode auto-complete org-mode cedet cmake-mode)

(blink-cursor-mode t)
(customize-set-variable 'blink-cursor-mode t)

(setq artart/packages '(psvn magit cedet haskell-mode ghc-mod
                             js2-mode auto-complete org-mode
                             cmake-mode color-theme-solarized
                             yasnippet))
(el-get 'sync artart/packages)

;;
(load "~/.emacs.d/rc/emacs-cedet.el")
(load "~/.emacs.d/rc/emacs-erlang.el")
(load "~/.emacs.d/rc/emacs-ccmode.el")
(load "~/.emacs.d/rc/emacs-flymake.el")
(load "~/.emacs.d/rc/emacs-cmake.el")
(load "~/.emacs.d/rc/emacs-gdb.el")
(load "~/.emacs.d/rc/emacs-haskell.el")
(load "~/.emacs.d/rc/emacs-javascript.el")

;;
(load "~/.emacs.d/rc/emacs-autocomplete.el")
(load "~/.emacs.d/rc/emacs-org-mode.el")
(load "~/.emacs.d/rc/emacs-common-hooks.el")

;;
(load "~/.emacs.d/rc/emacs-server.el")
(load "~/.emacs.d/rc/emacs-tramp.el")
(load "~/.emacs.d/rc/emacs-erc.el")
(load "~/.emacs.d/rc/emacs-decor.el")
(load "~/.emacs.d/rc/emacs-yasnippet.el")

;(load "~/.emacs.d/rc/emacs-jabber.el")

;(put 'dired-find-alternate-file 'disabled nil)

