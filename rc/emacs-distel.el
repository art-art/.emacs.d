

;;(let((distel-dir (concat emacs-dir ".emacs.d/erlang/distel/elisp")))
;;(unless (member distel-dir load-path)
;;  (setq load-path (append load-path (list distel-dir)))
;;))

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

