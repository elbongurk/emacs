;;save compulsively instead
(setq make-backup-files nil)

;;splash screen not needed and use blank scratch
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)

;;remove unwanted ui
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;;set tab width globally
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq js-indent-level 2)
(setq css-indent-offset 2)

;;disable Emacs version control
(setq vc-handled-backends nil)

;;get the PATH variable right on Mac windowed Emacs
(add-to-list 'load-path "~/.emacs.d/vendor/exec-path-from-shell")
(when (memq window-system '(mac ns))
  (require 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

;;markdown
(add-to-list 'load-path "~/.emacs.d/vendor/markdown-mode")
(autoload 'markdown-mode "markdown-mode" 
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))

