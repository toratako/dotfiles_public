;; ui settings
(load-theme 'wombat t)

(menu-bar-mode -1)
(tool-bar-mode -1)

(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq ring-bell-function 'ignore)

(setq-default cursor-type 'bar)
(setq-default show-trailing-whitespace t)

;; completion settings
(setq completion-styles '(basic partial-completion substring flex))
(setq completions-format 'vertical)
(setq tab-always-indent 'complete)

;; input settings
(xterm-mouse-mode 1)
(setq use-short-answers t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq line-move-visual t)
(setq scroll-conservatively 101)
(setq scroll-margin 5)

;; editing enhancements
(show-paren-mode 1)
(global-hl-line-mode 1)
(electric-pair-mode 1)
(global-display-line-numbers-mode 1)
(delete-selection-mode 1)
(global-auto-revert-mode 1)

;; session settings
(save-place-mode 1)
(savehist-mode 1)

;; backup settings
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

;; undo settings
(setq undo-limit 800000)
(setq undo-strong-limit 12000000)
(setq undo-outer-limit 120000000)
