(add-to-list 'load-path "~/.emacs.d/vendor")
(require 'rubocopfmt)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://melpa.org/packages/") t)

;;; Packages
(setq packages
      '(ensime
	restclient
	nyan-mode
        yaml-mode
        haml-mode
        clojure-mode
        json-mode
        markdown-mode
        elm-mode
        pug-mode
        coffee-mode
        typescript-mode
        elixir-mode
        alchemist
        dumb-jump
        terraform-mode
	solarized-theme))

(package-initialize)

(dolist (pkg packages)
  (unless (package-installed-p pkg)
    (package-refresh-contents) (package-install pkg)))

(require 'ido)
(require 'ensime)
(ido-mode t)

(tool-bar-mode -1)
(blink-cursor-mode 0)
(setq make-backup-files nil)
(set-default-font "Monaco 14")
(setq ruby-insert-encoding-magic-comment nil)
(dumb-jump-mode)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(load-theme 'tango-dark)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
