(custom-set-variables
 '(org-startup-folded nil)
 '(org-log-done t)
 '(org-hide-leading-stars t)
 '(org-agenda-include-diary t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-include-all-todo t)
 '(org-use-property-inheritance t)
; '(org-enforce-todo-dependencies t)
 '(org-special-ctrl-a/e t)
 '(org-special-ctrl-k t)
 '(org-blank-before-new-entry (quote ((heading . auto) (plain-list-item))))
 '(org-agenda-dim-blocked-tasks 'invisible)
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-completion-use-iswitchb t)
 '(org-export-allow-BIND t)
 '(diary-file "~/Dropbox/.org/diary")
 '(mark-diary-entries-in-calendar t)
 '(org-export-html-postamble t)
 '(org-export-html-postamble-format (quote (("en" "<hr><p><span class=\"author\">Author: %a (%e)</span>, <span class=\"date\">Date: %d</span></p>
"))))
 '(org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "STARTED(s)" "|" "DONE(d)"
                                     "CANCELED(c)")))
 '(org-directory "~/Dropbox/.org/")
 '(org-agenda-files (directory-files org-directory t ".*\.org$")))

(require 'org-install)
(require 'org)

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|/TODO\\)$" . org-mode))
(add-to-list 'file-coding-system-alist (cons "\\.\\(org\\|org_archive\\|/TODO\\)$"  'utf-8))

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)

(defun artart/org-mode-hook ()
  (local-set-key "\C-x\C-a" 'show-all)
  (imenu-add-to-menubar "Imenu")
  (setq comment-start nil)
  (make-variable-buffer-local 'yas/trigger-key)
  (setq yas/trigger-key [tab])
  (local-set-key [tab] 'yas/expand)
  (local-set-key [(meta tab)] 'pcomplete)
  )
(add-hook 'org-mode-hook 'artart/org-mode-hook)
(add-hook 'org-mode-hook 'turn-on-font-lock)

;; blorg mode
;(require 'blorg)

;; diary setup
(require 'diary-lib)
(add-hook 'diary-display-hook 'fancy-diary-display)

;; link abbrevs
(add-to-list 'org-link-abbrev-alist '("emacswiki" . "http://www.emacswiki.org/cgi-bin/wiki/"))
(add-to-list 'org-link-abbrev-alist '("google" . "http://www.google.com/search?q="))
(add-to-list 'org-link-abbrev-alist '("ms-spec" . "http://localhost/~ott/data-formats-doc/Microsoft%20Specs/[%s].pdf"))
(add-to-list 'org-link-abbrev-alist '("BZ" . "https://bugzilla.corp.nai.org/bugzilla/show_bug.cgi?id="))

;; remember mode
(org-remember-insinuate)
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cr" 'org-remember)

;; mobile org support
(setq org-mobile-inbox-for-pull (concat org-directory "/mobile.org"))
(setq org-mobile-directory "~/Dropbox/.org")

(setq org-remember-templates
      '(
        ("Todo" ?t "* TODO %?\n  %i\n  %a" (concat org-directory "/TODO.org") "Tasks")
        ))

;; icalendar
(autoload 'icalendar-import-buffer "icalendar" "Import iCalendar data from current buffer" t)

;; org + appt
;; Run once, activate and schedule refresh
;; (defun artart/org-agenda-to-appt ()
;;   (interactive)
;;   (setq appt-time-msg-list nil)
;;   (org-agenda-to-appt))

;; (add-hook 'org-finalize-agenda-hook 'artart/org-agenda-to-appt)
;; (artart/org-agenda-to-appt)
;; (run-at-time "24:01" nil 'artart/org-agenda-to-appt)
;; (run-at-time "00:59" 3600 'org-save-all-org-buffers)
;; ;; (run-at-time nil 3600 'org-agenda-to-appt)
;; (appt-activate t)

;; ;; 5 minute warning
;; (setq appt-message-warning-time '60)
;; (setq appt-display-interval '15)

;; ;; on screen display
;; (defun org-osd-display (min-to-app new-time msg)
;;   (osd-display msg msg -1 "center" "center" "Verdana 40")
;;   )

;; (setq appt-disp-window-function (function org-osd-display))
;; ;; Update appt each time agenda opened.
;; (setq appt-display-format 'window)

;; drawing diagrams with ditaa
;;(setq org-ditaa-jar-path "~/bin/ditaa0_6b.jar")

;; babel setup
(org-babel-do-load-languages
 'org-babel-load-languages
 '((clojure . t)
  (haskell . t)
  (C . t)
  (emacs-lisp . t)
  (R . t)
  (sh . t)
))

;; Org-Drill - flash-cards, a-la Anki...
(require 'org-drill)

