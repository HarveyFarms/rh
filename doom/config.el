;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(after! org
        (setq org-agenda-span 'month))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(map! :leader
      (:prefix-map ("j" . "journal")
       :desc "Capture new journal entry" "n" #'org-roam-dailies-capture-today
       :desc "Go to today's journal entry" "t" #'org-roam-dailies-goto-today
       :desc "Go to yesterday's journal entry" "y" #'org-roam-dailies-goto-yesterday
       :desc "Go to tomorrow's journal entry" "o" #'org-roam-dailies-goto-tomorrow
       :desc "Find date" "f" #'org-roam-dailies-find-date))

(defun save-buffer-and-switch-to-normal-mode ()
  "Save the buffer and switch to normal mode."
  (interactive)
  (save-buffer)
  (evil-normal-state))

(global-set-key (kbd "C-s") 'save-buffer-and-switch-to-normal-mode)
(global-set-key (kbd "C-c g s") 'org-gcal-sync)
(global-set-key (kbd "C-c g p") 'org-gcal-post-at-point)
(use-package org-roam
             :ensure t
             :init
             (setq org-roam-v2-ack t)
             :custom
             (org-roam-directory "~/org-roam")
             (org-roam-completion-everywhere t)
             (org-roam-capture-templates
               '(("d" "default" plain
                  "%?"
                  :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
                  :unnarrowed t)))
             :bind (("C-c n l" . org-roam-buffer-toggle)
                    ("C-c n f" . org-roam-node-find)
                    ("C-c n i" . org-roam-node-insert)
                    :map org-mode-map
                    ("C-M-i" . completion-at-point))
             :config
             (org-roam-setup))


(setq org-gcal-client-id "159150927089-vm128nk2ag2a41j0aft1dctg56gt90hj.apps.googleusercontent.com"
      org-gcal-client-secret "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"
      org-gcal-fetch-file-alist '(("rharv99@gmail.com" .  "~/rh/org-agenda/gcal.org")
                                  ("en.greek#holiday@group.v.calendar.google.com" .  "~/rh/org-agenda/orth.org")))