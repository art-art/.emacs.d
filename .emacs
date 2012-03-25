;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Artem Artemev ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; .emacs config ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq debug-on-error t)

(setq emacs-dir (file-name-directory (file-truename (or load-file-name buffer-file-name))))
(setq emacs-config-dir (concat emacs-dir "/.emacs.d/configs/"))

(defun load-cfg-files (filelist)
  (dolist (file filelist)
    (load (expand-file-name
           (concat emacs-config-dir file)))
    (message "Loaded config file: %s" file)
    ))

(load-cfg-files '("dired+"
		  "sr-speedbar"
		  "tree-mode"
		  "windata"
		  "dirtree"
		  "init-speedbar"
		  "flymake"
		  "erlang"
		  "theme"
		  "lua-mode"
		  ;;"flymake-lua"
		  "init-windows"
		  "init-org"
		  "init-lua"
		  "init-common"
		))
(put 'dired-find-alternate-file 'disabled nil)
