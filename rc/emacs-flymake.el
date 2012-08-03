(require 'flymake)

(setq temporary-file-directory "/tmp")

;; todo - simply clear all default rules?
(setq flymake-allowed-file-name-masks (delete '("\\.c\\'" flymake-simple-make-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.cpp\\'" flymake-simple-make-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.cs\\'" flymake-simple-make-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.h\\'" flymake-master-make-header-init flymake-master-cleanup) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.xml\\'" flymake-xml-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.html?\\'" flymake-xml-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.tex\\'" flymake-simple-tex-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("[0-9]+\\.tex\\'" flymake-master-tex-init flymake-master-cleanup) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.java\\'" flymake-simple-make-java-init flymake-simple-java-cleanup) flymake-allowed-file-name-masks))

;;no more problems with read-only files.
(add-hook 'find-file-hook 'flymake-find-file-hook)

;; function to create files in /tmp dirs
(defun flymake/create-temp-file (file-name prefix)
  "Create the file FILE-NAME in a unique directory in the temp directory."
  (file-truename (expand-file-name (file-name-nondirectory file-name)
                                   (expand-file-name  (int-to-string (random)) (flymake-get-temp-dir)))))

;; custom clean-up function
(defun flymake/cleanup ()
  "Cleanup after `flymake-java-ecj-init' -- delete temp file and dirs."
  (flymake-safe-delete-file flymake-temp-source-file-name)
  (when flymake-temp-source-file-name
    (flymake-safe-delete-directory (file-name-directory flymake-temp-source-file-name))))

;;shows flymake erros on minibuffer
(defun flymake/show-help ()
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      (if help (message "%s" help)))))
(add-hook 'post-command-hook 'flymake/show-help)
