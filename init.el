;;save compulsively instead
(setq make-backup-files nil)

;;splash screen not needed and use blank scratch
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)

;;dont wrap text except for text files but then wrap words
(set-default 'truncate-lines t)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;;remove unwanted ui
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;;set tab width globally
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

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

;;rinari
(add-to-list 'load-path "~/.emacs.d/vendor/rinari")
(require 'rinari)
(global-rinari-mode)

;;rhtml
(add-to-list 'load-path "~/.emacs.d/vendor/rhtml")
(autoload 'rhtml-mode "rhtml-mode" 
  "Minor Mode for editing rhtml files" t)
(add-to-list 'auto-mode-alist '("\\.html\\.erb" . rhtml-mode))

;;ruby
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Procfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec" . ruby-mode))

;;yaml
(add-to-list 'load-path "~/.emacs.d/vendor/yaml-mode")
(autoload 'yaml-mode "yaml-mode" 
  "Major mode for editing YAML files" t)
(add-to-list 'auto-mode-alist '("\\.yml" . yaml-mode))

;;coffeescript
(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(autoload 'coffee-mode "coffee-mode" 
  "Major mode for editing CoffeeScript files" t)
(add-to-list 'auto-mode-alist '("\\.coffee" . coffee-mode))

;;scss/less
(add-to-list 'auto-mode-alist '("\\.scss" . css-mode))
(add-to-list 'auto-mode-alist '("\\.less" . css-mode))
