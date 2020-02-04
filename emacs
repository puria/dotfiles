;; -*- emacs-lisp -*-

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(package-selected-packages
   (quote
    (neotree magit spaceline-all-the-icons org nyan-mode))))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-message t)

(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(setq package-load-list '(all))
(unless (package-installed-p 'org)
  (package-install 'org))
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(nyan-mode)
(nyan-start-animation)
(require 'spaceline-all-the-icons)
(require 'use-package)
(use-package all-the-icons)
(use-package spaceline-all-the-icons 
  :after spaceline
  :config (spaceline-all-the-icons-theme))
(spaceline-all-the-icons--setup-neotree)
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(global-set-key (kbd "C-x g") 'magit-status)
(put 'erase-buffer 'disabled nil)
