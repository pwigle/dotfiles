(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;;; Packages
(setq packages
      '(ensime
	nyan-mode
	solarized-theme))

(package-initialize)

(dolist (pkg packages)
  (unless (package-installed-p pkg)
    (package-refresh-contents) (package-install pkg)))

(require 'ido)
(require 'ensime)
(ido-mode t)

;; Scala

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(js-indent-level 2)
 )
(tool-bar-mode -1)
(blink-cursor-mode 0)
(setq make-backup-files nil)

