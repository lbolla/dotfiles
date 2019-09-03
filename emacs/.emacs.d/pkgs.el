;;; package --- lbolla pkgs.el file
;;; Commentary:
;;; 7 November 2016

;;; Code:

(defvar my/lesser-evil)
(defvar package-archives)

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

(use-package company-lsp
  :config
  (push 'company-lsp company-backends))

(use-package conf-mode
  :mode (((rx "rc" eos) . conf-unix-mode)
         ((rx ".pycheckers" eos) . conf-unix-mode)
         ((rx ".importlinter" eos) . conf-unix-mode)
         ((rx "requirements") . conf-unix-mode))

  :hook
  (conf-mode . (lambda ()
                 (modify-syntax-entry ?\_ "w"))))

(use-package counsel)

(use-package css-mode
  :mode ((rx ".scss" eos))
  :hook
  (css-mode . (lambda ()
                (modify-syntax-entry ?\- "w"))))

(use-package csv-mode
  :hook
  (csv-mode . (lambda ()
                 (variable-pitch-mode 0))))

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
  :functions
  dumb-jump-mode
  :custom
  (dump-jump-prefer-searcher 'rg)
  (dumb-jump-selector 'ivy)
  (dumb-jump-window 'other)
  :init
  (dumb-jump-mode))

(use-package electric
  :config
  (electric-indent-mode t))

;; TODO lsp
;; (use-package elpy
;;   :after python
;;   :diminish
;;   :custom
;;   (elpy-modules '(elpy-module-sane-defaults
;;                   elpy-module-company
;;                   elpy-module-eldoc
;;                   elpy-module-highlight-indentation
;;                   elpy-module-pyvenv))
;;   :init
;;   (elpy-enable))

(use-package erlang-start
  :load-path "/usr/lib/erlang/lib/tools-3.1/emacs/"
  :mode (((rx ".erl" eos) . erlang-mode)
         ((rx ".app.src" eos) . erlang-mode)
         ((rx ".hrl" eos) . erlang-mode)
         ((rx ".config" eos) . erlang-mode)
         ((rx "rebar") . erlang-mode))
  :custom
  (erlang-root-dir "/usr")
  :defines
  erlang-mode-map
  erlang-shell-mode-map
  erlang-man-file-regexp
  :hook
  (erlang-mode . (lambda ()
                   (evil-define-key 'normal erlang-mode-map (kbd "K") 'erlang-man-function)
                   ;; Only consider 3erl man files
                   (setq erlang-man-file-regexp
                         "\\(.*\\)/man[^/]*/\\([^.]+\\.3erl\\)\\(\\.gz\\)?$")
                   (defun erlang-man-get-files (dir)
                     "Return files in directory DIR."
                     (directory-files dir t ".+\\.3erl\\(\\.gz\\)?\\'"))))
  (erlang-shell-mode . (lambda ()
                         (evil-define-key 'normal erlang-shell-mode-map (kbd "K") 'erlang-man-function))))

(use-package ess
  :disabled t
  :hook
  (ess-mode . (lambda ()
                 (modify-syntax-entry ?\_ "w"))))

(use-package esup
  :disabled t)

(use-package eyebrowse
  :demand t
  :config
  (eyebrowse-mode t))

(use-package expand-region
  :bind
  ("C-=" . er/expand-region))

(use-package evil
  :demand t
  :custom
  (evil-want-keybinding nil)
  (evil-want-integration t)
  (evil-default-state 'normal)

  (evil-lookup-func 'man-at-point)
  (evil-want-C-w-in-emacs-state (not my/lesser-evil))
  ;; Or it masks <TAB> in non-graphical mode
  (evil-want-C-i-jump nil)

  :init
  (evil-mode t)

  :config

  (evil-set-initial-state 'dired-mode 'emacs)
  (evil-set-initial-state 'eshell-mode 'emacs)
  (evil-set-initial-state 'eww-mode 'emacs)
  (evil-set-initial-state 'pass-mode 'emacs)

  (define-key evil-insert-state-map (kbd "RET") 'evil-ret-and-indent)
  (define-key evil-normal-state-map (kbd "/") 'swiper)
  (define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)
  (define-key evil-normal-state-map (kbd "gp") 'counsel-yank-pop)

  (define-key evil-normal-state-map (kbd ",c") 'evilnc-comment-or-uncomment-lines)
  (define-key evil-visual-state-map (kbd ",c") 'evilnc-comment-or-uncomment-lines)
  (define-key evil-normal-state-map (kbd ",ff") 'counsel-imenu)

  (define-key evil-normal-state-map (kbd ",gb") 'magit-blame-addition)
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

(unless my/lesser-evil
  (use-package evil-collection
    :demand t
    :after evil
    :config
    (evil-collection-init)))

(unless my/lesser-evil
  (use-package evil-magit
    :demand t
    :after (evil magit)))

(unless my/lesser-evil
  (use-package evil-nerd-commenter
    :demand t
    :after evil))

(unless my/lesser-evil
  (use-package evil-org
    :demand t
    :diminish
    :after (evil org)
    :hook
    (org-mode . evil-org-mode)
    (evil-org-mode . (lambda ()
                       (evil-org-set-key-theme)))))

(unless my/lesser-evil
  (use-package evil-org-agenda
    :ensure nil  ;; Part of evil-org
    :demand t
    :after evil-org
    :config (evil-org-agenda-set-keys)))

(use-package flycheck
  :diminish
  :custom
  ;; (flycheck-idle-change-delay 3)
  (flycheck-check-syntax-automatically '(save idle-change new-line mode-enabled))
  (flycheck-highlighting-mode 'lines)
  (flycheck-ghc-language-extensions ())
  (flycheck-clang-include-path '("/usr/include/glib-2.0"
                                 "/usr/lib/x86_64-linux-gnu/glib-2.0/include"
                                 "../deps"
                                 "../../deps"))
  (flycheck-clang-language-standard "c++11")
  (flycheck-cppcheck-checks '("all"))
  (flycheck-cppcheck-suppressions '("constStatement"))
  (flycheck-flake8rc "setup.cfg")
  (flycheck-gcc-language-standard "c++1y")
  (flycheck-javascript-flow-args nil)
  ;; (flycheck-pylintrc nil)
  ;; (flycheck-python-flake8-executable nil)
  ;; (flycheck-python-mypy-cache-dir "/dev/null")
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
  (flycheck-add-next-checker 'c/c++-clang 'c/c++-cppcheck t))

(use-package flycheck-color-mode-line
  :after flycheck
  :hook
  (flycheck-mode . flycheck-color-mode-line-mode))

(use-package flycheck-cython
  :disabled t
  :load-path "/home/lbolla/src/emacs-flycheck-cython/"
  :after flycheck
  :demand t)

(use-package flycheck-dialyzer
  :disabled t
  :after flycheck
  :demand t
  :config
  (flycheck-add-next-checker 'erlang '(warning . erlang-dialyzer) t))

(use-package flycheck-flow
  :disabled t
  :load-path "/home/lbolla/src/emacs-flycheck-flow/"
  :after flycheck
  :config
  ;; (flycheck-add-next-checker 'javascript-flow '(warning . javascript-flow-coverage) t)
  (flycheck-add-next-checker 'javascript-jshint '(warning . javascript-flow) t))

(use-package flycheck-popup-tip
  :after flycheck
  :hook
  (flycheck-mode . flycheck-popup-tip-mode))

(use-package flycheck-pycheckers
  :after flycheck
  :custom
  (flycheck-pycheckers-checkers '(flake8 mypy3))
  :hook
  (flycheck-mode . flycheck-pycheckers-setup))

(use-package flycheck-rust
  :after rust-mode
  :demand t
  :custom
  (flycheck-rust-check-tests nil)
  :hook
  (flycheck-mode . flycheck-rust-setup)
  :config
  (flycheck-add-next-checker 'rust-cargo '(warning . rust-clippy)))

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

(use-package ivy
  :demand t
  :diminish
  :custom
  (ivy-use-virtual-buffers t)
  (magit-completing-read-function 'ivy-completing-read)
  (projectile-completion-system 'ivy)
  :defines
  magit-completing-read-function
  projectile-completion-system
  :config
  (ivy-mode t)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x))

(use-package ivy-hydra
  :demand t)

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
                (set-indent 2)
                (evil-define-key 'normal js2-mode-map (kbd ",b") 'js-insert-breakpoint))))

(use-package json-mode
  :mode ((rx ".ipynb" eos))
  :config
  (evil-define-key 'normal json-mode-map (kbd "=") 'json-mode-beautify)
  (evil-define-key 'visual json-mode-map (kbd "=") 'json-mode-beautify)
  :hook
  (json-mode . (lambda ()
                 (set-indent 2))))

(use-package leuven-theme)

(use-package lisp-mode
  :ensure nil ;; builtin
  :hook
  (emacs-lisp-mode . (lambda ()
                       ;; Dash and tilde are part of a lisp word
                       (modify-syntax-entry ?\- "w")
                       (modify-syntax-entry ?\~ "w"))))

;; TODO lsp
;; https://github.com/emacs-lsp/lsp-mode
;; For Python: pip install "python-language-server[all]"
(use-package lsp-mode
  :custom
  (lsp-prefer-flymake nil)
  :hook
  ;; (python-mode . lsp-deferred)
  ;; (rust-mode . lsp-deferred)
  ;; TODO maybe just prog-mode
  (prog-mode . lsp-deferred)
  :commands (lsp lsp-deferred)
  :config
  (evil-define-key 'normal prog-mode-map (kbd "C-]") 'lsp-find-definition)
  (evil-define-key 'normal prog-mode-map (kbd "C-u C-]") 'lsp-find-references)
  (evil-define-key 'normal prog-mode-map (kbd "K") 'lsp-describe-thing-at-point))

(use-package lsp-ui
  :custom
  (lsp-ui-sideline-enable nil)
  (lsp-ui-flycheck-enable t)
  :commands lsp-ui-mode)

(use-package lua-mode)

(use-package magit
  ;; :after evil
  :custom
  (magit-log-section-commit-count 10)
  (magit-branch-arguments nil)
  (magit-log-margin '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 18))
  (magit-push-always-verify nil)
  (magit-pull-or-fetch t)
  :bind (
         ;; :map magit-log-mode-map
         ;; (",vp" . vcs-resolve-at-point)
         ;; :map magit-revision-mode-map
         ;; (",vp" . vcs-resolve-at-point)
         ;; :map magit-status-mode-map
         ;; ("C-p" . projectile-find-file)
         :map magit-blame-mode-map
         ("C-c <RET>" . magit-show-commit)))

(use-package magit-todos
  :after magit
  :custom
  (magit-todos-keyword-suffix (rx (or ":" " " eol)))
  (magit-todos-update 60)
  (magit-todos-exclude-globs '(".git" "concatenated" "node_modules" "vendor"))
  ;; :hook
  ;; (magit-mode . magit-todos-mode)
  )

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
  :disabled t
  :hook
  (nim-mode . nimsuggest-mode)
  (nimsuggest-mode . (lambda ()
                       (set-indent 2)
                       (evil-define-key 'normal nimsuggest-mode-map (kbd "K") 'nimsuggest-show-doc)
                       (evil-define-key 'normal nimsuggest-mode-map (kbd "M-.") 'nimsuggest-find-definition))))

(use-package mu4e
  ;; :load-path "/usr/share/emacs/site-lisp/mu4e/"
  :load-path "/usr/local/share/emacs/site-lisp/mu4e/"
  :ensure nil  ;; installed system-wide
  :demand t

  :defines
  mu4e-view-actions
  mu4e-headers-mode-map
  yg-smtp-user

  :functions
  my/mu4e-headers-narrow-thing-at-point
  my/mu4e-refresh-headers

  :bind (("C-c m m" . mu4e)
         ("C-c m r" . (lambda () (interactive) (mu4e~request-contacts)))
         ("C-c m n" . mu4e-compose-new)
         :map mu4e-headers-mode-map
         ("C-c /" . my/mu4e-headers-narrow-ticket)
         ("C-c C-u" . my/mu4e-refresh-headers))

  :custom
  (user-mail-address yg-smtp-user)
  (user-full-name  "Lorenzo Bolla")
  (mu4e-maildir "/home/lbolla/Mail")
  (mu4e-drafts-folder "/YG/Drafts")
  (mu4e-sent-folder "/YG/Sent Items")
  (mu4e-trash-folder "/YG/Deleted Items")
  (mu4e-change-filenames-when-moving t)
  (mu4e-maildir-shortcuts '(("/YG/INBOX"   . ?i)
                            ("/YG/Sent Items" . ?s)
                            ("/YG/Errors" . ?e)
                            ("/YG/GitLab" . ?g)
                            ("/YG/Tickets" . ?t)))
  (mu4e-bookmarks '(("flag:unread AND NOT flag:trashed" "Unread/flagged" ?u)
                    ("maildir:/YG/INBOX AND flag:unread AND NOT flag:trashed" "Unread inbox" ?i)
                    ("maildir:/YG/Errors AND flag:unread AND NOT flag:trashed" "Unread errors" ?e)
                    ("maildir:/YG/Tickets AND flag:unread AND NOT flag:trashed" "Unread tickets" ?t)
                    ("maildir:/YG/GitLab AND flag:unread AND NOT flag:trashed" "Unread GitLab" ?g)
                    ("flag:flagged" "Flagged" ?f)
                    ("flag:attach" "With attachment" ?a)
                    ;; ("date:today..now" "Today's messages" ?t)
                    ;; ("date:7d..now" "Last 7 days" ?w)
                    ;; ("mime:image/*" "Messages with images" ?p)
                    ;; ("maildir:/YG/INBOX AND date:20170101..20171231" "2017" ?y)
                    ))
  (mail-user-agent 'mu4e-user-agent)
  (mu4e-compose-complete-addresses t)
  (mu4e-compose-complete-only-after nil)
  (mu4e-compose-complete-only-personal nil)
  (mu4e-user-mail-address-list `(,yg-smtp-user))
  (mu4e-compose-dont-reply-to-self t)
  (mu4e-use-fancy-chars nil)
  (mu4e-get-mail-command "true")
  (mu4e-update-interval 300)
  ;; TODO
  ;; (mu4e-html2text-command "w3m -dump -cols 80 -T text/html")
  (mu4e-view-html-plaintext-ratio-heuristic 20)
  (message-kill-buffer-on-exit t)
  (mu4e-view-scroll-to-next nil)
  (mu4e-attachment-dir "/tmp")
  (mu4e-headers-skip-duplicates t)
  (mu4e-headers-date-format "%x %X")
  (mu4e-headers-fields '((:human-date . 18)
                         (:flags . 6)
                         (:mailing-list . 10)
                         (:from . 22)
                         (:subject)))

  (mu4e-mailing-list-patterns '("\\([^.]*\\)\\.yougov\\.net"))
  (mu4e-headers-include-related t)
  ;; (mu4e-headers-results-limit 500)
  (mu4e-view-show-addresses t)
  (mu4e-view-show-images nil)
  (mu4e-view-use-gnus nil)

  :config
  ;; Force starting automatic updates
  (mu4e~start)
  (setq mu4e-view-actions '(("capture message" . mu4e-action-capture-message)
                            ("view as pdf" . mu4e-action-view-as-pdf)
                            ("show this thread" . mu4e-action-show-thread)
                            ("browse" . mu4e-action-view-in-browser))))

(use-package mu4e-alert
  :bind
  ("C-c m u" . mu4e-alert-view-unread-mails)
  ;; :custom
  ;; (mu4e-alert-interesting-mail-query "(flag:unread OR flag:flagged) AND NOT flag:trashed")
  :config
  (mu4e-alert-enable-notifications)
  (mu4e-alert-enable-mode-line-display)
  (mu4e-alert-set-default-style 'libnotify))

(use-package org
  ;; Install from Org's elpa
  ;; :load-path "/home/lbolla/src/code.orgmode.org/bzg/org-mode/lisp/"
  ;; :load-path "/usr/share/emacs/site-lisp/org/"

  :demand t
  :after evil

  :mode ((rx bos "diary" eos))

  :defines
  org-agenda-custom-commands
  org-agenda-include-diary
  org-agenda-sorting-strategy
  org-agenda-span
  org-agenda-start-on-weekday
  org-capture-templates
  org-clock-out-remove-zero-time-clocks
  org-clock-out-when-done
  org-publish-project-alist
  org-stuck-projects
  yg-fogbugz-url
  yg-kiln-url

  :custom
  (org-agenda-tags-column 'auto)
  (org-deadline-warning-days 30)
  (org-html-htmlize-output-type 'css)
  (org-src-tab-acts-natively t)
  (org-startup-indented t)
  (org-fontify-quote-and-verse-blocks  t)
  (org-agenda-files '("~/org/"))
  (org-agenda-include-diary t)
  (org-agenda-start-on-weekday nil)
  (org-agenda-span 1)
  (org-babel-load-languages
   '((emacs-lisp . t)
     (ledger . t)
     (shell . t)
     (sql . t)
     (python . t)))
  (org-default-notes-file "~/org/refile.org")
  (org-fast-tag-selection-single-key t)
  (org-treat-S-cursor-todo-selection-as-state-change nil)
  (org-src-fontify-natively t)
  (org-default-priority 68)
  (org-fontify-whole-heading-line t)
  (org-priority-start-cycle-with-default nil)
  (org-return-follows-link t)
  (org-agenda-sorting-strategy '((agenda habit-down time-up deadline-up scheduled-up timestamp-up todo-state-down priority-down alpha-up category-keep tag-up)
                                 (todo priority-down category-keep alpha-up)
                                 (tags priority-down category-keep)
                                 (search category-keep)))
  (org-priority-faces '((65 . font-lock-warning-face)  ; A
                        (67 . font-lock-comment-face))) ; C
  (org-stuck-projects '("+LEVEL=2/-DONE"
                        ("TODO" "STRT" "WAIT" "CANC" "DELG")
                        ("@ignore") ""))
  ;; See https://orgmode.org/worg/org-tutorials/org-custom-agenda-commands.html
  (org-agenda-custom-commands '((" " "Agenda"
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
                                  (org-tags-match-list-sublevels nil)))
                                ("i" "Ideas" tags "IDEA"
                                 ((org-agenda-overriding-header "Ideas")
                                  (org-tags-match-list-sublevels nil)))
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
                                ))
  (org-archive-location "%s_archive::* Archived Tasks")
  (org-tag-alist '((:startgroup)
                   ("@family" . ?f)
                   ("@home" . ?h)
                   ;; ("@work" . ?w)
                   ("@ignore" . ?i)
                   (:endgroup)
                   ("NOTE" . ?n)
                   ("MEET" . ?m)
                   ("PHON" . ?p)
                   ("FLAGGED" . ?+)))
  (org-link-abbrev-alist `(("FB" . ,(concat yg-fogbugz-url "/f/cases/%h"))
                           ("GH" . github-issue-url)
                           ("GL" . yg-gitlab-object-url)))
  (org-refile-targets '((org-agenda-files :level . 1)))
  (org-refile-use-outline-path t)
  (org-outline-path-complete-in-steps nil)
  (org-refile-allow-creating-parent-nodes 'confirm)
  (org-clock-out-remove-zero-time-clocks t)
  (org-clock-out-when-done t)
  (org-html-validation-link nil)
  (org-todo-keywords '((sequence "TODO(t)" "STRT(s!)" "|" "DONE(d!)" "CANC(c@)" "DELG(l@)")
                       (sequence "WAIT(w@/!)" "|" "DEFR(f@)")))
  (org-todo-keyword-faces '(("TODO" . org-todo)
                            ("STRT" . org-strt)
                            ("WAIT" . org-wait)
                            ("DELG" . org-delg)
                            ("MEET" . org-meet)
                            ("CANC" . org-canc)
                            ("DEFR" . org-defr)
                            ("DONE" . org-done)))
  (org-log-done 'time)
  (org-log-into-drawer t)
  (org-publish-project-alist '(("home"
                                :base-directory "~/Private/org/"
                                :exclude "\\.*"
                                :include ("home.org")
                                :with-broken-links t
                                :publishing-directory "~/Private/org/"
                                :publishing-function org-html-publish-to-html
                                :description "My links"
                                ;; :html-head "<link rel=\"stylesheet\" href=\"http://gongzhitaao.org/orgcss/org.css\" type=\"text/css\">")
                                ;; "Async" CSS
                                :html-postamble "<link rel=\"stylesheet\" href=\"http://gongzhitaao.org/orgcss/org.css\" type=\"text/css\">")
                               ("lbolla.info"
                                :components ("lbolla.info-html" "lbolla.info-static" "lbolla.info-cv.pdf"))
                               ("lbolla.info-static"
                                :base-directory "~/src/github.com/lbolla/lbolla.info/static/"
                                :base-extension "png\\|jpg\\|\\|gif\\|gz\\|css\\|woff2"
                                :publishing-directory "~/src/github.com/lbolla/lbolla.info/html/"
                                :recursive t
                                :publishing-function org-publish-attachment)
                               ("lbolla.info-cv.pdf"
                                :base-directory "~/src/github.com/lbolla/lbolla.info/org/"
                                :exclude "\\.*"
                                :include ("cv.org")
                                :publishing-directory "~/src/github.com/lbolla/lbolla.info/html/"
                                :publishing-function org-latex-publish-to-pdf)
                               ("lbolla.info-html"
                                :base-directory "~/src/github.com/lbolla/lbolla.info/org/"
                                :publishing-directory "~/src/github.com/lbolla/lbolla.info/html/"
                                :recursive t
                                :section-numbers nil
                                :auto-sitemap t
                                :sitemap-format-entry lbolla.info/org-publish-sitemap-format-entry
                                :sitemap-function lbolla.info/org-publish-sitemap-function
                                :sitemap-sort-files anti-chronologically
                                :sitemap-style tree
                                :sitemap-title "Sitemap"
                                :with-toc nil
                                :description "Lorenzo Bolla homepage"
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
                                :publishing-function org-publish-attachment)))
  (org-capture-templates '(("t" "Todo"      entry (file "~/org/refile.org") "* TODO %?\nSCHEDULED: %t\n%i\n%a\n")
                           ("m" "Meeting"   entry (file "~/org/refile.org") "* TODO Meeting %? :MEET:\n%U")
                           ("n" "Note"      entry (file "~/org/notes.org")  "* %? :NOTE:\n%U\n%a\n")
                           ("i" "Idea"      entry (file "~/org/ideas.org")  "* %? :IDEA:\n%U\n%a\n")
                           ("l" "Link"      entry (file+headline "~/Private/org/org-linkz/Linkz.org" "INBOX") "* %a\n%i" :immediate-finish t)
                           ;; ("c" "Clipboard" entry (file "~/org/refile.org") "* TODO %?\n%i\n%x\n")
                           ;; ("p" "Phone"     entry (file "~/org/refile.org") "* TODO Phone %? :PHON:\n%U")
                           ;; ("j" "Journal"   entry (file+olp+datetree "~/org/diary.org") "* %?\nEntered on %U\n  %i\n  %a")
                           ))
  (org-protocol-default-template-key "l")
  
  :hook
  (org-mode . auto-fill-mode)
  (org-mode . flyspell-mode)

  :bind
  ;; From https://orgmode.org/manual/Activation.html#Activation
  ("C-c a" . org-agenda)
  ("C-c c" . org-capture)
  ("C-c l" . org-store-link)
  ("C-c C-l" . org-insert-link)

  :init
  (evil-define-key 'normal org-mode-map (kbd "RET") 'org-return)
  (require 'org-protocol)

  :config
  (defface org-strt '((t (:inherit org-todo :foreground "dark orange"))) "Face used for started tasks." :group 'org-faces)
  (defface org-wait '((t (:inherit org-todo :foreground "gold"))) "Face used for waiting tasks." :group 'org-faces)
  (defface org-delg '((t (:inherit org-todo :foreground "dark gray"))) "Face used for delegated tasks." :group 'org-faces)
  (defface org-meet '((t (:inherit org-todo :foreground "deep sky blue"))) "Face used for meeting tasks." :group 'org-faces)
  (defface org-canc '((t (:inherit org-todo :foreground "dim gray"))) "Face used for cancelled tasks." :group 'org-faces)
  (defface org-defr '((t (:inherit org-todo :foreground "blue"))) "Face used for deferred tasks." :group 'org-faces))

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

(use-package pass
  :bind
  ("C-c x" . pass)
  ("C-c C-x" . password-store-copy)
  :config
  (defun password-store-change (entry &optional password-length)
    "Change password for ENTRY with PASSWORD-LENGTH.

Default PASSWORD-LENGTH is `password-store-password-length'."
    (interactive (list (read-string "Password entry: ")
                       (when current-prefix-arg
                         (abs (prefix-numeric-value current-prefix-arg)))))
    (unless password-length (setq password-length password-store-password-length))
    ;; A message with the output of the command is not printed because
    ;; the output contains the password.
    (password-store--run "generate" "--in-place" entry (number-to-string password-length))
    nil))

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
   '(".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox"
     ".svn" ".stack-work" "deps" "node_modules" "build" "_build" "dist"
     ".cache" ".eggs" ".tox" "__pycache__" ".mypy_cache"))
  (projectile-globally-ignored-file-suffixes '("pyc" "beam"))
  (projectile-switch-project-action 'projectile-dired)
  :init
  (projectile-mode)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (global-set-key (kbd "<f5>") 'projectile-compile-project))

(use-package python
  :after evil
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
                   ;; (elpy-enable)
                   (set-whitespace-line-column 79)
                   (define-key python-mode-map (kbd "C-c b") 'python-insert-breakpoint)
                   (evil-define-key 'normal python-mode-map (kbd ",b") 'python-insert-breakpoint)
                   (evil-define-key 'normal python-mode-map (kbd ",pi") 'python-insert-pylint-ignore)
                   (evil-define-key 'normal python-mode-map (kbd ",t") 'python-insert-type-annotation)
                   ;; TODO lsp
                   ;; (evil-define-key 'normal python-mode-map (kbd "C-]") 'elpy-goto-definition)
                   ;; (evil-define-key 'normal python-mode-map (kbd "K") 'elpy-doc)
                   ;; (evil-define-key 'normal python-mode-map (kbd "gf") (lambda () (interactive) (elpy-find-file t))))))
                   )))

;; TODO lsp
;; (use-package racer
;;   :diminish
;;   :after (evil rust-mode)
;;   :hook
;;   (rust-mode . racer-mode)
;;   (racer-mode . eldoc-mode)
;;   (racer-mode . company-mode)
;;   :init
;;   (evil-define-key 'normal rust-mode-map (kbd "K") 'racer-describe)
;;   (evil-define-key 'normal racer-help-mode-map (kbd "K") 'racer-describe)
;;   (evil-define-key 'normal rust-mode-map (kbd "C-]") 'racer-find-definition)
;;   (evil-define-key 'normal racer-help-mode-map (kbd "C-]") 'racer-find-definition))

(use-package rg
  :bind
  ("C-c r G" . rg-dwim)
  ("C-c r g" . counsel-rg)
  ("C-c r p" . rg-project)
  ("C-c r r" . rg)
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

(use-package rmsbolt
  :disabled t)

(use-package rst
  :hook
  (rst-mode . (lambda ()
                (auto-fill-mode t))))

(use-package rust-mode
  :after evil
  :hook
  (rust-mode . hs-minor-mode)
  :custom
  (rust-format-on-save t))

(use-package server
  :demand t
  :config
  (unless (server-running-p)
    (server-start)))

(use-package sh-script
  :mode (((rx "." (or "z" "ba") "sh") . shell-script-mode)
         ((rx ".sh" eos) . shell-script-mode)
         ((rx ".env") . shell-script-mode)
         ((rx ".venv") . shell-script-mode)
         ;; Void package template files
         ((rx bos "template" eos) . shell-script-mode)))

(use-package smtpmail
  :defines
  yg-smtp-server
  yg-smtp-port
  yg-smtp-user
  :custom
  (send-mail-function 'smtpmail-send-it)
  (smtpmail-smtp-server yg-smtp-server)
  (smtpmail-smtp-service yg-smtp-port)
  (smtpmail-mail-address yg-smtp-user)
  (smtpmail-stream-type 'starttls))

(use-package swiper
  :init
  (global-set-key (kbd "C-s") 'swiper))

(use-package text-mode
  :ensure nil
  :mode ((rx ".fbcli_comment" eos) . text-mode)
  :hook
  (text-mode . (lambda ()
                 (modify-syntax-entry ?\_ "w")
                 (variable-pitch-mode 0)
                 (flyspell-mode t))))

(use-package toml-mode
  :mode ((rx "Cargo")))

(use-package vcs-resolve
  :load-path "/home/lbolla/src/github.com/lbolla/vcs-resolve/"
  :demand t
  :bind
  ("C-c v b" . vcs-resolve-buffer)
  ("C-c v p" . vcs-resolve-at-point)
  ("C-c v r" . vcs-resolve-region)
  :custom
  (vcs-resolve-exe "/home/lbolla/src/github.com/lbolla/vcs-resolve/vcs-resolve.py"))

(use-package web-mode
  :mode ((rx ".html" eos)
         (rx ".tmpl" eos))
  :custom
  (web-mode-code-indent-offset 4)
  (web-mode-css-indent-offset 2)
  (web-mode-markup-indent-offset 2)
  :init
  (evil-define-key 'normal web-mode-map (kbd "%") 'web-mode-tag-match)
  (evil-define-key 'visual web-mode-map (kbd "%") 'web-mode-tag-match)
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
                 (variable-pitch-mode 0)
                 (flyspell-mode nil))))

(use-package yasnippet
  :custom
  (yas-indent-line 'fixed)
  :init
  (eval-after-load 'yasnippet '(diminish 'yas-minor-mode))
  (yas-global-mode 1))

(use-package which-key
  :diminish
  :init (which-key-mode))

(use-package zoom-window)

(provide 'pkgs)
;;; pkgs.el ends here
