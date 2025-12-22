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
(setq completion-styles '(orderless basic))
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

;; misc
(setq gc-cons-threshold (* 100 1024 1024))
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 2 1024 1024))))

;; packages
(vertico-mode 1)
(marginalia-mode 1)
(which-key-mode 1)
(setq which-key-idle-delay 0.5)

(global-corfu-mode 1)
(setq corfu-cycle t)
(setq corfu-auto t)
(setq corfu-auto-prefix 2)
(setq corfu-auto-delay 0.0)
(setq corfu-quit-at-boundary 'separator)
(setq corfu-quit-no-match t)
(setq corfu-preselect 'prompt)
(setq corfu-preview-current nil)

(unless (display-graphic-p)
  (require 'corfu-terminal)
  (corfu-terminal-mode 1))

(add-to-list 'completion-at-point-functions #'cape-dabbrev t)
(add-to-list 'completion-at-point-functions #'cape-file t)
(add-to-list 'completion-at-point-functions #'cape-keyword t)
(setq cape-dabbrev-min-length 2)

;; M-x package-install-selected-packages
(custom-set-variables
 '(package-selected-packages
   '(avy cape consult corfu corfu-terminal eglot magit marginalia
         markdown-mode orderless vertico which-key)))

(global-set-key (kbd "C-x b") 'consult-buffer)
(global-set-key (kbd "M-y") 'consult-yank-pop)
(global-set-key (kbd "M-g g") 'consult-goto-line)
(global-set-key (kbd "C-s") 'consult-line)

(global-set-key (kbd "C-j") 'avy-goto-char)
(global-set-key (kbd "C-x g") 'magit-status)
