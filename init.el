;; Open Eshell at startup
(setq inhibit-startup-screen t) ; Disable the startup screen
(term "/bin/bash")
(setq confirm-kill-processes nil)

(defun run-shell-command-no-output (command)
  "Run shell COMMAND and display output in echo area."
  (interactive "sShell command: ")
  (message "%s" (shell-command-to-string command)))

(global-set-key (kbd "M-!") 'run-shell-command-no-output)


(setq pop-up-windows nil)
(setq ring-bell-function 'ignore)

(add-to-list 'load-path "~/src/org-mode/lisp")

;; Add Melpa package source when using package list
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;; Startup
;;; PACKAGE LIST
;; Bootstrap `straight.el`
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Set up `straight.el`
(straight-use-package 'use-package)
(straight-use-package
 '(org :host github :repo "emacs-straight/org-mode"))


;; Configure package archives
(setq straight-use-package-by-default t)

;;; UNDO
;; Vim style undo not needed for emacs 28
(unless (package-installed-p 'undo-fu)
  (package-install 'undo-fu))

;;; Vim Bindings
(unless (package-installed-p 'evil)
  (package-install 'evil))
(define-key global-map (kbd "<escape>") #'keyboard-escape-quit)
;; to work properly with evil-collection
(setq evil-want-keybinding nil)
;; no vim insert bindings
(setq evil-undo-system 'undo-fu)
(evil-mode 1)

;;; Vim Bindings Everywhere else
(unless (package-installed-p 'evil-collection)
  (package-install 'evil-collection))
(setq evil-want-integration t)
(evil-collection-init)

(straight-use-package 'display-line-numbers)

(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(setq display-line-numbers-grow-only t)
(setq display-line-numbers-width-start t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:height 1.5 :weight bold))))
 '(org-level-2 ((t (:height 1.3 :weight bold))))
 '(org-level-3 ((t (:height 1.15 :weight bold))))
 '(org-level-4 ((t (:height 1.05 :weight bold))))
 '(org-level-5 ((t (:height 1.0 :weight bold)))))

(load-theme 'doom-one t)

(defun switch-theme (theme-number)
  (interactive "P")
  (cond
   ((equal theme-number 1) (load-theme 'doom-nord-light t))
   ((equal theme-number 2) (load-theme 'doom-one t))
   ((equal theme-number 3) (load-theme 'doom-gruvbox t))
   (t (message "Invalid theme number"))))

(global-set-key (kbd "C-c t 1") (lambda () (interactive) (switch-theme 1)))
(global-set-key (kbd "C-c t 2") (lambda () (interactive) (switch-theme 2)))
(global-set-key (kbd "C-c t 3") (lambda () (interactive) (switch-theme 3)))


(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  :config
  (setq completion-ignore-case t)
  (setq completion-ignore-case-insensitive t)
  (define-key vertico-map (kbd "C-j") 'vertico-next)
  (define-key vertico-map (kbd "C-k") 'vertico-previous))

(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install))

(defun my-org-agenda-custom-keys ()
  (local-set-key (kbd "C-j") 'org-agenda-next-line)
  (local-set-key (kbd "C-k") 'org-agenda-previous-line))

(add-hook 'org-agenda-mode-hook 'my-org-agenda-custom-keys)


(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(setq org-directory "~/rh/org/")

(require 'org)
(setq org-startup-indented t)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'org-indent-mode)
(setq org-M-RET-may-split-line nil)

(require 'org-id)
(setq org-id-link-to-org-use-id 'create-if-interactive)

(setq org-journal-dir "~/rh/org/journal/")

(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
(global-auto-revert-mode 1)

(setq org-capture-templates
      '(("t" "today's routine"
	 plain (here)
	 (file "~/rh/org/templates/todaysroutine.org"):immediate-finish t)
      ("b" "Book entry"
	 plain (here)
	 (file "~/rh/org/templates/book.org"):immediate-finish t)
      ("d" "TODO"
	 plain (here)
	 (file "~/rh/org/templates/TODOdeadline.org"):immediate-finish t)))

(setq org-todo-keywords
      '((sequence "todo" "goal" "|" "undone" "done")))

(setq org-todo-keyword-faces
        '(("todo" . (:foreground "gold" :weight bold))   
        ("goal" . (:foreground "blue" :weight bold))   
        ("done" . (:foreground "rgb:80/80/80" :weight bold))
        ("undone" . (:foreground "red" :weight bold)))) 

(setq org-agenda-files '("~/rh/org/journal/"))

(setq org-deadline-warning-days 6)

;; Prevent warning and error pop-up buffers
(setq warning-minimum-level :emergency)  ; Set the minimum warning level
(setq display-buffer-alist
      (quote
       (((".*\\*Warnings\\*.*" .  (display-buffer-no-window))
         (".*\\*Warnings\\*.*" .  (display-buffer-no-window)))
       )))

(global-set-key (kbd "C-M-;") 'switch-to-buffer)	;

(use-package auto-complete
  :ensure t
  :config
  (ac-config-default)

;; Customize keybindings for navigating through auto-complete suggestions
(define-key ac-completing-map (kbd "C-j") 'ac-next)
(define-key ac-completing-map (kbd "C-k") 'ac-previous)
)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (emacs-lisp . t)))

;; Install org-bullets if you haven't already
(use-package org-bullets
  :ensure t
  :config
  (setq org-bullets-bullet-list
        '("◉" "◎" "●" "◆" "▲" "★" "♥" "♦"))
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )
;; Install elscreen
(use-package elscreen
  :ensure t
  :config
  (elscreen-start))

;; Set up keybindings
(global-set-key (kbd "C-x 8") 'elscreen-previous)
(global-set-key (kbd "C-x 9") 'elscreen-next)
(global-set-key (kbd "C-x 0") 'elscreen-create)
(global-set-key (kbd "C-x +") 'elscreen-goto)
(global-set-key (kbd "C-x -") 'elscreen-kill)

(setq ibuffer-never-show-predicates
      (list "\\*scratch\\*" "\\*Messages\\*" "output\\*"))

(setq org-ellipsis "˯")

(use-package ox-reveal
  :ensure t)

(setq org-reveal-root "file:///~/rh/dependencies/reveal.js")

(defun open-chrome ()
  (interactive)
  (browse-url "https://www.youtube.com/watch?v=lcrVmGOMXeA")) 

(global-set-key (kbd "C-c p") 'open-chrome) ; Adjust the keybinding

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(display-battery-mode t)
 '(display-line-numbers-type 'relative)
 '(display-time-mode t)
 '(global-display-line-numbers-mode t)
 '(line-number-mode nil)
 '(menu-bar-mode nil)
 '(org-capture-templates
   '(("l" "log" plain
      (here)
      (file "~/rh/org/templates/log.org")
      :immediate-finish t)
     ("b" "Book entry" plain
      (here)
      (file "~/rh/org/templates/book.org")
      :immediate-finish t)) t)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))

