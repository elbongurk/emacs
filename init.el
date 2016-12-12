;;save compulsively instead
(setq make-backup-files nil)

;;we hates splash
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)

;;we hates ui
(unless (memq window-system '(mac ns))
  (when (fboundp 'menu-bar-mode)
    (menu-bar-mode -1)))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))

;;we hates tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;;load melpa packages
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))


(setq package-list '(markdown-mode
                     yaml-mode
                     scss-mode
                     coffee-mode
                     web-mode
                     projectile
                     projectile-rails
                     bundler
                     git-commit
                     gitconfig-mode
                     gitignore-mode
                     solarized-theme
                     exec-path-from-shell))
(eval-when-compile
  (require 'cl))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;;setup erc
(when (package-installed-p 'erc)
  (setq erc-hide-list '("JOIN" "PART" "QUIT")))

;;setup ruby-mode
(when (package-installed-p 'ruby-mode)
  (add-to-list 'auto-mode-alist '("Procfile\\'" . ruby-mode)))

;;setup css-mode
(when (package-installed-p 'css-mode)
  (setq css-indent-offset 2))

;;setup js-mode
(when (package-installed-p 'js)
  (setq js-indent-level 2))

;;setup projectile
(when (package-installed-p 'projectile)
  (setq projectile-completion-system 'default)
  (projectile-global-mode))

;;setup projectile-rails
(when (package-installed-p 'projectile-rails)
  (add-hook 'projectile-mode-hook 'projectile-rails-on))

;;setup web-mode
(when (package-installed-p 'web-mode)
  (setq web-mode-markup-indent-offset 2)
  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode)))

;;setup markdown-mode
(when (package-installed-p 'markdown-mode)
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode)))

;;setup git-commit
(when (package-installed-p 'git-commit)
  (global-git-commit-mode t))

;;setup window systems
(when window-system
  ;;setup scroll wheel for one line at a time
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
  (setq mouse-wheel-progressive-speed nil)
  (setq mouse-wheel-follow-mouse 't)
  ;;setup solarized
  (when (package-installed-p 'solarized-theme)
    (load-theme 'solarized-dark t)))

;;setup mac
(when (memq window-system '(mac ns))
  ;;we hates popups
  (setq ns-pop-up-frames nil)
  ;;we likes emoji
  (set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji") nil 'prepend)
  ;;setup exec-path-from-shell
  (when (package-installed-p 'exec-path-from-shell)
    (exec-path-from-shell-initialize)))
