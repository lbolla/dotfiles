;;; package --- lbolla init.el file
;;; Commentary:
;;; 14 March 2014

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote (("." . "~/.emacs.d/backups"))))
 '(column-number-mode t)
 '(custom-safe-themes (quote ("c4bdf654f62e0de639da577ad68283484b15c0937129bcfb7ecec43314d1b154" default)))
 '(delete-old-versions t)
 '(display-time-world-list (quote (("UTC" "UTC") ("America/Los_Angeles" "Palo Alto") ("America/New_York" "New York") ("Europe/London" "London") ("Europe/Rome" "Rome") ("Asia/Shanghai" "Shanghai") ("Asia/Tokyo" "Tokyo"))))
 '(evil-emacs-state-modes (quote (archive-mode bbdb-mode bookmark-bmenu-mode bookmark-edit-annotation-mode browse-kill-ring-mode bzr-annotate-mode calculator-mode calc-mode cfw:calendar-mode completion-list-mode Custom-mode debugger-mode delicious-search-mode desktop-menu-blist-mode desktop-menu-mode doc-view-mode dvc-bookmarks-mode dvc-diff-mode dvc-info-buffer-mode dvc-log-buffer-mode dvc-revlist-mode dvc-revlog-mode dvc-status-mode dvc-tips-mode ediff-mode ediff-meta-mode efs-mode Electric-buffer-menu-mode emms-browser-mode emms-mark-mode emms-metaplaylist-mode emms-playlist-mode etags-select-mode fj-mode gc-issues-mode gdb-breakpoints-mode gdb-disassembly-mode gdb-frames-mode gdb-locals-mode gdb-memory-mode gdb-registers-mode gdb-threads-mode gist-list-mode gnus-article-mode gnus-browse-mode gnus-group-mode gnus-server-mode gnus-summary-mode google-maps-static-mode ibuffer-mode jde-javadoc-checker-report-mode magit-commit-mode magit-diff-mode magit-key-mode magit-log-mode magit-mode magit-reflog-mode magit-show-branches-mode magit-branch-manager-mode magit-stash-mode magit-status-mode magit-wazzup-mode magit-process-mode mh-folder-mode monky-mode mu4e-main-mode mu4e-headers-mode mu4e-view-mode notmuch-hello-mode notmuch-search-mode notmuch-show-mode occur-mode org-agenda-mode package-menu-mode proced-mode rcirc-mode rebase-mode recentf-dialog-mode reftex-select-bib-mode reftex-select-label-mode reftex-toc-mode sldb-mode slime-inspector-mode slime-thread-control-mode slime-xref-mode sr-buttons-mode sr-mode sr-tree-mode sr-virtual-mode tar-mode tetris-mode tla-annotate-mode tla-archive-list-mode tla-bconfig-mode tla-bookmarks-mode tla-branch-list-mode tla-browse-mode tla-category-list-mode tla-changelog-mode tla-follow-symlinks-mode tla-inventory-file-mode tla-inventory-mode tla-lint-mode tla-logs-mode tla-revision-list-mode tla-revlog-mode tla-tree-lint-mode tla-version-list-mode twittering-mode urlview-mode vc-annotate-mode vc-dir-mode vc-git-log-view-mode vc-svn-log-view-mode vm-mode vm-summary-mode w3m-mode wab-compilation-mode xgit-annotate-mode xgit-changelog-mode xgit-diff-mode xgit-revlog-mode xhg-annotate-mode xhg-log-mode xhg-mode xhg-mq-mode xhg-mq-sub-mode xhg-status-extra-mode cider-repl-mode cider-popup-buffer-mode inferior-lisp-mode help-mode flycheck-error-list-mode inferior-haskell-mode haskell-error-mode haskell-interactive-mode)))
 '(font-use-system-font t)
 '(ido-ignore-files (quote ("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./" "\\.egg-info/")))
 '(inhibit-startup-screen t)
 '(mouse-autoselect-window t)
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(user-full-name "Lorenzo Bolla")
 '(vc-follow-symlinks nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "light gray" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 119 :width normal :foundry "unknown" :family "Terminus")))))

(load-file "~/.emacs.d/util.el")
(load-file "~/.emacs.d/custom.el")
(load-file "~/.emacs.d/private.el")
(load-file "~/.emacs.d/yg.el")

