(defun make-windows-3 ()
  "Make three windows"
  (interactive)
  (delete-other-windows)
  ;(sr-speedbar-open)
  (split-window-vertically)
  (split-window-horizontally)
  (dired "~/")
  )

(defun make-windows-2 ()
  "Make two windows"
  (interactive)
  (delete-other-windows)
  (split-window-horizontally)
  (dired "~/")
  )

(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 199))
