;; Packages that I used to use
;; Commentary:
;; 13 November 2017

;; use C-w hjkl instead
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

;; TODO Move some of these in use-package common :bind
;; (global-set-key (kbd "<f5>") 'compile)
;; (global-set-key (kbd "M-o") 'my/open-line)
;; (global-set-key (kbd "M-O") 'my/open-line-above)
;; (global-set-key (kbd "C-x 2") 'my/split-window-below-and-switch-buffer)
;; (global-set-key (kbd "C-x 3") 'my/split-window-right-and-switch-buffer)
;; (global-set-key (kbd "C-x n") 'my/narrow-or-widen-dwim)

;; (global-set-key (kbd "C-x C-b") 'ibuffer)
;; (global-set-key (kbd "C-c e") 'eshell)
;; (global-set-key (kbd "C-c f") 'variable-pitch-mode)
;; (global-set-key (kbd "C-c t c") 'my/switch-theme)
;; (global-set-key (kbd "C-c t t") 'modus-themes-toggle)
;; (global-set-key (kbd "C-c v w") 'my/venv-workon-and-cdproject)
;; (global-set-key (kbd "C-c w") 'w3m)
;; (global-set-key (kbd "C-c z") 'zoom-window-zoom)
;; (global-set-key (kbd "C-c f l") 'my/find-file-linkz)
;; (global-set-key (kbd "C-c f i") 'my/find-file-init)
;; (global-set-key (kbd "C-c f p") 'my/find-file-pkgs)

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

(use-package calfw
  :commands (cfw:open-calendar-buffer)
  :bind
  ("C-c o k" . lbolla/open-calendar)
  :config
  (use-package calfw-org
    :commands (cfw:open-org-calendar cfw:org-create-source)
    :config
    ;; (setq cfw:org-agenda-schedule-args '(:timestamp :scheduled* deadline*))
    (setq cfw:org-agenda-schedule-args nil))
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

(use-package copy-as-format
  :bind
  ("C-c w j" . copy-as-format-jira)
  ("C-c w s" . copy-as-format-slack)
  ("C-c w w" . (lambda ()
                 (interactive)
                 (let ((current-prefix-arg 4))
                   (copy-as-format)))))

(use-package elpy
  :after python
  :diminish
  :custom
  (elpy-modules '(elpy-module-sane-defaults
                  elpy-module-company
                  elpy-module-eldoc
                  elpy-module-highlight-indentation
                  elpy-module-pyvenv))
  :init
  (elpy-enable))

(use-package epg
  :ensure nil
  :custom
  (epg-pinentry-mode 'loopback))

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
  :disabled t
  :mode (("\\.erl\\'" . erlang-mode)
         ("\\vars.config\\'" . erlang-mode)
         ("\\rebar.config\\'" . erlang-mode))
  :custom
  (erlang-root-dir "/usr/lib/erlang")
  :config
  (evil-define-key 'normal erlang-mode-map (kbd "K") 'erlang-man-function)
  (add-hook 'erlang-mode-hook (lambda ()
                                ;; Unfortunately, erlang-mode does not inherit from prog-mode
                                (modify-syntax-entry ?\_ "w"))))

(use-package flycheck-elixir
  :load-path "/home/lbolla/src/emacs-flycheck-elixir/"
  :after flycheck)

(use-package flycheck-dialyzer
  :disabled t
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

;; Required by FF add-on "Edit with Emacs"
(use-package edit-server
  :init
  (unless (process-status "edit-server")
    (edit-server-start)))

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

(defun my/beep ()
  "Play an alert sound."
  (let ((alert "/usr/share/sounds/gnome/default/alerts/glass.ogg"))
    (start-process "beep" nil "mplayer" (expand-file-name alert))))

;; (defun insert-x-primary-selection ()
;;   "Insert selection from X primary clipboard."
;;   (interactive)
;;   (insert (gui-get-primary-selection)))

;; (defun cycle-fonts ()
;;   "Cycle between the fonts I like."
;;   (interactive)
;;   (set-frame-font (car my-fonts))
;;   (message "Using font %s" (car my-fonts))
;;   (setq my-fonts (cycle my-fonts)))

(defmacro hook-into-modes (func modes)
  "Add FUNC to MODES hooks."
  `(dolist (mode-hook ,modes)
     (add-hook mode-hook ,func)))

;; (defmacro with-basic-http-auth (&rest body)
;;   "Execute BODY with basic http auth."
;;   `(let ((url-request-extra-headers
;;           (cons `("Authorization" . ,(concat "Basic "
;;                                              (base64-encode-string
;;                                               (concat (read-string "Username: " "lorenzo.bolla")
;;                                                       ":"
;;                                                       (read-passwd "Password: "))))) url-request-extra-headers)))
;;      (progn ,@body)))

(defmacro timeit (what &rest body)
  "Time WHAT and run BODY and report real time taken to do so."
  `(let ((start-time (float-time)))
     (progn ,@body)
     (let ((elapsed-time (- (float-time) start-time)))
       (message "Completed %s in %.4f seconds" ,what elapsed-time)
       elapsed-time)))

(use-package rcirc
  :config (progn
            (defun my-rcirc-print-hook (process sender response target text)
              "In PROCESS, if SENDER is not self, ignore RESPONSE and TARGET, beep when TEXT equals current nick."
              ;; (when (and (string-match (regexp-quote (rcirc-nick process)) text)
              (when (and (string-match (concat "@?" (rcirc-nick process)) text)
                         (not (string= (rcirc-nick process) sender))
                         (not (string= (rcirc-server-name process) sender)))
                (my/beep)))
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
                               ;; password
                               ;; encryption
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

;; merged into evil-collections
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

;; elpy C-c C-t is better
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

;; not capturing email
;; (use-package org-mu4e
;;   :demand t
;;   :after (org mu4e))

;; Use mu4e attachment actions A
;; (defun icalendar-import-buffer-in-default-diary ()
;;   "Import icalendar files into default diary."
;;   (interactive)
;;   (defvar diary-file)
;;   (icalendar-import-buffer diary-file t t))

(use-package org-alert
  :after org
  :custom
  (alert-default-style 'notifications)
  (org-alert-interval 600)
  :config
  (org-alert-enable))

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

  ;; (define-key evil-normal-state-map (kbd ",=") 'my/c-indent)

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

;; https://www.reddit.com/r/emacs/comments/8fyzjd/theme_not_loading_completly_with_emacsserver/
;; (add-hook 'after-make-frame-functions
;;           (lambda (frame)
;;             (select-frame frame)
;;             ;; (load-theme-leuven)
;;             (load-theme-quasi-monochrome)
;;             ))

(defun load-theme-doom ()
  "Load `doom` theme."
  (interactive)
  (use-package doom-themes
    :demand t
    :custom
    (doom-tomorrow-day-padded-modeline t)
    (doom-tomorrow-night-padded-modeline t))
  (use-package doom-modeline
    :ensure t
    :disabled t
    :defer t
    :after doom-themes
    :custom
    (doom-modeline-icon t)
    (doom-modeline-bar-width 3)
    (doom-modeline-github nil)
    ;; :hook
    ;; (after-init . doom-modeline-init)
    :init
    (doom-modeline-init))
  (switch-theme 'doom-Iosvkem))

(defun load-theme-zerodark ()
  "Load `zerodark` theme."
  (interactive)
  (use-package zerodark-theme
    :demand t)
  (custom-theme-set-faces 'zerodark
   `(highlight-indentation-face        ((t (:inherit (fringe) :background "#24282f"))))
   `(org-canc                          ((t (:inherit (org-todo) :foreground "dark gray" :strike-through t))))
   `(org-delg                          ((t (:inherit (org-todo) :foreground "gray")))))
  (zerodark-setup-modeline-format)
  (switch-theme 'zerodark))

(use-package restclient
  :mode (((rx ".http" eos) . restclient-mode)))

(use-package w3m
  :custom
 '(w3m-home-page "about:")
  (w3m-search-default-engine "startpage")
  (w3m-search-engine-alist
   '(("searx" "https://searx.me/?q=%s" utf-8)
     ("startpage" "https://www.ixquick.com/do/search?q=%s" utf-8)
     ("yahoo" "https://search.yahoo.com/bin/search?p=%s" nil)
     ("yahoo-ja" "https://search.yahoo.co.jp/bin/search?p=%s" euc-japan)
     ("alc" "https://eow.alc.co.jp/%s/UTF-8/" utf-8)
     ("blog" "https://blogsearch.google.com/blogsearch?q=%s&oe=utf-8&ie=utf-8" utf-8)
     ("blog-en" "https://blogsearch.google.com/blogsearch?q=%s&hl=en&oe=utf-8&ie=utf-8" utf-8)
     ("google" "https://www.google.com/search?q=%s&ie=utf-8&oe=utf-8" utf-8)
     ("google-en" "https://www.google.com/search?q=%s&hl=en&ie=utf-8&oe=utf-8" utf-8)
     ("google news" "https://news.google.com/news?q=%s&ie=utf-8&oe=utf-8" utf-8)
     ("google news-en" "https://news.google.com/news?q=%s&hl=en&ie=utf-8&oe=utf-8" nil)
     ("technorati" "https://www.technorati.com/search/%s" utf-8)
     ("technorati-ja" "https://www.technorati.jp/search/search.html?query=%s&language=ja" utf-8)
     ("technorati-tag" "https://www.technorati.com/tag/%s" utf-8)
     ("goo-ja" "https://search.goo.ne.jp/web.jsp?MT=%s" euc-japan)
     ("excite-ja" "https://www.excite.co.jp/search.gw?target=combined&look=excite_jp&lang=jp&tsug=-1&csug=-1&search=%s" shift_jis)
     ("altavista" "https://altavista.com/sites/search/web?q=\"%s\"&kl=ja&search=Search" nil)
     ("rpmfind" "https://rpmfind.net/linux/rpm2html/search.php?query=%s" nil)
     ("debian-pkg" "https://packages.debian.org/search?&searchon=names&suite=stable&section=all&arch=amd64&keywords=%s" nil)
     ("debian-bts" "https://bugs.debian.org/cgi-bin/pkgreport.cgi?archive=yes&pkg=%s" nil)
     ("freebsd-users-jp" "https://home.jp.FreeBSD.org/cgi-bin/namazu.cgi?key=\"%s\"&whence=0&max=50&format=long&sort=score&dbname=FreeBSD-users-jp" euc-japan)
     ("iij-archie" "https://www.iij.ad.jp/cgi-bin/archieplexform?query=%s&type=Case+Insensitive+Substring+Match&order=host&server=archie1.iij.ad.jp&hits=95&nice=Nice" nil)
     ("waei" "https://dictionary.goo.ne.jp/search.php?MT=%s&kind=je" euc-japan)
     ("eiwa" "https://dictionary.goo.ne.jp/search.php?MT=%s&kind=ej" nil)
     ("kokugo" "https://dictionary.goo.ne.jp/search.php?MT=%s&kind=jn" euc-japan)
     ("eiei" "https://www.dictionary.com/cgi-bin/dict.pl?term=%s&r=67" nil)
     ("amazon" "https://www.amazon.com/exec/obidos/search-handle-form/250-7496892-7797857" iso-8859-1 "url=index=blended&field-keywords=%s")
     ("amazon-ja" "https://www.amazon.co.jp/gp/search?__mk_ja_JP=%%83J%%83%%5E%%83J%%83i&url=search-alias%%3Daps&field-keywords=%s" shift_jis)
     ("emacswiki" "https://www.emacswiki.org/cgi-bin/wiki?search=%s" nil)
     ("en.wikipedia" "https://en.wikipedia.org/wiki/Special:Search?search=%s" nil)
     ("de.wikipedia" "https://de.wikipedia.org/wiki/Spezial:Search?search=%s" utf-8)
     ("ja.wikipedia" "https://ja.wikipedia.org/wiki/Special:Search?search=%s" utf-8)
     ("msdn" "https://search.msdn.microsoft.com/search/default.aspx?query=%s" nil)
     ("duckduckgo" "https://duckduckgo.com/?q=%s" utf-8)))
  )

(use-package fbcli
  :demand t
  :mode ((rx ".fbcli_comment" eos) . fogbugz-mode)
  :load-path "/home/lbolla/src/fbcli/")

(use-package htmlize)

(use-package olivetti)

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

(use-package js2-mode
  :disabled t
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

(defun set-indent (size)
  "Set indent equal to SIZE."
  (interactive "p")
  (defvar evil-shift-width)
  (defvar js-indent-level)
  (defvar json-reformat:indent-width)
  (setq evil-shift-width size
        js-indent-level size
        json-reformat:indent-width size
        tab-width size))

(use-package kubernetes
  :bind
  ("C-c k" . kubernetes-overview)
  :custom
  (kubernetes-kubectl-flags '("--kubeconfig=/home/lbolla/src/yougov/devops/kubernetes/client/config")))

(use-package dimmer
  :bind
  ("C-c d" . dimmer-mode)
  :custom
  (dimmer-fraction 0.4)
  :config
  (dimmer-configure-hydra)  ;; TODO  ivy-hydra???
  (dimmer-configure-org)
  (dimmer-configure-which-key))

(use-package rmsbolt
  :disabled t)

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

(use-package diminish
  :disabled t
  :demand t
  :init
  (eval-after-load 'abbrev '(diminish 'abbrev-mode))
  (eval-after-load 'autorevert '(diminish 'auto-revert-mode))
  (eval-after-load 'eldoc '(diminish 'eldoc-mode))
  (eval-after-load 'elpy '(diminish 'elpy-mode))
  (eval-after-load 'flyspell '(diminish 'flyspell-mode))
  (eval-after-load 'hideshow '(diminish 'hs-minor-mode))
  (eval-after-load 'mml '(diminish 'mml-mode))
  (eval-after-load 'org-indent '(diminish 'org-indent-mode))
  (eval-after-load 'simple '(diminish 'auto-fill-function))
  (eval-after-load 'smerge-mode '(diminish 'smerge-mode))
  (eval-after-load 'undo-tree '(diminish 'undo-tree-mode))
  (eval-after-load 'whitespace '(diminish 'whitespace-mode)))

(use-package company-lsp
  :after lsp-mode
  :custom
  (company-lsp-cache-candidates 'auto)
  (company-lsp-enable-snippet nil)
  :config
  (push 'company-lsp company-backends))

;; ;; From https://github.com/jethrokuan/.emacs.d/blob/master/init.el
;; (defun my/org-process-inbox ()
;;   "Called in org-agenda-mode, processes all inbox items."
;;   (interactive)
;;   (org-agenda-bulk-mark-regexp "inbox:")
;;   (my/bulk-process-entries))

;; (defun my/bulk-process-entries ()
;;   "Bulk process inbox entries."
;;   (if (not (null org-agenda-bulk-marked-entries))
;;       (let ((entries (reverse org-agenda-bulk-marked-entries))
;;             (processed 0)
;;             (skipped 0))
;;         (dolist (e entries)
;;           (let ((pos (text-property-any (point-min) (point-max) 'org-hd-marker e)))
;;             (if (not pos)
;;                 (progn (message "Skipping removed entry at %s" e)
;;                        (cl-incf skipped))
;;               (goto-char pos)
;;               (let (org-loop-over-headlines-in-active-region) (funcall 'my/org-agenda-process-inbox-item))
;;               ;; `post-command-hook' is not run yet.  We make sure any
;;               ;; pending log note is processed.
;;               (when (or (memq 'org-add-log-note (default-value 'post-command-hook))
;;                         (memq 'org-add-log-note post-command-hook))
;;                 (org-add-log-note))
;;               (cl-incf processed))))
;;         (org-agenda-redo)
;;         (unless org-agenda-persistent-marks (org-agenda-bulk-unmark-all))
;;         (message "Acted on %d entries%s%s"
;;                  processed
;;                  (if (= skipped 0)
;;                      ""
;;                    (format ", skipped %d (disappeared before their turn)"
;;                            skipped))
;;                  (if (not org-agenda-persistent-marks) "" " (kept marked)")))))

;; (defun my/org-agenda-process-inbox-item ()
;;   "Process a single item in the org-agenda."
;;   (interactive)
;;   (org-with-wide-buffer
;;    (org-agenda-set-tags)
;;    (org-agenda-priority)
;;    (call-interactively 'my/org-agenda-set-effort)
;;    (org-agenda-refile nil nil t)))

;; (defcustom my/org-current-effort "1:00" "Current effort for agenda items." :group 'local :type 'list)

;; (defun my/org-agenda-set-effort (effort)
;;   "Set the effort property for the current headline."
;;   (interactive
;;    (list (read-string (format "Effort [%s]: " my/org-current-effort) nil nil my/org-current-effort)))
;;   (setq my/org-current-effort effort)
;;   (org-agenda-check-no-diary)
;;   (let* ((hdmarker (or (org-get-at-bol 'org-hd-marker)
;;                        (org-agenda-error)))
;;          (buffer (marker-buffer hdmarker))
;;          (pos (marker-position hdmarker))
;;          (inhibit-read-only t)
;;          newhead)
;;     (org-with-remote-undo buffer
;;       (with-current-buffer buffer
;;         (widen)
;;         (goto-char pos)
;;         (org-show-context 'agenda)
;;         (funcall-interactively 'org-set-effort nil my/org-current-effort)
;;         (end-of-line 1)
;;         (setq newhead (org-get-heading)))
;;       (org-agenda-change-all-lines newhead hdmarker))))

(use-package undo-tree
  :custom
  (undo-tree-auto-save-history nil)  ;; Super slow if t
  (undo-tree-history-directory-alist `(("." . ,(concat user-emacs-directory ".undo-tree")))))

(use-package mu4e
  :load-path "/usr/local/share/emacs/site-lisp/mu4e/"
  :ensure nil  ;; installed system-wide
  ;; :demand t

  :defines
  mu4e-view-actions
  yg-smtp-user

  :functions
  my/mu4e-headers-narrow-thing-at-point
  my/mu4e-refresh-headers

  :bind (("C-c m m" . mu4e)
         ("C-c m n" . mu4e-compose-new)
         :map mu4e-main-mode-map
         ("C-c C-u" . my/mu4e-refresh-headers)
         :map mu4e-headers-mode-map
         ("C-c /" . my/mu4e-headers-narrow)
         ("C-c C-u" . my/mu4e-refresh-headers)
         ("<backspace>" . mu4e-headers-query-prev))

  :config
  (defun my/mu4e-refile-folder-function (msg)
    "Set the refile folder for MSG."
    ;; https://www.djcbsoftware.nl/code/mu/mu4e/Refiling-messages.html
    (concat "/YG/Archives/" (format-time-string "%Y" (mu4e-message-field msg :date))))

  :custom
  (user-mail-address yg-smtp-user)
  (user-full-name  "Lorenzo Bolla")
  (mu4e-drafts-folder "/YG/Drafts")
  (mu4e-sent-folder "/YG/Sent Items")
  (mu4e-trash-folder "/YG/Deleted Items")
  (mu4e-refile-folder 'my/mu4e-refile-folder-function)
  (mu4e-change-filenames-when-moving t)
  (mu4e-maildir-shortcuts '((:maildir "/YG/INBOX"      :key ?i)
                            (:maildir "/YG/Sent Items" :key ?s)
                            (:maildir "/YG/Errors"     :key ?e)
                            (:maildir "/YG/GitLab"     :key ?g)
                            (:maildir "/YG/Tickets"    :key ?t)))
  (mu4e-bookmarks '((:name "Unread"               :query "flag:unread AND NOT flag:trashed AND NOT maildir:/YG/Archives"                  :key ?u)
                    (:name "Unread inbox"         :query "flag:unread AND NOT flag:trashed AND maildir:/YG/INBOX"                         :key ?i)
                    (:name "Unread errors"        :query "flag:unread AND NOT flag:trashed AND maildir:/YG/Errors"                        :key ?e)
                    (:name "Unread tickets"       :query "flag:unread AND NOT flag:trashed AND maildir:/YG/Tickets"                       :key ?t)
                    (:name "Unread GitLab"        :query "flag:unread AND NOT flag:trashed AND maildir:/YG/GitLab"                        :key ?g)
                    (:name "Unread mentions"      :query "flag:unread AND NOT flag:trashed AND NOT maildir:/YG/Archives AND body:lorenzo" :key ?m)
                    (:name "Unread archived"      :query "flag:unread AND maildir:/YG/Archives"                                           :key ?a)
                    (:name "Flagged"              :query "flag:flagged AND NOT maildir:/YG/Archives"                                      :key ?f)
                    ;; (:name "With attachment"      :query "flag:attach"                                              :key ?a)
                    ;; (:name "Today's messages"     :query "date:today..now"                                          :key ?t)
                    ;; (:name "Last 7 days"          :query "date:7d..now"                                             :key ?w)
                    ;; (:name "Messages with images" :query "mime:image/*"                                             :key ?p)
                    ;; (:name "2013 inbox"            :query "maildir:/YG/INBOX AND date:20130101..20131231"            :key ?3)
                    ;; (:name "2014 inbox"            :query "maildir:/YG/INBOX AND date:20140101..20141231"            :key ?4)
                    ;; (:name "2015 inbox"            :query "maildir:/YG/INBOX AND date:20150101..20151231"            :key ?5)
                    ;; (:name "2016 inbox"            :query "maildir:/YG/INBOX AND date:20160101..20161231"            :key ?6)
                    ;; (:name "2017 inbox"            :query "maildir:/YG/INBOX AND date:20170101..20171231"            :key ?7)
                    ;; (:name "2018 inbox"            :query "maildir:/YG/INBOX AND date:20180101..20181231"            :key ?8)
                    ;; (:name "2019 inbox"            :query "maildir:/YG/INBOX AND date:20190101..20191231"            :key ?9)
                    ))
  ;; (mail-user-agent 'mu4e-user-agent)
  (mu4e-compose-complete-addresses t)
  (mu4e-compose-complete-only-after nil)
  (mu4e-compose-complete-only-personal nil)
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
  (mu4e-headers-include-related nil)
  ;; (mu4e-headers-results-limit 500)
  (mu4e-view-actions '(("capture message" . mu4e-action-capture-message)
                       ("view as pdf" . mu4e-action-view-as-pdf)
                       ("show this thread" . mu4e-action-show-thread)
                       ("browse" . mu4e-action-view-in-browser)))
  (mu4e-view-show-addresses t)
  (mu4e-view-show-images nil)
  (mu4e-view-use-gnus nil))

(use-package mu4e-alert
  :bind
  ("C-c m u" . mu4e-alert-view-unread-mails)
  :custom
  ;; (mu4e-alert-interesting-mail-query "(flag:unread OR flag:flagged) AND NOT flag:trashed")
  (mu4e-alert-style 'log)
  :config
  (mu4e-alert-enable-notifications)
  (mu4e-alert-enable-mode-line-display))

(use-package org-mu4e
  :ensure nil
  :demand t
  :after (org mu4e))

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

;; Use pyright instead
;; (use-package lsp-python-ms
;;   :custom
;;   (lsp-python-ms-disabled ["inherit-non-class"])
;;   :hook
;;   (python-mode . (lambda ()
;;                    (require 'lsp-python-ms)
;;                    (lsp-deferred))))
