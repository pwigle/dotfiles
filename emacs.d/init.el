(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

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
(ido-mode t)

;; Scala
(require 'ensime)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(js-indent-level 2))

(tool-bar-mode -1)
(blink-cursor-mode 0)

