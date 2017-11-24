;;; Packages that I used to use
;;; Commentary:
;;; 13 November 2017

;; TODO use C-w hjkl instead
;; (global-set-key (kbd "C-c h") 'windmove-left)
;; (global-set-key (kbd "C-c j") 'windmove-down)
;; (global-set-key (kbd "C-c k") 'windmove-up)
;; (global-set-key (kbd "C-c l") 'windmove-right)
;; (global-set-key (kbd "C-c u") 'undo-tree-visualize)
;; (global-set-key (kbd "<f6>") 'gdb)
;; (global-set-key (kbd "<f7>") 'async-shell-command)
;; (global-set-key (kbd "C-c b b") 'browse-url-at-point)
;; (global-set-key (kbd "C-c b w")
;;                 (lambda ()
;;                   (interactive)
;;                   (w3m-goto-url (thing-at-point 'word))))
;; (global-set-key (kbd "C-c b e")
;;                 (lambda ()
;;                   (interactive)
;;                   (eww (thing-at-point 'word))))

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

(use-package flycheck-ats2
  :load-path "/home/lbolla/src/ATS2-Postiats-0.3.3/utils/emacs/"
  :after ats2-mode
  :commands flycheck-ats2-setup
  :init (progn
          (flycheck-ats2-setup)))

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

(use-package ido
  :disabled t
  :init (progn
          (ido-mode t)
          (ido-everywhere t)
          (setq ido-enable-flex-matching t
                ido-file-extensions-order '(".py" ".js" ".html" ".css" t))))

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

