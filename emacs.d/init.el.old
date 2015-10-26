(push "/usr/local/bin" exec-path)
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/themes")
(load "thrift-mode")
(setq initial-frame-alist
      '((top . 1) (left . 1) (width . 160) (height . 40)))

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)

(fset 'yes-or-no-p 'y-or-n-p)

(delete-selection-mode t)
(menu-bar-mode -1)

(when window-system
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (set-fringe-style -1)
  (tooltip-mode -1)
)
(blink-cursor-mode -1)
(show-paren-mode t)
(column-number-mode t)
(setq mac-right-option-modifier nil)

(set-frame-font "Monaco-12")
(load-theme 'manoj-dark)

(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(require 'tramp)
(setq tramp-default-method "scp")
(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))

;; Turn on the clock!
(autoload 'display-time "time" "clock in status bar" t) ;shut up compiler
(if (locate-library "time")
    (progn
      (require 'time)
      (defconst display-time-day-and-date t)
      (defconst display-time-24hr-format t)
      (display-time))
    (message "Get time.el from your distro."))

;; Custom key bindings
(global-set-key (kbd "C-C f") 'ns-toggle-fullscreen)
(global-set-key (kbd "C-X c c") 'comment-region)
(global-set-key (kbd "C-X c u") 'uncomment-region)
(global-set-key (kbd "C-.") 'hippie-expand)
(global-set-key (kbd "C-X g") 'git-grep-in-ruby-project)
(global-set-key (kbd "C-C g") 'goto-line)
(global-set-key (kbd "C-C t") 'touch-file)
(global-set-key (kbd "C-C C-G") 'magit-status)

(setq scss-compile-at-save nil)

(defun ruby-mode-hook ()
  (autoload 'ruby-mode "ruby-mode" nil t)
  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
  (add-hook 'ruby-mode-hook '(lambda ()
                               (setq ruby-deep-arglist t)
                               (setq ruby-deep-indent-paren nil)
                               (setq c-tab-always-indent nil)
                               (setq show-trailing-whitespace t)
                               (require 'inf-ruby)
                               (require 'ruby-compilation)
;                              (define-key ruby-mode-map "{" nil)
;                              (define-key ruby-mode-map "}" nil)
                               (define-key ruby-mode-map (kbd "M-r") 'run-rails-test-or-ruby-buffer)
                               )))
(defun rhtml-mode-hook ()
  (autoload 'rhtml-mode "rhtml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
  (add-hook 'rhtml-mode-hook '(lambda ()
                           (set-face-attribute 'erb-face nil :background nil)
                           (define-key rhtml-mode-map (kbd "M-s") 'save-buffer))))

(defun yaml-mode-hook ()
  (autoload 'yaml-mode "yaml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode)))

(defun css-mode-hook ()
  (autoload 'css-mode "css-mode" nil t)
  (add-hook 'css-mode-hook '(lambda ()
                              (setq css-indent-level 2)
                              (setq css-indent-offset 2))))
(defun haml-mode-hook ()
  (add-hook 'haml-mode-hook
            '(lambda ()
               (setq indent-tabs-mode nil)
               (define-key haml-mode-map "\C-m" 'newline-and-indent))))

(defun is-rails-project ()
  (when (textmate-project-root)
    (file-exists-p (expand-file-name "config/environment.rb" (textmate-project-root)))))

(defun run-rails-test-or-ruby-buffer ()
  (interactive)
  (if (is-rails-project)
      (let* ((path (buffer-file-name))
             (filename (file-name-nondirectory path))
             (test-path (expand-file-name "test" (textmate-project-root)))
             (command (list ruby-compilation-executable "-I" test-path path)))
        (pop-to-buffer (ruby-compilation-do filename command)))
    (ruby-compilation-this-buffer)))

(defun git-grep-in-ruby-project (expression)
  (interactive "sRegexp: ")
  (vc-git-grep expression "*.{rb,haml,erb,js,scss,feature}" (textmate-project-root)))


(defun touch-file ()
  "Force modification of current file, unless already modified."
  (interactive)
  (if (and (verify-visited-file-modtime (current-buffer))
           (not (buffer-modified-p)))
      (progn
        (set-buffer-modified-p t)
        (save-buffer 0))))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("tromey" . "http://tromey.com/elpa/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))

;; el-get
;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; (unless (require 'el-get nil 'noerror)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;     (goto-char (point-max))
;;     (eval-print-last-sexp)))

;; (el-get 'sync)

(ruby-mode-hook)

;; (setq el-get-sources
;;       '(
;;         (:name ruby-mode :after (progn (ruby-mode-hook)))
;;         (:name inf-ruby  :type elpa)
;;         (:name feature-mode)
;;         (:name markdown-mode)
;;         (:name haml-mode
;;                :after (progn (haml-mode-hook)))
;;         (:name coffee-mode)
;;         (:name scss-mode)
;;         (:name ruby-compilation :type elpa)
;;         (:name css-mode 
;;                :type elpa 
;;                :after (progn (css-mode-hook)))
;;         (:name textmate
;;                :type git
;;                :url "git://github.com/defunkt/textmate.el"
;;                :load "textmate.el")
;;         (:name rhtml
;;                :type git
;;                :url "https://github.com/crazycode/rhtml.git"
;;                :features rhtml-mode
;;                :after (lambda () (rhtml-mode-hook)))
;;         (:name yaml-mode 
;;                :type git
;;                :url "http://github.com/yoshiki/yaml-mode.git"
;;                :features yaml-mode
;;                :after (progn (yaml-mode-hook)))
;;         (:name magit
;;                :type git
;;                :url "https://github.com/magit/magit.git")
               
;;         (:name enotify
;;                :type git
;;                :url "https://github.com/laynor/enotify.git")
;;         (:name full-ack)
;;         ))
;; (setq my-packages
;;       (append ()
;;               (loop for src in el-get-sources collect (el-get-source-name src))))

;; (el-get 'sync my-packages)
(add-to-list 'auto-mode-alist '("\\.scala" . scala-mode))
(add-to-list 'auto-mode-alist '("\\.sbt" . scala-mode))
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.avsc" . json-mode))
(add-to-list 'auto-mode-alist '("\\.template" . json-mode))
(add-to-list 'auto-mode-alist '("\\.avpr" . json-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.sls" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.jinja" . jinja2-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(css-indent-offset 2)
 '(js-indent-level 2)
 '(js2-basic-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
