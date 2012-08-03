(setq erlang-root-dir "/usr/local/lib/erlang")

;; --erlang-mode
(when (file-directory-p erlang-root-dir)
  (when (file-directory-p (concat erlang-root-dir "/lib/tools-2.6.6.6/emacs"))
    
    (setq load-path (cons (concat erlang-root-dir "/lib/tools-2.6.6.6/emacs") load-path))
    (setq exec-path (cons (concat erlang-root-dir "/bin") exec-path))
    (require 'erlang-start)
    (require 'erlang-flymake)
    
    (setq inferior-erlang-machine-options '("-sname" "emacs"))
    
    (add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
    (add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))
    )
  )
