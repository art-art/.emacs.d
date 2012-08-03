(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
;(setq org-log-done t)

(global-set-key "\e\el" 'org-store-link)
(global-set-key "\e\ec" 'org-capture)
(global-set-key "\e\ea" 'org-agenda)
(global-set-key "\e\eb" 'org-iswitchb)
 
(setq org-agenda-files (list "/Users/artemart/Dropbox/.org/agenda/planning.org"
			     "/Users/artemart/Dropbox/.org/agenda/private.org"))


;my prefer identation
(setq org-startup-indented t)
 
;;logging stuff
(setq org-log-done (quote time))
(setq org-log-into-drawer nil)
(setq org-log-redeadline (quote note))
(setq org-log-reschedule (quote time))
;todo keywords
(setq org-todo-keywords
      (quote
       ((sequence "TODO(t!)" "NEXT(n!)" "STARTED(s!)" "|" "DONE(d!/!)")
        (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE")
        (sequence "OPEN(O!)" "|" "CLOSED(C!)"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "cyan" :weight bold)
              ("STARTED" :foreground "purple" :weight bold)
              ("DONE" :foreground "green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold)
              ("OPEN" :foreground "yellow" :weight bold)
              ("CLOSED" :foreground "brown" :weght bold)
              )))
