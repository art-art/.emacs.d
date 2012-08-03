
(require 'auto-complete)
(setq ac-auto-start nil)
;;(setq ac-auto-start t)
(define-key ac-mode-map (kbd "C-TAB") 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict")

(defun artart/ac-hook ()
  (local-set-key [(control return)] 'auto-complete)
  )

(add-hook 'prog-mode-hook 'artart/ac-hook)
(add-hook 'LaTeX-mode-hook 'artart/ac-hook)
