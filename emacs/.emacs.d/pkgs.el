;;; package --- lbolla pkgs.el file
;;; Commentary:
;;; 7 November 2016

;;; Code:

(defvar my/lesser-evil)
(defvar package-archives)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ;; ("marmalade" . "https://marmalade-repo.org/packages/")
        ;; ("melpa-stable" . "https://stable.melpa.org/packages/")
        ;; ("sc" . "https://joseito.republika.pl/sunrise-commander/")
        ))

(eval-when-compile
  (require 'package)
  (package-initialize)
  (unless (file-directory-p (concat user-emacs-directory "elpa"))
    (package-refresh-contents))
  (unless (require 'use-package nil 'noerror)
    (package-install 'use-package)
    (require 'use-package)))

(setq use-package-always-defer t
      use-package-always-ensure t
      use-package-minimum-reported-time 0.1
      use-package-verbose t)

(use-package all-the-icons)

(use-package ansi-color
  :ensure nil
  :custom
  (ansi-color-faces-vector [default bold shadow italic underline success warning error])
  (ansi-term-color-vector [unspecified "#fdf6e3" "#dc322f" "#859900" "#b58900" "#268bd2" "#6c71c4" "#268bd2" "#586e75"]))

(use-package auth-source
  :ensure nil
  :custom
  (auth-source-debug nil)
  (auth-sources '("secrets:session" "secrets:Login" "~/.authinfo.gpg")))

(use-package avy
  :bind*
  ("C-c ;" . avy-goto-char-timer))

(use-package browse-url
  :ensure nil
  :custom
  (browse-url-browser-function 'browse-url-xdg-open))

(use-package calfw
  :commands (cfw:open-calendar-buffer)
  :bind
  ("C-c o k" . lbolla/open-calendar)
  :config
  (use-package calfw-org
    :commands (cfw:open-org-calendar cfw:org-create-source)
    :config
    ;; (setq cfw:org-agenda-schedule-args '(:timestamp :scheduled* deadline*))
    (setq cfw:org-agenda-schedule-args nil)
    )
  (use-package calfw-cal
    :commands (cfw:open-diary-calendar cfw:cal-create-source))
  (defun lbolla/open-calendar ()
    "Open a calendar view."
    (interactive)
    (cfw:open-calendar-buffer
     :contents-sources
     (list
      (cfw:org-create-source)  ; orgmode source
      (cfw:cal-create-source "Orange") ; diary source
      ))))

(use-package cc-mode
  :ensure nil
  :custom
  (c-default-style '((c-mode . "k&r")
                     (c++-mode . "stroustrup-book")
                     (java-mode . "java")
                     (awk-mode . "awk")
                     (other . "gnu")))
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

(use-package clang-format
  ;; :load-path "/usr/share/emacs/site-lisp/clang-format-10/"
  ;; :ensure nil
  :custom
  (clang-format-style "WebKit")
  :config
  (evil-define-key 'normal c++-mode-map (kbd "=") 'clang-format-region)
  (evil-define-key 'visual c++-mode-map (kbd "=") 'clang-format-region)
  :bind (:map c++-mode-map
              (("C-c =" . clang-format-region))))

(use-package company
  :custom
  (company-idle-delay 0.2)
  (company-tooltip-align-annotations t)
  :hook
  (after-init . global-company-mode))

(use-package conf-mode
  :mode (((rx "rc" eos) . conf-unix-mode)
         ((rx ".pycheckers" eos) . conf-unix-mode)
         ((rx ".importlinter" eos) . conf-unix-mode)
         ((rx "requirements") . conf-unix-mode)
         ;; systemd unit files
         ((rx ".mount") . conf-unix-mode)
         ((rx ".path") . conf-unix-mode)
         ((rx ".scope") . conf-unix-mode)
         ((rx ".service") . conf-unix-mode)
         ((rx ".slice") . conf-unix-mode)
         ((rx ".socket") . conf-unix-mode)
         ((rx ".swap") . conf-unix-mode)
         ((rx ".target") . conf-unix-mode)
         ((rx ".timer") . conf-unix-mode))

  :hook
  (conf-mode . (lambda ()
                 (modify-syntax-entry ?\_ "w"))))

(use-package copy-as-format
  :bind
  ("C-c w j" . copy-as-format-jira)
  ("C-c w s" . copy-as-format-slack)
  ("C-c w w" . (lambda ()
                 (interactive)
                 (let ((current-prefix-arg 4))
                   (copy-as-format)))))

(use-package counsel
  :bind*
  ("M-x" . counsel-M-x))

(use-package css-mode
  :mode ((rx ".scss" eos))
  :hook
  (css-mode . (lambda ()
                (modify-syntax-entry ?\- "w"))))

(use-package csv-mode
  :hook
  (csv-mode . (lambda ()
                 (variable-pitch-mode 0))))

;; TODO https://www.reddit.com/r/emacs/comments/g46sg2/a_solution_to_the_agony_of_customsetvariables_and/
;; (use-package cus-edit
;;   :custom
;;   (custom-file null-device "Don't store customizations"))

(use-package custom
  :ensure nil
  :custom
  (custom-safe-themes t)
  (gc-cons-threshold 100000000))

(use-package cython-mode
  :after evil
  :config
  (evil-define-key 'normal cython-mode-map (kbd ",a") 'cython-show-annotated))

; https://gitlab.com/skybert/my-little-friends/blob/master/emacs/.emacs#L780
(use-package dap-java
  :ensure nil
  :after lsp-java
  :bind
  ("C-c d d" . dap-java-debug))

;; https://emacs-lsp.github.io/dap-mode/
(use-package dap-mode
  :bind
  ;; ("C-c d d" . dap-debug)
  ;; ("C-c d s" . dap-step-in)
  ;; ("C-c d r" . dap-step-out)
  ;; ("C-c d n" . dap-next)
  ;; ("C-c d c" . dap-continue)
  ("C-c d B" . dap-breakpoint-delete-all)
  ("C-c d b" . dap-breakpoint-toggle)
  :hook
  (dap-stopped . (lambda (arg) (call-interactively #'dap-hydra))))

(use-package deft
  :bind
  ("C-c n d" . deft)
  :custom
  (deft-directory my/zettelkasten-directory)
  (deft-extensions '("org" "txt" "md")))

(use-package delsel
  :ensure nil
  :custom
  (delete-selection-mode t))

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
  ;; (dumb-jump-mode)
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

(use-package ediff
  :ensure nil
  :custom
  (ediff-split-window-function 'split-window-horizontally)
  (ediff-window-setup-function 'ediff-setup-windows-plain))

;; Required by FF add-on "Edit with Emacs"
(use-package edit-server
  :init
  (unless (process-status "edit-server")
    (edit-server-start)))

(use-package electric
  :config
  (electric-indent-mode t))

(use-package elixir-mode
  :mode (((rx ".mxs" eos) . elixir-mode)))

(use-package erlang-start
  :load-path "/usr/lib/erlang/lib/tools-3.4.1/emacs/"
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
  ;; :demand t
  :custom
  (eyebrowse-default-workspace-slot 0)
  (eyebrowse-keymap-prefix (kbd "C-c e"))
  (eyebrowse-new-workspace t)
  :init
  (eyebrowse-mode t))

(use-package expand-region
  :bind
  ("C-=" . er/expand-region))

(use-package evil
  :demand t

  :custom
  (evil-default-state (if my/lesser-evil 'emacs 'normal))
  (evil-lookup-func 'man-at-point)
  (evil-undo-system 'undo-redo)
  (evil-want-C-i-jump nil)  ;; Or it masks <TAB> in non-graphical mode
  (evil-want-C-w-in-emacs-state (not my/lesser-evil))
  (evil-want-integration t)
  (evil-want-keybinding nil)

  :init
  (evil-mode t)

  :config
  (evil-set-initial-state 'calc-mode 'emacs)
  (evil-set-initial-state 'custom-mode 'emacs)
  (evil-set-initial-state 'deft-mode 'emacs)
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

  (define-key evil-normal-state-map (kbd ",rG") 'my/rg-dwim-project-dir)
  (define-key evil-normal-state-map (kbd ",rg") 'counsel-rg)
  (define-key evil-normal-state-map (kbd ",rp") 'rg-project)
  (define-key evil-normal-state-map (kbd ",rr") 'rg)

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
  (use-package evil-nerd-commenter
    :demand t
    :after evil))

(unless my/lesser-evil
  (use-package evil-org
    :demand t
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

(use-package explain-pause-mode
  ;; :demand t
  :load-path "~/src/github.com/lastquestion/explain-pause-mode"
  :custom
  (explain-pause-blocking-too-long-ms 100)
  :config
  (explain-pause-mode t))

(use-package files
  :ensure nil
  :custom
  (backup-directory-alist '(("." . "~/.emacs.d/backups")))
  (delete-old-versions t)
  (indent-tabs-mode nil))

(use-package fill
  :ensure nil
  :custom
  (fill-column 79))

(use-package find-file
  :ensure nil
  :custom
  (cc-search-directories '("." "/usr/include" "/usr/local/include/*" "../deps" "../../deps")))

(use-package flycheck
  :custom
  ;; (flycheck-idle-change-delay 3)
  (flycheck-check-syntax-automatically '(save idle-change new-line mode-enabled))
  (flycheck-clang-include-path '("/usr/include/glib-2.0"
                                 "/usr/lib/x86_64-linux-gnu/glib-2.0/include"
                                 "../deps"
                                 "../../deps"))
  (flycheck-clang-language-standard "c++17")
  ;; (flycheck-cppcheck-checks '("all"))
  ;; (flycheck-cppcheck-suppressions '("constStatement"))
  (flycheck-flake8rc "setup.cfg")
  (flycheck-gcc-language-standard "c++17")
  (flycheck-ghc-language-extensions ())
  (flycheck-highlighting-mode 'lines)
  (flycheck-javascript-flow-args nil)
  ;; (flycheck-pylintrc nil)
  ;; (flycheck-python-flake8-executable nil)
  ;; (flycheck-python-mypy-cache-dir "/dev/null")
  (flycheck-shellcheck-excluded-warnings '("SC2006" "SC2086" "SC2181"))
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
  :load-path "~/src/github.com/lbolla/emacs-flycheck-cython/"
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
  :load-path "~/src/github.com/lbolla/emacs-flycheck-flow/"
  :after flycheck
  :config
  ;; (flycheck-add-next-checker 'javascript-flow '(warning . javascript-flow-coverage) t)
  (flycheck-add-next-checker 'javascript-jshint '(warning . javascript-flow) t))

(use-package flycheck-popup-tip
  :disabled t
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
  ;; (flycheck-mode . flycheck-rust-setup)
  (rust-mode . flycheck-rust-setup)
  :config
  (flycheck-add-next-checker 'rust-cargo '(warning . rust-clippy)))

(use-package frame
  :ensure nil
  :custom
  (auto-hscroll-mode t)
  (blink-cursor-mode t)
  :init
  (unless (eq (frame-parameter nil 'fullscreen) 'fullboth)
    (toggle-frame-fullscreen)))

(use-package go-mode
  ;; :custom
  ;; (godef-command "~/src/go/bin/godef")
  :hook
  (before-save . gofmt-before-save)
  (go-mode . (lambda ()
               (require 'lsp-go)
               (define-key go-mode-map (kbd "K") 'godoc))))

(use-package highlight-indentation)

(use-package ivy
  :demand t
  :bind*
  ("C-c C-r" . ivy-resume)
  :custom
  (ivy-use-virtual-buffers t)
  (magit-completing-read-function 'ivy-completing-read)
  (projectile-completion-system 'ivy)
  :defines
  magit-completing-read-function
  projectile-completion-system
  :config
  (ivy-mode t))

(use-package hl-line
  :ensure nil
  :custom
  (global-hl-line-mode t))

(use-package ivy-hydra
  :demand t)

(use-package json-mode
  :mode ((rx ".ipynb" eos))
  :config
  (evil-define-key 'normal json-mode-map (kbd "=") 'json-mode-beautify)
  (evil-define-key 'visual json-mode-map (kbd "=") 'json-mode-beautify)
  :custom
  (json-reformat:indent-width 2))

(use-package lisp-mode
  :ensure nil ;; builtin
  :hook
  (emacs-lisp-mode . (lambda ()
                       ;; Dash and tilde are part of a lisp word
                       (modify-syntax-entry ?\- "w")
                       (modify-syntax-entry ?\~ "w"))))

(use-package lsp-mode
  :custom
  (lsp-client-packages nil "Do not prompt to install new language servers")
  (lsp-clients-clangd-executable "clangd-10")
  (lsp-diagnostics-flycheck-default-level 'info)
  (lsp-diagnostics-modeline-scope :workspace)
  (lsp-enable-indentation nil)
  (lsp-enable-snippet nil)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-keymap-prefix "C-c l")
  (lsp-prefer-capf t)
  (lsp-response-timeout 5)
  (lsp-rust-clippy-preference "on")
  (lsp-rust-server 'rls)
  (lsp-signature-auto-activate nil)
  ;; (lsp-rust-server 'rust-analyzer)  ;; TODO not working with cube-rs
  :hook
  (lsp-mode . lsp-lens-mode)
  (prog-mode . lsp-deferred)
  (lsp-managed-mode . (lambda ()
                        ;; This is when 'lsp flycheck checker is defined
                        (flycheck-add-next-checker 'lsp 'python-pycheckers t)))
  :commands (lsp lsp-deferred)
  :config
  ;; From https://emacs-lsp.github.io/lsp-mode/page/performance/
  (setq read-process-output-max (* 1024 1024))
  ;; (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
  (evil-define-key 'normal prog-mode-map (kbd "C-]") 'my/lsp-find-definition-other-window)
  (evil-define-key 'normal prog-mode-map (kbd "C-}") 'lsp-find-definition)
  (evil-define-key 'normal prog-mode-map (kbd "C-c C-]") 'lsp-find-references)
  (evil-define-key 'normal prog-mode-map (kbd "K") 'lsp-describe-thing-at-point))

;; https://emacs-lsp.github.io/lsp-java/
(use-package lsp-java
  :after lsp-mode
  :hook
  (java-lens-mode . lsp-java-lens-mode))

(use-package lsp-python-ms
  ;; :demand t  ; TODO use :commands
  ;; :after lsp-mode
  :custom
  (lsp-python-ms-disabled ["inherit-non-class"])
  :hook (python-mode . (lambda ()
                         (require 'lsp-python-ms)
                         (lsp-deferred))))

(use-package lsp-ui
  :after lsp-mode
  :custom
  (lsp-ui-doc-enable nil)
  (lsp-ui-flycheck-enable t)
  (lsp-ui-sideline-enable nil))

(use-package lua-mode)

(use-package magit
  :custom
  (magit-log-margin '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 18))
  (magit-log-section-commit-count 10)
  (magit-pull-or-fetch t)
  (magit-push-always-verify nil))

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
  (makefile-mode . (lambda ()
                 (modify-syntax-entry ?\- "w")
                 (setq indent-tabs-mode t))))

(use-package markdown-mode
  :bind (("<C-return>" . markdown-follow-link-at-point))
  :hook
  (markdown-mode . (lambda ()
                     (auto-fill-mode t))))

(use-package menu-bar
  :ensure nil
  :custom
  (menu-bar-mode nil))

(use-package message
  :ensure nil
  :custom
  (message-citation-line-function 'message-insert-formatted-citation-line)
  (message-kill-buffer-on-exit t))

(use-package minions
  :demand t
  :bind*
  ([S-down-mouse-3] . minions-minor-modes-menu)
  :config
  (minions-mode 1))

(use-package mouse
  :ensure nil
  :custom
  (mouse-yank-at-point t))

(use-package nim-mode
  :disabled t
  :hook
  (nim-mode . nimsuggest-mode)
  (nimsuggest-mode . (lambda ()
                       (evil-define-key 'normal nimsuggest-mode-map (kbd "K") 'nimsuggest-show-doc)
                       (evil-define-key 'normal nimsuggest-mode-map (kbd "M-.") 'nimsuggest-find-definition))))

(use-package nsm
  :ensure nil
  :custom (network-security-level 'high))

(use-package org
  ;; Install from Org's elpa
  ;; :load-path "~/src/code.orgmode.org/bzg/org-mode/lisp/"
  ;; :load-path "/usr/share/emacs/site-lisp/org/"

  :ensure org-plus-contrib
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

  :custom
  (org-agenda-block-separator "")
  (org-agenda-custom-commands '(
                                ("." "Agenda/Next/Todo"
                                 ((agenda "" nil)
                                  (tags-todo "-REFILE/NEXT"
                                        ((org-agenda-overriding-header "Next tasks")
                                         (org-agenda-skip-function 'my/org-agenda-skip-scheduled)
                                         ;; (org-agenda-files '("~/org/"))
                                         ))
                                  (tags-todo "-REFILE/WAIT"
                                        ((org-agenda-overriding-header "Stuck tasks")
                                         (org-agenda-skip-function 'my/org-agenda-skip-scheduled)
                                         ;; (org-agenda-files '("~/org/"))
                                         ))
                                  (tags-todo "-REFILE/TODO"
                                        ((org-agenda-overriding-header "Todo tasks")
                                         (org-agenda-skip-function 'my/org-agenda-skip-scheduled)
                                         ;; (org-agenda-files '("~/org/"))
                                         ))
                                  ))
                                ("," "Refile/Archive/Someday"
                                 ((org-ql-block '(tags-inherited "REFILE")
                                                ((org-ql-block-header "Tasks to Refile")))
                                  (org-ql-block '(and
                                                  (done)
                                                  (ts :to -60))
                                                ((org-ql-block-header "Tasks to archive")))
                                  (tags-todo "-REFILE/SDAY"
                                        ((org-agenda-overriding-header "Someday tasks")
                                         (org-agenda-skip-function 'my/org-agenda-skip-scheduled)
                                         ;; (org-agenda-files '("~/org/"))
                                         ))))))
  (org-agenda-files '("~/org/refile.org"))
  (org-agenda-include-diary t)
  (org-agenda-log-mode-items `(clock closed))
  (org-agenda-sorting-strategy '((agenda habit-down time-up deadline-down scheduled-up timestamp-up todo-state-down priority-down alpha-up category-up tag-up)
                                 (todo todo-state-down priority-down category-up alpha-up)
                                 (tags todo-state-down priority-down category-up alpha-up)
                                 (search todo-state-down priority-down category-up alpha-up)))
  (org-agenda-span 1)
  (org-agenda-start-on-weekday nil)
  (org-agenda-start-with-log-mode t)
  (org-agenda-tags-column 'auto)
  ;; (org-archive-location "%s_archive::* Archived Tasks")
  (org-babel-load-languages
   '((emacs-lisp . t)
     (ledger . t)
     (shell . t)
     (sql . t)
     (python . t)))
  (org-capture-templates '(("t" "Todo"    entry (file "~/org/refile.org") "* TODO %?\n%i\n%a\n")
                           ("m" "Meeting" entry (file "~/org/refile.org") "* TODO Meeting %? :MEET:\n%U")
                           ("h" "Habit"   entry (file "~/org/refile.org") "* TODO %?\n:PROPERTIES:\n:STYLE:    habit\n:END:\n")
                           ("n" "Note"    entry (file "~/org/notes.org")  "* %? \n%U\n%a\n")
                           ("i" "Idea"    entry (file "~/org/ideas.org")  "* %? \n%U\n%a\n")
                           ("l" "Link"    entry (file+headline "~/org-linkz/Linkz.org" "INBOX") "* %a\n%i" :immediate-finish t)
                           ))
  (org-clock-into-drawer "CLOCKS")
  (org-clock-out-remove-zero-time-clocks t)
  (org-clock-out-when-done '("WAIT" "DONE" "CANC" "DELG"))
  (org-clocktable-defaults
   '(:maxlevel 2 :lang "en" :scope file :block nil :wstart 1 :mstart 1 :tstart nil :tend nil :step nil :stepskip0 nil :fileskip0 t :tags nil :match nil :emphasize nil :link nil :narrow 40! :indent t :hidefiles nil :formula nil :timestamp nil :level nil :tcolumns nil :formatter nil))
  (org-columns-default-format "%50ITEM %TODO %3PRIORITY %TAGS %10EFFORT %CLOCKSUM %CLOCKSUM_T")
  (org-deadline-warning-days 30)
  (org-default-notes-file "~/org/refile.org")
  (org-priority-default 68)
  (org-export-backends '(ascii html icalendar latex odt confluence))
  (org-fast-tag-selection-single-key t)
  (org-fontify-quote-and-verse-blocks  t)
  (org-fontify-whole-heading-line t)
  (org-html-htmlize-output-type 'css)
  (org-html-validation-link nil)
  (org-link-abbrev-alist `(("GH" . github-object-url)))
  (org-log-done 'time)
  (org-log-into-drawer t)
  (org-modules '(org-habit
                 ox-confluence
                 org-protocol
                 ol-w3m
                 ol-bbdb
                 ol-bibtex
                 ol-docview
                 ;; ol-gnus
                 ol-info
                 ;; ol-irc
                 ;; ol-mhe
                 ;; ol-rmail
                 ol-eww))
  (org-outline-path-complete-in-steps nil)
  (org-priority-faces '((65 . font-lock-warning-face)  ; A
                        (67 . font-lock-comment-face))) ; C
  (org-priority-start-cycle-with-default nil)
  (org-protocol-default-template-key "l")
  (org-publish-project-alist '(("home"
                                :base-directory "~/org/"
                                :exclude "\\.*"
                                :include ("home.org")
                                :with-broken-links t
                                :publishing-directory "~/org/"
                                :publishing-function org-html-publish-to-html
                                :description "My links"
                                ;; :html-head "<link rel=\"stylesheet\" href=\"http://gongzhitaao.org/orgcss/org.css\" type=\"text/css\">")
                                ;; "Async" CSS
                                :html-postamble "<link rel=\"stylesheet\" href=\"http://gongzhitaao.org/orgcss/org.css\" type=\"text/css\">")
                               ("lbolla.info"
                                :components ("lbolla.info-html" "lbolla.info-static" "lbolla.info-cv.pdf"))
                               ("lbolla.info-static"
                                :base-directory "~/src/github.com/lbolla/lbolla.info/static/"
                                :base-extension "png\\|jpg\\|\\|gif\\|gz\\|css\\|woff2\\|ico"
                                :publishing-directory "~/src/github.com/lbolla/lbolla.info/html/"
                                :recursive t
                                :publishing-function org-publish-attachment)
                               ("lbolla.info-cv.pdf"
                                :base-directory "~/src/github.com/lbolla/lbolla.info/org/"
                                :exclude "\\.*"
                                :include ("cv.org" "cv-short.org")
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
                                :html-home/up-format "<div id=\"org-div-home-and-up\"><a accesskey=\"h\" href=\"/\">Home</a> | <a accesskey=\"a\" href=\"/articles.html\">Articles</a> | <a accesskey=\"c\" href=\"/cv.html\">CV</a> (<a href=\"/cv.pdf\">pdf</a> | <a href=\"/cv-short.pdf\">short</a>)</div>"
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
  (org-refile-allow-creating-parent-nodes 'confirm)
  (org-refile-targets '((org-agenda-files :level . 1)))
  (org-refile-use-outline-path t)
  (org-return-follows-link t)
  (org-src-fontify-natively t)
  (org-src-tab-acts-natively t)
  (org-startup-indented t)
  (org-stuck-projects '("+LEVEL=2/-DONE"
                        ("TODO" "NEXT" "SOMEDAY" "WAIT" "CANC" "DELG")
                        ("@ignore") ""))
  (org-tag-alist '((:startgroup)
                   ("@family" . ?f)
                   ("@home" . ?h)
                   ("@work" . ?w)
                   ("@ignore" . ?i)
                   (:endgroup)
                   ("MEET" . ?m)
                   ("FLAG" . ?+)))
  (org-todo-keywords '((sequence "TODO(t)" "NEXT(n!)" "WAIT(w@/!)" "SDAY(s!)" "|" "DONE(d!)" "CANC(c@)" "DELG(l@)")))
  (org-todo-keyword-faces '(("TODO" . org-todo)
                            ("NEXT" . org-strt)
                            ("SDAY" . org-sday)
                            ("WAIT" . org-wait)
                            ("DELG" . org-delg)
                            ("CANC" . org-canc)
                            ("DONE" . org-done)))
  (org-treat-S-cursor-todo-selection-as-state-change nil)
  
  :hook
  (org-mode . auto-fill-mode)
  (org-mode . flyspell-mode)

  :bind
  ;; From https://orgmode.org/manual/Activation.html#Activation
  ("C-c o a" . org-agenda)
  ("C-c o c" . org-capture)
  ("C-c o l" . org-store-link)
  ("C-c o C-l" . org-insert-link)

  :config
  (require 'org-habit)  ;; Otherwise habits are not rendered in org-agenda
  (evil-define-key 'normal org-mode-map (kbd "RET") 'org-return)
  (defface org-strt '((t (:inherit org-todo :foreground "dark orange"))) "Face used for started tasks." :group 'org-faces)
  (defface org-wait '((t (:inherit org-todo :foreground "gold"))) "Face used for waiting tasks." :group 'org-faces)
  (defface org-delg '((t (:inherit org-todo :foreground "dark gray"))) "Face used for delegated tasks." :group 'org-faces)
  (defface org-sday '((t (:inherit org-todo :foreground "dark gray"))) "Face used for someday tasks." :group 'org-faces)
  (defface org-meet '((t (:inherit org-todo :foreground "deep sky blue"))) "Face used for meeting tasks." :group 'org-faces)
  (defface org-canc '((t (:inherit org-todo :foreground "dim gray"))) "Face used for cancelled tasks." :group 'org-faces))

(use-package org-ref
  :after org-roam
  :custom
  (reftex-default-bibliography `(,(concat my/zettelkasten-directory "/bibliography/references.bib")))
  (org-ref-default-bibliography `(,(concat my/zettelkasten-directory "/bibliography/references.bib")))
  (org-ref-bibliography-notes (concat my/zettelkasten-directory "/bibliography/notes.bib"))
  (org-ref-pdf-directory (concat my/zettelkasten-directory "/bibliography/bibtex-pdfs/")))

(use-package org-roam
  :custom
  (org-roam-directory my/zettelkasten-directory)
  :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n c" . org-ref-insert-link)
               ("C-c n b" . org-roam-switch-to-buffer)
               ("C-c n g" . org-roam-graph-show))
              :map org-mode-map
              (("C-c n i" . org-roam-insert)))
  :config
  (defun my/org-roam-rebuild-db ()
    (interactive)
    (org-roam-db--clear)
    (org-roam-db-build-cache))
  (require 'org-ref)
  (org-roam-mode))

(use-package org-ql
  :defines
  org-ql-views
  :bind
  ("C-c o /" . org-ql-search)
  ("C-c o v" . org-ql-view)
  ("C-c o r" . org-ql-view-recent-items)
  :config
  (use-package org-ql-view
    :ensure nil
    :config
    (add-to-list 'org-ql-views
                 '("Overview: Someday" :buffers-files org-agenda-files
                   :query (todo "SDAY")
                   :super-groups ((:auto-parent t))
                   :title "Someday") t)
    (add-to-list 'org-ql-views
                 '("Overview: Prioritized tasks" :buffers-files org-agenda-files
                   :query (and (todo) (priority >= "C"))
                   :title "Prioritized tasks"
                   :sort (priority todo)) t)
    (add-to-list 'org-ql-views
                 '("Personal: Ideas" :buffers-files org-agenda-files
                   :query (and (tags "IDEA") (level 1))
                   :title "Ideas") t)
    (add-to-list 'org-ql-views
                 '("Personal: Notes" :buffers-files org-agenda-files
                   :query (and (tags "NOTE") (level 1))
                   :title "Notes") t)))

(use-package paredit
  :demand t
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

(use-package paren
  :ensure nil
  :custom
  (show-paren-mode t))

(unless (version< emacs-version "27.1")
  (use-package pass
    :bind
    ("C-c x" . pass)
    ("C-c C-x" . password-store-copy)
    :custom
    (password-store-password-length 16)
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
      nil)))

(use-package prog-mode
  :ensure nil
  :hook
  (prog-mode . (lambda ()
                 ;; Underscore is part of a word
                 (modify-syntax-entry ?\_ "w"))))

(use-package projectile
  :custom
  (projectile-after-switch-project-hook '(my/eyebrowse-name-from-project projectile-vc))
  (projectile-globally-ignored-directories
   '(".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox"
     ".svn" ".stack-work" "deps" "node_modules" "build" "_build" "dist"
     ".cache" ".eggs" ".tox" "__pycache__" ".mypy_cache"))
  (projectile-globally-ignored-file-suffixes '("pyc" "beam"))
  (projectile-switch-project-action 'projectile-dired)
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  :init
  (projectile-mode 1))

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
  (evil-define-key 'normal python-mode-map (kbd ",b") 'python-insert-breakpoint)
  (evil-define-key 'normal python-mode-map (kbd ",pi") 'python-insert-pylint-ignore)
  (evil-define-key 'normal python-mode-map (kbd ",t") 'python-insert-type-annotation)
  :hook
  (python-mode . hs-minor-mode)
  (python-mode . (lambda ()
                   (set-whitespace-line-column 79))))

(use-package pyvenv
  :init
  (pyvenv-mode))

(use-package recentf
  :ensure nil
  :custom
  (recentf-max-saved-items nil))

(use-package rg
  :bind
  ("C-c r G" . my/rg-dwim-project-dir)
  ("C-c r g" . counsel-rg)
  ("C-c r p" . rg-project)
  ("C-c r r" . rg)
  :custom
  (rg-group-result nil)
  (rg-default-alias-fallback "everything")
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
  (rg-define-toggle "--context 3" "x" nil)
  (rg-define-search my/rg-dwim-project-dir
    "Search for thing at point in every file under the project root directory."
    :query point
    :format literal
    :files "everything"
    :dir project))

(use-package rjsx-mode
  :mode ((rx ".js" eos)))

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

(use-package scroll-bar
  :ensure nil
  :custom
  (scroll-bar-mode nil))

(use-package sendmail
  :ensure nil
  :custom
  (send-mail-function 'smtpmail-send-it))

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
         ((rx ".vars") . shell-script-mode)
         ((rx ".sh.inc") . shell-script-mode)
         ((rx ".plugin" eos) . shell-script-mode)
         ;; ((rx ".conf" eos) . shell-script-mode)
         ;; ((rx bos "template" eos) . shell-script-mode)  ;; Void package template files
         ))

(use-package simple
  :ensure nil
  :custom
  (column-number-mode t))

(use-package startup
  :ensure nil
  :custom
  (inhibit-startup-screen t))

(use-package swiper
  :bind
  ("C-s" . swiper))

(use-package text-mode
  :ensure nil
  :mode ((rx ".fbcli_comment" eos) . text-mode)
  :hook
  (text-mode . (lambda ()
                 (modify-syntax-entry ?\_ "w")
                 (variable-pitch-mode 0)
                 (flyspell-mode t))))

(use-package time
  :ensure nil
  :custom
  (world-clock-list '(("UTC" "UTC/GMT/Zulu")
                      ("America/Los_Angeles" "palmcal")
                      ("America/New_York" "fesh")
                      ("America/Lima" "mbc")
                      ("America/Sao_Paulo" "diogo")
                      ("IST-5:30" "shashikant")
                      ("America/Los_Angeles" "Palo Alto")
                      ("America/Mexico_City" "Mexico City")
                      ("America/Lima" "Lima")
                      ("America/New_York" "New York")
                      ("America/Montreal" "Montreal")
                      ("America/Sao_Paulo" "Sao Paulo")
                      ("Europe/London" "London")
                      ("Europe/Rome" "Rome")
                      ("Europe/Moscow" "Moscow")
                      ("Asia/Jakarta" "Jakarta")
                      ("Asia/Bangkok" "Bangkok")
                      ("IST-5:30" "Mumbai")
                      ("Asia/Singapore" "Singapore")
                      ("Asia/Kuala_Lumpur" "Kuala Lumpur")
                      ("Asia/Shanghai" "Shanghai")
                      ("Asia/Tokyo" "Tokyo")
                      ("Australia/Sydney" "Sydney"))))

(use-package toml-mode
  :mode ((rx "Cargo")))

(use-package tool-bar
  :ensure nil
  :custom
  (tool-bar-mode nil))

(use-package tramp
  :ensure nil
  :custom
  (tramp-default-method "ssh"))

(use-package vc-hooks
  :ensure nil
  :custom
  (vc-follow-symlinks nil)
  (vc-handled-backends '(Git)))

(use-package vcs-resolve
  :load-path "~/src/github.com/lbolla/vcs-resolve/"
  ;; :demand t
  :bind
  ("C-c v b" . vcs-resolve-buffer)
  ("C-c v p" . vcs-resolve-at-point)
  ("C-c v r" . vcs-resolve-region)
  :custom
  (vcs-resolve-exe "~/src/github.com/lbolla/vcs-resolve/vcs-resolve.py"))

(use-package web-mode
  :mode ((rx ".html" eos)
         (rx ".tmpl" eos))
  ;; Use .dir-locals.el
  ;; :custom
  ;; (web-mode-code-indent-offset 4)
  ;; (web-mode-css-indent-offset 2)
  ;; (web-mode-markup-indent-offset 2)
  :init
  (evil-define-key 'normal web-mode-map (kbd "%") 'web-mode-tag-match)
  (evil-define-key 'visual web-mode-map (kbd "%") 'web-mode-tag-match)
  :hook
  (web-mode . (lambda ()
                 (modify-syntax-entry ?\- "w"))))

(use-package whitespace
  :ensure nil
  :custom
  (whitespace-style '(face trailing lines-tail)))

(use-package yaml-mode
  :mode ((rx ".y" (opt "a") "ml" eos)
         (rx ".tpl" eos))
  :hook
  (yaml-mode . (lambda ()
                 (modify-syntax-entry ?\_ "w")
                 (modify-syntax-entry ?\- "w")
                 (modify-syntax-entry ?\$ ".")
                 (variable-pitch-mode 0)
                 (flyspell-mode nil))))

(use-package yasnippet
  :custom
  (yas-indent-line 'fixed)
  :init
  (yas-global-mode 1))

(use-package which-key
  :init (which-key-mode))

(use-package zoom-window)

(provide 'pkgs)
;;; pkgs.el ends here
