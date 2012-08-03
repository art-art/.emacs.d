

(defun flymake-erlang-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake/create-temp-file))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list (concat emacs-dir ".emacs.d/erlang/eflymake") (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.erl\\'" flymake-erlang-init flymake/cleanup))

(defun artart/flymake-erlang-mode-hook ()
  (flymake-mode 1))

(defun artart/folding-erlang-mode-hook ()
  (setq hs-special-modes-alist 
	(cons '(erlang-mode 
		"^\\([a-z][a-zA-Z0-9_]*\\|'[^\n']*[^\\]'\\)\\s *(" nil "%" 
		erlang-end-of-clause) hs-special-modes-alist))
  (hs-minor-mode 1)
  (local-set-key [?\M-s] 'hs-toggle-hiding)
  (local-set-key [?\M-h] 'hs-hide-all)
  (local-set-key [?\M-u] 'hs-show-all))

(add-hook 'erlang-mode-common-hook 'artart/flymake-erlang-mode-hook)
(add-hook 'erlang-mode-hook 'artart/folding-erlang-mode-hook)
