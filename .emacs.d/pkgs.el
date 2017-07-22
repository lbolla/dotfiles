;;; package --- lbolla pkgs.el file
;;; Commentary:
;;; 7 November 2016

;;; Code:

;;; Note: keep the `setq` here to allow commented out archives
(setq
 package-archives
 '(
   ("melpa" . "http://melpa.org/packages/")
   ;; ("melpa-stable" . "http://stable.melpa.org/packages/")
   ;; ("marmalade" . "http://marmalade-repo.org/packages/")
   ;; ("org" . "http://orgmode.org/elpa/")
   ;; ("gnu" . "http://elpa.gnu.org/packages/")
   ;; ("sc" . "http://joseito.republika.pl/sunrise-commander/")
   ))

(eval-when-compile
  (require 'package)
  (package-initialize)
  (require 'use-package))

;; Necessary to use use-package's :bind
(require 'bind-key)

(use-package ace-jump-mode)

;; Replaced by rg
;; TODO uninstall
;; (use-package ag)

(use-package alchemist
  :disabled t
  :init (add-hook 'elixir-mode-hook
                  (lambda ()
                    (evil-define-key 'normal elixir-mode-map (kbd "C-]") 'alchemist-goto-definition-at-point)
                    (evil-define-key 'normal elixir-mode-map (kbd "K") 'alchemist-help-search-at-point))))

(use-package ats2-mode
  :load-path "/home/lbolla/src/ATS2-Postiats-0.3.3/utils/emacs/"
  :disabled t
  ;; :commands ats-mode
  :mode ("\\.dats\\'" . ats-mode)
  :init (progn
          (use-package flycheck-ats2
            :load-path "/home/lbolla/src/ATS2-Postiats-0.3.3/utils/emacs/"
            :demand t
            :commands flycheck-ats2-setup
            :init (progn
                      (flycheck-ats2-setup)))))

(use-package auto-revert-tail-mode
  :mode ("\\.log\\'" . auto-revert-tail-mode))

(use-package cc-mode
  :init (progn

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
                          (inline-open . 0))))))

(use-package cider-mode
  :disabled t
  :commands cider-jack-in)

(use-package clojure-mode
  :disabled t)

(use-package company
  :init (progn
          (add-hook 'after-init-hook 'global-company-mode)))

(use-package counsel)

(use-package css-mode
  :mode (("\\.scss\\'" . css-mode))
  :init (progn
          (add-hook 'css-mode-hook
                    (lambda ()
                      (modify-syntax-entry ?\- "w")))))

(use-package csv-mode
  :mode ("\\.csv\\'" . csv-mode))

(use-package custom
  :demand t
  :config (progn

            (use-package quasi-monochrome-theme
              :load-path "/home/lbolla/src/emacs-quasi-monochrome/"
              :demand t)
            (load-theme 'quasi-monochrome :no-confirm)

          ;; (if (equal (getenv "IN_X") "no")
          ;;     ;; Textual terminal
          ;;     (progn
          ;;       ;; (add-to-list 'default-frame-alist '(tty-color-mode  . never))
          ;;       )

          ;;   (progn

              ;; (use-package quasi-monochrome-theme
              ;;   :load-path "/home/lbolla/src/emacs-quasi-monochrome/"
              ;;   :demand t)
          ;;     (load-theme 'quasi-monochrome)

          ;;     ;; (use-package cyberpunk-theme)
          ;;     ;; (load-theme 'cyberpunk)

          ;;     ;; (use-package base16-theme)
          ;;     ;; (load-theme 'base16-default-dark)

            ;; (use-package leuven)
            ;; (load-theme 'leuven)

          ;;     ;; In X terminal

          ;;     (unless (display-graphic-p)
          ;;       (progn
          ;;         (use-package xclip
          ;;           :init (xclip-mode t))
          ;;         (xterm-mouse-mode t)))))
          ))

(use-package cython-mode
  :config (progn

            (defun cython-show-annotated ()
              (interactive)
              (shell-command (concat "cython -a " (buffer-file-name)))
              (browse-url (concat "file://" (replace-regexp-in-string "\.pyx$" ".html" (buffer-file-name)))))

            (evil-define-key 'normal cython-mode-map (kbd ",a") 'cython-show-annotated)))

(use-package disaster)

(use-package docker
  :init (progn
          (use-package dockerfile-mode))
  :config (progn
            (docker-global-mode t)))

(use-package electric
  :config (progn

          ;; Ignore electric indentation in Python
          (defun electric-indent-ignore-python (char)
            "Ignore electric indentation for 'python-mode' after CHAR."
            (if (equal major-mode 'python-mode)
                `no-indent'
              nil))

          ;; Enable it globally
          (electric-indent-mode t)
          (add-hook 'electric-indent-functions
                    'electric-indent-ignore-python)))

(use-package elixir-mode
  :disabled t
  :config (add-hook 'elixir-mode-hook
                    (lambda ()
                      (evil-define-key 'insert elixir-mode-map (kbd "RET") 'newline)
                      (set-indent 2))))

(use-package erlang
  :mode (("\\.erl\\'" . erlang-mode)
         ("\\vars.config\\'" . erlang-mode)
         ("\\rebar.config\\'" . erlang-mode))
  :config (progn
            (setq erlang-root-dir "/usr/lib/erlang")
            (evil-define-key 'normal erlang-mode-map (kbd "K") 'erlang-man-function)
            (add-hook 'erlang-mode-hook
                      (lambda ()
                        ;; Unfortunately, erlang-mode does not inherit from prog-mode
                        (modify-syntax-entry ?\_ "w")))))

(use-package ess)

(use-package eww
  :init (progn
          (defun eww-at-point ()
            (interactive)
            (eww (thing-at-point 'word)))

          (defun eww-region (start end)
            (interactive "r")
            (eww (buffer-substring start end)))))

(use-package evil
  :demand t
  :init (progn
            (evil-mode t))
  :config (progn

            (defun new-tab ()
              "Open file in new tab."
              (interactive)
              (ido-find-file-other-frame))

            (defun delete-tab ()
              "Delete current tab."
              (interactive)
              (delete-frame))

            (defun next-tab ()
              "Switch to next tab."
              (interactive)
              (other-frame 1))

            (defun previous-tab ()
              "Switch to previous tab."
              (interactive)
              (other-frame -1))

            (define-key evil-insert-state-map (kbd "RET") 'evil-ret-and-indent)
            (define-key evil-normal-state-map (kbd ", SPC") 'ace-jump-mode)
            (define-key evil-normal-state-map (kbd ",=") 'c-indent)
            (define-key evil-normal-state-map (kbd ",Cgg") 'counsel-git-grep)
            ;; (define-key evil-normal-state-map (kbd ",F") 'ag-project-files)
            (define-key evil-normal-state-map (kbd ",F") 'rg-project)
            ;; (define-key evil-normal-state-map (kbd ",G") 'ag-project)
            (define-key evil-normal-state-map (kbd ",G") 'rg-dwim)
            (define-key evil-normal-state-map (kbd ",f") 'cycle-fonts)
            (define-key evil-normal-state-map (kbd ",gb") 'magit-blame)
            (define-key evil-normal-state-map (kbd ",gg") 'vc-git-grep)
            (define-key evil-normal-state-map (kbd ",gt") 'tags-search)
            (define-key evil-normal-state-map (kbd ",hb") 'vc-annotate)
            (define-key evil-normal-state-map (kbd ",vb") 'vcs-resolve-buffer)
            (define-key evil-normal-state-map (kbd ",vp") 'vcs-resolve-at-point)
            (define-key evil-normal-state-map (kbd ",yp") 'yg-paste-buffer)
            (define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)
            (define-key evil-normal-state-map (kbd "C-w t") 'new-tab)
            (define-key evil-normal-state-map (kbd "C-w x") 'delete-tab)
            (define-key evil-normal-state-map (kbd "gT") 'previous-tab)
            (define-key evil-normal-state-map (kbd "gp") 'insert-x-primary-selection)
            (define-key evil-normal-state-map (kbd "gt") 'next-tab)
            (define-key evil-normal-state-map (kbd ",K") 'eww-at-point)
            (define-key evil-visual-state-map (kbd ",vr") 'vcs-resolve-region)
            (define-key evil-visual-state-map (kbd ",yp") 'yg-paste-region)
            (define-key evil-visual-state-map (kbd ",vr") 'vcs-resolve-region)
            (define-key evil-visual-state-map (kbd ",K") 'eww-region)

            ;; Avoid that visual selecting a region copies it to kill-ring
            (fset 'evil-visual-update-x-selection 'ignore)

            (use-package evil-nerd-commenter
              :demand t
              :init (progn
                      (define-key evil-normal-state-map (kbd ",c") 'evilnc-comment-or-uncomment-lines)
                      (define-key evil-visual-state-map (kbd ",c") 'evilnc-comment-or-uncomment-lines)))

            (use-package evil-matchit
              :demand t
              :init (progn
                      (global-evil-matchit-mode 1)))))

(use-package ffap
  :config (progn
          (add-to-list 'ffap-c-path "../deps")
          (add-to-list 'ffap-c-path "../../deps")))

(use-package flycheck
  :init (progn

          (use-package flycheck-cython
            :load-path "/home/lbolla/src/emacs-flycheck-cython/"
            :demand t)

          (use-package flycheck-elixir
            :load-path "/home/lbolla/src/emacs-flycheck-elixir/"
            :disabled t)

          (use-package flycheck-mypy
            :load-path "/home/lbolla/src/emacs-flycheck-mypy/"
            :demand t
            :config (progn
                      ;; TODO set it depending on which Python version I'm using
                      ;; TODO consider using mypy.ini in repo dir, instead
                      ;; http://mypy.readthedocs.io/en/latest/config_file.html
                      ;; TODO http://blog.zulip.org/2016/10/13/static-types-in-python-oh-mypy/
                      (setq flycheck-python-mypy-args '("--py2" "--silent-imports"))
                      (flycheck-add-next-checker 'python-pylint '(warning . python-mypy) t)))

          (use-package flycheck-dialyzer
            :load-path "/home/lbolla/src/emacs-flycheck-dialyzer/"
            :disabled t
            :config (progn
                      (flycheck-add-next-checker 'erlang 'erlang-dialyzer t)))

          (use-package flycheck-flow
            :load-path "/home/lbolla/src/emacs-flycheck-flow/"
            :demand t
            :config (progn
                      (flycheck-add-next-checker 'javascript-jshint '(warning . javascript-flow) t)
                      ;; (flycheck-add-next-checker 'javascript-flow '(warning . javascript-flow-coverage) t)
                      ))

          (add-hook 'after-init-hook #'global-flycheck-mode))

  :config (progn
            (setq flycheck-highlighting-mode 'lines
                  flycheck-error-list-format
                  [("Line" 4 flycheck-error-list-entry-< :right-align t)
                   ("Col" 3 nil :right-align t)
                   ("Level" 8 flycheck-error-list-entry-level-<)
                   ("ID" 16 t)
                   ("Message (Checker)" 0 t)]
                  flycheck-ghc-language-extensions ())

            (flycheck-add-next-checker 'python-flake8 'python-pylint t)
            (flycheck-add-next-checker 'c/c++-clang 'c/c++-cppcheck t)))

(use-package frame
  :init (progn
          (blink-cursor-mode 1)))

(use-package gnuplot)

(use-package go-mode
  :mode ("\\.go\\'" . go-mode)
  :init (progn
          (setq godef-command "/home/lbolla/src/go/bin/godef")
          (auto-complete-mode -1)
          (add-hook 'before-save-hook 'gofmt-before-save)
          (add-hook 'go-mode-hook
                    (lambda ()
                      (define-key go-mode-map (kbd "K") 'godoc)))))

(use-package haskell-mode
  ;; :mode ("\\.hs\\'" . haskell-mode)
  ;; :init (progn
  ;;         (use-package haskell-cabal
  ;;           :disabled t
  ;;           :mode ("\\.cabal\\'" . haskell-cabal-mode)
  ;;           :config (progn
  ;;                     (setenv "PATH" (concat "~/.cabal/bin:" (getenv "PATH")))
  ;;                     (add-to-list 'exec-path "~/.cabal/bin"))))
  :config (progn
            (add-hook 'haskell-mode-hook
                      (lambda ()
                        ;; (set-indent 2)
                        (haskell-indentation-mode -1)
                        (haskell-indent-mode -1)
                        (setq
                         haskell-stylish-on-save t
                         ;; haskell-compile-cabal-build-command "stack build"
                         ;; haskell-process-suggest-remove-import-lines t
                         ;; haskell-process-auto-import-loaded-modules t
                         ;; haskell-process-type 'cabal-repl
                         ;; haskell-process-log t
                         )
                        ;; (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile)
                        ;; (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
                        ;; (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
                        ;; (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
                        ;; (define-key haskell-mode-map (kbd "C-c C-v") 'haskell-cabal-visit-file)
                        ;; (define-key haskell-mode-map (kbd "C-c `") 'haskell-interactive-bring)
                        ))))

(use-package help-mode
  :init (progn
          (add-hook 'help-mode-hook
                    (lambda ()
                      (evil-motion-state 0)))))

(use-package hl-line
  :init (progn
          (global-hl-line-mode)
          (when (is-theme-enabled 'cyberpunk)
            (set-face-attribute 'hl-line nil :background "grey20"))
          (when (is-theme-enabled 'tao-yin)
            (set-face-attribute 'hl-line nil :background "grey20"))
          (when (is-theme-enabled 'base16-default-dark)
            (set-face-attribute 'hl-line nil :background "grey15")
            (set-face-attribute 'region nil :foreground "light grey" :background "brown4"))))

(use-package ido
  :disabled t
  :init (progn
          (ido-mode t)
          (ido-everywhere t)
          (setq ido-enable-flex-matching t
                ido-file-extensions-order '(".py" ".js" ".html" ".css" t))))

(use-package ivy
  :init (progn
          (ivy-mode t))
  :config (progn
            (defvar magit-completing-read-function)
            (defvar projectile-completion-system)
            (setq ivy-use-virtual-buffers t
                  magit-completing-read-function 'ivy-completing-read
                  projectile-completion-system 'ivy)))

(use-package jedi)

(use-package js
  :disabled t
  :init (progn
          (add-hook 'js-mode-hook
                    (lambda ()
                      (setq js-indent-level 4)
                      (local-set-key (kbd "RET") 'newline-and-indent)))))

(use-package js2-mode
  :mode (("\\.js\\'" . js2-mode))
  :init (progn

          (defun js-insert-breakpoint ()
            "Insert JS Chrome breakpoint above point."
            (interactive)
            (evil-open-above 1)
            (insert "debugger;  // TODO")
            (evil-normal-state))

          (defun js-fix-style ()
            "Call `fixjsstyle` on current buffer."
            (interactive)
            (save-buffer)
            (let ((outbuf (get-buffer-create "*FixJSStyle output*")))
              (shell-command (concat "fixjsstyle " (buffer-name)) outbuf)
              (with-current-buffer outbuf
                (setq buffer-read-only t)
                (unless (= 0 (buffer-size outbuf))
                  (display-buffer outbuf))))
            (revert-buffer :ignore-auto :noconfirm))

          (defun js-clang-format ()
            "Call `clang-format` on current buffer."
            (interactive)
            (save-buffer)
            (shell-command (concat "clang-format-3.9 -i " (buffer-name)))
            (revert-buffer :ignore-auto :noconfirm))

          (defun js-beautify ()
            "Call `uglifyjs` on current buffer to make it prettier."
            (interactive)
            (save-excursion
              (shell-command-on-region (point-min) (point-max) "uglifyjs -b --comments=all -q 1" (current-buffer) t)))

          (add-hook 'js2-mode-hook
                    (lambda ()

                      (when (is-theme-enabled 'tao-yin)
                        (set-face-attribute 'js2-function-call nil :underline nil))

                      (set-whitespace-line-column 80)
                      (set-indent 4)
                      (evil-define-key 'normal js2-mode-map (kbd ",b") 'js-insert-breakpoint)))))

(use-package json-mode
  :init (progn
          (add-hook 'json-mode-hook
                    (lambda ()
                      (set-indent 2)))))

(use-package lisp-mode
  :init (progn
          (add-hook 'emacs-lisp-mode-hook
                    (lambda ()
                      ;; Dash and tilde are part of a lisp word
                      (modify-syntax-entry ?\- "w")
                      (modify-syntax-entry ?\~ "w")))))

(use-package lua-mode)

(use-package magit
  :config (progn
            (when (is-theme-enabled 'cyberpunk)
              (set-face-attribute 'magit-section-highlight nil :background "gray20"))
            (when (is-theme-enabled 'leuven)
              (set-face-attribute 'magit-section-highlight nil :background "gray95")
              (set-face-attribute 'magit-diff-file-heading-highlight nil :background "gray80")
              (set-face-attribute 'magit-diff-hunk-heading-highlight nil :background "gray70")
              (set-face-attribute 'magit-diff-hunk-heading nil :background "gray90"))
            (when (is-theme-enabled 'base16-tomorrow-dark)
              (set-face-attribute 'magit-section-highlight nil :background "gray20"))
            (when (is-theme-enabled 'base16-default-dark)
              (set-face-attribute 'magit-section-highlight nil :background "gray20")
              (set-face-attribute 'magit-diff-file-heading-highlight nil :background "gray20")
              (set-face-attribute 'magit-diff-hunk-heading-highlight nil :background "gray30")
              (set-face-attribute 'magit-diff-hunk-heading nil :background "gray20"))

            ;; (setq magit-bury-buffer-function 'magit-mode-quit-window)
            (define-key magit-log-mode-map (kbd ",vp") 'vcs-resolve-at-point)
            (define-key magit-revision-mode-map (kbd ",vp") 'vcs-resolve-at-point)
            (define-key magit-status-mode-map (kbd "C-p") 'projectile-find-file)
            (evil-define-key 'normal magit-blame-mode-map (kbd "q") 'magit-blame-quit)
            (evil-define-key 'normal magit-blame-mode-map (kbd "RET") 'magit-show-commit)))

(use-package make-mode
  :init (progn
          (add-hook 'make-mode-hook
                    (lambda ()
                      (setq indent-tabs-mode t)))))

(use-package markdown-mode
  :mode (("\\.md\\'" . markdown-mode))
  :init (progn
            (add-hook 'markdown-mode-hook
                      (lambda ()
                        (auto-fill-mode t)
                        (set-indent 4))))
  :config (progn
            (defun markdown-help ()
              (interactive)
              (browse-url "https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet"))))

(use-package menu-bar
  :init (progn
          (global-set-key (kbd "<f10>") 'menu-bar-mode)
          (menu-bar-mode 0)))

(use-package monky
  :load-path "/home/lbolla/src/monky"
  :commands monky-status
  :config (progn
            (setq monky-process-type nil)))

(use-package mu4e
  :load-path "/usr/local/share/emacs/site-lisp/mu4e"
  :demand t
  :bind (("C-c mm" . mu4e)
         ("C-c mu" . mu4e-alert-view-unread-mails))
  :config (progn
            ;; Force adding contacts
            ;; (mu4e~request-contacts))
            ;; Force starting automatic updates
            (mu4e~start))
  :init (progn

          (use-package mu4e-alert
            :init (progn
                    (mu4e-alert-set-default-style 'libnotify)
                    (add-hook 'after-init-hook #'mu4e-alert-enable-notifications)
                    (add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display)))

          (use-package org-mu4e
            :demand t)

          (when (is-theme-enabled 'cyberpunk)
            (set-face-attribute 'mu4e-flagged-face nil :inherit font-lock-constant-face :foreground "firebrick" :weight 'bold)
            (set-face-attribute 'mu4e-replied-face nil :inherit font-lock-comment-face :weight 'normal))

          (when (is-theme-enabled 'leuven)
            (set-face-attribute 'mu4e-header-highlight-face nil :underline nil))

          (when (is-theme-enabled 'base16-tomorrow-dark)
            (set-face-attribute 'mu4e-flagged-face nil :inherit font-lock-constant-face :foreground "firebrick" :weight 'bold :underline nil)
            (set-face-attribute 'mu4e-header-highlight-face nil :inherit nil :underline nil :background "gray20"))

          (when (is-theme-enabled 'tao-yin)
            (set-face-attribute 'mu4e-header-highlight-face nil :inherit nil :underline nil :background "gray20")
            (set-face-attribute 'mu4e-title-face nil :inherit font-lock-type-face :underline nil))

          (when (is-theme-enabled 'tao-yang)
            (set-face-attribute 'mu4e-title-face nil :inherit font-lock-type-face :underline nil))

          (when (is-theme-enabled 'tao-yang)
            (set-face-attribute 'mu4e-header-highlight-face nil :inherit nil :underline nil :background "gray85"))

          (when (is-theme-enabled 'base16-default-dark)
            (set-face-attribute 'mu4e-header-highlight-face nil :inherit nil :underline nil :weight 'bold :background "gray20")
            (set-face-attribute 'mu4e-replied-face nil :inherit font-lock-comment-face :weight 'normal :foreground "gray50")
            (set-face-attribute 'message-cited-text-face nil :inherit font-lock-comment-face :underline nil :foreground "gray60"))

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
           mu4e-headers-skip-duplicates t)))


;; Packages loaded lazily

(use-package multi-term
  :init (progn
          (global-set-key (kbd "C-c t") 'multi-term)))

(use-package org
  :mode (("\\.org\\'" . org-mode)
         ("\\diary\\'" . org-mode))
  :init (progn
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
          (global-set-key (kbd "S-<f12>") (lambda (match) (interactive "P") (org-tags-view nil match)))
          (global-set-key (kbd "C-<f12>") (lambda () (interactive) (execute-kbd-macro (kbd "C-c o a A"))))
          (global-set-key (kbd "M-<f12>") 'org-search-view)

          (evil-define-key 'normal org-mode-map (kbd "RET") 'org-return)

          (defun bh/skip-non-archivable-tasks ()
            "Skip trees that are not available for archiving"
            (save-restriction
              (widen)
              ;; Consider only tasks with done todo headings as archivable candidates
              (let ((next-headline (save-excursion (or (outline-next-heading) (point-max))))
                    (subtree-end (save-excursion (org-end-of-subtree t))))
                (if (member (org-get-todo-state) org-todo-keywords-1)
                    (if (member (org-get-todo-state) org-done-keywords)
                        (let* ((daynr (string-to-number (format-time-string "%d" (current-time))))
                               (a-month-ago (* 60 60 24 (+ daynr 1)))
                               (last-month (format-time-string "%Y-%m-" (time-subtract (current-time) (seconds-to-time a-month-ago))))
                               (this-month (format-time-string "%Y-%m-" (current-time)))
                               (subtree-is-current (save-excursion
                                                     (forward-line 1)
                                                     (and (< (point) subtree-end)
                                                          (re-search-forward (concat last-month "\\|" this-month) subtree-end t)))))
                          (if subtree-is-current
                              subtree-end ; Has a date in this month or last month, skip it
                            nil))  ; available to archive
                      (or subtree-end (point-max)))
                  next-headline))))

          (add-hook 'org-mode-hook
                    (lambda ()

                      (when (is-theme-enabled 'leuven)
                        (set-face-attribute 'org-checkbox nil :foreground "#cccccc")
                        (set-face-attribute 'org-done nil :foreground "forest green")
                        (set-face-attribute 'org-todo nil :foreground "gray20")
                        (set-face-attribute 'org-scheduled-today nil :background "#ffffff" :weight 'normal))

                      (when (is-theme-enabled 'base16-default-dark)
                        (set-face-attribute 'org-checkbox nil :background "#666666" :foreground "#cccccc")
                        (set-face-attribute 'org-done nil :foreground "forest green")
                        (set-face-attribute 'org-scheduled-today nil :foreground "gray70" :weight 'normal)
                        (set-face-attribute 'org-scheduled nil :foreground "gray60" :weight 'normal))

                      (when (is-theme-enabled 'cyberpunk)
                        (set-face-attribute 'org-todo nil :foreground "gray40"))

                      (when (is-theme-enabled 'tao-yang)
                        (set-face-attribute 'org-scheduled-previously nil :foreground "gray40" :weight 'normal))

                      (when (is-theme-enabled 'tao-yin)
                        (set-face-attribute 'org-todo nil :background "black" :foreground "gray40")
                        (set-face-attribute 'org-scheduled-previously nil :foreground "gray50" :weight 'normal))

                      (org-indent-mode t)
                      (auto-fill-mode t)
                      (flyspell-mode t)))

          (org-babel-do-load-languages
           (quote org-babel-load-languages)
           (quote ((emacs-lisp . t)
                   (dot . t)
                   ;; (ditaa . t)
                   (R . t)
                   (python . t)
                   (ruby . t)
                   (gnuplot . t)
                   (clojure . t)
                   (sh . t)
                   (ledger . t)
                   (org . t)
                   ;; (plantuml . t)
                   (latex . t))))

          (setq org-agenda-files '("~/org/")
                org-agenda-include-diary t
                org-agenda-start-on-weekday nil
                org-agenda-span 1
                org-default-notes-file "~/org/refile.org"
                org-fast-tag-selection-single-key t
                org-treat-S-cursor-todo-selection-as-state-change nil
                org-src-fontify-natively t

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
                org-agenda-tags-column -116
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
                                        ("G" . "http://www.google.com/search?q=%h")
                                        ("GMAP" . "http://maps.google.com/maps?q=%h"))
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
                  (sequence "WAIT(w@/!)" "DELG(l@)" "|" "DEFR(f@)" "MEET(m@)" "PHON(p@)"))
                org-todo-keyword-faces
                '(("TODO" . org-todo)
                  ("STRT" . font-lock-keyword-face)
                  ("WAIT" . font-lock-warning-face)
                  ("DELG" . font-lock-comment-face)
                  ("MEET" . org-todo)
                  ("PHONE" . org-todo)
                  ("CANC" . fringe)
                  ("DEFR" . font-lock-comment-face)
                  ("DONE" . org-done))
                org-log-done 'time
                org-log-into-drawer t)))

(use-package paredit
  :init (progn
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
          (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
          ;; (add-hook 'comint-mode-hook           #'enable-paredit-mode)
          ;; (add-hook 'haskell-mode-hook          #'disable-paredit-mode)
          ;; (add-hook 'inferior-python-mode-hook  #'disable-paredit-mode)
          ))

(use-package paren
  :init (progn
          (show-paren-mode)))

(use-package pass)

(use-package prog-mode
  :init (progn
          (add-hook 'prog-mode-hook
                    (lambda ()
                      ;; Underscore is part of a word
                      (modify-syntax-entry ?\_ "w")))))

(use-package projectile
  :init (progn
          (projectile-mode)
          (global-set-key (kbd "<f5>") 'projectile-compile-project)))

(use-package python
  :mode (("\\.py\\'" . python-mode)
         ("\\.pyi\\'" . python-mode) ;; type stub files
         ("\\.mk\\'" . python-mode)) ;; check-mk config files
  :interpreter ("python" . python-mode)
  :init (progn
          (defun python-insert-breakpoint ()
            "Insert Python breakpoint above point."
            (interactive)
            (evil-open-above 1)
            (insert "import ipdb; ipdb.set_trace()  # BREAKPOINT")
            (evil-normal-state))
          (defun python-insert-breakpoint-celery()
            "Insert Celery breakpoint above point."
            (interactive)
            (evil-open-above 1)
            (insert "from celery.contrib import rdb; rdb.set_trace()  # BREAKPOINT")
            (evil-normal-state))
          (defun python-insert-pylint-ignore ()
            "Insert pylint ignore comment."
            (interactive)
            (evil-open-above 1)
            (insert "# pylint: disable=")
            (evil-insert-state))
          (defun python-insert-type-annotation ()
            "Insert type annotation."
            (interactive)
            (end-of-line)
            (insert "  # type: ")
            (evil-insert-state)))
  :config (progn
            (defun python-current-function ()
              (save-excursion
                (end-of-line)
                (beginning-of-defun)
                (search-forward-regexp " *def \\(\\w+\\)")
                (match-string-no-properties 1)))

            (defmacro venv-pytest (&rest what)
              `(async-shell-command
                (concat
                 "cd "
                 (venv-get-proj-dir)
                 " && "
                 "py.test --color=no -v "
                 ,@what)))

            (defun python-indent-jaraco ()
              "Set jaraco-style indentation."
              (interactive)
              (python-indent-guess-indent-offset)
              (setq indent-tabs-mode t))

            (defun python-pytest-current-file ()
              (interactive)
              (venv-pytest (buffer-file-name)))

            (defun python-pytest-at-point ()
              (interactive)
              (venv-pytest
               (buffer-file-name)
               " -k "
               (thing-at-point 'word)))

            (defun python-pytest-current-function ()
              (interactive)
              (venv-pytest
               (buffer-file-name)
               " -k "
               (python-current-function)))

            (defun python-pyformat-buffer ()
              "Run pyformat on current buffer."
              (interactive)
              (shell-command (concat "pyformat --in-place " (buffer-name)))
              (revert-buffer :noconfirm t))

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
                        (evil-define-key 'normal python-mode-map (kbd ",t") 'python-pytest-current-function)
                        (evil-define-key 'normal python-mode-map (kbd ",T") 'python-pytest-current-file)
                        (evil-define-key 'normal python-mode-map (kbd ",pf") 'python-pyformat-buffer)
                        (evil-define-key 'normal python-mode-map (kbd ",pi") 'python-insert-pylint-ignore)
                        (evil-define-key 'normal python-mode-map (kbd ",pt") 'python-insert-type-annotation)
                        ;; Enter key executes newline-and-indent
                        (local-set-key (kbd "RET") 'newline-and-indent)))))

(use-package rcirc
  :disabled t
  :config (progn
            (defun my-rcirc-print-hook (process sender response target text)
              "In PROCESS, if SENDER is not self, ignore RESPONSE and TARGET, beep when TEXT equals current nick."
              ;; (when (and (string-match (regexp-quote (rcirc-nick process)) text)
              (when (and (string-match (concat "@?" (rcirc-nick process)) text)
                         (not (string= (rcirc-nick process) sender))
                         (not (string= (rcirc-server-name process) sender)))
                (my-beep)))
            (add-hook 'rcirc-print-functions 'my-rcirc-print-hook)
            (add-hook 'rcirc-mode-hook
                      (lambda ()
                        (set (make-local-variable 'scroll-conservatively) 8192)
                        (rcirc-track-minor-mode t)
                        ;; (rcirc-omit-mode)
                        (flyspell-mode t)))
            (setq rcirc-server-alist
                  `(
                    ;; rcirc-server-yg
                    ,rcirc-server-yg-slack
                    ;; rcirc-server-freenode
                    ;; ,rcirc-server-mozilla
                    ))
            (defun-rcirc-command reconnect (arg)
              "Reconnect the server process."
              (interactive "i")
              (unless process
                (error "There's no process for this target"))
              (let* ((server (car (process-contact process)))
                     (port (process-contact process :service))
                     (nick (rcirc-nick process))
                     channels query-buffers)
                (dolist (buf (buffer-list))
                  (with-current-buffer buf
                    (when (eq process (rcirc-buffer-process))
                      (remove-hook 'change-major-mode-hook
                                   'rcirc-change-major-mode-hook)
                      (if (rcirc-channel-p rcirc-target)
                          (setq channels (cons rcirc-target channels))
                        (setq query-buffers (cons buf query-buffers))))))
                (delete-process process)
                (rcirc-connect server port nick
                               rcirc-default-user-name
                               rcirc-default-full-name
                               channels
                               ;; TODO password
                               ;; TODO encryption
                               )))))

(use-package restclient
  :mode (("\\.http\\'" . restclient-mode)
         ;; ("\\*HTTP Response\\*" . json-mode)
         ))

(use-package rg
  :config (progn
            (setq rg-group-result t
                  rg-custom-type-aliases '(("gn" . "*.gn *.gni")
                                           ("gyp" . "*.gyp *.gypi")
                                           ("tmpl" . "*.tmpl")))
            ;; Rerun search with context -- bind to "x" in rg results buffer
            (rg-define-toggle "--context 3" "x" nil)))

(use-package rst
  :init (progn
          (add-hook 'rst-mode-hook
                    (lambda ()
                      (auto-fill-mode t)))))

(use-package rust-mode
  :mode (("\\.rs\\'" . rust-mode))
  :init (progn

          (setq rust-format-on-save t)

          (use-package racer)

          (use-package flycheck-rust
            :init (progn
                    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

          (add-hook 'rust-mode-hook
                    (lambda ()
                      (racer-mode))))
  :config (progn
            (evil-define-key 'normal rust-mode-map (kbd "K") 'racer-describe)
            (evil-define-key 'normal rust-mode-map (kbd "C-]") 'racer-find-definition)))

;; http://doc.norang.ca/org-mode.html#GettingStarted
(use-package scroll-bar
  :init (progn
          (scroll-bar-mode 0)))

(use-package sh-script
  :mode ((".zsh" . shell-script-mode)
         (".bash" . shell-script-mode)
         ("\\.sh\\'" . shell-script-mode)))

(use-package slime
  :disabled t
  :init (progn
          (setq inferior-lisp-program "/usr/local/bin/sbcl --noinform")
          ;; Using (ql:quickload "clhs")
          (load "/home/lbolla/quicklisp/clhs-use-local.el" t)
          (require 'slime-autoloads)
          (add-to-list 'slime-contribs 'slime-fancy)
          ;; (add-to-list 'slime-contribs 'slime-highlight-edits)
          (slime-setup)
          (add-hook 'slime-mode-hook
                    (lambda ()
                      ;; (slime-highlight-edits-mode t)
                      (unless (slime-connected-p)
                        (save-excursion (slime)))))))

(use-package smtpmail
  :init (progn
          (setq send-mail-function 'smtpmail-send-it
                smtpmail-smtp-server yg-smtp-server
                smtpmail-smtp-service yg-smtp-port
                smtpmail-mail-address yg-smtp-user
                smtpmail-stream-type 'starttls)))

(use-package swiper
  :init (progn
          (global-set-key (kbd "C-s") 'swiper)))

(use-package text-mode
  :mode "\\README\\'"
  :init (progn
          (add-hook 'text-mode-hook
                    (lambda ()
                      ;; TODO this breaks mu4e reply for certain msgs!
                      ;; (modify-syntax-entry ?\_ "w")
                      (flyspell-mode t)))))

(use-package timonier
  :load-path "/home/lbolla/src/timonier"
  :disabled t
  :commands timonier-k8s
  :init (progn
          (use-package all-the-icons)
          (use-package hydra)
          (use-package request)

          (setq timonier-k8s-proxy "https://10.32.9.224:443")))

(use-package tool-bar
  :init (progn
          (tool-bar-mode 0)))

(use-package toml-mode)

(use-package vcs-resolve
  :load-path "/home/lbolla/src/vcs-resolve/"
  :commands (vcs-resolve-at-point
             vcs-resolve-buffer
             vcs-resolve-region))

(use-package virtualenvwrapper
  :init (progn

          (defun venv-get-proj-dir ()
            "While in a venv, return the project directory or nil."
            (let ((fn (concat (getenv "VIRTUAL_ENV") ".project")))
              (if (file-exists-p fn)
                  (chomp (read-file-in-string fn)))))

          (defun venv-cdproject ()
            "Change directory to the current project directory, if set."
            (interactive)
            (let ((dir (venv-get-proj-dir)))
              (if dir
                  (cd dir))))

          (defun venv-build-python-etags ()
            (interactive)
            (let ((dir (venv-get-proj-dir)))
              (shell-command
               (concat "find " dir " -name \"*.py\" | fgrep -ve node_modules/ -ve build/ -ve dist/ -ve .egg/ | xargs etags -f " dir "/TAGS")
               nil nil)
              (setq tags-file-name (concat dir "/TAGS"))))

          (defun venv-workon-and-cdproject (venv)
            (interactive "i")
            (venv-workon venv)
            (venv-cdproject)
            (venv-build-python-etags)
            (dired default-directory)
            (revert-buffer)
            (projectile-vc)
            (other-window 1))

          (global-set-key (kbd "C-c v w") 'venv-workon-and-cdproject))
  :config (progn
            (venv-initialize-interactive-shells)
            (venv-initialize-eshell)))

(use-package w3m)

(use-package web-mode
  :mode (("\\.html\\'" . web-mode)
         ("\\.tmpl\\'" . web-mode))
  :config (progn
            (add-hook 'web-mode-hook
                      (lambda ()
                        (modify-syntax-entry ?\- "w")
                        (setq web-mode-markup-indent-offset 2
                              web-mode-css-indent-offset 2
                              web-mode-code-indent-offset 4)))))

(use-package whitespace)

(use-package yaml-mode
  :mode ("\\.ya?ml\\'" . yaml-mode)
  :init (progn
          (add-hook 'yaml-mode-hook
                    (lambda ()
                      (modify-syntax-entry ?\_ "w")
                      (set-indent 4)))))

(use-package yasnippet
  :disabled t
  :init (yas-global-mode 1))

(provide 'pkgs)
;;; pkgs.el ends here
