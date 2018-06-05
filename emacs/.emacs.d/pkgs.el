;;; package --- lbolla pkgs.el file
;;; Commentary:
;;; 7 November 2016
;;; TODO use :defines/:functions to silence linter
;;; TODO use :custom to customize variables

;;; Code:

;;; Note: keep the `setq` here to allow commented out archives
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ;; ("marmalade" . "https://marmalade-repo.org/packages/")
        ;; ("melpa-stable" . "https://stable.melpa.org/packages/")
        ;; ("sc" . "https://joseito.republika.pl/sunrise-commander/")
        ))

(eval-when-compile
  (require 'package)
  (package-initialize)
  (unless (require 'use-package nil 'noerror)
    (package-install 'use-package)
    (require 'use-package)))

(setq use-package-always-defer t
      use-package-always-ensure t
      use-package-minimum-reported-time 0.1
      use-package-verbose t)

;; Necessary to use use-package's :bind
(require 'bind-key)

(use-package gnu-apl-mode)

;; TODO builtin, move to init?
(use-package cc-mode
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
  :hook
  (after-init . global-company-mode))

(use-package conf-mode
  :mode (((rx "rc" eos). conf-unix-mode)
         ((rx "requirements") . conf-unix-mode)))

(use-package counsel)

(use-package css-mode
  :mode ((rx ".scss" eos))
  :hook
  (css-mode . (lambda ()
                (modify-syntax-entry ?\- "w"))))

(use-package csv-mode)

(use-package cython-mode
  :after evil
  :config
  (evil-define-key 'normal cython-mode-map (kbd ",a") 'cython-show-annotated))

(use-package diminish
  :demand t
  :init
  (eval-after-load 'abbrev '(diminish 'abbrev-mode))
  (eval-after-load 'autorevert '(diminish 'auto-revert-mode))
  (eval-after-load 'eldoc '(diminish 'eldoc-mode))
  (eval-after-load 'flyspell '(diminish 'flyspell-mode))
  (eval-after-load 'hideshow '(diminish 'hs-minor-mode))
  (eval-after-load 'mml '(diminish 'mml-mode))
  (eval-after-load 'org-indent '(diminish 'org-indent-mode))
  (eval-after-load 'simple '(diminish 'auto-fill-function))
  (eval-after-load 'smerge-mode '(diminish 'smerge-mode))
  (eval-after-load 'undo-tree '(diminish 'undo-tree-mode))
  (eval-after-load 'whitespace '(diminish 'whitespace-mode)))

(use-package doc-view
  :hook
  (doc-view . (lambda ()
                (setq cursor-type nil))))

(use-package dockerfile-mode
  :mode ((rx "Dockerfile")))

(use-package dumb-jump
  :custom
  (dump-jump-prefer-searcher 'rg)
  (dumb-jump-selector 'ivy)
  :init
  (dumb-jump-mode))

(use-package electric
  :config
  (electric-indent-mode t))

(use-package elpy
  :commands
  elpy-enable
  :diminish
  :custom
  (elpy-modules '(elpy-module-sane-defaults
                  elpy-module-company
                  elpy-module-eldoc
                  elpy-module-highlight-indentation
                  elpy-module-pyvenv))
 :init
 (elpy-enable))

(use-package ess
  :hook
  (ess-mode . (lambda ()
                 (modify-syntax-entry ?\_ "w"))))

(use-package eyebrowse
  :init
  (eyebrowse-mode t))

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
  :after evil
  :config
  (evil-collection-init))

(use-package evil-magit
  :demand t
  :after (evil magit))

(use-package evil-mu4e
  :demand t
  :load-path "/home/lbolla/src/evil-mu4e/"
  :after (evil mu4e))

(use-package evil-nerd-commenter
  :demand t
  :after evil)

(use-package evil-org
  :demand t
  :diminish
  :after (evil org)
  :hook
  (org-mode . evil-org-mode)
  (evil-org-mode . (lambda ()
                     (evil-org-set-key-theme))))

(use-package evil-org-agenda
  :ensure nil  ;; Part of evil-org
  :demand t
  :after evil-org
  :config (evil-org-agenda-set-keys))

(use-package flycheck
  :diminish
  :custom
  (flycheck-idle-change-delay 3)
  (flycheck-check-syntax-automatically '(save idle-change new-line mode-enabled))
  :defines
  flycheck-javascript-flow-args
  :hook
  (after-init . global-flycheck-mode)
  :init
  (add-to-list 'display-buffer-alist
               `(,(rx bos "*Flycheck errors*" eos)
                 (display-buffer-reuse-window
                  display-buffer-below-selected)
                 (reusable-frames . visible)
                 (side            . bottom)
                 (window-height   . 0.20)))
  :config
  (setq flycheck-highlighting-mode 'lines
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
  :load-path "/home/lbolla/src/emacs-flycheck-cython/"
  :after flycheck)

(use-package flycheck-mypy
  :load-path "/home/lbolla/src/emacs-flycheck-mypy/"
  :after flycheck
  :custom
  (flycheck-python-mypy-args '("--incremental" "--ignore-missing-imports" "--follow-imports=skip"))
  :config
  (flycheck-add-next-checker 'python-pylint '(warning . python-mypy) t))

(use-package flycheck-flow
  :load-path "/home/lbolla/src/emacs-flycheck-flow/"
  :after flycheck
  :config
  ;; (flycheck-add-next-checker 'javascript-flow '(warning . javascript-flow-coverage) t)
  (flycheck-add-next-checker 'javascript-jshint '(warning . javascript-flow) t))

(use-package flycheck-rust
  :after rust-mode
  :custom
  ;; Use 'cargo check' not 'cargo test'
  (flycheck-rust-check-tests nil)
  :hook
  (flycheck-mode . flycheck-rust-setup)
  :config
  (flycheck-add-next-checker 'rust-cargo '(warning . rust-clippy) t))

(use-package fbcli
  :demand t
  :mode ((rx ".fbcli_comment" eos) . fogbugz-mode)
  :load-path "/home/lbolla/src/fbcli/")

(use-package go-mode
  :disabled t
  :custom
  (godef-command "/home/lbolla/src/go/bin/godef")
  :hook
  (before-save . gofmt-before-save)
  (go-mode . (lambda ()
               (define-key go-mode-map (kbd "K") 'godoc))))

(use-package highlight-indentation
  :diminish)

(use-package htmlize)

(use-package ivy
  :demand t
  :diminish
  :custom
  (ivy-use-virtual-buffers t)
  (magit-completing-read-function 'ivy-completing-read)
  (projectile-completion-system 'ivy)
  :config
  (ivy-mode t)
  (defvar magit-completing-read-function)
  (defvar projectile-completion-system)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  ;; (global-set-key (kbd "M-x") 'counsel-M-x)
  )

(use-package js2-mode
  :after evil
  :mode ((rx ".js" eos))
  :custom
  (js2-mode-show-strict-warnings nil)
  :functions
  set-indent
  set-whitespace-line-column
  :hook
  (js2-mode . (lambda ()
                (set-whitespace-line-column 80)
                (set-indent 4)
                (evil-define-key 'normal js2-mode-map (kbd ",b") 'js-insert-breakpoint))))

(use-package json-mode
  :hook
  (json-mode . (lambda ()
                 (set-indent 2))))

(use-package kubernetes
  :disabled t
  :load-path "/home/lbolla/src/kubernetes-el/"
  :config (progn
            (kubernetes-global-mode t)))

(use-package leuven-theme)

(use-package lisp-mode
  :ensure nil ;; builtin
  :hook
  (emacs-lisp-mode . (lambda ()
                       ;; Dash and tilde are part of a lisp word
                       (modify-syntax-entry ?\- "w")
                       (modify-syntax-entry ?\~ "w"))))

(use-package lua-mode)

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
  :hook
  (make-mode . (lambda ()
                 (setq indent-tabs-mode t))))

(use-package markdown-mode
  :hook
  (markdown-mode . (lambda ()
                     (auto-fill-mode t)
                     (set-indent 4))))

(use-package nim-mode
  :hook
  (nim-mode . nimsuggest-mode))

(use-package mu4e
  ;; TODO add this to list of paths to search
  :load-path "/usr/local/share/emacs/site-lisp/mu4e/"
  :ensure nil  ;; installed system-wide
  :demand t
  :bind (
         ("C-c m m" . mu4e)
         ("C-c m r" . (lambda () (interactive) (mu4e~request-contacts)))
         ("C-c m n" . mu4e-compose-new))
  :defines
  yg-smtp-user
  :functions
  mu4e-refresh-headers
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
                            ("/YG/Errors" . ?e)
                            ("/YG/Tickets" . ?t))
   ;; Bookmarks
   mu4e-bookmarks '(("flag:unread OR flag:flagged AND NOT flag:trashed" "Unread/flagged" ?u)
                    ("maildir:/YG/INBOX AND flag:unread AND NOT flag:trashed" "Unread inbox" ?i)
                    ("maildir:/YG/Errors AND flag:unread AND NOT flag:trashed" "Unread errors" ?e)
                    ("maildir:/YG/Tickets AND flag:unread AND NOT flag:trashed" "Unread tickets" ?t)
                    ("flag:flagged" "Flagged" ?f)
                    ("flag:attach" "With attachment" ?a)
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
   ;; mu4e-index-lazy-check t
   ;; convert html msgs to txt
   ;; mu4e-html2text-command 'mu4e-shr2text
   mu4e-html2text-command "w3m -dump -cols 120 -T text/html"  ;;; Let Emacs do the line wrapping
   ;; mu4e-html2text-command "html2text -utf8 -width 72"
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
  ;; TODO only start if not already started
  (mu4e~start)
  )

(use-package mu4e-alert
  :bind (("C-c m u" . mu4e-alert-view-unread-mails))
  :custom
  (mu4e-alert-interesting-mail-query "flag:unread OR flag:flagged AND NOT flag:trashed")
  :config
  (mu4e-alert-enable-notifications)
  (mu4e-alert-enable-mode-line-display)
  (mu4e-alert-set-default-style 'libnotify))

(use-package olivetti)

(use-package org
  :after evil
  :custom
  (org-html-htmlize-output-type 'css)
  (org-deadline-warning-days 30)
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

  :hook
  (org-mode . org-indent-mode)
  (org-mode . auto-fill-mode)
  (org-mode . flyspell-mode)

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
  (global-set-key (kbd "<f12>") (lambda () (interactive) (org-agenda nil (kbd "SPC") nil)))
  (global-set-key (kbd "S-<f12>") (lambda (match) (interactive "P") (org-tags-view t match)))
  ;; (global-set-key (kbd "C-<f12>") (lambda (c) (interactive) (execute-kbd-macro (kbd "C-c o a A"))))
  (global-set-key (kbd "M-<f12>") 'org-search-view)

  (evil-define-key 'normal org-mode-map (kbd "RET") 'org-return)

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
        '((agenda habit-down time-up deadline-up scheduled-up timestamp-up todo-state-down priority-down alpha-up category-keep tag-up)
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
        ;; https://orgmode.org/worg/org-tutorials/org-custom-agenda-commands.html
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
          ("i" "Ideas" tags "IDEA"
           ((org-agenda-overriding-header "Ideas")
            (org-tags-match-list-sublevels t)))
          ("A" agenda "Prioritized tasks"
           ((org-agenda-skip-function
             (lambda nil
               (org-agenda-skip-entry-if 'notregexp "\\=.*\\[#\[ABC\]\\]")))
            (org-agenda-overriding-header "Prioritized tasks")))
          ("u" . "Unscheduled")
          ("ut" "Unscheduled TODO" todo "TODO"
           ((org-agenda-skip-function
             (lambda nil
               (org-agenda-skip-entry-if 'scheduled 'deadline)))
            (org-agenda-overriding-header "Unscheduled TODO")))
          ("ud" "Unscheduled DONE|CANC" todo "DONE|CANC"
           ((org-agenda-skip-function
             (lambda nil
               (org-agenda-skip-entry-if 'scheduled 'deadline)))
            (org-agenda-overriding-header "Unscheduled DONE|CANC")))
          ("c" . "Filter by category")
          ("cb" "BrandIndex" tags-todo "+CATEGORY=\"BrandIndex\"")
          ("cd" "DevOps" tags-todo "+CATEGORY=\"DevOps\"")
          ("ce" "Emacs" tags-todo "+CATEGORY=\"Emacs\"")
          ("cp" "Python" tags-todo "+CATEGORY=\"Python\"")
          ("cr" "Rust" tags-todo "+CATEGORY=\"Rust\"")
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
        '(("t" "Todo"      entry (file "~/org/refile.org") "* TODO %?\n%i\n%a\n")
          ("c" "Clipboard" entry (file "~/org/refile.org") "* TODO %?\n%i\n%x\n")
          ("f" "Fogbugz"   entry (file "~/org/refile.org") "* TODO [[FB:%? %:subject :FOGB:\n%i\n%a\n")
          ("m" "Meeting"   entry (file "~/org/refile.org") "* TODO Meeting %? :MEET:\n%U")
          ("p" "Phone"     entry (file "~/org/refile.org") "* TODO Phone %? :PHON:\n%U")
          ("n" "Note"      entry (file "~/org/notes.org")  "* %? :NOTE:\n%U\n%a\n")
          ("i" "Idea"      entry (file "~/org/ideas.org")  "* %? :IDEA:\n%U\n%a\n")
          ("j" "Journal"   entry (file+datetree "~/org/diary.org") "* %?\nEntered on %U\n  %i\n  %a"))

        ;; Abbreviations
        org-link-abbrev-alist `(("FB" . ,(concat yg-fogbugz-url "/f/cases/%h"))
                                ;; ("KR" . ,(concat yg-kiln-url "/Review/K%h"))
                                ("GH" . github-issue-url)
                                ("GL" . yg-gitlab-issue-url)
                                ("MR" . yg-gitlab-merge-request-url))
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
           :base-directory "~/Private/org/"
           :exclude "\\.*"
           :include ("home.org")
           :with-broken-links t
           :publishing-directory "~/Private/"
           :publishing-function org-html-publish-to-html
           ;; :html-head "<link rel=\"stylesheet\" href=\"http://gongzhitaao.org/orgcss/org.css\" type=\"text/css\">")
           ;; "Async" CSS
           :html-postamble "<link rel=\"stylesheet\" href=\"http://gongzhitaao.org/orgcss/org.css\" type=\"text/css\">")
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

(use-package org-bullets
  :after org
  :demand t
  :hook
  (org-mode . org-bullets-mode))

(use-package org-mu4e
  :ensure nil
  :demand t
  :after (org mu4e))

(use-package paredit
  :demand t
  :diminish
  :hook
  ((emacs-lisp-mode
    eval-expression-minibuffer-setup
    ielm-mode-hook
    lisp-mode-hook
    inferior-lisp-mode-hook
    slime-repl-mode-hook
    lisp-interaction-mode-hook
    clojure-mode-hook
    cider-repl-mode-hook
    scheme-mode-hook) . enable-paredit-mode))

(use-package pass)

(use-package prog-mode
  :ensure nil
  :hook
  (prog-mode . (lambda ()
                 ;; Underscore is part of a word
                 (modify-syntax-entry ?\_ "w"))))

(use-package projectile
  :demand t
  :diminish
  :custom
  (projectile-globally-ignored-directories
   '(".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "deps" "node_modules" "build" "dist" ".cache" ".eggs" ".tox" "__pycache__" ".mypy_cache"))
  (projectile-globally-ignored-file-suffixes '("pyc"))
  (projectile-switch-project-action 'projectile-dired)
  :init
  (projectile-mode)
  (global-set-key (kbd "<f5>") 'projectile-compile-project))

(use-package nsm
  :demand t
  :custom (network-security-level 'high))

(use-package python
  :after evil
  :bind (("C-c v w" . venv-workon-and-cdproject))
  :mode (((rx ".pyi" eos) . python-mode) ;; type stub files
         ((rx ".mk" eos) . python-mode) ;; check-mk config files
         ((rx ".pyrc" eos) . python-mode))
  :config
  (font-lock-add-keywords
   'python-mode
   '(("\\<\\(TODO\\)\\>" 1 font-lock-warning-face t)
     ("\\<\\(FIXME\\)\\>" 1 font-lock-warning-face t)
     ("\\<\\(XXX\\)\\>" 1 font-lock-warning-face t)))
  :hook
  (python-mode . hs-minor-mode)
  (python-mode . (lambda ()
                   (electric-indent-local-mode -1)
                   (set-whitespace-line-column 79)
                   (evil-define-key 'normal python-mode-map (kbd ",b") 'python-insert-breakpoint)
                   (evil-define-key 'normal python-mode-map (kbd ",pi") 'python-insert-pylint-ignore)
                   (evil-define-key 'normal python-mode-map (kbd "C-]") 'elpy-goto-definition)
                   (evil-define-key 'normal python-mode-map (kbd "K") 'elpy-doc)
                   (evil-define-key 'normal python-mode-map (kbd "gf") (lambda () (interactive) (elpy-find-file t))))))

(use-package prettier-js
  :diminish
  :commands (prettier-js)
  ;; :hook
  ;; (js2-mode . prettier-js-mode)
  ;; (web-mode . prettier-js-mode)
  :custom
  (prettier-js-args '(
                      "--bracket-spacing" "false"
                      "--single-quote" "true"
                      "--tab-width" "4"
                      "--trailing-comma" "none"
                      )))

(use-package racer
  :diminish
  :after (evil rust-mode)
  ;; :hook
  ;; (rust-mode . racer-mode)
  ;; (racer-mode . eldoc-mode)
  ;; (racer-mode . company-mode)
  :init
  (evil-define-key 'normal rust-mode-map (kbd "K") 'racer-describe)
  (evil-define-key 'normal racer-help-mode-map (kbd "K") 'racer-describe)
  (evil-define-key 'normal rust-mode-map (kbd "C-]") 'racer-find-definition)
  (evil-define-key 'normal racer-help-mode-map (kbd "C-]") 'racer-find-definition))

(use-package restclient
  :mode (((rx ".http" eos) . restclient-mode)))

(use-package rg
  :custom
  (rg-group-result nil)
  (rg-custom-type-aliases '((#("gn" 0 1
                               (idx 0))
                             . "*.gn *.gni")
                            (#("gyp" 0 1
                               (idx 1))
                             . "*.gyp *.gypi")
                            (#("tmpl" 0 1
                               (idx 2))
                             . "*.tmpl")))
  :config
  (rg-define-toggle "--context 3" "x" nil))

(use-package rst
  :hook
  (rst-mode . (lambda ()
                (auto-fill-mode t))))

(use-package rust-mode
  :after evil
  :custom
  (rust-format-on-save t))

(use-package sh-script
  :mode (((rx "." (or "z" "ba") "sh") . shell-script-mode)
         ((rx ".sh" eos) . shell-script-mode)
         ((rx ".env") . shell-script-mode)))

(use-package smtpmail
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
  :ensure nil
  :hook
  (text-mode . (lambda ()
                 (flyspell-mode t))))

(use-package toml-mode
  :mode ((rx "Cargo")))

(use-package vcs-resolve
  :load-path "/home/lbolla/src/vcs-resolve/"
  :commands (vcs-resolve-at-point
             vcs-resolve-buffer
             vcs-resolve-region))

(use-package w3m)

(use-package web-mode
  :mode ((rx ".html" eos)
         (rx ".tmpl" eos))
  :custom
  (web-mode-code-indent-offset 4)
  (web-mode-css-indent-offset 2)
  (web-mode-markup-indent-offset 2)
  :hook
  (web-mode . (lambda ()
                 (modify-syntax-entry ?\- "w"))))

(use-package yaml-mode
  :mode ((rx ".y" (opt "a") "ml" eos)
         (rx ".tpl" eos))
  :hook
  (yaml-mode . (lambda ()
                 (modify-syntax-entry ?\_ "w")
                 (modify-syntax-entry ?\- "w")
                 (modify-syntax-entry ?\$ ".")
                 (set-indent 2)
                 (flyspell-mode nil))))

(use-package yasnippet
  :init
  (eval-after-load 'yasnippet '(diminish 'yas-minor-mode))
  (yas-global-mode 1))

(use-package which-key
  :diminish
  :init (which-key-mode))

(use-package zoom-window)

(provide 'pkgs)
;;; pkgs.el ends here
