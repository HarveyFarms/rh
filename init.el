;; Open Eshell at startup
(setq inhibit-startup-screen t) ; Disable the startup screen
(eshell)

(setq org-startup-folded t)

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


(defun save-buffer-and-enter-normal-mode ()
  (interactive)
  (save-buffer)
  (evil-normal-state))

(global-set-key (kbd "C-s") 'save-buffer-and-enter-normal-mode)
