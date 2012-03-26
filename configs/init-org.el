(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(global-set-key "\e\el" 'org-store-link)
(global-set-key "\e\ec" 'org-capture)
(global-set-key "\e\ea" 'org-agenda)
(global-set-key "\e\eb" 'org-iswitchb)
 
(setq org-agenda-files (list "~/Dropbox/.org/work.org"
			     "~/Dropbox/.org/education.org"
			     "~/Dropbox/.org/home.org"))


;my prefer identation
(setq org-startup-indented t)
 
;;logging stuff
(setq org-log-done (quote time))
(setq org-log-into-drawer nil)
(setq org-log-redeadline (quote note))
(setq org-log-reschedule (quote time))
;todo keywords
(setq org-todo-keywords
      (quote ((sequence "TODO(t!)" "NEXT(n!)" "WAITING(w@/!)" "STARTED(s!)" "|" "DONE(d!/!)" "CANCELLED(c@/!)")
              (sequence "QUOTE(Q!)" "QUOTED(D!)" "|" "APPROVED(A@)" "EXPIRED(E@)" "REJECTED(R@)")
              (sequence "OPEN(O!)" "|" "CLOSED(C!)"))))
