;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(set-default-font "Monaco")
(set-face-attribute 'default nil :height 110)

(setq x-select-enable-clipboard t)
(setq column-number-mode t)
(delete-selection-mode t)

(global-linum-mode 1)
(line-number-mode 1)
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq file-name-coding-system 'utf-8)
(windmove-default-keybindings 'meta) ;; alt + \arrow_keys\.
(fset 'yes-or-no-p 'y-or-n-p) ;; yes or no replace on y and n.

(setq temporary-file-directory "/tmp")

(global-set-key [?\C-,] 'previous-buffer)
(global-set-key [?\C-.] 'next-buffer)

(require 'dirtree)
(require 'hl-line+)
(toggle-hl-line-when-idle 1)

(setq desktop-dirname             "~/.emacs.d/desktop/"
      desktop-base-file-name      "emacs.desktop"
      desktop-base-lock-name      "lock"
      desktop-path                (list desktop-dirname)
      desktop-save                t
      desktop-files-not-to-save   "^$" ;reload tramp paths
      desktop-load-locked-desktop nil)
(desktop-save-mode 1)

(iswitchb-mode 1)
(global-set-key [f5] 'bookmark-set)
(global-set-key [f6] 'bookmark-jump)
