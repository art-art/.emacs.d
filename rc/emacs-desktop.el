(setq-default desktop-missing-file-warning nil)
(setq-default desktop-path (quote ("~/.emacs.d/desktop/")))
(setq-default desktop-save t)
(setq-default desktop-save-mode t)
(setq-default save-place t)

(add-to-list 'desktop-locals-to-save 'buffer-file-coding-system)
(add-to-list 'desktop-locals-to-save 'tab-width)

(defun artart/desktop-ignore-semantic (desktop-buffer-file-name)
       "Function to ignore cedet minor modes during restore of buffers"
       nil)
(add-to-list
 'desktop-minor-mode-handlers
 '(semantic-stickyfunc-mode . artart/desktop-ignore-semantic))

(add-to-list
 'desktop-minor-mode-handlers
 '(senator-minor-mode . artart/desktop-ignore-semantic))

(add-to-list 'desktop-minor-mode-handlers
             '(semantic-idle-scheduler-mode . artart/desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers
             '(semantic-idle-summary-mode . artart/desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers
             '(semantic-idle-completions-mode . artart/desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers
             '(semantic-mru-bookmark-mode . artart/desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers
             '(semantic-decoration-mode . artart/desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers
             '(srecode-minor-mode . artart/desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers
             '(ede-minor-mode . artart/desktop-ignore-semantic))

(desktop-read)
