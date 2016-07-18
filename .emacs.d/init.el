;;; package --- lbolla init.el file
;;; Commentary:
;;; 14 March 2014

;;; Code:

;;; Variables

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
 '(cc-search-directories
   (quote
    ("." "/usr/include" "/usr/local/include/*" "../deps" "../../deps")))
 '(column-number-mode t)
 '(company-idle-delay 0.2)
 '(custom-safe-themes
   (quote
    ("0b6645497e51d80eda1d337d6cabe31814d6c381e69491931a688836c16137ed" "d1a42ed39a15a843cccadf107ee0242b5f78bfbb5b70ba3ce19f3ea9fda8f52d" "3a3917dbcc6571ef3942c2bf4c4240f70b5c4bc0b28192be6d3f9acd83607a24" "b6db49cec08652adf1ff2341ce32c7303be313b0de38c621676122f255ee46db" "b4ec581daad15aa7020b722523dc6bcea850bfbdbe31bfeb11c45ea51899bd75" "e24679edfdea016519c0e2d4a5e57157a11f928b7ef4361d00c23a7fe54b8e01" "badc4f9ae3ee82a5ca711f3fd48c3f49ebe20e6303bba1912d4e2d19dd60ec98" "fe1682ca8f7a255cf295e76b0361438a21bb657d8846a05d9904872aa2fb86f2" "b9183de9666c3a16a7ffa7faaa8e9941b8d0ab50f9aaba1ca49f2f3aec7e3be9" "cc0dbb53a10215b696d391a90de635ba1699072745bf653b53774706999208e3" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" "1fab355c4c92964546ab511838e3f9f5437f4e68d9d1d073ab8e36e51b26ca6a" "53af9a10613a30b5e04c4e0f8efbc44d12147fc9985767d7e45f5088be889841" "fbb449ba8147e2914a9bebc2d6a210b8927313a6c1b70764a7f7c61a9bc04b90" "093af34e7baf84660c739950b515fb3700f5a5745deb516c9d1d7723a5d0c39f" default)))
 '(delete-old-versions t)
 '(display-time-world-list
   (quote
    (("UTC" "UTC")
     ("America/Los_Angeles" "Palo Alto")
     ("America/Mexico_City" "Mexico City")
     ("America/Lima" "Lima")
     ("America/Montreal" "Montreal")
     ("America/New_York" "New York")
     ("America/Sao_Paulo" "Sao Paulo")
     ("America/Montreal" "Montreal")
     ("Europe/London" "London")
     ("Europe/Rome" "Rome")
     ("Asia/Jakarta" "Jakarta")
     ("Asia/Bangkok" "Bangkok")
     ("Asia/Singapore" "Singapore")
     ("Asia/Kuala_Lumpur" "Kuala Lumpur")
     ("Asia/Shanghai" "Shanghai")
     ("Asia/Tokyo" "Tokyo"))))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(evil-emacs-state-modes
   (quote
    (archive-mode bbdb-mode bookmark-bmenu-mode bookmark-edit-annotation-mode browse-kill-ring-mode bzr-annotate-mode calculator-mode calc-mode cfw:calendar-mode completion-list-mode Custom-mode debugger-mode delicious-search-mode desktop-menu-blist-mode desktop-menu-mode doc-view-mode dvc-bookmarks-mode dvc-diff-mode dvc-info-buffer-mode dvc-log-buffer-mode dvc-revlist-mode dvc-revlog-mode dvc-status-mode dvc-tips-mode ediff-mode ediff-meta-mode efs-mode Electric-buffer-menu-mode emms-browser-mode emms-mark-mode emms-metaplaylist-mode emms-playlist-mode etags-select-mode fj-mode gc-issues-mode gdb-breakpoints-mode gdb-disassembly-mode gdb-frames-mode gdb-locals-mode gdb-memory-mode gdb-registers-mode gdb-threads-mode gist-list-mode gnus-article-mode gnus-browse-mode gnus-group-mode gnus-server-mode gnus-summary-mode google-maps-static-mode ibuffer-mode jde-javadoc-checker-report-mode magit-diff-mode magit-process-mode magit-refs-mode magit-revision-mode magit-reflog-mode magit-log-mode magit-status-mode magit-popup-mode magit-popup-sequence-mode magit-log-select-mode mh-folder-mode monky-mode mu4e-main-mode mu4e-headers-mode mu4e-view-mode notmuch-hello-mode notmuch-search-mode notmuch-show-mode org-agenda-mode package-menu-mode proced-mode rcirc-mode recentf-dialog-mode reftex-select-bib-mode reftex-select-label-mode reftex-toc-mode sldb-mode slime-inspector-mode slime-thread-control-mode slime-xref-mode sr-buttons-mode sr-mode sr-tree-mode sr-virtual-mode tar-mode tetris-mode tla-annotate-mode tla-archive-list-mode tla-bconfig-mode tla-bookmarks-mode tla-branch-list-mode tla-browse-mode tla-category-list-mode tla-changelog-mode tla-follow-symlinks-mode tla-inventory-file-mode tla-inventory-mode tla-lint-mode tla-logs-mode tla-revision-list-mode tla-revlog-mode tla-tree-lint-mode tla-version-list-mode twittering-mode urlview-mode vc-annotate-mode vc-dir-mode vc-git-log-view-mode vc-svn-log-view-mode vm-mode vm-summary-mode w3m-mode wab-compilation-mode xgit-annotate-mode xgit-changelog-mode xgit-diff-mode xgit-revlog-mode xhg-annotate-mode xhg-log-mode xhg-mode xhg-mq-mode xhg-mq-sub-mode xhg-status-extra-mode cider-repl-mode cider-popup-buffer-mode inferior-lisp-mode help-mode flycheck-error-list-mode inferior-haskell-mode haskell-error-mode haskell-interactive-mode vc-hg-log-view-mode diff-mode display-time-world-mode pass-mode alchemist-mix-mode alchemist-iex-mode alchemist-test-report-mode)))
 '(flycheck-clang-include-path
   (quote
    ("/usr/include/glib-2.0" "/usr/lib/x86_64-linux-gnu/glib-2.0/include" "../deps" "../../deps")))
 '(flycheck-cppcheck-checks (quote ("all")))
 '(flycheck-javascript-flow-args (quote ("check")))
 '(font-use-system-font t)
 '(ido-ignore-files
   (quote
    ("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./" "\\.egg-info/")))
 '(indent-tabs-mode nil)
 '(inferior-lisp-program "/usr/local/bin/sbcl --noinform" t)
 '(inhibit-startup-screen t)
 '(linum-format " %7i ")
 '(magit-branch-arguments nil)
 '(magit-push-always-verify nil)
 '(mouse-autoselect-window nil)
 '(mouse-yank-at-point t)
 '(mu4e-headers-include-related t)
 '(mu4e-view-show-images t)
 '(org-agenda-sorting-strategy
   (quote
    ((agenda habit-down deadline-up time-up todo-state-down alpha-up priority-down category-keep tag-up)
     (todo priority-down category-keep alpha-up)
     (tags priority-down category-keep)
     (search category-keep))))
 '(org-default-priority 68)
 '(org-fontify-whole-heading-line t)
 '(org-priority-start-cycle-with-default nil)
 '(org-stuck-projects
   (quote
    ("+LEVEL=2/-DONE"
     ("TODO" "NEXT" "NEXTACTION" "CANC")
     nil "")))
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "deps" "node_modules")))
 '(python-shell-interpreter "ipython")
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(user-full-name "Lorenzo Bolla")
 '(vc-follow-symlinks nil)
 '(vc-log-show-limit 50)
 '(yas-indent-line (quote none))
 '(yas-prompt-functions
   (quote
    (yas-ido-prompt yas-x-prompt yas-dropdown-prompt yas-completing-prompt yas-no-prompt)))
 '(yas-snippet-dirs (quote (yas-installed-snippets-dir))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monoid" :height 90)))))
 ;; '(default ((t (:family "Input" :height 120)))))

