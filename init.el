;; Open Eshell at startup
(setq inhibit-startup-screen t) ; Disable the startup screen
(eshell)

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

(load-theme 'tao-yin t)

(defun switch-theme (theme-number)
  "Switch between themes.
   1 - tao-yin
   2 - doom-one
   3 - doom-one-light"
  (interactive "P")
  (cond
   ((equal theme-number 1) (load-theme 'tao-yin t))
   ((equal theme-number 2) (load-theme 'doom-one t))
   ((equal theme-number 3) (load-theme 'doom-one-light t))
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


(global-set-key (kbd "C-c 1") (lambda () (interactive) (find-file (concat org-directory "default.org"))))
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(setq org-directory "~/gh/myorg/")

(require 'org)
(setq org-startup-indented t)
(add-hook 'org-mode-hook 'org-indent-mode)
(setq org-M-RET-may-split-line nil)

(require 'org-id)
(setq org-id-link-to-org-use-id 'create-if-interactive)

(setq org-journal-dir "~/RH/org/journal/")

(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
(global-auto-revert-mode 1)

(setq org-capture-templates
      '(("e" "Evening routine"
	 plain (here)
	 (file "~/RH/org/templates/eveningroutine.org"):immediate-finish t)
      ("m" "Morning routine"
	 plain (here)
	 (file "~/RH/org/templates/morningroutine.org"):immediate-finish t)
      ("b" "Book entry"
	 plain (here)
	 (file "~/RH/org/templates/book.org"):immediate-finish t)
      ("t" "TODO schedule and deadline"
	 plain (here)
	 (file "~/RH/org/templates/TODOboth.org"):immediate-finish t)
      ("d" "TODO deadline"
	 plain (here)
	 (file "~/RH/org/templates/TODOdeadline.org"):immediate-finish t)
      ("s" "TODO schedule"
	 plain (here)
	 (file "~/RH/org/templates/TODOschedule.org"):immediate-finish t)
      ("j" "deadline today"
         plain (here)
         (file "~/RH/org/templates/propertydeadlinetoday.org"):immediate-finish t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("dfb1c8b5bfa040b042b4ef660d0aab48ef2e89ee719a1f24a4629a0c5ed769e8" "02d422e5b99f54bd4516d4157060b874d14552fe613ea7047c4a5cfa1288cf4f" "9e1cf0f16477d0da814691c1b9add22d7cb34e0bb3334db7822424a449d20078" "75b2a02e1e0313742f548d43003fcdc45106553af7283fb5fad74359e07fe0e2" "00cec71d41047ebabeb310a325c365d5bc4b7fab0a681a2a108d32fb161b4006" "3fe1ebb870cc8a28e69763dde7b08c0f6b7e71cc310ffc3394622e5df6e4f0da" "b54376ec363568656d54578d28b95382854f62b74c32077821fdfd604268616a" "89d9dc6f4e9a024737fb8840259c5dd0a140fd440f5ed17b596be43a05d62e67" "c5878086e65614424a84ad5c758b07e9edcf4c513e08a1c5b1533f313d1b17f1" "9013233028d9798f901e5e8efb31841c24c12444d3b6e92580080505d56fd392" "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33" "9d29a302302cce971d988eb51bd17c1d2be6cd68305710446f658958c0640f68" "162201cf5b5899938cfaec99c8cb35a2f1bf0775fc9ccbf5e63130a1ea217213" "2721b06afaf1769ef63f942bf3e977f208f517b187f2526f0e57c1bd4a000350" "4b6cc3b60871e2f4f9a026a5c86df27905fb1b0e96277ff18a76a39ca53b82e1" "13096a9a6e75c7330c1bc500f30a8f4407bd618431c94aeab55c9855731a95e1" "b1acc21dcb556407306eccd73f90eb7d69664380483b18496d9c5ccc5968ab43" "6f96a9ece5fdd0d3e04daea6aa63e13be26b48717820aa7b5889c602764cf23a" "8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" "7964b513f8a2bb14803e717e0ac0123f100fb92160dcf4a467f530868ebaae3e" "ffafb0e9f63935183713b204c11d22225008559fa62133a69848835f4f4a758c" "9f297216c88ca3f47e5f10f8bd884ab24ac5bc9d884f0f23589b0a46a608fe14" "5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874" "f4d1b183465f2d29b7a2e9dbe87ccc20598e79738e5d29fc52ec8fb8c576fcfd" "a9abd706a4183711ffcca0d6da3808ec0f59be0e8336868669dc3b10381afb6f" "8d8207a39e18e2cc95ebddf62f841442d36fcba01a2a9451773d4ed30b632443" "37b6695bae243145fa2dfb41440c204cd22833c25cd1993b0f258905b9e65577" "f5f80dd6588e59cfc3ce2f11568ff8296717a938edd448a947f9823a4e282b66" "be84a2e5c70f991051d4aaf0f049fa11c172e5d784727e0b525565bb1533ec78" "4fdbed4aa8bcb199d7f6a643886bac51178d1705b9b354ef3dd82d4ec48072d2" "0d0936adf23bba16569c73876991168d0aed969d1e095c3f68d61f87dd7bab9a" "e87fd8e24e82eb94d63b1a9c79abc8161d25de9f2f13b64014d3bf4b8db05e9a" "a9eeab09d61fef94084a95f82557e147d9630fbbb82a837f971f83e66e21e5ad" "badd1a5e20bd0c29f4fe863f3b480992c65ef1fa63951f59aa5d6b129a3f9c4c" "443e2c3c4dd44510f0ea8247b438e834188dc1c6fb80785d83ad3628eadf9294" "29b4f767c48da68f8f3c2bbf0dde2be58e4ed9c97e685af5a7ab7844f0d08b8b" "c517e98fa036a0c21af481aadd2bdd6f44495be3d4ac2ce9d69201fcb2578533" "bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e" "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098" "e4a702e262c3e3501dfe25091621fe12cd63c7845221687e36a79e17cf3a67e0" "3cdd0a96236a9db4e903c01cb45c0c111eb1492313a65790adb894f9f1a33b2d" "10e5d4cc0f67ed5cafac0f4252093d2119ee8b8cb449e7053273453c1a1eb7cc" "013728cb445c73763d13e39c0e3fd52c06eefe3fbd173a766bfd29c6d040f100" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "2078837f21ac3b0cc84167306fa1058e3199bbd12b6d5b56e3777a4125ff6851" "93011fe35859772a6766df8a4be817add8bfe105246173206478a0706f88b33d" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "56044c5a9cc45b6ec45c0eb28df100d3f0a576f18eef33ff8ff5d32bac2d9700" "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "96005f97499f0549f921f81588f190f189b7acb8bbebbcbb9033cdd340118f80" "9b39b25c3a23b1be6e99a3648b91ebaf2a7efdde236e3472aa95f1708ec61d4f" "f87f74ecd2ff6dc433fb4af4e76d19342ea4c50e4cd6c265b712083609c9b567" "801a567c87755fe65d0484cb2bded31a4c5bb24fd1fe0ed11e6c02254017acb2" "dbade2e946597b9cda3e61978b5fcc14fa3afa2d3c4391d477bdaeff8f5638c5" "1bad38d6e4e7b2e6a59aef82e27639e7a1d8e8b06bbeac6730f3e492d4f5ba46" "b2b3855b9445755b53e891d0979fcc3479b0ac3098895faffa18e67a5c605016" "d19f00fe59f122656f096abbc97f5ba70d489ff731d9fa9437bac2622aaa8b89" "b273cc6a1d492660fff886a3cae1f00d5fd2d53b55fb374a21a14afd74fdec92" "ba323a013c25b355eb9a0550541573d535831c557674c8d59b9ac6aa720c21d3" "a5270d86fac30303c5910be7403467662d7601b821af2ff0c4eb181153ebfc0a" "f366d4bc6d14dcac2963d45df51956b2409a15b770ec2f6d730e73ce0ca5c8a7" "046a2b81d13afddae309930ef85d458c4f5d278a69448e5a5261a5c78598e012" default))
 '(display-line-numbers-type 'relative)
 '(fringe-mode 0 nil (fringe))
 '(global-display-line-numbers-mode t)
 '(safe-local-variable-values '((git-commit-major-mode . git-commit-elisp-text-mode)))
 '(tool-bar-mode nil)
 '(tooltip-mode nil))


(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE")))

(setq org-agenda-files '("~/RH/org/journal/"))

(setq org-deadline-warning-days 6)

;; Prevent warning and error pop-up buffers
(setq warning-minimum-level :emergency)  ; Set the minimum warning level
(setq display-buffer-alist
      (quote
       (((".*\\*Warnings\\*.*" .  (display-buffer-no-window))
         (".*\\*Warnings\\*.*" .  (display-buffer-no-window)))
       )))

(global-set-key (kbd "C-M-;") 'ibuffer)	;

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

(setq org-ellipsis "▾")

(use-package ox-reveal
  :ensure t)

(setq org-reveal-root "file:///~/RH/dependencies/reveal.js")
