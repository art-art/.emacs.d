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

;; --distel
(let((distel-dir (concat emacs-dir ".emacs.d/erlang/distel/elisp")))
  (unless (member distel-dir load-path)
    (setq load-path (append load-path (list distel-dir)))))

(require 'distel)
(distel-setup)

(defconst distel-shell-keys
  '(("\C-\M-i"   erl-complete)
    ("\M-?"      erl-complete)
    ("\M-."      erl-find-source-under-point)
    ("\M-,"      erl-find-source-unwind)
    ("\M-*"      erl-find-source-unwind)
    )
  "Additional keys to bind when in Erlang shell.")

(add-hook 'erlang-shell-mode-hook
	  (lambda ()
	    (dolist (spec distel-shell-keys)
	      (define-key erlang-shell-mode-map (car spec) (cadr spec)))))


;; --flymake
(defun flymake-erlang-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake/create-temp-file))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list (concat emacs-dir ".emacs.d/erlang/eflymake") (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.erl\\'" flymake-erlang-init flymake/cleanup))

(defun my-erlang-mode-hook ()
  (flymake-mode 1))
(add-hook 'erlang-mode-common-hook 'my-erlang-mode-hook)