(load-file "~/.emacs.d/private.el")
(load-file "~/.emacs.d/yg.el")

(global-set-key "\C-x\C-b" 'buffer-menu)
(global-set-key (kbd "C-c h") 'windmove-left)
(global-set-key (kbd "C-c j") 'windmove-down)
(global-set-key (kbd "C-c k") 'windmove-up)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c i") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") (lambda () (interactive) (text-scale-set 0)))
(global-set-key (kbd "<f5>") 'compile)
(global-set-key (kbd "<f6>") 'gdb)
(global-set-key (kbd "<f7>") 'async-shell-command)
(global-set-key (kbd "C-c b b") 'browse-url-at-point)
(global-set-key (kbd "C-c b w") 'w3m-goto-url)

(server-start)

;;; Functions

(defun insert-x-primary-selection ()
  "Insert selection from X primary clipboard."
  (interactive)
  (insert (x-get-selection-value)))

(defun chomp (str)
  "Chomp leading and tailing whitespace from STR."
  (replace-regexp-in-string (rx (or (: bos (* (any " \t\n")))
				    (: (* (any " \t\n")) eos)))
			    ""
			    str))

(defun read-file-in-string (fn)
  "Read FN and return its content as a string."
  (with-temp-buffer
    (insert-file-contents fn)
    (buffer-string)))

(defun my-beep ()
  "Play an alert sound."
  (let ((alert "/usr/share/sounds/gnome/default/alerts/glass.ogg"))
    (start-process "beep" nil "mplayer" (expand-file-name alert))))

(defun cycle (lst)
  "Cycle elements of LST."
  (let ((item (pop lst)))
    (append lst `(,item))))

(defun is-theme-enabled (theme)
  "Check if THEME is enabled."
  (member theme custom-enabled-themes))

(defmacro timeit (what &rest body)
  "Time WHAT and run BODY and report real time taken to do so."
  `(let ((start-time (float-time)))
     (progn ,@body)
     (let ((elapsed-time (- (float-time) start-time)))
       (message "Completed %s in %.4f seconds" ,what elapsed-time)
       elapsed-time)))

(defmacro hook-into-modes (func modes)
  "Add FUNC to MODES hooks."
  `(dolist (mode-hook ,modes)
     (add-hook mode-hook ,func)))

(defmacro with-basic-http-auth (&rest body)
  "Execute BODY with basic http auth."
  `(let ((url-request-extra-headers
	  (cons `("Authorization" . ,(concat "Basic "
					    (base64-encode-string
					     (concat (read-string "Username: " "lorenzo.bolla")
						     ":"
						     (read-passwd "Password: "))))) url-request-extra-headers)))
     (progn ,@body)))

(defun set-indent (size)
  "Set indent equal to SIZE."
  (interactive "p")
  (setq evil-shift-width size
	js-indent-level size
        tab-width size))

(defun c-indent ()
  "Run `indent` on current buffer."
  (interactive)
  (when (eq major-mode 'c-mode)
    (let ((temp-point (point)))
      ;; Use $HOME/.indent.pro to specify indent options
      (shell-command-on-region (point-min) (point-max) "indent" nil t)
      (save-buffer)
      (goto-char temp-point))))

(defcustom my-fonts '("Terminus-12" "Ubuntu Mono-12" "ProggyCleanTT-12" "Monoid-9" "IBM 3270 Narrow-14" "Input-12")
  "List of fonts I like." :group 'local)

(defun cycle-fonts ()
  "Cycle between the fonts I like."
  (interactive)
  (set-frame-font (car my-fonts))
  (message "Using font %s" (car my-fonts))
  (setq my-fonts (cycle my-fonts)))

(defun icalendar-import-buffer-in-default-diary ()
  "Import icalendar files into default diary."
  (interactive)
  (icalendar-import-buffer diary-file t t))

(require 'package)

;; Repositories
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/")
	     ;; '("melpa-stable" . "http://stable.melpa.org/packages/")
             t)

;; Load all downloaded packages
(package-initialize)

;; Package management
;; See https://github.com/jwiegley/dot-emacs/blob/master/init.el
;;     https://github.com/jordonbiondo/.emacs.d/blob/master/init.el
(require 'use-package)
; (setq use-package-always-ensure t)

(use-package cyberpunk-theme)
(use-package quasi-monochrome-theme
  ;; :load-path "/home/lbolla/src/emacs-quasi-monochrome/"
  )
(use-package base16-theme)
(use-package custom
  :init (progn
          (if (display-graphic-p)
              (load-theme
               ;; 'cyberpunk
               'leuven
               ;; 'base16-default-dark
               ;; 'base16-tomorrow-dark
               ;; 'base16-twilight-dark
               ;; 'quasi-monochrome
               )
            ;; Turn font coloring off on textual terminals
            (add-to-list 'default-frame-alist '(tty-color-mode  . never)))))

(use-package evil
  :config (progn

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
            (define-key evil-normal-state-map (kbd "gp") 'insert-x-primary-selection)
            ;; (define-key evil-normal-state-map (kbd ",G") 'ag)
            ;; (define-key evil-normal-state-map (kbd ",G") 'ag-venv-project-at-point)
            (define-key evil-normal-state-map (kbd ",G") 'ag-project-at-point)
            (define-key evil-normal-state-map (kbd ",F") 'ag-files)
            (define-key evil-normal-state-map (kbd ",f") 'cycle-fonts)
            (define-key evil-normal-state-map (kbd ", SPC") 'ace-jump-mode)
            (define-key evil-normal-state-map (kbd ",=") 'c-indent)
            ;; (define-key evil-normal-state-map (kbd ",yff") 'yg-fogbugz-cli)
            ;; (define-key evil-normal-state-map (kbd ",yfo") 'yg-fogbugz-browse-at-point)
            (define-key evil-normal-state-map (kbd ",yp") 'yg-paste-buffer)
            (define-key evil-normal-state-map (kbd ",yk") 'yg-kiln-buffer)
            (define-key evil-visual-state-map (kbd ",yk") 'yg-kiln-region)

            (use-package evil-nerd-commenter
              :config (progn
                        (define-key evil-normal-state-map (kbd ",c") 'evilnc-comment-or-uncomment-lines)
                        (define-key evil-visual-state-map (kbd ",c") 'evilnc-comment-or-uncomment-lines)))

            (use-package evil-matchit
              :config (progn
                        (global-evil-matchit-mode 1)))))

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

(use-package lisp-mode
  :init (progn
          (add-hook 'emacs-lisp-mode-hook
                    (lambda ()
                      ;; Dash is part of a lisp word
                      (modify-syntax-entry ?\- "w")))))

(use-package elixir-mode
  :init (add-hook 'elixir-mode-hook
                  (lambda ()
                    (evil-define-key 'insert elixir-mode-map (kbd "RET") 'newline)
                    (set-indent 2))))

(use-package alchemist
  :init (add-hook 'elixir-mode-hook
                  (lambda ()
                    (evil-define-key 'normal elixir-mode-map (kbd "C-]") 'alchemist-goto-definition-at-point)
                    (evil-define-key 'normal elixir-mode-map (kbd "K") 'alchemist-help-search-at-point))))

(use-package flycheck
  :init (progn
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

            (flycheck-add-next-checker 'python-flake8 'python-pylint)
            (flycheck-add-next-checker 'c/c++-clang 'c/c++-cppcheck)))

(use-package flycheck-cython
  ;; :load-path "/home/lbolla/src/emacs-flycheck-cython/"
  )

(use-package flycheck-elixir
  :load-path "/home/lbolla/src/emacs-flycheck-elixir/"
  ;; :disabled t
  )

(use-package flycheck-haskell
  :init (progn
	  (add-hook 'flycheck-mode-hook #'flycheck-haskell-setup)
	  (add-hook 'haskell-mode-hook #'flycheck-haskell-configure)))

(use-package flycheck-mypy
  ;; :load-path "/home/lbolla/src/emacs-flycheck-mypy/"
  :disabled t
  :config (progn
            ;; TODO set it depending on which Python version I'm using
            (setq flycheck-python-mypy-args '("--py2" "--silent-imports"))
            (flycheck-add-next-checker 'python-pylint 'python-mypy)))

(use-package flycheck-dialyzer
  :load-path "/home/lbolla/src/emacs-flycheck-dialyzer/"
  :config (progn
	    (flycheck-add-next-checker 'erlang 'erlang-dialyzer)))

(use-package flycheck-flow
  :load-path "/home/lbolla/src/emacs-flycheck-flow/"
  :config (progn
            (flycheck-add-next-checker 'javascript-gjslint 'javascript-flow)))

(use-package ido
  :disabled t
  :init (progn
	  (ido-mode t)
	  (ido-everywhere t)
	  (setq ido-enable-flex-matching t)
	  (setq ido-file-extensions-order '(".py" ".js" ".html" ".css" t))))

(use-package swiper
  :init (progn
          (ivy-mode t)
          ;; (swiper-from-isearch)
          ;; TODO search-forward/backward evil-search
          (global-set-key (kbd "C-s") 'swiper)
          (setq ivy-use-virtual-buffers t
                magit-completing-read-function 'ivy-completing-read
                projectile-completion-system 'ivy)))

(use-package tool-bar
  :init (progn
	  (tool-bar-mode 0)))

(use-package hl-line
  :init (progn
	  (global-hl-line-mode)
          (when (is-theme-enabled 'cyberpunk)
              (set-face-attribute 'hl-line nil :background "grey20"))
          (when (is-theme-enabled 'base16-default-dark)
              (set-face-attribute 'hl-line nil :background "grey15")
              (set-face-attribute 'region nil :foreground "light grey" :background "brown4"))))

(use-package scroll-bar
  :init (progn
	  (scroll-bar-mode 0)))

(use-package menu-bar
  :init (progn
	  (global-set-key (kbd "<f10>") 'menu-bar-mode)
	  (menu-bar-mode 0)))

(use-package frame
  :init (progn
	  (blink-cursor-mode 1)))

(use-package paren
  :init (progn
	  (show-paren-mode)))

(use-package xclip
  :disabled t
  :init (xclip-mode t))

(use-package projectile
  :init (progn
	  (projectile-global-mode)
	  (define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)))

(use-package go-mode
  :mode ("\\.go\\'" . go-mode)
  :init (progn
          (setq godef-command "/home/lbolla/src/go/bin/godef")
          (auto-complete-mode -1)
          (add-hook 'before-save-hook 'gofmt-before-save))
  :config (progn
            (define-key go-mode-map (kbd "K") 'godoc)))

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

	  (global-set-key (kbd "C-c v w") 'venv-workon-and-cdproject))
  :config (progn
	    (venv-initialize-interactive-shells)
	    (venv-initialize-eshell)))

(use-package w3m
  :defer t)

(use-package yaml-mode
  :mode ("\\.ya?ml\\'" . yaml-mode))

(use-package json-mode)

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
  :disabled t
  :defer t)

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

(use-package sh-script
  :mode ((".zsh" . shell-script-mode)
	 (".bash" . shell-script-mode)
	 ("\\.sh\\'" . shell-script-mode)))

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
		 "py.test -v "
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
	       ("\\<\\(FIXME\\)\\>" 1 font-lock-warning-face t)))

	    (add-hook 'python-mode-hook
		      (lambda ()
			;; Autocompletion
			(jedi:setup)
                        ;; Turn off AC and use company instead
                        (auto-complete-mode -1)
                        (add-to-list 'company-backends 'company-jedi)

                        ;; Hideshow mode to handle folding
                        (hs-minor-mode t)

			;; Keybidings
			(evil-define-key 'normal python-mode-map (kbd ",b") 'python-insert-breakpoint)
			(evil-define-key 'normal python-mode-map (kbd ",t") 'python-pytest-current-function)
			(evil-define-key 'normal python-mode-map (kbd ",T") 'python-pytest-current-file)
			(evil-define-key 'normal python-mode-map (kbd ",pf") 'python-pyformat-buffer)
			(evil-define-key 'normal python-mode-map (kbd ",pi") 'python-insert-pylint-ignore)
			(evil-define-key 'normal python-mode-map (kbd ",pt") 'python-insert-type-annotation)
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
            (define-key evil-normal-state-map (kbd ",gb") 'magit-blame)
            (evil-define-key 'normal magit-blame-mode-map (kbd "q") 'magit-blame-quit)
            (evil-define-key 'normal magit-blame-mode-map (kbd "RET") 'magit-show-commit)))

(use-package cython-mode
  :defer t
  :config (progn
	    (defun cython-show-annotated ()
	      (interactive)
	      (shell-command (concat "cython -a " (buffer-file-name)))
	      (browse-url (concat "file://" (replace-regexp-in-string "\.pyx$" ".html" (buffer-file-name)))))
	    (evil-define-key 'normal cython-mode-map (kbd ",a") 'cython-show-annotated)))

(use-package js
  :init (progn
	  (add-hook 'js-mode-hook
		    (lambda ()
		      (setq js-indent-level 2)
		      (local-set-key (kbd "RET") 'newline-and-indent)))))

(use-package js2-mode
  :mode (("\\.js\\'" . js2-mode)))

(use-package ffap
  :config (progn
          (add-to-list 'ffap-c-path "../deps")
          (add-to-list 'ffap-c-path "../../deps")))

(use-package cc-mode
  :init (progn

	  ;; Run indent on save
	  ;; (add-hook 'before-save-hook 'c-indent)

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
  :mode (("\\.erl\\'" . erlang-mode)
	 ("\\vars.config\\'" . erlang-mode)
	 ("\\rebar.config\\'" . erlang-mode))
  :init (progn
          (add-hook 'erlang-mode-hook
                    (lambda ()
                      (evil-define-key 'normal erlang-mode-map (kbd "K") 'erlang-man-function)
                      ;; Unfortunately, erlang-mode does not inherit from prog-mode
                      (modify-syntax-entry ?\_ "w")))

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

(use-package rst
  :init (progn
          (add-hook 'rst-mode-hook
                    (lambda ()
		      (auto-fill-mode t)))))

;; http://doc.norang.ca/org-mode.html#GettingStarted
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
	  (global-set-key (kbd "<f12>") (lambda () (interactive) (execute-kbd-macro (kbd "C-c o a SPC"))))

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
                        (set-face-attribute 'org-scheduled-today nil :foreground "#c2d69c" :weight 'normal))

                      (when (is-theme-enabled 'cyberpunk)
                        (set-face-attribute 'org-todo nil :foreground "gray40"))

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
                  ("A" agenda "Priority #A tasks"
                   ((org-agenda-skip-function
                     (lambda nil
                       (org-agenda-skip-entry-if 'notregexp "\\=.*\\[#A\\]")))
                    (org-agenda-overriding-header "Priority #A tasks")))
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
                org-agenda-tags-column -167
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
		org-link-abbrev-alist '(("FB" . (concat yg-fogbugz-url "/f/cases/%s"))
					("google" . "http://www.google.com/search?q=")
					("gmap" . "http://maps.google.com/maps?q=%s"))
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
                '((sequence "TODO(t)" "STRT(s!)" "|" "DONE(d!)")
                  (sequence "WAIT(w@/!)" "DELG(l@)" "|" "DEFR(f@)" "CANC(c@)" "MEET(m@)" "PHON(p@)"))
                org-todo-keyword-faces
                '(("TODO" . org-todo)
		  ("STRT" . "orangered")
		  ("WAIT" . "gold")
		  ("DELG" . "blue")
		  ("MEET" . "cyan")
		  ("PHONE" . "cyan")
		  ("CANC" . "darkgray")
		  ("DEFR" . "purple")
		  ("DONE" . org-done))
                org-log-done 'time
		org-log-into-drawer t)))

(use-package css-mode
  :mode (("\\.scss\\'" . css-mode)))

(use-package web-mode
  :mode (("\\.html\\'" . web-mode)
	 ("\\.tmpl\\'" . web-mode))
  :config (progn
	    (add-hook 'web-mode-hook
		      (lambda ()
                        (modify-syntax-entry ?\- "w")
			(setq web-mode-markup-indent-offset 4)
			(setq web-mode-css-indent-offset 4)
			(setq web-mode-code-indent-offset 4)
			(setq web-mode-indent-style 4)))))

(use-package clojure-mode
  :disabled t)

(use-package cider-mode
  :disabled t
  :commands cider-jack-in)

(use-package gnuplot
  :defer t)

(use-package haskell-mode
  :disabled t
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
  :disabled t
  :mode ("\\.cabal\\'" . haskell-cabal-mode)
  :config (progn
            (setenv "PATH" (concat "~/.cabal/bin:" (getenv "PATH")))
            (add-to-list 'exec-path "~/.cabal/bin")))

(use-package auto-revert-tail-mode
  :mode ("\\.log\\'" . auto-revert-tail-mode))

(use-package csv-mode
  :mode ("\\.csv\\'" . csv-mode))

(use-package restclient
  :mode (("\\.http\\'" . restclient-mode)
         ;; ("\\*HTTP Response\\*" . json-mode)
         ))

(use-package lua-mode
  :disabled t
  :defer t)

(use-package ace-jump-mode
  :defer t)

(use-package rcirc
  :disabled t
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

(use-package monky)

(use-package pass)

(use-package ag)

(use-package mu4e
  :load-path "/usr/local/share/emacs/site-lisp/mu4e"
  :config (progn
            ;; Force adding contacts
            ;; (mu4e~request-contacts))
            ;; Force starting automatic updates
            (mu4e~start))
  :init (progn
	  (global-set-key (kbd "C-c mm") 'mu4e)
          (require 'org-mu4e)

          (when (is-theme-enabled 'cyberpunk)
            (set-face-attribute 'mu4e-flagged-face nil :inherit font-lock-constant-face :foreground "firebrick" :weight 'bold)
            (set-face-attribute 'mu4e-replied-face nil :inherit font-lock-comment-face :weight 'normal))

          (when (is-theme-enabled 'leuven)
            (set-face-attribute 'mu4e-header-highlight-face nil :underline nil))

          (when (is-theme-enabled 'base16-tomorrow-dark)
            (set-face-attribute 'mu4e-header-highlight-face nil :inherit nil :underline nil :background "gray20"))

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
	   mu4e-trash-folder "/YG/Trash"

	   ;; Shortcuts
	   mu4e-maildir-shortcuts '(("/YG/INBOX"   . ?i)
				    ("/YG/Sent Items" . ?s))
	   ;; Bookmarks
	   mu4e-bookmarks '(("flag:unread AND NOT flag:trashed" "Unread messages" ?u)
			    ("date:today..now" "Today's messages" ?t)
			    ("date:7d..now" "Last 7 days" ?w)
			    ("mime:image/*" "Messages with images" ?p)
			    ("flag:flagged" "Flagged messages" ?f))

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
	   ;; convert html msgs to txt
	   ;; mu4e-html2text-command "html2text -utf8 -width 72"
           mu4e-html2text-command "w3m -dump -cols 9999 -T text/html"  ;;; Let Emacs do the line wrapping
           ;; mu4e-html2text-command "iconv -c -t utf-8 | pandoc -f html -t plain | iconv -f utf-8 | fold"
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

(use-package mu4e-alert
  :init (progn
	  (mu4e-alert-set-default-style 'libnotify)
	  (global-set-key (kbd "C-c mu") 'mu4e-alert-view-unread-mails)
	  (add-hook 'after-init-hook #'mu4e-alert-enable-notifications)
	  (add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display)))

(use-package smtpmail
  :init (progn
	    (setq send-mail-function 'smtpmail-send-it
		  smtpmail-smtp-server yg-smtp-server
		  smtpmail-smtp-service yg-smtp-port
		  smtpmail-mail-address yg-smtp-user
		  smtpmail-stream-type 'starttls)))

(use-package yasnippet
  :disabled t
  :init (yas-global-mode 1))

(use-package company
  :defer t
  :init (progn
          (add-hook 'after-init-hook 'global-company-mode)))

(use-package multi-term
  :init (progn
          (global-set-key (kbd "C-c t") 'multi-term)))

(use-package generic
  :init (progn
          ;; https://www.emacswiki.org/emacs/GenericMode
          (define-generic-mode
            'qsl-mode                                       ;; name of the mode
            '("#")                                          ;; comments delimiter
            '("questionnaire" "survey")                     ;; some keywords
            '(("\\[.*\\]" . 'font-lock-constant-face)
              ("<.*>" . 'font-lock-builtin-face)
              ("[0-9]+" . 'font-lock-variable-name-face)
              ("=" . 'font-lock-builtin))                   ;; a built-in
            '("\\.qsl$")                                    ;; files that trigger this mode
            nil                                             ;; any other functions to call
            "qsl mode"                                      ;; doc string
            )))

(provide 'init)
;;; init.el ends here

