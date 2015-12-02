;; package --- lbolla init.el file
;;; Commentary:
;;; 14 March 2014

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-ignore-list (quote ("TAGS")))
 '(backup-directory-alist (quote (("." . "~/.emacs.d/backups"))))
 '(browse-url-browser-function (quote browse-url-default-browser))
 '(c-default-style
   (quote
    ((c-mode . "k&r-wikipedia")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu"))))
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("1fab355c4c92964546ab511838e3f9f5437f4e68d9d1d073ab8e36e51b26ca6a" "53af9a10613a30b5e04c4e0f8efbc44d12147fc9985767d7e45f5088be889841" "fbb449ba8147e2914a9bebc2d6a210b8927313a6c1b70764a7f7c61a9bc04b90" "093af34e7baf84660c739950b515fb3700f5a5745deb516c9d1d7723a5d0c39f" default)))
 '(delete-old-versions t)
 '(display-time-world-list
   (quote
    (("UTC" "UTC")
     ("GMT" "GMT")
     ("America/Los_Angeles" "Palo Alto")
     ("America/Mexico_City" "Mexico City")
     ("America/Lima" "Lima")
     ("America/Montreal" "Montreal")
     ("America/New_York" "New York")
     ("America/Sao_Paulo" "Sao Paulo")
     ("Europe/London" "London")
     ("Europe/Rome" "Rome")
     ("Asia/Jakarta" "Jakarta")
     ("Asia/Bangkok" "Bangkok")
     ("Asia/Singapore" "Singapore")
     ("Asia/Kuala_Lumpur" "Kuala Lumpur")
     ("Asia/Shanghai" "Shanghai")
     ("Asia/Tokyo" "Tokyo"))))
 '(evil-emacs-state-modes
   (quote
    (archive-mode bbdb-mode bookmark-bmenu-mode bookmark-edit-annotation-mode browse-kill-ring-mode bzr-annotate-mode calculator-mode calc-mode cfw:calendar-mode completion-list-mode Custom-mode debugger-mode delicious-search-mode desktop-menu-blist-mode desktop-menu-mode doc-view-mode dvc-bookmarks-mode dvc-diff-mode dvc-info-buffer-mode dvc-log-buffer-mode dvc-revlist-mode dvc-revlog-mode dvc-status-mode dvc-tips-mode ediff-mode ediff-meta-mode efs-mode Electric-buffer-menu-mode emms-browser-mode emms-mark-mode emms-metaplaylist-mode emms-playlist-mode etags-select-mode fj-mode gc-issues-mode gdb-breakpoints-mode gdb-disassembly-mode gdb-frames-mode gdb-locals-mode gdb-memory-mode gdb-registers-mode gdb-threads-mode gist-list-mode gnus-article-mode gnus-browse-mode gnus-group-mode gnus-server-mode gnus-summary-mode google-maps-static-mode ibuffer-mode jde-javadoc-checker-report-mode magit-blame-mode magit-diff-mode magit-process-mode magit-refs-mode magit-revision-mode magit-reflog-mode magit-log-mode magit-status-mode magit-popup-mode magit-popup-sequence-mode magit-log-select-mode mh-folder-mode monky-mode mu4e-main-mode mu4e-headers-mode mu4e-view-mode notmuch-hello-mode notmuch-search-mode notmuch-show-mode org-agenda-mode package-menu-mode proced-mode rcirc-mode recentf-dialog-mode reftex-select-bib-mode reftex-select-label-mode reftex-toc-mode sldb-mode slime-inspector-mode slime-thread-control-mode slime-xref-mode sr-buttons-mode sr-mode sr-tree-mode sr-virtual-mode tar-mode tetris-mode tla-annotate-mode tla-archive-list-mode tla-bconfig-mode tla-bookmarks-mode tla-branch-list-mode tla-browse-mode tla-category-list-mode tla-changelog-mode tla-follow-symlinks-mode tla-inventory-file-mode tla-inventory-mode tla-lint-mode tla-logs-mode tla-revision-list-mode tla-revlog-mode tla-tree-lint-mode tla-version-list-mode twittering-mode urlview-mode vc-annotate-mode vc-dir-mode vc-git-log-view-mode vc-svn-log-view-mode vm-mode vm-summary-mode w3m-mode wab-compilation-mode xgit-annotate-mode xgit-changelog-mode xgit-diff-mode xgit-revlog-mode xhg-annotate-mode xhg-log-mode xhg-mode xhg-mq-mode xhg-mq-sub-mode xhg-status-extra-mode cider-repl-mode cider-popup-buffer-mode inferior-lisp-mode help-mode flycheck-error-list-mode inferior-haskell-mode haskell-error-mode haskell-interactive-mode vc-hg-log-view-mode diff-mode display-time-world-mode pass-mode)))
 '(explicit-shell-file-name "/usr/bin/zsh")
 '(flycheck-clang-include-path
   (quote
    ("/usr/include/glib-2.0" "/usr/lib/x86_64-linux-gnu/glib-2.0/include")))
 '(flycheck-cppcheck-checks (quote ("all")))
 '(font-use-system-font t)
 '(ido-ignore-files
   (quote
    ("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./" "\\.egg-info/")))
 '(inferior-lisp-program "/usr/local/bin/sbcl --noinform" t)
 '(inhibit-startup-screen t)
 '(magit-branch-arguments nil)
 '(magit-push-always-verify nil)
 '(mouse-autoselect-window nil)
 '(mouse-yank-at-point t)
 '(org-agenda-sorting-strategy
   (quote
    ((agenda habit-down deadline-up time-up todo-state-down alpha-up priority-down category-keep tag-up)
     (todo priority-down category-keep alpha-up)
     (tags priority-down category-keep)
     (search category-keep))))
 '(org-fontify-whole-heading-line t)
 '(python-shell-interpreter "ipython")
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(user-full-name "Lorenzo Bolla")
 '(vc-follow-symlinks nil)
 '(vc-log-show-limit 50))

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
(global-set-key (kbd "C-c t") 'zsh)
(global-set-key (kbd "C-c i") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "<f5>") 'compile)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 119 :width normal :foundry "unknown" :family "Terminus")))))

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
; (setq use-package-always-ensure t)

(use-package custom
  :init
  (load-theme 'quasi-monochrome)
  ;; (load-theme 'leuven)
  )

(use-package evil
  :init (progn

	  (evil-mode t)

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
	    :init (progn
	  	    (define-key evil-normal-state-map (kbd ",c") 'evilnc-comment-or-uncomment-lines)
	  	    (define-key evil-visual-state-map (kbd ",c") 'evilnc-comment-or-uncomment-lines)))

	  (use-package evil-matchit
	    :init (progn
	  	    (global-evil-matchit-mode 1)))

	  ;; Start in "emacs mode"
	  (evil-set-initial-state 'eshell-mode 'emacs)
	  (evil-set-initial-state 'term-mode 'emacs)
	  (evil-set-initial-state 'comint-mode 'emacs)
	  (evil-set-initial-state 'occur-mode 'emacs)
	  (evil-set-initial-state 'sql-interactive-mode 'emacs)

	  ;; Mercurial keybindings for VC
	  (define-key evil-normal-state-map (kbd ",hb") 'vc-annotate)

	  (define-key evil-insert-state-map (kbd "RET") 'evil-ret-and-indent)
	  (define-key evil-normal-state-map (kbd "C-w t") 'new-tab)
	  (define-key evil-normal-state-map (kbd "C-w x") 'delete-tab)
	  (define-key evil-normal-state-map (kbd "gt") 'next-tab)
	  (define-key evil-normal-state-map (kbd "gT") 'previous-tab)
	  (define-key evil-normal-state-map (kbd ",gg") 'vc-git-grep)
	  (define-key evil-normal-state-map (kbd ",gt") 'tags-search)
	  ;; (define-key evil-normal-state-map (kbd ",G") 'ag)
	  ;; (define-key evil-normal-state-map (kbd ",G") 'ag-venv-project-at-point)
	  (define-key evil-normal-state-map (kbd ",G") 'ag-project-at-point)
	  (define-key evil-normal-state-map (kbd ",F") 'ag-files)
	  (define-key evil-normal-state-map (kbd ",m") 'menu-bar-mode)
	  (define-key evil-normal-state-map (kbd ",f") 'cycle-fonts)
	  (define-key evil-normal-state-map (kbd ", SPC") 'ace-jump-mode)
	  (define-key evil-normal-state-map (kbd ",yf") 'yg-fogbugz-browse-at-point)
	  (define-key evil-normal-state-map (kbd ",yp") 'yg-paste-buffer)))

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

(use-package flycheck
  :init (progn
	  (add-hook 'after-init-hook #'global-flycheck-mode))
  :config (progn
	    (setq flycheck-highlighting-mode 'lines)
	    (setq flycheck-ghc-language-extensions ())

	    ;; TODO
	    (flycheck-define-checker cython
	      "Cython checker"
	      :command ("cython" "-Wextra" source-original)
	      :error-patterns
	      ((error line-start
		      (file-name)
		      ":"
		      line
		      ":"
		      column
		      ":"
		      (message)
		      line-end))
	      :modes cython-mode)
	    (add-to-list 'flycheck-checkers 'cython-mode t)

	    (flycheck-add-next-checker 'python-flake8 'python-pylint)
	    (flycheck-add-next-checker 'c/c++-clang 'c/c++-cppcheck)))

(use-package flycheck-haskell
  :init (progn
	  (add-hook 'flycheck-mode-hook #'flycheck-haskell-setup)
	  (add-hook 'haskell-mode-hook #'flycheck-haskell-configure)))

(use-package flycheck-mypy
  ;; :disabled t
  ;; :config (progn
  ;; 	  (flycheck-add-next-checker 'python-pylint 'python-mypy))
)

(use-package flycheck-dialyzer
  :config (progn
	    (flycheck-add-next-checker 'erlang 'erlang-dialyzer)))

(use-package flycheck-flow
:config (progn
	    (flycheck-add-next-checker 'javascript-gjslint 'javascript-flow)))

(use-package ido
  :init (progn
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
	  (blink-cursor-mode 1)))

(use-package paren
  :init (progn
	  (show-paren-mode)))

(use-package xclip
  :init (xclip-mode t))

(use-package projectile
  :init (progn
	  (projectile-global-mode)
	  (define-key evil-normal-state-map "\C-p" 'projectile-find-file)))

(use-package go-mode
  :mode ("\\.go\\'" . go-mode)
  :init (progn
	  (add-hook 'before-save-hook 'gofmt-before-save)
	  (add-hook 'go-mode-hook 'auto-complete-mode)))

(use-package virtualenvwrapper
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

	  (defun venv-build-python-etags ()
	    (interactive)
	    (let ((dir (venv-get-proj-dir)))
	      (shell-command
	       (concat "find " dir " -name \"*.py\" | xargs etags -f " dir "/TAGS")
	       nil nil)
	      (setq tags-file-name (concat dir "/TAGS"))))

	  (defun ag-venv-project-at-point ()
	    (interactive)
	    (ag (thing-at-point 'word) (venv-get-proj-dir)))

	  (defun venv-workon-and-cdproject (venv)
	    (interactive "i")
	    (venv-workon venv)
	    (venv-cdproject)
	    (venv-build-python-etags)
	    (dired default-directory)
	    (revert-buffer)
	    (projectile-vc)
	    (other-window 1))

	  (define-key evil-normal-state-map ",w" 'venv-workon-and-cdproject))

  :config (progn
	    (venv-initialize-interactive-shells)
	    (venv-initialize-eshell)))

(use-package w3m
  :defer t)

(use-package xclip
  :disabled t
  :defer t)

(use-package yaml-mode
  :mode ("\\.ya?ml\\'" . yaml-mode))

(use-package text-mode
  :mode "\\README\\'"
  :init (progn
	  (add-hook 'text-mode-hook
		    (lambda ()
		      (modify-syntax-entry ?\_ "w")
		      (flyspell-mode t)))))

(use-package help-mode
  :init (progn
	  (add-hook 'help-mode-hook
		    (lambda ()
		      (evil-motion-state 0)))))

(use-package jedi
  :commands jedi:setup
  :config (progn
	    (setq jedi:complete-on-dot t)
	    (setq jedi:tooltip-method nil)))

(use-package electric
  :init (progn
	  ;; Ignoring electric indentation
	  (defun electric-indent-ignore-python (char)
	    "Ignore electric indentation for 'python-mode' after CHAR."
	    (if (equal major-mode 'python-mode)
		`no-indent'
	      nil))
	  (electric-indent-mode t)
	  (add-hook 'electric-indent-functions
		    'electric-indent-ignore-python)))

(use-package erlang
  :mode (("\\.erl\\'" . erlang-mode)
	 ("\\rebar.config\\'" . erlang-mode)))

(use-package python
  :mode (("\\.py\\'" . python-mode)
	 ("\\.mk\\'" . python-mode)) ;; check-mk config files
  :interpreter ("python" . python-mode)
  :init (progn
	  (defun python-insert-breakpoint ()
	    "Insert Python breakpoint above point."
	    (interactive)
	    (evil-open-above 1)
	    (insert "import ipdb; ipdb.set_trace()  # BREAKPOINT")
	    (evil-normal-state))
	  (defun python-insert-pylint-ignore ()
	    "Insert pylint ignore comment."
	    (interactive)
	    (evil-open-above 1)
	    (insert "# pylint: disable=")
	    (evil-normal-state)))
  :config (progn
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

	    (defun python-pyformat-buffer ()
	      "Run pyformat on current buffer."
	      (interactive)
	      (shell-command (concat "pyformat --in-place " (buffer-name)))
	      (revert-buffer :noconfirm t))

	    (font-lock-add-keywords
	     'python-mode
	     '(("\\<\\(TODO\\)\\>" 1 font-lock-warning-face t)
	       ("\\<\\(FIXME\\)\\>" 1 font-lock-warning-face t)))

	    (add-hook 'python-mode-hook
		      (lambda ()
			;; Autocompletion
			(jedi:setup)
			;; Keybidings
			(define-key evil-normal-state-map (kbd ",b") 'python-insert-breakpoint)
			(define-key evil-normal-state-map (kbd ",t") 'python-pytest-current-function)
			(define-key evil-normal-state-map (kbd ",T") 'python-pytest-current-file)
			(define-key evil-normal-state-map (kbd ",pf") 'python-pyformat-buffer)
			(define-key evil-normal-state-map (kbd ",pi") 'python-insert-pylint-ignore)
			;; Enter key executes newline-and-indent
			(local-set-key (kbd "RET") 'newline-and-indent)))))

(use-package prog-mode
  :config (progn
	    (add-hook 'prog-mode-hook
		      (lambda ()
			;; Underscore is part of a word
			(modify-syntax-entry ?\_ "w")))))

(use-package magit
  :config (progn
  	    (define-key evil-normal-state-map (kbd ",gb") 'magit-blame)
  	    (define-key evil-normal-state-map (kbd ",gB") 'magit-blame-quit)))

(use-package cython-mode
  :defer t
  :config (progn
	    (define-key evil-insert-state-map (kbd "RET") 'evil-ret-and-indent)
	    (defun cython-show-annotated ()
	      (interactive)
	      (shell-command (concat "cython -a " (buffer-file-name)))
	      (browse-url (concat "file://" (replace-regexp-in-string "\.pyx$" ".html" (buffer-file-name)))))
	    (define-key evil-normal-state-map (kbd ",a") 'cython-show-annotated)))

(use-package js
  :init (progn
	  (add-hook 'js-mode-hook
		    (lambda ()
		      (setq indent-tabs-mode nil
			    js-indent-level 2)
		      (local-set-key (kbd "RET") 'newline-and-indent)))))

(use-package js2-mode
  :mode (("\\.js\\'" . js2-mode)))

(use-package cc-mode
  :init (progn
	  ;; From https://en.wikipedia.org/wiki/Indent_style#K.26R_style
	  (c-add-style "k&r-wikipedia"
		       '("k&r"
			 (c-basic-offset . 4)	; Guessed value
			 (c-offsets-alist
			  (block-close . 0)	; Guessed value
			  (defun-block-intro . +)	; Guessed value
			  (defun-close . 0)	; Guessed value
			  (defun-open . 0)	; Guessed value
			  (else-clause . 0)	; Guessed value
			  (statement . 0)		; Guessed value
			  (statement-block-intro . +) ; Guessed value
			  (substatement . +)	; Guessed value
			  (topmost-intro . 0)	; Guessed value
			  (access-label . -)
			  (annotation-top-cont . 0)
			  (annotation-var-cont . +)
			  (arglist-close . c-lineup-close-paren)
			  (arglist-cont c-lineup-gcc-asm-reg 0)
			  (arglist-cont-nonempty . c-lineup-arglist)
			  (arglist-intro . +)
			  (block-open . 0)
			  (brace-entry-open . 0)
			  (brace-list-close . 0)
			  (brace-list-entry . 0)
			  (brace-list-intro . +)
			  (brace-list-open . 0)
			  (c . c-lineup-C-comments)
			  (case-label . 0)
			  (catch-clause . 0)
			  (class-close . 0)
			  (class-open . 0)
			  (comment-intro . c-lineup-comment)
			  (composition-close . 0)
			  (composition-open . 0)
			  (cpp-define-intro c-lineup-cpp-define +)
			  (cpp-macro . -1000)
			  (cpp-macro-cont . +)
			  (do-while-closure . 0)
			  (extern-lang-close . 0)
			  (extern-lang-open . 0)
			  (friend . 0)
			  (func-decl-cont . +)
			  (inclass . +)
			  (incomposition . +)
			  (inexpr-class . +)
			  (inexpr-statement . +)
			  (inextern-lang . +)
			  (inher-cont . c-lineup-multi-inher)
			  (inher-intro . +)
			  (inlambda . c-lineup-inexpr-block)
			  (inline-close . 0)
			  (inline-open . +)
			  (inmodule . +)
			  (innamespace . +)
			  (knr-argdecl . 0)
			  (knr-argdecl-intro . +)
			  (label . 2)
			  (lambda-intro-cont . +)
			  (member-init-cont . c-lineup-multi-inher)
			  (member-init-intro . +)
			  (module-close . 0)
			  (module-open . 0)
			  (namespace-close . 0)
			  (namespace-open . 0)
			  (objc-method-args-cont . c-lineup-ObjC-method-args)
			  (objc-method-call-cont c-lineup-ObjC-method-call-colons c-lineup-ObjC-method-call +)
			  (objc-method-intro .
					     [0])
			  (statement-case-intro . +)
			  (statement-case-open . 0)
			  (statement-cont . +)
			  (stream-op . c-lineup-streamop)
			  (string . -1000)
			  (substatement-label . 2)
			  (substatement-open . +)
			  (template-args-cont c-lineup-template-args +)
			  (topmost-intro-cont . c-lineup-topmost-intro-cont))))))

(use-package erlang
  :init (progn
	  (setq erlang-root-dir "/usr/lib/erlang")))

(use-package whitespace
  :init (progn
	  (hook-into-modes 'whitespace-mode '(python-mode-hook))
	  ;; Highlight portion of lines >79
	  (setq whitespace-line-column 79
		whitespace-style '(face lines-tail))))

(use-package markdown-mode
  :mode (("\\.md\\'" . markdown-mode))
  :config (progn
	    (add-hook 'markdown-mode-hook
		      (lambda ()
			(set-indent 2)))))

(use-package org
  :init (progn
	  (global-set-key (kbd "C-c o a") 'org-agenda)
	  (global-set-key (kbd "C-c o k") 'org-capture)
	  (global-set-key (kbd "C-c o l") 'org-store-link)
	  (add-hook 'org-mode-hook
		    (lambda ()
		      ;; For leuven theme
		      (set-face-attribute 'org-checkbox nil :foreground "#CCCCCC")
		      (auto-fill-mode t)
		      (flyspell-mode t)))
	  (setq org-agenda-files '("~/org/")
		org-agenda-include-diary t
		org-agenda-start-on-weekday nil
		org-agenda-ndays 7
		org-agenda-custom-commands (quote (("d" todo "DELG" nil)
						   ("c" todo "DONE|DEFR|CANC" nil)
						   ("w" todo "WAIT" nil)
						   ("W" agenda "21 days" ((org-agenda-ndays 21)))
						   ("A" agenda "Today's #A priority"
						    ((org-agenda-skip-function
						      (lambda nil
							(org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]")))
						     (org-agenda-ndays 1)
						     (org-agenda-overriding-header "Today's Priority #A tasks: ")))
						   ("u" alltodo "Unscheduled TODO"
						    ((org-agenda-skip-function
						      (lambda nil
							(org-agenda-skip-entry-if (quote scheduled) (quote deadline)
										  (quote regexp) "\n]+>")))
						     (org-agenda-overriding-header "Unscheduled TODO entries: ")))))
		org-capture-templates
		'(("t" "Todo" entry (file+headline "~/org/todo.org" "Tasks") "* TODO %?\n  %i\n  %a")
		  ("j" "Journal" entry (file+datetree "~/org/todo.org") "* %?\nEntered on %U\n  %i\n  %a"))
		org-default-notes-file "~/org/todo.org" 
		org-fast-tag-selection-single-key t
		org-link-abbrev-alist '(("FB" . "https://yougov.fogbugz.com/f/cases/%s")
					("google" . "http://www.google.com/search?q=")
					("gmap" . "http://maps.google.com/maps?q=%s"))
		org-log-done 'time
		org-log-into-drawer t
		;; org-todo-keywords '((sequence "TODO(t)" "WAITING(w@/!)" "|" "DONE(d!)" "CANCELLED(c@)"))
		org-todo-keyword-faces
		'(("TODO" . org-todo)
		  ("STRT" . "orange")
		  ("WAIT" . "yellow")
		  ("DELG" . "blue")
		  ("APPT" . "cyan")
		  ("CANC" . "darkgray")
		  ("DEFR" . "purple")
		  ("DONE" . org-done)))))

(use-package css-mode
  :mode (("\\.scss\\'" . css-mode)))

(use-package web-mode
  :mode (("\\.html\\'" . web-mode)
	 ("\\.tmpl\\'" . web-mode))
  :config (progn
	    (add-hook 'web-mode-hook
		      (lambda ()
			(setq web-mode-markup-indent-offset 4)
			(setq web-mode-css-indent-offset 4)
			(setq web-mode-code-indent-offset 4)
			(setq web-mode-indent-style 4)))))

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
	       (set-indent 2)
	       (setq
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

(use-package restclient
  :mode ("\\.http\\'" . restclient-mode))

(use-package lua-mode
  :defer t)

(use-package ace-jump-mode
  :defer t)

(use-package rcirc
  :defer t
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
	    (setq rcirc-server-alist '())
	    ;; (add-to-list 'rcirc-server-alist yg-rcirc-server)
	    ;; (add-to-list 'rcirc-server-alist yg-slack-rcirc-server)
	    (add-to-list 'rcirc-server-alist freenode-rcirc-server)
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

(use-package slime
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

(use-package monky)

(use-package pass)

(use-package ag)

(use-package mu4e
  :load-path "/usr/local/share/emacs/site-lisp/mu4e"
  :init (progn
	  (global-set-key (kbd "C-c m") 'mu4e)
	  (setq
	   ;; who am I?
	   user-mail-address yg-smtp-user
	   user-full-name  "Lorenzo Bolla"
	   ;; Maildirs
	   mu4e-maildir "/home/lbolla/Mail"
	   mu4e-drafts-folder "/YG/Drafts"
	   mu4e-sent-folder "/YG/Sent Items"
	   mu4e-trash-folder "/YG/Trash"
	   ;; Shortcuts
	   mu4e-maildir-shortcuts '(("/YG/INBOX"   . ?i)
				    ("/YG/Errors" . ?e)
				    ("/YG/Tickets" . ?t))
	   ;; don't save message to Sent Messages, Gmail/IMAP takes care of this
	   ;; mu4e-sent-messages-behavior 'delete
	   ;; Default MUA
	   mail-user-agent 'mu4e-user-agent
	   ;; I like UTF-8
	   mu4e-use-fancy-chars nil
	   ;; allow for updating mail using 'U' in the main view:
	   mu4e-get-mail-command "offlineimap"
	   ;; Update every 5 minutes
	   mu4e-update-interval 300
	   ;; convert html msgs to txt
	   mu4e-html2text-command "html2text -utf8 -width 72"
	   ;; don't keep message buffers around
	   message-kill-buffer-on-exit t
	   ;; don't show next message when scrolling with SPC
	   mu4e-view-scroll-to-next nil
	   ;; where to save attachments
	   mu4e-attachment-dir "/tmp"
	   ;; skip duplicates introduced by gmail and offlineimap
	   mu4e-headers-skip-duplicates t)))

(use-package smtpmail
  :init (progn
	    (setq send-mail-function 'smtpmail-send-it
		  smtpmail-smtp-server yg-smtp-server
		  smtpmail-smtp-service yg-smtp-port
		  smtpmail-mail-address yg-smtp-user
		  smtpmail-stream-type 'starttls)))

(provide '.emacs)
;;; .emacs ends here
