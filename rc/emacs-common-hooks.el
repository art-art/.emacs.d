
(defun artart/common-hook ()
  (local-set-key "\C-c:" 'uncomment-region)
  (local-set-key "\C-c;" 'comment-region)
  (local-set-key "\C-c\C-c" 'comment-region)
  (font-lock-mode 1)
  )

(add-hook 'prog-mode-hook 'artart/common-hook)

;; show FIXME/TODO/BUG keywords
(defun artart/show-prog-keywords ()
  ;; highlight additional keywords
  (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
  (font-lock-add-keywords nil '(("\\<\\(DONE\\):" 1 font-lock-doc-face t)))
  ;; highlight too long lines
  ;;(font-lock-add-keywords nil '(("^[^\n]\\{120\\}\\(.*\\)$" 1 font-lock-warning-face t)))
  )

(defun artart/common-prog-hook ()
  (subword-mode 1)
  (artart/show-prog-keywords)
  )
(add-hook 'prog-mode-hook 'artart/common-prog-hook)

;; clean trailing whitespaces automatically
(setq artart/trailing-whitespace-modes '(haskell-mode lisp-mode scheme-mode erlang-mode))

(defun artart/trailing-whitespace-hook ()
  (when (member major-mode artart/trailing-whitespace-modes)
    (delete-trailing-whitespace)))
(add-hook 'before-save-hook 'artart/trailing-whitespace-hook)

;; untabify some modes
;; (setq artart/untabify-modes '(haskell-mode lisp-mode scheme-mode erlang-mode clojure-mode))
;; (defun artart/untabify-hook ()
;;   (when (member major-mode artart/untabify-modes)
;;     (untabify (point-min) (point-max))))
;; (add-hook 'before-save-hook 'artart/untabify-hook)
