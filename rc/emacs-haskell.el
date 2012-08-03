(add-to-list 'load-path "~/.emacs.d/el-get/haskell-mode")
(load "~/.emacs.d/el-get/haskell-mode/haskell-site-file.el")

(require 'haskell-checkers)

(add-to-list 'auto-mode-alist '("\\.hsc$" . haskell-mode))

(autoload 'ghc-init "ghc" nil t)

(custom-set-variables
 '(haskell-program-name "ghci")
 '(inferior-haskell-wait-and-jump t)
; '(hs-lint-replace-with-suggestions t)
 )

(defun artart/haskell-mode-hook ()
  (ghc-init)
  (turn-on-haskell-doc-mode)
  (turn-on-haskell-indent)
  (turn-on-haskell-ghci)
  (turn-on-eldoc-mode)
  (turn-on-haskell-indentation)
  (local-set-key [return] 'newline-and-indent)
  (local-set-key "\C-cl" 'hs-lint)
  (local-set-key "\C-ch" 'haskell-hoogle)
  (local-set-key "\C-c\C-h" 'haskell-hayoo)
  (setq tab-width 4)
  (setq haskell-font-lock-symbols t)
  (add-to-list 'ac-sources 'ac-source-ghc-mod)
;;  (turn-on-haskell-simple-indent)
  )
(add-hook 'haskell-mode-hook 'artart/haskell-mode-hook)

(require 'haskell-interactive-mode)
(defun artart/hs-interactive-hook ()
  (local-set-key (kbd "C-<up>")
		 '(lambda () (haskell-interactive-mode-history-toggle 1)))
  (local-set-key (kbd "C-<down>")
		 '(lambda () (haskell-interactive-mode-history-toggle -1)))
  )
(add-hook 'haskell-interactive-mode-hook 'artart/hs-interactive-hook)

;;
(add-to-list 'exec-path "~/Library/Haskell/bin")