(setenv "PATH" (concat "~/.cabal/bin:" (getenv "PATH")))
(add-to-list 'exec-path "~/.cabal/bin")

(global-set-key "\C-x\C-b" 'buffer-menu)
(global-set-key (kbd "C-c h") 'windmove-left)
(global-set-key (kbd "C-c j") 'windmove-down)
(global-set-key (kbd "C-c k") 'windmove-up)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c t") 'ansi-term)
(global-set-key (kbd "C-c i") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))

(load-theme 'lorenzo)
(server-start)

;;; Packages
(require 'package)

;; Repositories
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Load all downloaded packages
(package-initialize)

;; Package management
;; See https://github.com/jwiegley/dot-emacs/blob/master/init.el
;;     https://github.com/jordonbiondo/.emacs.d/blob/master/init.el
(require 'use-package)

(use-package evil
  :ensure t
  :init (timeit
	 "EVIL"

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

	 (use-package evil-nerd-commenter
	   :ensure t)

	 (use-package evil-matchit
	   :ensure t
	   :init (progn
		    (global-evil-matchit-mode 1)))

	 (evil-mode t)
	 ;; (define-key evil-normal-state-map (kbd ",t") 'new-tab)
	 (define-key evil-normal-state-map (kbd "C-w t") 'new-tab)
	 (define-key evil-normal-state-map (kbd "C-w x") 'delete-tab)
	 (define-key evil-normal-state-map (kbd "gt") 'next-tab)
	 (define-key evil-normal-state-map (kbd "gT") 'previous-tab)
	 (define-key evil-normal-state-map (kbd ",gg") 'vc-git-grep)
	 (define-key evil-normal-state-map (kbd ",G") 'rgrep)
	 (define-key evil-normal-state-map (kbd ",m") 'menu-bar-mode)
	 (define-key evil-normal-state-map (kbd ",f") 'cycle-fonts)
	 (define-key evil-normal-state-map (kbd ",a") 'ace-jump-mode)
	 (define-key evil-normal-state-map (kbd ",yf") 'yg-fogbugz-browse-at-point)
	 (define-key evil-normal-state-map (kbd ",yp") 'yg-paste-buffer)
	 (define-key evil-visual-state-map (kbd ",c") 'evilnc-comment-or-uncomment-lines)
	 (define-key evil-normal-state-map (kbd ",c") 'evilnc-comment-or-uncomment-lines)))

(use-package paredit
  :ensure t
  :init (progn
	  (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
	  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
	  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
	  (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
	  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
	  ;; (add-hook 'haskell-mode-hook          #'enable-paredit-mode)
	  (add-hook 'inferior-lisp-mode-hook    #'enable-paredit-mode)
	  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
	  (add-hook 'clojure-mode-hook          #'enable-paredit-mode)
	  (add-hook 'cider-repl-mode-hook       #'enable-paredit-mode)
	  (add-hook 'scheme-mode-hook           #'enable-paredit-mode)))

(use-package flycheck
  :ensure t
  :init (timeit
	 "FLYCHECK"
	 (add-hook 'after-init-hook #'global-flycheck-mode)
	 (setq flycheck-highlighting-mode 'lines)
	 (setq flycheck-ghc-language-extensions ())
	 (setq python-check-function "flake8")))

(use-package flycheck-haskell
  :ensure t
  :init (progn
	 (add-hook 'flycheck-mode-hook #'flycheck-haskell-setup)
	 (add-hook 'haskell-mode-hook #'flycheck-haskell-configure)))

(use-package ido
  :ensure t
  :init (timeit
	 "IDO"
	 (ido-mode t)
	 (ido-everywhere t)
	 (setq ido-enable-flex-matching t)
	 (setq ido-file-extensions-order '(".py" ".js" ".emacs" t))))

(use-package tool-bar
  :init (progn
	  (tool-bar-mode 0)))

(use-package hl-line
  :init (progn
	  (global-hl-line-mode)))

(use-package scroll-bar
  :init (progn
	  (scroll-bar-mode 0)))

(use-package menu-bar
  :init (progn
	  (menu-bar-mode 0)))

(use-package frame
  :init (progn
	  (blink-cursor-mode)))

(use-package paren
  :init (progn
	  (show-paren-mode)))

(use-package xclip
  :ensure t
  :init (timeit
	 "XCLIP"
	 (xclip-mode t)))

(use-package projectile
  :ensure t
  :init (timeit
	 "PROJECTILE"
	  (projectile-global-mode)
	  (define-key evil-normal-state-map "\C-p" 'projectile-find-file)))

(use-package go-mode
  :ensure t
  :mode ("\\.go\\'" . go-mode)
  :init (timeit
	   "GO-MODE"
	   (add-hook 'before-save-hook 'gofmt-before-save)
	   (add-hook 'go-mode-hook 'auto-complete-mode)))

(use-package virtualenvwrapper
  :ensure t
  :defer t
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

	  (defun venv-workon-and-cdproject (venv)
	    (interactive "i")
	    (venv-workon venv)
	    (venv-cdproject)
	    (dired default-directory))

	  (define-key evil-normal-state-map ",w" 'venv-workon-and-cdproject))

  :config (timeit
	   "VENV"
	   (venv-initialize-interactive-shells)
	   (venv-initialize-eshell)))

(use-package w3m
  :ensure t
  :defer t)

(use-package xclip
  :disabled t
  :ensure t
  :defer t)

(use-package yaml-mode
  :ensure t
  :mode ("\\.ya?ml\\'" . yaml-mode))

(use-package text-mode
  :mode "\\README\\'"
  :init (progn
	  (add-hook 'text-mode-hook
		    (lambda ()
		      (flyspell-mode t)))))

(use-package help-mode
  :init (progn
	  (add-hook 'help-mode-hook
		    (lambda ()
		      (evil-motion-state 0)))))

(use-package jedi
  :ensure t
  :commands jedi:setup
  :config (timeit
	   "JEDI"
	   (setq jedi:complete-on-dot t)
	   (setq jedi:tooltip-method nil)))

(use-package electric
  :init (timeit
	 "ELECTRIC"
	 ;; Ignoring electric indentation
	 (defun electric-indent-ignore-python (char)
	   "Ignore electric indentation for 'python-mode' after CHAR."
	   (if (equal major-mode 'python-mode)
	       `no-indent'
	     nil))
	 (electric-indent-mode t)
	 (add-hook 'electric-indent-functions
		   'electric-indent-ignore-python)))

(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :init (progn
	  (defun python-insert-breakpoint ()
	    "Insert Python breakpoint above point."
	    (interactive)
	    (evil-open-above 1)
	    (insert "import ipdb; ipdb.set_trace()  # BREAKPOINT")
	    (evil-normal-state)))
  :config (timeit
	 "PYTHON"

	 (defun python-current-function ()
	   (save-excursion
	     (end-of-line)
	     (beginning-of-defun)
	     (search-forward-regexp " *def \\(\\w+\\)")
	     (message (match-string-no-properties 1))))

	 (defmacro venv-pytest (&rest what)
	   `(async-shell-command
	     (concat
	      "cd "
	      (venv-get-proj-dir)
	      " && "
	      "py.test -v "
	      ,@what)))

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

	 (font-lock-add-keywords
	   'python-mode
	   '(("\\<\\(TODO\\)\\>" 1 font-lock-warning-face t)
	     ("\\<\\(FIXME\\)\\>" 1 font-lock-warning-face t)))

	  (add-hook 'python-mode-hook
		    (lambda ()
		      ;; Underscore part of word in Python
		      (modify-syntax-entry ?\_ "w" python-mode-syntax-table)
		      ;; Autocompletion
		      (jedi:setup)
		      ;; Keybidings
		      (define-key evil-normal-state-map (kbd ",b") 'python-insert-breakpoint)
		      (define-key evil-normal-state-map (kbd ",t") 'python-pytest-current-function)
		      (define-key evil-normal-state-map (kbd ",T") 'python-pytest-current-file)
		      ;; Enter key executes newline-and-indent
		      (local-set-key (kbd "RET") 'newline-and-indent)))))

(use-package magit
  :ensure t
  :config (progn
	    (define-key evil-normal-state-map (kbd ",gb") 'magit-blame-mode)
	    (global-set-key (kbd "C-x G") 'magit-status)))

(use-package cython-mode
  :ensure t
  :defer t
  :config (progn
	    (defun cython-show-annotated ()
	      (interactive)
	      (browse-url (concat "file://" (replace-regexp-in-string "\.pyx$" ".html" (buffer-file-name)))))
	    (define-key evil-normal-state-map (kbd ",a") 'cython-show-annotated)))

(use-package js
  :init (progn
	  (add-hook 'js-mode-hook
		    (lambda ()
		      (setq indent-tabs-mode nil
			    js-indent-level 2)
		      (modify-syntax-entry ?\_ "w")))))

(use-package sql
  :init (progn
	  (add-hook 'sql-mode-hook
		    (lambda ()
		      (modify-syntax-entry ?\_ "w")))))

(use-package whitespace
  :ensure t
  :init (timeit
	 "WHITESPACE"
	 (hook-into-modes 'whitespace-mode '(python-mode-hook))
	 ;; Highlight portion of lines >79
	 (setq whitespace-line-column 79)
	 (setq whitespace-style '(face lines-tail))))

(use-package markdown-mode
  :mode ("\\.md\\'" . markdown-mode)
  :config (progn
	    (setq indent-tabs-mode nil)
	    (setq evil-shift-width 2)
	    (setq tab-width 2)))

(use-package org
  :init (progn
	    (global-set-key (kbd "C-c o a") 'org-agenda)
	    (global-set-key (kbd "C-c o c") 'org-capture)
	    (global-set-key (kbd "C-c o l") 'org-store-link)
	    (add-hook 'org-mode-hook
		      (lambda ()
			(auto-fill-mode t)
			(flyspell-mode t)))
	    (setq org-log-done 'time
		  org-log-into-drawer t
		  org-agenda-include-diary t
		  org-todo-keywords '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)"))
		  org-todo-keyword-faces '(("TODO" . org-todo) ("WAIT" . "yellow")
					   ("CANCELED" . "gray") ("DONE" . org-done))
		  org-agenda-files '("~/org/")
		  org-link-abbrev-alist '(("google"    . "http://www.google.com/search?q=")
					  ("gmap"      . "http://maps.google.com/maps?q=%s")))))

(use-package sgml-mode
  :mode (("\\.html\\'" . html-mode)
	 ("\\.tmpl\\'" . html-mode))
  :config (progn
	    (sgml-guess-indent)
	    (modify-syntax-entry ?\_ "w")
	    (modify-syntax-entry ?\- "w")))

(use-package cider
  :commands cider-jack-in)

(use-package gnuplot
  :defer t)

(use-package haskell-mode
  :defer t
  :config (progn
	    (add-hook
	     'haskell-mode-hook
	     (lambda ()
	       ;; See https://github.com/serras/emacs-haskell-tutorial/blob/master/tutorial.md#haskell-mode
	       (turn-on-haskell-decl-scan)
	       (turn-on-haskell-doc-mode t)
	       (turn-on-haskell-indentation)
	       ;; (require 'w3m-haddock)
	       ;; (add-hook 'w3m-display-hook 'w3m-haddock-display)
	       (setq
		evil-shift-width 2
		tab-width 2
		js-indent-level 2
		haskell-compile-cabal-build-command "cd %s && ~/.cabal/bin/cabal build -v --ghc-options=-ferror-spans"
		haskell-process-suggest-remove-import-lines t
		haskell-process-auto-import-loaded-modules t
		haskell-process-type 'cabal-repl
		;; haskell-w3m-haddock-dirs '("~/.cabal/share/doc/")
		haskell-process-log t)
	       (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
	       (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile)
	       ;; (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
	       (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
	       (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
	       (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
	       (define-key haskell-mode-map (kbd "C-c C-v") 'haskell-cabal-visit-file)
	       ;; (define-key haskell-mode-map (kbd "C-c C-d") 'haskell-w3m-open-haddock)
	       (define-key haskell-mode-map (kbd "C-c `") 'haskell-interactive-bring)))))

(use-package haskell-cabal
  :mode ("\\.cabal\\'" . haskell-cabal-mode)
  :config (progn
	    (add-hook 'haskell-cabal-mode-hook
		      (lambda ()
			(setq indent-tabs-mode nil)))))

(use-package auto-revert-tail-mode
  :mode ("\\.log\\'" . auto-revert-tail-mode))

(use-package csv-mode
  :mode ("\\.csv\\'" . csv-mode))

(use-package lua-mode
  :ensure t
  :defer t)

(use-package ace-jump-mode
  :ensure t
  :defer t)

(use-package rcirc
  :ensure t
  :defer t
  :config (timeit
	   "RCIRC"
	   (defun my-rcirc-print-hook (process sender response target text)
	     "In PROCESS, if SENDER is not self, ignore RESPONSE and TARGET, beep when TEXT equals current nick."
	     (when (and (string-match (regexp-quote (rcirc-nick process)) text)
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
	   (setq rcirc-server-alist '())
	   (add-to-list 'rcirc-server-alist yg-rcirc-server)
	   ;; (add-to-list 'rcirc-server-alist freenode-rcirc-server)
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

(use-package shm
  :disabled t
  :load-path "/home/lbolla/src/structured-haskell-mode/elisp"
  :init (progn
	  (add-hook 'haskell-mode-hook
		    (lambda ()
		      (electric-indent-mode 0)
		      (hl-line-mode 0)
		      (structured-haskell-mode)))))

(use-package mu4e
  :load-path "/usr/local/share/emacs/site-lisp/mu4e"
  :init (progn
	  ;; default
	  (setq mu4e-maildir "/home/lbolla/Mail")

	  ;; (setq mu4e-drafts-folder "/Networkscale/[Gmail].Drafts")
	  ;; (setq mu4e-sent-folder   "/Networkscale/[Gmail].Sent Mail")
	  ;; (setq mu4e-trash-folder  "/Networkscale/[Gmail].Bin")

	  ;; ;; don't save message to Sent Messages, Gmail/IMAP takes care of this
	  ;; (setq mu4e-sent-messages-behavior 'delete)

	  ;; (setq mu4e-maildir-shortcuts
	  ;; 	'(("/Networkscale/INBOX"               . ?i)
	  ;; 	  ("/Networkscale/[Gmail].Sent Mail"   . ?s)
	  ;; 	  ("/Networkscale/[Gmail].Bin"         . ?t)
	  ;; 	  ("/Networkscale/[Gmail].All Mail"    . ?a)))

	  ;; ;; something about ourselves
	  ;; (setq
	  ;;  user-mail-address "lorenzo@networkscale.co.uk"
	  ;;  user-full-name  "Lorenzo Bolla"
	  ;;  message-signature
	  ;;  (concat
	  ;;   "Lorenzo Bolla, Director\n"
	  ;;   "Networkscale Ltd.\n"))

	  (defvar mu4e-my-accounts-alist
	    `(("Personal"
	       (mu4e-sent-folder . "/Personal/[Gmail].Sent Mail")
	       (mu4e-drafts-folder . "/Personal/[Gmail].Drafts")
	       (mu4e-trash-folder . "/Personal/[Gmail].Bin")
	       ;; don't save message to Sent Messages, Gmail/IMAP takes care of this
	       (mu4e-sent-messages-behavior . delete)
	       (mu4e-maildir-shortcuts . (("/Personal/INBOX"               . ?i)
					  ("/Personal/[Gmail].Sent Mail"   . ?s)
					  ("/Personal/[Gmail].Bin"         . ?t)
					  ("/Personal/[Gmail].All Mail"    . ?a)))
	       (message-signature . "Lorenzo Bolla\nhttp://lbolla.info")
	       (user-mail-address . ,personal-smtp-mail-address)
	       (smtpmail-smtp-user . ,personal-smtp-mail-address)
	       (smtpmail-smtp-server . ,personal-smtp-server)
	       (smtpmail-smtp-service . ,personal-smtp-port)
	       (smtpmail-stream-type . starttls))
	      ("Networkscale"
	       (mu4e-sent-folder . "/Networkscale/[Gmail].Sent Mail")
	       (mu4e-drafts-folder . "/Networkscale/[Gmail].Drafts")
	       (mu4e-trash-folder . "/Networkscale/[Gmail].Bin")
	       ;; don't save message to Sent Messages, Gmail/IMAP takes care of this
	       (mu4e-sent-messages-behavior . delete)
	       (mu4e-maildir-shortcuts . (("/Networkscale/INBOX"               . ?i)
					  ("/Networkscale/[Gmail].Sent Mail"   . ?s)
					  ("/Networkscale/[Gmail].Bin"         . ?t)
					  ("/Networkscale/[Gmail].All Mail"    . ?a)))
	       (message-signature . "Lorenzo Bolla, Director\nNetworkscale Ltd.")
	       (user-mail-address . ,ns-mail-address)
	       (smtpmail-smtp-user . ,ns-smtp-user)
	       (smtpmail-smtp-server . ,ns-smtp-server)
	       (smtpmail-smtp-service . ,ns-smtp-port)
	       (smtpmail-stream-type . starttls))
	      ("YG"
	       ;; (mu4e-sent-folder . "/YG/[Gmail].Sent Mail")
	       ;; (mu4e-drafts-folder . "/YG/[Gmail].Drafts")
	       ;; (mu4e-trash-folder . "/YG/[Gmail].Bin")
	       ;; don't save message to Sent Messages, Gmail/IMAP takes care of this
	       ;; (mu4e-sent-messages-behavior . delete)
	       ;; (mu4e-maildir-shortcuts . (("/YG/INBOX"               . ?i)))
	       (message-signature . "Lorenzo Bolla")
	       (user-mail-address . ,yg-smtp-mail-address)
	       (smtpmail-smtp-user . ,yg-smtp-mail-address)
	       (smtpmail-smtp-server . ,yg-smtp-server)
	       (smtpmail-smtp-service . ,yg-smtp-port)
	       (smtpmail-stream-type . starttls))))

	  (defun mu4e-set-my-account (&optional acct)
	    "Set the account for composing a message."
	    (let* ((account
	  	    (if acct
	  		acct
	  	      (if mu4e-compose-parent-message
	  		  (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
	  		    (string-match "/\\(.*?\\)/" maildir)
	  		    (match-string 1 maildir))
	  		(completing-read (format "Compose with account: (%s) "
	  					 (mapconcat #'(lambda (var) (car var)) mu4e-my-accounts-alist "/"))
	  				 (mapcar #'(lambda (var) (car var)) mu4e-my-accounts-alist)
	  				 nil t nil nil (caar mu4e-my-accounts-alist)))))
	  	    (account-vars (cdr (assoc account mu4e-my-accounts-alist))))
	      (if account-vars
	  	  (mapc #'(lambda (var)
	  		    (set (car var) (cdr var)))
	  		account-vars)
	  	(error "No email account found"))))

	  ;; Pick a default account
	  (mu4e-set-my-account "Networkscale")
	  (add-hook 'mu4e-compose-pre-hook 'mu4e-set-my-account)

	  ;; Global keybinding
	  (global-set-key (kbd "C-c m") 'mu4e)
	  (setq
	   ;; Default MUA
	   mail-user-agent 'mu4e-user-agent
	   ;; I like UTF-8
	   mu4e-use-fancy-chars nil
	   ;; allow for updating mail using 'U' in the main view:
	   mu4e-get-mail-command "offlineimap"
	   ;; Update every 5  minutes
	   mu4e-update-interval 300
	   ;; convert html msgs to txt
	   mu4e-html2text-command "html2text -utf8 -width 72"
	   ;; don't keep message buffers around
	   message-kill-buffer-on-exit t
	   ;; skip duplicates introduced by gmail and offlineimap
	   mu4e-headers-skip-duplicates t)))

;; (use-package smtpmail
;;   :config (progn
;; 	    (setq send-mail-function 'smtpmail-send-it

;; 		  ;; smtpmail-smtp-server yg-smtp-server
;; 		  ;; smtpmail-smtp-service yg-smtp-port
;; 		  ;; smtpmail-mail-address yg-smtp-mail-address
;; 		  smtpmail-default-smtp-server "smtp.gmail.com"
;; 		  smtpmail-smtp-server "smtp.gmail.com"
;; 		  smtpmail-smtp-service 587

;; 		  smtpmail-stream-type 'starttls)))

(provide '.emacs)
;;; .emacs ends here
