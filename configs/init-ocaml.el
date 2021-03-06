;(require 'tuareg)
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
(autoload 'tuareg-mode "tuareg" "Major mode for editing OCaml code" t)
(autoload 'tuareg-run-ocaml "tuareg" "Run an inferior OCaml process." t)
(autoload 'ocamldebug "ocamldebug" "Run the OCaml debugger" t)

;(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
;(autoload 'tuareg-imenu-set-imenu "tuareg-imenu" "Configuration of imenu for tuareg" t) 
;(add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
;(setq auto-mode-alist 
;      (append '(("\\.ml[ily]?$" . tuareg-mode)
;		("\\.topml$" . tuareg-mode))
;	      auto-mode-alist))
