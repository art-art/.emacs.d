(yas/initialize)
(eval-after-load 'yasnippet
  '(progn
    (add-to-list 'yas/snippet-dirs "~/.emacs.d/snippets/")
    (yas/load-snippet-dirs)))

(defun artart/update-yasnippets-on-save ()
  (when (string-match "/snippets/" buffer-file-name)
    (yas/load-snippet-dirs)
;;    (yas/reload-all)
    ))
(add-hook 'after-save-hook 'artart/update-yasnippets-on-save)
