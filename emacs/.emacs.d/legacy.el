;; Packages that I used to use
;; Commentary:
;; 13 November 2017

;; TODO use C-w hjkl instead
(global-set-key (kbd "C-c h") 'windmove-left)
(global-set-key (kbd "C-c j") 'windmove-down)
(global-set-key (kbd "C-c k") 'windmove-up)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c u") 'undo-tree-visualize)
(global-set-key (kbd "<f6>") 'gdb)
(global-set-key (kbd "<f7>") 'async-shell-command)
(global-set-key (kbd "C-c b b") 'browse-url-at-point)
(global-set-key (kbd "C-c b w")
                (lambda ()
                  (interactive)
                  (w3m-goto-url (thing-at-point 'word))))
(global-set-key (kbd "C-c b e")
                (lambda ()
                  (interactive)
                  (eww (thing-at-point 'word))))

(use-package ace-jump-mode)

(use-package alchemist
  :disabled t
  :init (add-hook 'elixir-mode-hook
                  (lambda ()
                    (evil-define-key 'normal elixir-mode-map (kbd "C-]") 'alchemist-goto-definition-at-point)
                    (evil-define-key 'normal elixir-mode-map (kbd "K") 'alchemist-help-search-at-point))))

(use-package ag
  :config
 (setq ag-ignore-list (quote ("TAGS" "*.min.*"))))

(use-package ats2-mode
  :load-path "/home/lbolla/src/ATS2-Postiats-0.3.3/utils/emacs/"
  :disabled t
  ;; :commands ats-mode
  :mode ("\\.dats\\'" . ats-mode)
  :init (progn
          ))

(use-package eyebrowse
  :custom
  (eyebrowse-new-workspace t)
  (eyebrowse-keymap-prefix (kbd "C-c e"))
  :init
  (eyebrowse-mode t)
  :config
  (eyebrowse-setup-opinionated-keys))

(use-package ffap
  :config
  (add-to-list 'ffap-c-path "../deps")
  (add-to-list 'ffap-c-path "../../deps"))

(use-package flycheck-ats2
  :load-path "/home/lbolla/src/ATS2-Postiats-0.3.3/utils/emacs/"
  :after ats2-mode
  :commands flycheck-ats2-setup
  :init (progn
          (flycheck-ats2-setup)))

(use-package fzf
  :defer t
  :config
  (setq fzf/executable (expand-file-name "~/.fzf/bin/fzf")))

(use-package gnu-apl-mode)

(use-package auto-revert-tail-mode
  :mode ("\\.log\\'" . auto-revert-tail-mode))

(use-package cider-mode
  :disabled t
  :commands cider-jack-in)

(use-package clojure-mode
  :disabled t)

(use-package disaster
  :config
  (setq disaster-objdump "objdump -d -M intel --demangle -Sl --no-show-raw-insn"))

(use-package docker
  :config (progn
            (docker-global-mode t)))

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

(use-package flycheck-elixir
  :load-path "/home/lbolla/src/emacs-flycheck-elixir/"
  :after flycheck)

(use-package flycheck-dialyzer
  :load-path "/home/lbolla/src/emacs-flycheck-dialyzer/"
  :after flycheck
  :config (progn
            (flycheck-add-next-checker 'erlang 'erlang-dialyzer t)))

(use-package gnuplot)

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

;; (use-package help-mode
;;   :init
;;   (add-hook 'help-mode-hook
;;             (lambda ()
;;               (evil-motion-state 0))))

(use-package kubernetes
  :disabled t
  :load-path "/home/lbolla/src/kubernetes-el/"
  :config (progn
            (kubernetes-global-mode t)))

(use-package ido
  :disabled t
  :init (progn
          (ido-mode t)
          (ido-everywhere t)
          (setq ido-enable-flex-matching t
                ido-file-extensions-order '(".py" ".js" ".html" ".css" t))))

(use-package jedi
  ;; :defer t
  )

(use-package js
  :disabled t
  :init (progn
          (add-hook 'js-mode-hook
                    (lambda ()
                      (setq js-indent-level 4)
                      (local-set-key (kbd "RET") 'newline-and-indent)))))

(use-package monky
  :load-path "/home/lbolla/src/monky"
  :commands monky-status
  :config (progn
            (setq monky-process-type nil)))

(use-package multi-term
  :init (progn
          (defun multi-term-evil ()
            (interactive)
            (multi-term)
            (evil-local-mode -1))
          (global-set-key (kbd "C-c C-t") 'multi-term-evil)))

(use-package python
  ;; :defer t
  :after evil
  :mode (("\\.py\\'" . python-mode)
         ("\\.pyi\\'" . python-mode) ;; type stub files
         ("\\.mk\\'" . python-mode)) ;; check-mk config files
  :config
  (font-lock-add-keywords
   'python-mode
   '(("\\<\\(TODO\\)\\>" 1 font-lock-warning-face t)
     ("\\<\\(FIXME\\)\\>" 1 font-lock-warning-face t)
     ("\\<\\(XXX\\)\\>" 1 font-lock-warning-face t)))
  :hook
  (python-mode . (lambda ()
                   ;; Autocompletion
                   ;; (jedi:setup)
                   ;; Turn off AC and use company instead
                   ;; (auto-complete-mode -1)
                   ;; (add-to-list 'company-backends 'company-jedi)

                   ;; Hideshow mode to handle folding
                   (hs-minor-mode t)

                   ;; PEP8set-whitespace-line-column line width
                   (set-whitespace-line-column 79)

                   ;; Keybidings
                   (evil-define-key 'normal python-mode-map (kbd ",b") 'python-insert-breakpoint)
                   ;; (evil-define-key 'normal python-mode-map (kbd ",pt") 'python-pytest-current-function)
                   ;; (evil-define-key 'normal python-mode-map (kbd ",pT") 'python-pytest-current-file)
                   ;; (evil-define-key 'normal python-mode-map (kbd ",pf") 'python-pyformat-buffer)
                   (evil-define-key 'normal python-mode-map (kbd ",pi") 'python-insert-pylint-ignore)
                   ;; (evil-define-key 'normal python-mode-map (kbd ",pt") 'python-insert-type-annotation)
                   (evil-define-key 'normal python-mode-map (kbd "gf") (lambda () (interactive) (elpy-find-file t)))
                   (evil-define-key 'normal python-mode-map (kbd "C-]") 'elpy-goto-definition)

                   ;; Enter key executes newline-and-indent
                   ;; (local-set-key (kbd "RET") 'newline-and-indent)
                   )))

(use-package rcirc
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
                    ;; ,rcirc-server-yg
                    ;; ,rcirc-server-yg-slack
                    ,rcirc-server-freenode
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

(use-package timonier
  ;; Need to have: kubectl proxy --port=8001
  )

(use-package yasnippet
  :disabled t
  :init (yas-global-mode 1)
  :config
  (setq
   yas-indent-line (quote none)
   yas-prompt-functions
   '(yas-ido-prompt yas-x-prompt yas-dropdown-prompt yas-completing-prompt yas-no-prompt)
   yas-snippet-dirs (quote (yas-installed-snippets-dir))))

;; TODO
;; (use-package virtualenvwrapper
;;   ;; :defer t
;;   :bind (("C-c v w" . venv-workon-and-cdproject))
;;   :config
;;   (venv-initialize-interactive-shells)
;;   (venv-initialize-eshell))

(defun load-theme-base16-default-dark ()
  "Load `base-16-default-dark` theme."
  (interactive)
  (use-package base16-theme)
  (switch-theme 'base16-default-dark)
  ;; (set-face-attribute 'hl-line nil :background "grey15")
  ;; (set-face-attribute 'region nil :foreground "light grey" :background "brown4")
  ;; (set-face-attribute 'org-checkbox nil :background "#666666" :foreground "#cccccc")
  ;; (set-face-attribute 'org-done nil :foreground "forest green")
  ;; (set-face-attribute 'org-scheduled-today nil :foreground "gray70" :weight 'normal)
  ;; (set-face-attribute 'org-scheduled nil :foreground "gray60" :weight 'normal)
  ;; (set-face-attribute 'mu4e-header-highlight-face nil :inherit nil :underline nil :weight 'bold :background "gray20")
  ;; (set-face-attribute 'mu4e-replied-face nil :inherit font-lock-comment-face :weight 'normal :foreground "gray50")
  ;; (set-face-attribute 'message-cited-text-face nil :inherit font-lock-comment-face :underline nil :foreground "gray60")
  ;; (set-face-attribute 'magit-section-highlight nil :background "gray20")
  ;; (set-face-attribute 'magit-diff-file-heading-highlight nil :background "gray20")
  ;; (set-face-attribute 'magit-diff-hunk-heading-highlight nil :background "gray30")
  ;; (set-face-attribute 'magit-diff-hunk-heading nil :background "gray20")
  )

;; Evil settings

;; evil-emacs-state-modes '(Custom-mode Electric-buffer-menu-mode alchemist-iex-mode alchemist-mix-mode alchemist-test-report-mode archive-mode bbdb-mode bookmark-edit-annotation-mode browse-kill-ring-mode bzr-annotate-mode calc-mode calculator-mode cfw:calendar-mode cider-popup-buffer-mode cider-repl-mode comint-mode completion-list-mode debugger-mode delicious-search-mode desktop-menu-blist-mode desktop-menu-mode diff-mode display-time-world-mode doc-view-mode docker-containers-mode docker-images-mode doctor-mode dvc-bookmarks-mode dvc-diff-mode dvc-info-buffer-mode dvc-log-buffer-mode dvc-revlist-mode dvc-revlog-mode dvc-status-mode dvc-tips-mode ediff-meta-mode ediff-mode efs-mode emms-browser-mode emms-mark-mode emms-metaplaylist-mode emms-playlist-mode etags-select-mode eww-mode fj-mode gc-issues-mode gdb-breakpoints-mode gdb-disassembly-mode gdb-frames-mode gdb-locals-mode gdb-memory-mode gdb-registers-mode gdb-threads-mode gist-list-mode git-rebase-mode gnus-article-mode gnus-browse-mode gnus-group-mode gnus-server-mode gnus-summary-mode google-maps-static-mode haskell-error-mode haskell-interactive-mode help-mode inferior-haskell-mode inferior-lisp-mode jde-javadoc-checker-report-mode log-view-mode mh-folder-mode monky-mode org-agenda-mode pass-mode proced-mode rcirc-mode recentf-dialog-mode reftex-select-bib-mode reftex-select-label-mode reftex-toc-mode rg-mode sldb-mode slime-inspector-mode slime-thread-control-mode slime-xref-mode sql-interactive-mode sr-buttons-mode sr-mode sr-tree-mode special-mode sr-virtual-mode tabulated-list-mode tar-mode term-char-mode tetris-mode tla-annotate-mode tla-archive-list-mode tla-bconfig-mode tla-bookmarks-mode tla-branch-list-mode tla-browse-mode tla-category-list-mode tla-changelog-mode tla-follow-symlinks-mode tla-inventory-file-mode tla-inventory-mode tla-lint-mode tla-logs-mode tla-revision-list-mode tla-revlog-mode tla-tree-lint-mode tla-version-list-mode twittering-mode urlview-mode vc-annotate-mode vc-dir-mode vm-mode vm-summary-mode w3m-mode wab-compilation-mode xgit-annotate-mode xgit-changelog-mode xgit-diff-mode xgit-revlog-mode xhg-annotate-mode xhg-log-mode xhg-mode xhg-mq-mode xhg-mq-sub-mode xhg-status-extra-mode))

  ;; (define-key evil-normal-state-map (kbd ", SPC") 'ace-jump-mode)
  ;; (define-key evil-normal-state-map (kbd "gp") 'insert-x-primary-selection)
  ;; (define-key evil-normal-state-map (kbd ",Cgg") 'counsel-git-grep)
  ;; (define-key evil-normal-state-map (kbd ",f") 'cycle-fonts)
  ;; (define-key evil-normal-state-map (kbd ",gg") 'vc-git-grep)
  ;; (define-key evil-normal-state-map (kbd ",gt") 'tags-search)
  ;; (define-key evil-normal-state-map (kbd ",hb") 'vc-annotate)
  ;; (define-key evil-normal-state-map (kbd ",t") 'fzf-evil)
  ;; (define-key evil-normal-state-map (kbd ",K") 'eww-at-point)
  ;; (define-key evil-visual-state-map (kbd ",K") 'eww-region)

;; TODO merged into evil-collections
;; (use-package evil-mu4e
;;   :demand t
;;   :load-path "/home/lbolla/src/evil-mu4e/"
;;   :after (evil mu4e))

;; (defun venv-cdproject ()
;;   "Change directory to the current project directory, if set."
;;   (interactive)
;;   (let ((dir (venv-get-proj-dir)))
;;     (if dir
;;         (cd dir))))

;; (defun venv-build-python-etags ()
;;   "Build etags for venv."
;;   (interactive)
;;   (let ((dir (venv-get-proj-dir)))
;;     (shell-command
;;      (concat "find " dir " -name \"*.py\" | fgrep -ve node_modules/ -ve build/ -ve dist/ -ve .egg/ | xargs etags -f " dir "/TAGS")
;;      nil nil)
;;     (setq tags-file-name (concat dir "/TAGS"))))

;; (defun venv-workon-and-cdproject (venv)
;;   "Activate VENV and cd to it."
;;   (interactive "i")
;;   (venv-workon venv)
;;   ;; (pyvenv-workon venv)
;;   (venv-cdproject)
;;   (message default-directory)
;;   (elpy-rpc-restart)
;;   ;; Replaced etags with dumb-jump
;;   ;; (venv-build-python-etags)
;;   (dired default-directory)
;;   (projectile-switch-project-by-name default-directory)
;;   (revert-buffer)
;;   (projectile-vc default-directory)
;;   (other-window 1)
;;   )

;; TODO elpy C-c C-t is better
;; (defmacro venv-pytest (&rest what)
;;   `(async-shell-command
;;     (concat
;;      "cd "
;;      (venv-get-proj-dir)
;;      " && "
;;      "py.test --color=no -sv "
;;      ,@what)))

;; (defun python-pytest-current-file ()
;;   "Run py.test for current file."
;;   (interactive)
;;   (venv-pytest (buffer-file-name)))

;; (defun python-pytest-at-point ()
;;   "Run py.test thing at point."
;;   (interactive)
;;   (venv-pytest
;;    (buffer-file-name)
;;    " -k "
;;    (thing-at-point 'word)))

;; (defun python-pytest-current-function ()
;;   "Run py.test for current function."
;;   (interactive)
;;   (venv-pytest
;;    (buffer-file-name)
;;    " -k "
;;    (python-current-function)))

  ;; (add-hook 'electric-indent-functions
  ;;           'electric-indent-ignore-python)

;; (defun python-current-function ()
;;   (interactive)
;;   (save-excursion
;;     (end-of-line)
;;     (elpy-shell--nav-beginning-of-defun)
;;     (search-forward-regexp " *def \\(\\w+\\)")
;;     (message (match-string-no-properties 1))))

;; (use-package evil-matchit
;;   :ensure t
;;   :demand t
;;   :after evil
;;   ;; :config (global-evil-matchit-mode 1)
;;   )

;; TODO not capturing email
;; (use-package org-mu4e
;;   :demand t
;;   :after (org mu4e))

(use-package org-bullets
  :after org
  :demand t
  :hook
  (org-mode . org-bullets-mode))

;; org keybindings
  ;; (global-set-key (kbd "C-c o a") 'org-agenda)
  ;; (global-set-key (kbd "C-c o k") 'org-capture)
  ;; (global-set-key (kbd "C-c o l s") 'org-store-link)
  ;; (global-set-key (kbd "C-c o l i") 'org-insert-link)
  ;; (global-set-key (kbd "C-c o l o") 'org-open-at-point)

  ;; (global-set-key (kbd "<f9>") 'org-capture)
  ;; (global-set-key (kbd "C-<f9>") 'org-store-link)
  ;; (global-set-key (kbd "S-<f9>") 'org-insert-link)
  ;; (global-set-key (kbd "<f12>") (lambda () (interactive) (org-agenda nil (kbd "SPC") nil)))
  ;; (global-set-key (kbd "S-<f12>") (lambda (match) (interactive "P") (org-tags-view t match)))
  ;; ;; (global-set-key (kbd "C-<f12>") (lambda (c) (interactive) (execute-kbd-macro (kbd "C-c o a A"))))
  ;; (global-set-key (kbd "M-<f12>") 'org-search-view)

;; Included in flycheck.el
;; (use-package flycheck-mypy
;;   :load-path "/home/lbolla/src/emacs-flycheck-mypy/"
;;   :after flycheck
;;   :demand t
;;   :custom
;;   (flycheck-python-mypy-args '("--incremental" "--ignore-missing-imports" "--follow-imports=skip"))
;;   :config
;;   (flycheck-add-next-checker 'python-pylint '(warning . python-mypy) t))

;; (use-package flycheck-rust
;;   :after rust-mode
;;   :demand t
;;   :custom
;;   ;; Use 'cargo check' not 'cargo test'
;;   (flycheck-rust-check-tests nil)
;;   :hook
;;   (flycheck-mode . flycheck-rust-setup)
;;   :config
;;   (flycheck-add-next-checker 'rust-cargo '(warning . rust-clippy)))

  ;; (define-key evil-normal-state-map (kbd ",=") 'c-indent)

;; (global-set-key (kbd "C-c f h")
;;                 (lambda ()
;;                   (interactive)
;;                   (find-file "~/Private/home.org")))
;; (global-set-key (kbd "C-c f i")
;;                 (lambda ()
;;                   (interactive)
;;                   (find-file "~/.emacs.d/init.el")))
;; (global-set-key (kbd "C-c f p")
;;                 (lambda ()
;;                   (interactive)
;;                   (find-file "~/.emacs.d/pkgs.el")))
;; (global-set-key (kbd "C-c l") 'display-line-numbers-mode)
;; (global-set-key (kbd "C-c w") 'eww)

;; TODO https://www.reddit.com/r/emacs/comments/8fyzjd/theme_not_loading_completly_with_emacsserver/
;; (add-hook 'after-make-frame-functions
;;           (lambda (frame)
;;             (select-frame frame)
;;             ;; (load-theme-leuven)
;;             (load-theme-quasi-monochrome)
;;             ))
