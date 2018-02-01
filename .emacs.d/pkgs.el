;;; package --- lbolla pkgs.el file
;;; Commentary:
;;; 7 November 2016
;;; TODO difference between :init and :config
;;; TODO use :declare to silence linter
;;; TODO use :custom to customize variables

;;; Code:

;;; Note: keep the `setq` here to allow commented out archives
(setq package-archives
      '(
        ("melpa" . "http://melpa.org/packages/")
        ;; ("melpa-stable" . "http://stable.melpa.org/packages/")
        ;; ("marmalade" . "http://marmalade-repo.org/packages/")
        ("org" . "http://orgmode.org/elpa/")
        ;; ("gnu" . "http://elpa.gnu.org/packages/")
        ;; ("sc" . "http://joseito.republika.pl/sunrise-commander/")
        ))

(eval-when-compile
  (require 'package)
  (package-initialize)
  (require 'use-package))

(setq use-package-always-defer t
      use-package-minimum-reported-time 0.1
      use-package-verbose t)

;; Necessary to use use-package's :bind
(require 'bind-key)

;; TODO builtin, move to init?
(use-package cc-mode
  ;; :defer t
  :init
  ;; Run indent on save
  ;; (add-hook 'before-save-hook 'c-indent)
  ;; (add-hook 'cc-mode-hook
  ;;           (lambda ()
  ;;             (evil-define-key 'normal cc-mode-map (kbd ",h") 'cppref-search)))
  ;; Style used in the C++ Programming Language book
  (c-add-style "stroustrup-book"
               '("stroustrup"
                 (c-basic-offset . 4)
                 (c-offsets-alist
                  (inline-open . 0)))))

(use-package company
  :diminish
  :custom
  (company-idle-delay 0.2)
  (company-tooltip-align-annotations t)
  :init
  (add-hook 'after-init-hook 'global-company-mode))

;; racer provides its own autocompletion, but it's slow
;; TODO add more info to MATCHES (see racer)
;; TODO bind C-i instead of TAB
(use-package company-racer
  ;; :defer t
  :load-path "/home/lbolla/src/company-racer/"
  :after (company evil rust)
  :defines rust-mode-map
  :init
  (add-hook 'rust-mode-hook
            (lambda ()
              ;; (company-racer 'init)
              (evil-define-key 'insert rust-mode-map (kbd "M-TAB") 'company-racer))))

(use-package counsel)

(use-package css-mode
  ;; :defer t
  :mode (("\\.scss\\'" . css-mode))
  :init
  (add-hook 'css-mode-hook
            (lambda ()
              (modify-syntax-entry ?\- "w"))))

(use-package csv-mode
  ;; :defer t
  :mode ("\\.csv\\'" . csv-mode))

(use-package cython-mode
  ;; :defer t
  :after evil
  :config
  (evil-define-key 'normal cython-mode-map (kbd ",a") 'cython-show-annotated))

(use-package diminish
  :demand t
  :init
  ;; Diminish built-in modes here
  ;; Other modes are diminished by use-package

  ;; (diminish 'auto-revert-mode)
  ;; (diminish 'flyspell-mode)
  ;; (diminish 'hs-minor-mode)
  ;; (diminish 'whitespace-mode)

  ;; TODO auto-fill-mode
  (eval-after-load 'autorevert '(diminish 'auto-revert-mode))
  (eval-after-load 'flyspell '(diminish 'flyspell-mode))
  (eval-after-load 'hideshow '(diminish 'hs-minor-mode))
  (eval-after-load 'whitespace '(diminish 'whitespace-mode)))

(use-package doc-view
  :init
  (add-hook 'doc-view-mode
            (lambda ()
              (setq cursor-type nil))))

(use-package dockerfile-mode
  :mode (rx "Dockerfile" (zero-or-more "." (one-or-more anything)) eol))

(use-package dumb-jump
  :custom
  (dump-jump-prefer-searcher 'rg)
  (dumb-jump-selector 'ivy)
  :init
  (dumb-jump-mode))

(use-package electric
  :config
  (electric-indent-mode t)
  (add-hook 'electric-indent-functions
            'electric-indent-ignore-python))

(use-package ess
  ;; :defer t
  )

(use-package evil
  :demand t

  :custom
  ;; (evil-emacs-state-modes '(picture-mode))
  (evil-want-integration nil)
  (evil-lookup-func 'man-at-point)
  (evil-want-C-w-in-emacs-state t)

  :init
  (evil-mode t)

  :config
  (define-key evil-insert-state-map (kbd "RET") 'evil-ret-and-indent)
  (define-key evil-normal-state-map (kbd "/") 'swiper)
  (define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)
  (define-key evil-normal-state-map (kbd "gp") 'counsel-yank-pop)

  (define-key evil-normal-state-map (kbd ",=") 'c-indent)
  (define-key evil-normal-state-map (kbd ",c") 'evilnc-comment-or-uncomment-lines)
  (define-key evil-visual-state-map (kbd ",c") 'evilnc-comment-or-uncomment-lines)
  (define-key evil-normal-state-map (kbd ",ff") 'counsel-imenu)

  (define-key evil-normal-state-map (kbd ",gb") 'magit-blame)
  (define-key evil-normal-state-map (kbd ",gf") 'counsel-git)
  (define-key evil-normal-state-map (kbd ",gg") 'counsel-git-grep)

  (define-key evil-normal-state-map (kbd ",rG") 'rg-dwim)
  (define-key evil-normal-state-map (kbd ",rg") 'counsel-rg)
  (define-key evil-normal-state-map (kbd ",rp") 'rg-project)
  (define-key evil-normal-state-map (kbd ",rr") 'rg)

  (define-key evil-normal-state-map (kbd ",yp") 'yg-paste-buffer)
  (define-key evil-visual-state-map (kbd ",yp") 'yg-paste-region)

  (define-key evil-normal-state-map (kbd ",vb") 'vcs-resolve-buffer)
  (define-key evil-normal-state-map (kbd ",vp") 'vcs-resolve-at-point)
  (define-key evil-visual-state-map (kbd ",vr") 'vcs-resolve-region)

  ;; Avoid that visual selecting a region copies it to kill-ring
  (fset 'evil-visual-update-x-selection 'ignore))

(use-package evil-collection
  :demand t
  ;; :load-path "/home/lbolla/src/evil-collection/"
  :after evil
  :config
  (evil-collection-init))

(use-package evil-magit
  :demand t
  :after (evil magit))

(use-package evil-matchit
  :demand t
  :after evil
  :init (global-evil-matchit-mode 1))

(use-package evil-mu4e
  :demand t
  :load-path "/home/lbolla/src/evil-mu4e/"
  :after (evil mu4e))

(use-package evil-nerd-commenter
  :demand t
  :after evil)

(use-package evil-org
  :demand t
  :after (evil org)
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme))))

(use-package evil-org-agenda
  :demand t
  :after (evil org)
  :config (evil-org-agenda-set-keys))

(use-package flycheck
  ;; :defer t
  :diminish
  :defines
  flycheck-javascript-flow-args
  :init
  (add-to-list 'display-buffer-alist
               `(,(rx bos "*Flycheck errors*" eos)
                 (display-buffer-reuse-window
                  display-buffer-below-selected)
                 (reusable-frames . visible)
                 (side            . bottom)
                 (window-height   . 0.15)))
  (add-hook 'after-init-hook #'global-flycheck-mode)
  :config
  (setq flycheck-highlighting-mode 'lines
        flycheck-error-list-format
        [("Line" 4 flycheck-error-list-entry-< :right-align t)
         ("Col" 3 nil :right-align t)
         ("Level" 8 flycheck-error-list-entry-level-<)
         ("ID" 16 t)
         ("Message (Checker)" 0 t)]
        flycheck-ghc-language-extensions ()
        flycheck-clang-include-path '("/usr/include/glib-2.0"
                                      "/usr/lib/x86_64-linux-gnu/glib-2.0/include"
                                      "../deps"
                                      "../../deps")

        flycheck-clang-language-standard "c++11"
        flycheck-cppcheck-checks '("all")
        flycheck-cppcheck-suppressions '("constStatement")
        flycheck-flake8rc nil
        flycheck-gcc-language-standard "c++1y"
        flycheck-javascript-flow-args nil
        flycheck-pylintrc nil
        flycheck-python-flake8-executable "/home/lbolla/bin/flake8")
  (flycheck-add-next-checker 'python-flake8 'python-pylint t)
  (flycheck-add-next-checker 'c/c++-clang 'c/c++-cppcheck t))

(use-package flycheck-cython
  ;; :defer t
  :load-path "/home/lbolla/src/emacs-flycheck-cython/"
  :after flycheck)

(use-package flycheck-mypy
  ;; :defer t
  :load-path "/home/lbolla/src/emacs-flycheck-mypy/"
  :after flycheck
  :config
  ;; TODO set it depending on which Python version I'm using
  ;; TODO consider using mypy.ini in repo dir, instead
  ;; http://mypy.readthedocs.io/en/latest/config_file.html
  ;; TODO http://blog.zulip.org/2016/10/13/static-types-in-python-oh-mypy/
  (setq flycheck-python-mypy-args '("--py2" "--silent-imports"))
  (flycheck-add-next-checker 'python-pylint '(warning . python-mypy) t))

(use-package flycheck-flow
  ;; :defer t
  :load-path "/home/lbolla/src/emacs-flycheck-flow/"
  :after flycheck
  :config
  ;; (flycheck-add-next-checker 'javascript-flow '(warning . javascript-flow-coverage) t)
  (flycheck-add-next-checker 'javascript-jshint '(warning . javascript-flow) t))

(use-package flycheck-rust
  ;; :defer t
  :after rust-mode
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(use-package go-mode
  ;; :defer t
  :mode ("\\.go\\'" . go-mode)
  :custom
  (godef-command "/home/lbolla/src/go/bin/godef")
  :init
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook
            (lambda ()
              (auto-complete-mode -1)
              (define-key go-mode-map (kbd "K") 'godoc))))

(use-package htmlize)

(use-package ivy
  :diminish
  :custom
  (ivy-use-virtual-buffers t)
  (magit-completing-read-function 'ivy-completing-read)
  (projectile-completion-system 'ivy)
  :init
  (ivy-mode t)
  :config
  (defvar magit-completing-read-function)
  (defvar projectile-completion-system)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x))

(use-package jedi
  ;; :defer t
  )

(use-package js2-mode
  ;; :defer t
  :after evil
  :mode (("\\.js\\'" . js2-mode))
  :custom
  (js2-mode-show-strict-warnings nil)
  :init
  (add-hook 'js2-mode-hook
            (lambda ()
              (set-whitespace-line-column 80)
              (set-indent 4)
              (evil-define-key 'normal js2-mode-map (kbd ",b") 'js-insert-breakpoint))))

(use-package json-mode
  ;; :defer t
  :init
  (add-hook 'json-mode-hook
            (lambda ()
              (set-indent 2))))

(use-package kubernetes
  :disabled t
  :load-path "/home/lbolla/src/kubernetes-el/"
  :config (progn
            (kubernetes-global-mode t)))

(use-package leuven-theme)

(use-package lisp-mode
  ;; :defer t
  :init
  (add-hook 'emacs-lisp-mode-hook
            (lambda ()
              ;; Dash and tilde are part of a lisp word
              (modify-syntax-entry ?\- "w")
              (modify-syntax-entry ?\~ "w"))))

(use-package lua-mode
  ;; :defer t
  )

(use-package magit
  :after evil
  :defines
  magit-branch-arguments
  magit-push-always-verify
  :config
  (setq
   ;; No recent commits -- confusing
   magit-log-section-commit-count 0
   magit-branch-arguments nil
   magit-log-margin '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 18)
   magit-push-always-verify nil)

  (define-key magit-log-mode-map (kbd ",vp") 'vcs-resolve-at-point)
  (define-key magit-revision-mode-map (kbd ",vp") 'vcs-resolve-at-point)
  (define-key magit-status-mode-map (kbd "C-p") 'projectile-find-file)
  (evil-define-key 'normal magit-blame-mode-map (kbd "q") 'magit-blame-quit)
  (evil-define-key 'normal magit-blame-mode-map (kbd "RET") 'magit-show-commit))

(use-package make-mode
  ;; :defer t
  :init
  (add-hook 'make-mode-hook
            (lambda ()
              (setq indent-tabs-mode t))))

(use-package markdown-mode
  ;; :defer t
  :init
  (add-hook 'markdown-mode-hook
            (lambda ()
              (auto-fill-mode t)
              (set-indent 4))))

(use-package mu4e
  :demand t
  :load-path "/usr/local/share/emacs/site-lisp/mu4e"
  :bind (("C-c m m" . mu4e))
  :defines
  yg-smtp-user
  :config
  (setq

   ;; who am I?
   user-mail-address yg-smtp-user
   user-full-name  "Lorenzo Bolla"

   ;; Maildirs
   mu4e-maildir "/home/lbolla/Mail"
   mu4e-drafts-folder "/YG/Drafts"
   mu4e-sent-folder "/YG/Sent Items"
   mu4e-trash-folder "/YG/Deleted Items"

   ;; Shortcuts
   mu4e-maildir-shortcuts '(("/YG/INBOX"   . ?i)
                            ("/YG/Sent Items" . ?s)
                            ("/YG/Errors" . ?e))
   ;; Bookmarks
   mu4e-bookmarks '(("flag:unread AND NOT flag:trashed" "Unread messages" ?u)
                    ("maildir:/YG/INBOX AND flag:unread AND NOT flag:trashed" "Unread inbox" ?i)
                    ("maildir:/YG/Errors AND flag:unread AND NOT flag:trashed" "Unread errors" ?e)
                    ("maildir:/YG/Tickets AND flag:unread AND NOT flag:trashed" "Unread tickets" ?t)
                    ("flag:flagged" "Flagged messages" ?f)
                    ;; ("date:today..now" "Today's messages" ?t)
                    ;; ("date:7d..now" "Last 7 days" ?w)
                    ;; ("mime:image/*" "Messages with images" ?p)
                    ;; ("maildir:/YG/INBOX AND date:20170101..20171231" "2017" ?y)
                    )

   ;; Actions
   mu4e-view-actions '(("capture message" . mu4e-action-capture-message)
                       ("view as pdf" . mu4e-action-view-as-pdf)
                       ("show this thread" . mu4e-action-show-thread)
                       ("browse" . mu4e-action-view-in-browser))

   ;; don't save message to Sent Messages, Gmail/IMAP takes care of this
   ;; mu4e-sent-messages-behavior 'delete
   ;; Default MUA
   mail-user-agent 'mu4e-user-agent
   ;; Autocompletion
   mu4e-compose-complete-addresses t
   mu4e-compose-complete-only-after nil
   mu4e-compose-complete-only-personal nil
   ;; Don't include me in reply
   mu4e-user-mail-address-list `(,yg-smtp-user)
   mu4e-compose-dont-reply-to-self t
   ;; I like UTF-8
   mu4e-use-fancy-chars nil
   ;; allow for updating mail using 'U' in the main view:
   ;; mu4e-get-mail-command "offlineimap"
   ;; use crontab to call offlineimap
   mu4e-get-mail-command "true"
   ;; Update every 5 minutes
   mu4e-update-interval 300
   ;; Speed up indexing
   mu4e-index-lazy-check t
   ;; convert html msgs to txt
   ;; mu4e-html2text-command "html2text -utf8 -width 72"
   mu4e-html2text-command "w3m -dump -cols 120 -T text/html"  ;;; Let Emacs do the line wrapping
   ;; mu4e-html2text-command "iconv -c -t utf-8 | pandoc -f html -t plain | iconv -f utf-8 | fold"
   ;; mu4e-html2text-command "iconv -c -t utf-8 | pandoc -f html -t plain --columns=120"
   ;; when to prefer html over text
   mu4e-view-html-plaintext-ratio-heuristic 20
   ;; don't keep message buffers around
   message-kill-buffer-on-exit t
   ;; don't show next message when scrolling with SPC
   mu4e-view-scroll-to-next nil
   ;; where to save attachments
   mu4e-attachment-dir "/tmp"
   ;; skip duplicates introduced by gmail and offlineimap
   mu4e-headers-skip-duplicates t
   ;; Date format
   mu4e-headers-date-format "%x %X"

   mu4e-headers-fields
   '((:human-date . 18)
     (:flags . 6)
     (:mailing-list . 10)
     (:from . 22)
     (:subject))
   mu4e-headers-include-related t
   mu4e-view-show-addresses t
   mu4e-view-show-images t)

  (define-key mu4e-headers-mode-map (kbd "U") (lambda () (interactive) (mu4e-refresh-headers nil)))
  (define-key mu4e-headers-mode-map (kbd "C-u U") (lambda () (interactive) (mu4e-refresh-headers t)))
  (define-key mu4e-headers-mode-map (kbd "C-u /") 'mu4e-headers-narrow-thing-at-point)

  ;; Force adding contacts
  ;; (mu4e~request-contacts))
  ;; Force starting automatic updates
  (mu4e~start)
  )

(use-package mu4e-alert
  :bind (("C-c m u" . mu4e-alert-view-unread-mails))
  :config
  (mu4e-alert-enable-notifications)
  (mu4e-alert-enable-mode-line-display)
  (mu4e-alert-set-default-style 'libnotify))

(use-package org
  :after evil
  :mode (("\\.org\\'" . org-mode)
         ("\\diary\\'" . org-mode))
  :custom
  (org-html-htmlize-output-type 'css)
  :defines
  org-agenda-custom-commands
  org-agenda-include-diary
  org-agenda-sorting-strategy
  org-agenda-span
  org-agenda-start-on-weekday
  org-agenda-tags-column
  org-capture-templates
  org-clock-out-remove-zero-time-clocks
  org-clock-out-when-done
  org-publish-project-alist
  org-stuck-projects
  yg-fogbugz-url
  yg-kiln-url
  :init
  (global-set-key (kbd "C-c o a") 'org-agenda)
  (global-set-key (kbd "C-c o b") 'org-iswitchb)
  (global-set-key (kbd "C-c o k") 'org-capture)
  (global-set-key (kbd "C-c o l s") 'org-store-link)
  (global-set-key (kbd "C-c o l i") 'org-insert-link)
  (global-set-key (kbd "C-c o l o") 'org-open-at-point)

  (global-set-key (kbd "<f9>") 'org-capture)
  (global-set-key (kbd "C-<f9>") 'org-store-link)
  (global-set-key (kbd "S-<f9>") 'org-insert-link)
  (global-set-key (kbd "<f12>") (lambda () (interactive) (execute-kbd-macro (kbd "C-c o a SPC"))))
  (global-set-key (kbd "S-<f12>") (lambda (match) (interactive "P") (org-tags-view t match)))
  (global-set-key (kbd "C-S-<f12>") (lambda (match) (interactive "P") (org-tags-view nil match)))
  (global-set-key (kbd "C-<f12>") (lambda () (interactive) (execute-kbd-macro (kbd "C-c o a A"))))
  (global-set-key (kbd "M-<f12>") 'org-search-view)

  (evil-define-key 'normal org-mode-map (kbd "RET") 'org-return)

  (add-hook 'org-mode-hook
            (lambda ()
              (org-indent-mode t)
              (auto-fill-mode t)
              (flyspell-mode t)))

  :config
  (defface org-strt '((t (:inherit org-todo :foreground "dark orange"))) "Face used for started tasks." :group 'org-faces)
  (defface org-wait '((t (:inherit org-todo :foreground "gold"))) "Face used for waiting tasks." :group 'org-faces)
  (defface org-delg '((t (:inherit org-todo :foregrouund "dark gray"))) "Face used for delegated tasks." :group 'org-faces)
  (defface org-meet '((t (:inherit org-todo :foregrouund "deep sky blue"))) "Face used for meeting tasks." :group 'org-faces)
  (defface org-canc '((t (:inherit org-todo :foregrouund "dim gray"))) "Face used for cancelled tasks." :group 'org-faces)
  (defface org-defr '((t (:inherit org-todo :foregrouund "blue"))) "Face used for deferred tasks." :group 'org-faces)

  (setq org-agenda-files '("~/org/")
        org-agenda-include-diary t
        org-agenda-start-on-weekday nil
        org-agenda-span 1
        org-default-notes-file "~/org/refile.org"
        org-fast-tag-selection-single-key t
        org-treat-S-cursor-todo-selection-as-state-change nil
        org-src-fontify-natively t

        org-agenda-sorting-strategy
        '((agenda habit-down deadline-up time-up todo-state-down priority-down alpha-up category-keep tag-up)
          (todo priority-down category-keep alpha-up)
          (tags priority-down category-keep)
          (search category-keep))
        org-default-priority 68
        org-fontify-whole-heading-line t
        org-priority-faces '((65 . font-lock-warning-face)  ; A
                             (67 . font-lock-comment-face)) ; C
        org-priority-start-cycle-with-default nil
        org-return-follows-link t
        org-stuck-projects '("+LEVEL=2/-DONE"
                             ("TODO" "NEXT" "NEXTACTION" "CANC")
                             nil "")

        ;; Commands
        org-agenda-custom-commands
        '((" " "Agenda"
           ((agenda "" nil)
            (tags "REFILE"
                  ((org-agenda-overriding-header "Tasks to Refile")
                   (org-tags-match-list-sublevels nil)))
            (tags "-REFILE/"
                  ((org-agenda-overriding-header "Tasks to Archive")
                   (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
                   (org-tags-match-list-sublevels nil)))))
          ("n" "Notes" tags "NOTE"
           ((org-agenda-overriding-header "Notes")
            (org-tags-match-list-sublevels t)))
          ("A" agenda "Prioritized tasks"
           ((org-agenda-skip-function
             (lambda nil
               (org-agenda-skip-entry-if 'notregexp "\\=.*\\[#\[ABC\]\\]")))
            (org-agenda-overriding-header "Prioritized tasks")))
          ("u" alltodo "Unscheduled TODO"
           ((org-agenda-skip-function
             (lambda nil
               (org-agenda-skip-entry-if 'scheduled 'deadline 'regexp "\n]+>")))
            (org-agenda-overriding-header "Unscheduled TODO")))
          ;; ("d" todo "DELG" nil)
          ;; ("c" todo "DONE|DEFR|CANC" nil)
          ;; ("w" todo "WAIT" nil)
          ;; ("W" agenda "21 days" ((org-agenda-ndays 21)))
          )

        ;; Archiving
        org-archive-location "%s_archive::* Archived Tasks"

        ;; Tags
        org-agenda-tags-column -130
        org-tag-alist
        '((:startgroup)
          ("@family" . ?f)
          ("@home" . ?h)
          ("@work" . ?w)
          (:endgroup)
          ("NOTE" . ?n)
          ("MEET" . ?m)
          ("PHON" . ?p)
          ("FLAGGED" . ?+))

        ;; Templates
        org-capture-templates
        '(("t" "Todo" entry (file "~/org/refile.org") "* TODO %?\n  %i\n  %a")
          ("m" "Meeting" entry (file "~/org/refile.org") "* TODO Meeting %? :MEET:\n%U")
          ("p" "Phone" entry (file "~/org/refile.org") "* TODO Phone %? :PHON: \n%U")
          ("n" "Note" entry (file "~/org/refile.org") "* %? :NOTE:\n%U\n%a\n")
          ("j" "Journal" entry (file+datetree "~/org/diary.org") "* %?\nEntered on %U\n  %i\n  %a"))

        ;; Abbreviations
        org-link-abbrev-alist `(("FB" . ,(concat yg-fogbugz-url "/f/cases/%h"))
                                ("KR" . ,(concat yg-kiln-url "/Review/K%h"))
                                ("VR" . "https://github.com/yougov/velociraptor/issues/%h")
                                ("VR.SERVER" . "https://github.com/yougov/vr.server/issues/%h")
                                ("VR.COMMON" . "https://github.com/yougov/vr.common/issues/%h")
                                ("CHERRYPY" . "https://github.com/cherrypy/cherrypy/issues/%h")
                                ("EMPY" . "https://github.com/lbolla/EMpy/issues/%h")
                                ("GL" . yg-gitlab-issue-url))
        ;; Refiling
        org-refile-targets
        ;; '((nil :maxlevel . 9)
        ;;   (org-agenda-files :maxlevel . 9))
        '((org-agenda-files :level . 1))
        org-refile-use-outline-path t
        org-outline-path-complete-in-steps nil
        org-refile-allow-creating-parent-nodes 'confirm

        ;; Clocking
        org-clock-out-remove-zero-time-clocks t
        org-clock-out-when-done t

        ;; Todos
        org-todo-keywords
        '((sequence "TODO(t)" "STRT(s!)" "|" "DONE(d!)" "CANC(c@)")
          (sequence "WAIT(w@/!)" "DELG(l@)" "|" "DEFR(f@)" "MEET(m@)"))
        org-todo-keyword-faces
        '(("TODO" . org-todo)
          ("STRT" . org-strt)
          ("WAIT" . org-wait)
          ("DELG" . org-delg)
          ("MEET" . org-meet)
          ("CANC" . org-canc)
          ("DEFR" . org-defr)
          ("DONE" . org-done))
        org-log-done 'time
        org-log-into-drawer t
        org-publish-project-alist
        '(("home"
           :base-directory "~/Private/"
           :exclude "\\.*"
           :include ("home.org")
           :with-broken-links t
           :publishing-directory "~/Private/"
           :publishing-function org-html-publish-to-html
           :html-head "<link rel=\"stylesheet\" href=\"http://gongzhitaao.org/orgcss/org.css\" type=\"text/css\">")
           ;; "Async" CSS
           ;; :html-postamble "<link rel=\"stylesheet\" href=\"http://gongzhitaao.org/orgcss/org.css\" type=\"text/css\">")
          ("lbolla.info"
           :components ("lbolla.info-html" "lbolla.info-static" "lbolla.info-cv"))
          ("lbolla.info-static"
           :base-directory "~/src/lbolla.info/static/"
           :base-extension "png\\|jpg\\|\\|gif\\|gz\\|css"
           :publishing-directory "~/src/lbolla.info/html/"
           :recursive t
           :publishing-function org-publish-attachment)
          ("lbolla.info-cv"
           :base-directory "~/src/lbolla.info/org/"
           :exclude "\\.*"
           :include ("cv.org")
           :publishing-directory "~/src/lbolla.info/html/"
           :publishing-function org-latex-publish-to-pdf)
          ("lbolla.info-html"
           :base-directory "~/src/lbolla.info/org/"
           :publishing-directory "~/src/lbolla.info/html/"
           :recursive t
           :section-numbers nil
           :auto-sitemap t
           :sitemap-format-entry lbolla.info/org-publish-sitemap-format-entry
           :sitemap-function lbolla.info/org-publish-sitemap-function
           :sitemap-sort-files anti-chronologically
           :sitemap-style tree
           :sitemap-title "Sitemap"
           :with-toc nil
           :html-doctype "html5"
           :html-head-include-default-style nil
           :html-head-include-scripts nil
           :html-link-home "<ignored>"
           :html-link-up "<ignored>"
           :html-home/up-format "<div id=\"org-div-home-and-up\"><a accesskey=\"h\" href=\"/\">Home</a> | <a accesskey=\"a\" href=\"/articles\">Articles</a> | <a accesskey=\"c\" href=\"/cv\">CV</a> (<a href=\"/cv.pdf\">pdf</a>)</div>"
           :html-preamble lbolla.info/html-preamble
           :html-postamble nil
           :html-head "<link rel=\"stylesheet\" href=\"./css/org.css\" type=\"text/css\">"
           :html-head-extra "<link rel=\"stylesheet\" href=\"./css/extra.css\" type=\"text/css\">"
           :publishing-function org-html-publish-to-html)
          ("kubernetes"
           :components ("kubernetes-org" "kubernetes-html"))
          ("kubernetes-org"
           :base-directory "~/work/kubernetes/"
           :base-extension "org"
           :publishing-directory "/rsync:dev-lbolla:public_html/kubernetes/"
           :publishing-function org-org-publish-to-org
           :recursive t)
          ("kubernetes-html"
           :base-directory "~/work/kubernetes/"
           :base-extension "org"
           :publishing-directory "/rsync:dev-lbolla:public_html/kubernetes/"
           :publishing-function org-html-publish-to-html
           :html-head "<link rel=\"stylesheet\" href=\"http://gongzhitaao.org/orgcss/org.css\" type=\"text/css\">"
           :recursive t)
          ("cubeapi"
           :components ("cubeapi-notes" "cubeapi-static"))
          ("cubeapi-notes"
           :base-directory "~/work/cubeapi/notes/"
           :base-extension "org"
           :publishing-directory "/rsync:dev-lbolla:public_html/cubeapi/"
           :publishing-function org-html-publish-to-html
           :html-head "<link rel=\"stylesheet\" href=\"http://gongzhitaao.org/orgcss/org.css\" type=\"text/css\">"
           :recursive t)
          ("cubeapi-static"
           :base-directory "~/work/cubeapi/notes/"
           :base-extension "png\\|jpg"
           :publishing-directory "/rsync:dev-lbolla:public_html/cubeapi/"
           :recursive t
           :publishing-function org-publish-attachment))))

;; TODO not capturing email
(use-package org-mu4e
  :demand t
  :after (org mu4e))

(use-package org-bullets
  :after org
  :demand t
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package paredit
  :diminish
  :init
  (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'inferior-lisp-mode-hook    #'enable-paredit-mode)
  (add-hook 'slime-repl-mode-hook       #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'clojure-mode-hook          #'enable-paredit-mode)
  (add-hook 'cider-repl-mode-hook       #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode))
  ;; (add-hook 'comint-mode-hook           #'enable-paredit-mode)
  ;; (add-hook 'haskell-mode-hook          #'disable-paredit-mode)
  ;; (add-hook 'inferior-python-mode-hook  #'disable-paredit-mode)

(use-package pass
  ;; :defer t
  )

(use-package prog-mode
  :init
  (add-hook 'prog-mode-hook
            (lambda ()
              ;; Underscore is part of a word
              (modify-syntax-entry ?\_ "w"))))

(use-package projectile
  ;; :defer t
  :diminish
  :custom
  (projectile-globally-ignored-directories
   '(".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "deps" "node_modules" "build" "dist" ".cache" ".eggs" ".tox" "__pycache__"))
  (projectile-globally-ignored-file-suffixes '("pyc"))
  (projectile-switch-project-action 'projectile-dired)
  :init
  (projectile-mode)
  (global-set-key (kbd "<f5>") 'projectile-compile-project))

(use-package python
  ;; :defer t
  :after evil
  :mode (("\\.py\\'" . python-mode)
         ("\\.pyi\\'" . python-mode) ;; type stub files
         ("\\.mk\\'" . python-mode)) ;; check-mk config files
  :interpreter ("python" . python-mode)
  :config

  (font-lock-add-keywords
   'python-mode
   '(("\\<\\(TODO\\)\\>" 1 font-lock-warning-face t)
     ("\\<\\(FIXME\\)\\>" 1 font-lock-warning-face t)
     ("\\<\\(XXX\\)\\>" 1 font-lock-warning-face t)))

  (add-hook 'python-mode-hook
            (lambda ()
              ;; Autocompletion
              (jedi:setup)
              ;; Turn off AC and use company instead
              (auto-complete-mode -1)
              (add-to-list 'company-backends 'company-jedi)

              ;; Hideshow mode to handle folding
              (hs-minor-mode t)

              ;; PEP8set-whitespace-line-column line width
              (set-whitespace-line-column 79)

              ;; Keybidings
              (evil-define-key 'normal python-mode-map (kbd ",b") 'python-insert-breakpoint)
              (evil-define-key 'normal python-mode-map (kbd ",pt") 'python-pytest-current-function)
              (evil-define-key 'normal python-mode-map (kbd ",pT") 'python-pytest-current-file)
              (evil-define-key 'normal python-mode-map (kbd ",pf") 'python-pyformat-buffer)
              (evil-define-key 'normal python-mode-map (kbd ",pi") 'python-insert-pylint-ignore)
              ;; (evil-define-key 'normal python-mode-map (kbd ",pt") 'python-insert-type-annotation)

              ;; Enter key executes newline-and-indent
              (local-set-key (kbd "RET") 'newline-and-indent))))

;; TODO is there a way to only trigger autocompletion on keypress?
;; See https://www.gnu.org/software/emacs/manual/html_node/elisp/Completion-in-Buffers.html
(use-package racer
  :after (evil rust-mode)
  ;; Don't enable racer-mode, which turns on autocompletion, which is slow
  ;; :init
  ;; (add-hook 'rust-mode-hook
  ;;           (lambda ()
  ;;             (racer-mode)
  ;;             ;; https://github.com/racer-rust/emacs-racer/issues/86
  ;;             ;; (setq-local eldoc-documentation-function #'ignore)
  ;;             ))
  :init
  ;; For some reason, racer-describe is not "autoload"ed
  (autoload 'racer-describe "racer" nil t)
  (evil-define-key 'normal rust-mode-map (kbd "K") 'racer-describe)
  (evil-define-key 'normal rust-mode-map (kbd "C-]") 'racer-find-definition))

(use-package restclient
  ;; :defer t
  :mode (("\\.http\\'" . restclient-mode)
         ;; ("\\*HTTP Response\\*" . json-mode)
         ))

(use-package rg
  ;; :defer t
  :custom
  (rg-group-result t)
  (rg-custom-type-aliases '(("gn" . "*.gn *.gni")
                            ("gyp" . "*.gyp *.gypi")
                            ("tmpl" . "*.tmpl")))
  ;; Rerun search with context -- bind to "x" in rg results buffer
  (rg-define-toggle "--context 3" "x" nil))

(use-package rst
  ;; :defer t
  :init
  (add-hook 'rst-mode-hook
            (lambda ()
              (auto-fill-mode t))))

(use-package rust-mode
  ;; :defer t
  :after evil
  :mode (("\\.rs\\'" . rust-mode))
  :custom
  (rust-format-on-save t))

(use-package sh-script
  ;; :defer t
  :mode (("\\.zsh" . shell-script-mode)
         ("\\.bash" . shell-script-mode)
         ("\\.sh\\'" . shell-script-mode)
         ("\\.env" . shell-script-mode)))

(use-package smtpmail
  ;; :defer t
  :custom
  (send-mail-function 'smtpmail-send-it)
  :defines
  yg-smtp-server
  yg-smtp-port
  :init
  (setq smtpmail-smtp-server yg-smtp-server
        smtpmail-smtp-service yg-smtp-port
        smtpmail-mail-address yg-smtp-user
        smtpmail-stream-type 'starttls))

(use-package swiper
  :init
  (global-set-key (kbd "C-s") 'swiper))

(use-package text-mode
  :mode (((rx ".fbcli_comment" eol) . text-mode))
  :init
  (add-hook 'text-mode-hook
            (lambda ()
              (flyspell-mode t))))

(use-package toml-mode
  ;; :defer t
  )

;; Used by evil
(use-package undo-tree
  :diminish)

(use-package vcs-resolve
  ;; :defer t
  :load-path "/home/lbolla/src/vcs-resolve/"
  :commands (vcs-resolve-at-point
             vcs-resolve-buffer
             vcs-resolve-region))

(use-package virtualenvwrapper
  ;; :defer t
  :bind (("C-c v w" . venv-workon-and-cdproject))
  :config
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell))

(use-package w3m
  ;; :defer t
  )

(use-package web-mode
  ;; :defer t
  :mode (("\\.html\\'" . web-mode)
         ("\\.tmpl\\'" . web-mode))
  :config
  (add-hook 'web-mode-hook
            (lambda ()
              (modify-syntax-entry ?\- "w")
              (setq web-mode-markup-indent-offset 2
                    web-mode-css-indent-offset 2
                    web-mode-code-indent-offset 4))))

(use-package yaml-mode
  ;; :defer t
  :mode (("\\.ya?ml\\'" . yaml-mode)
         ("\\.tpl\\'" . yaml-mode))
  :init
  (add-hook 'yaml-mode-hook
            (lambda ()
              (modify-syntax-entry ?\_ "w")
              (modify-syntax-entry ?\- "w")
              (modify-syntax-entry ?\$ ".")
              (set-indent 2)
              (flyspell-mode nil))))

(use-package which-key
  :diminish
  :init (which-key-mode))

(provide 'pkgs)
;;; pkgs.el ends here
