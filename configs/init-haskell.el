;;(load (concat emacs-dir "haskell-mode/haskell-site-file"))

;;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-to-list 'completion-ignored-extensions ".hi")


 ;; Customization
;;(custom-set-variables
;; ;; Use cabal-dev for the GHCi session. Ensures our dependencies are in scope.
;; '(haskell-process-type 'cabal-dev)
;
 ;; Use notify.el (if you have it installed) at the end of running
 ;; Cabal commands or generally things worth notifying.
;; '(haskell-notify-p t))
;; (add-hook 'haskell-mode-hook 'haskell-hook)
;; (add-hook 'haskell-cabal-mode-hook 'haskell-cabal-hook)
 ;; Haskell main editing mode key bindings.
;;(defun haskell-hook ()
  ;; Use simple indentation.
;;  (turn-on-haskell-simple-indent)
;;  (define-key haskell-mode-map (kbd "<return>") 'haskell-simple-indent-newline-same-col)
;;  (define-key haskell-mode-map (kbd "C-<return>") 'haskell-simple-indent-newline-indent)

  ;; Load the current file (and make a session if not already made).
;;  (define-key haskell-mode-map [?\C-c ?\C-l] 'haskell-process-load-file)
;;  (define-key haskell-mode-map [f5] 'haskell-process-load-file)
  ;; Switch to the REPL.
;;  (define-key haskell-mode-map [?\C-c ?\C-z] 'haskell-interactive-switch)
  ;; “Bring” the REPL, hiding all other windows apart from the source
  ;; and the REPL.
;;  (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)

  ;; Build the Cabal project.
;;  (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  ;; Interactively choose the Cabal command to run.
;;  (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)

  ;; Get the type and info of the symbol at point, print it in the
  ;; message buffer.
;;  (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
;;  (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)

  ;; Contextually do clever things on the space key, in particular:
  ;;   1. Complete imports, letting you choose the module name.
  ;;   2. Show the type of the symbol after the space.
;;  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)

  ;; Jump to the imports. Keep tapping to jump between import
  ;; groups. C-u f8 to jump back again.
;;  (define-key haskell-mode-map [f8] 'haskell-navigate-imports)

  ;; Jump to the definition of the current symbol.
;;  (define-key haskell-mode-map (kbd "M-.") 'haskell-mode-tag-find)

  ;; Save the current buffer and generate etags (a TAGS file) for the
  ;; whole project.
;;  (define-key haskell-mode-map (kbd "C-x C-s") 'haskell-mode-save-buffer-and-tags)
  ;; Indent the below lines on columns after the current column.
;;(define-key haskell-mode-map (kbd "C-<right>")
;;(lambda ()
;;  (interactive)
;;  (haskell-move-nested 1)))
;; Same as above but backwards.
;;(define-key haskell-mode-map (kbd "C-<left>")
;;(lambda ()
;;  (interactive)
;;  (haskell-move-nested -1))))

 ;; Useful to have these keybindings for .cabal files, too.
;;(defun haskell-cabal-hook ()
;;  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
;;  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)
;;  (define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
;;  (define-key haskell-cabal-mode-map [?\C-c ?\C-z]
;;  'haskell-interactive-switch))

;; Flymake Haskell Init

(defun flymake-haskell-init ()
  "When flymake triggers, generates a tempfile containing the
  contents of the current buffer, runs `hslint` on it, and
  deletes file. Put this file path (and run `chmod a+x hslint`)
  to enable hslint: https://gist.github.com/1241073"
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "hslint" (list local-file))))

(defun flymake-haskell-enable ()
  "Enables flymake-mode for haskell, and sets <C-c d> as command
  to show current error."
  (when (and buffer-file-name
             (file-writable-p
              (file-name-directory buffer-file-name))
             (file-writable-p buffer-file-name))
    (local-set-key (kbd "C-c d") 'flymake-display-err-menu-for-current-line)
    (flymake-mode t)))

;; Forces flymake to underline bad lines, instead of fully
;; highlighting them; remove this if you prefer full highlighting.
(custom-set-faces
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))
