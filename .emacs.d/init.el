;;; package --- lbolla init.el file
;;; Commentary:
;;; 14 March 2014

;;; Code:

;;; Variables


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-ignore-list (quote ("TAGS" "*.min.*")))
 '(ansi-color-names-vector
   ["#C2C2C2" "#161616" "#252525" "#080808" "#0E0E0E" "#161616" "#080808" "#080808"])
 '(backup-directory-alist (quote (("." . "~/.emacs.d/backups"))))
 '(browse-url-browser-function (quote browse-url-xdg-open))
 '(c-default-style
   (quote
    ((c-mode . "k&r")
     (c++-mode . "stroustrup-book")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu"))))
 '(cc-search-directories
   (quote
    ("." "/usr/include" "/usr/local/include/*" "../deps" "../../deps")))
 '(column-number-mode t)
 '(company-idle-delay 0.2)
 '(delete-old-versions t)
 '(disaster-objdump "objdump -d -M intel --demangle -Sl --no-show-raw-insn")
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
     ("Europe/Moscow" "Moscow")
     ("Asia/Jakarta" "Jakarta")
     ("Asia/Bangkok" "Bangkok")
     ("Asia/Singapore" "Singapore")
     ("Asia/Kuala_Lumpur" "Kuala Lumpur")
     ("Asia/Shanghai" "Shanghai")
     ("Asia/Tokyo" "Tokyo")
     ("Australia/Sydney" "Sydney"))))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(evil-emacs-state-modes
   (quote
    (Custom-mode Electric-buffer-menu-mode alchemist-iex-mode alchemist-mix-mode alchemist-test-report-mode archive-mode bbdb-mode bookmark-bmenu-mode bookmark-edit-annotation-mode browse-kill-ring-mode bzr-annotate-mode calc-mode calculator-mode cfw:calendar-mode cider-popup-buffer-mode cider-repl-mode comint-mode completion-list-mode debugger-mode delicious-search-mode desktop-menu-blist-mode desktop-menu-mode diff-mode display-time-world-mode doc-view-mode docker-containers-mode docker-images-mode doctor-mode dvc-bookmarks-mode dvc-diff-mode dvc-info-buffer-mode dvc-log-buffer-mode dvc-revlist-mode dvc-revlog-mode dvc-status-mode dvc-tips-mode ediff-meta-mode ediff-mode efs-mode emms-browser-mode emms-mark-mode emms-metaplaylist-mode emms-playlist-mode eshell-mode etags-select-mode eww-mode fj-mode flycheck-error-list-mode gc-issues-mode gdb-breakpoints-mode gdb-disassembly-mode gdb-frames-mode gdb-locals-mode gdb-memory-mode gdb-registers-mode gdb-threads-mode gist-list-mode git-rebase-mode gnus-article-mode gnus-browse-mode gnus-group-mode gnus-server-mode gnus-summary-mode google-maps-static-mode haskell-error-mode haskell-interactive-mode help-mode ibuffer-mode inferior-haskell-mode inferior-lisp-mode jde-javadoc-checker-report-mode log-view-mode magit-diff-mode magit-log-mode magit-log-select-mode magit-popup-mode magit-popup-sequence-mode magit-process-mode magit-reflog-mode magit-refs-mode magit-revision-mode magit-status-mode mh-folder-mode monky-mode mu4e-headers-mode mu4e-main-mode mu4e-view-mode notmuch-hello-mode notmuch-search-mode notmuch-show-mode occur-mode org-agenda-mode package-menu-mode pass-mode proced-mode rcirc-mode recentf-dialog-mode reftex-select-bib-mode reftex-select-label-mode reftex-toc-mode rg-mode sldb-mode slime-inspector-mode slime-thread-control-mode slime-xref-mode sql-interactive-mode sr-buttons-mode sr-mode sr-tree-mode special-mode sr-virtual-mode tabulated-list-mode tar-mode term-mode tetris-mode tla-annotate-mode tla-archive-list-mode tla-bconfig-mode tla-bookmarks-mode tla-branch-list-mode tla-browse-mode tla-category-list-mode tla-changelog-mode tla-follow-symlinks-mode tla-inventory-file-mode tla-inventory-mode tla-lint-mode tla-logs-mode tla-revision-list-mode tla-revlog-mode tla-tree-lint-mode tla-version-list-mode twittering-mode urlview-mode vc-annotate-mode vc-dir-mode vm-mode vm-summary-mode w3m-mode wab-compilation-mode xgit-annotate-mode xgit-changelog-mode xgit-diff-mode xgit-revlog-mode xhg-annotate-mode xhg-log-mode xhg-mode xhg-mq-mode xhg-mq-sub-mode xhg-status-extra-mode)))
 '(evil-lookup-func (quote man-at-point))
 '(eww-search-prefix "https://lite.qwant.com/?q=")
 '(explicit-shell-file-name "/bin/bash")
 '(fci-rule-color "#F0F0F0")
 '(flycheck-clang-include-path
   (quote
    ("/usr/include/glib-2.0" "/usr/lib/x86_64-linux-gnu/glib-2.0/include" "../deps" "../../deps")))
 '(flycheck-clang-language-standard "c++11")
 '(flycheck-cppcheck-checks (quote ("all")))
 '(flycheck-cppcheck-suppressions (quote ("constStatement")))
 '(flycheck-flake8rc nil)
 '(flycheck-gcc-language-standard "c++1y")
 '(flycheck-javascript-flow-args nil)
 '(flycheck-pylintrc nil)
 '(flycheck-python-flake8-executable "/home/lbolla/bin/flake8")
 '(font-use-system-font t)
 '(gc-cons-threshold 5000000)
 '(ido-ignore-files
   (quote
    ("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./" "\\.egg-info/")))
 '(indent-tabs-mode nil)
 '(inferior-lisp-program "/usr/local/bin/sbcl --noinform" t)
 '(inhibit-startup-screen t)
 '(linum-format " %7i ")
 '(magit-branch-arguments nil)
 '(magit-log-margin (quote (t "%Y-%m-%d %H:%M " magit-log-margin-width t 18)))
 '(magit-push-always-verify nil)
 '(message-citation-line-function (quote message-insert-formatted-citation-line))
 '(mouse-autoselect-window nil)
 '(mouse-yank-at-point t)
 '(mu4e-headers-include-related t)
 '(mu4e-view-show-addresses t)
 '(mu4e-view-show-images t)
 '(org-agenda-sorting-strategy
   (quote
    ((agenda habit-down deadline-up time-up todo-state-down priority-down alpha-up category-keep tag-up)
     (todo priority-down category-keep alpha-up)
     (tags priority-down category-keep)
     (search category-keep))))
 '(org-default-priority 68)
 '(org-fontify-whole-heading-line t)
 '(org-priority-faces
   (quote
    ((65 . mu4e-flagged-face)
     (67 . "mu4e-replied-face"))))
 '(org-priority-start-cycle-with-default nil)
 '(org-return-follows-link t)
 '(org-stuck-projects
   (quote
    ("+LEVEL=2/-DONE"
     ("TODO" "NEXT" "NEXTACTION" "CANC")
     nil "")))
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (rg dockerfile-mode racer toml-mode flycheck-rust haskell-mode lua-mode ess docker counsel yaml-mode xclip web-mode w3m virtualenvwrapper use-package swiper spinner restclient queue projectile pass paredit multi-term mu4e-alert markdown-mode magit macrostep json-mode js2-mode jedi hexrgb go-mode gnus-desktop-notify gnuplot flycheck-mypy flycheck-flow flycheck-elixir flycheck-dialyzer flycheck-cython evil-nerd-commenter evil-matchit evil erlang disaster cython-mode cyberpunk-theme csv-mode company-jedi base16-theme alchemist ag ace-jump-mode)))
 '(password-store-password-length 16)
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "deps" "node_modules" "build" "dist" ".cache" ".eggs" ".tox" "__pycache__")))
 '(projectile-globally-ignored-file-suffixes (quote ("pyc")))
 '(python-shell-interpreter "ipython")
 '(show-paren-mode t)
 '(shr-use-fonts nil)
 '(tool-bar-mode nil)
 '(use-package-always-defer t)
 '(use-package-minimum-reported-time 0.1)
 '(use-package-verbose t)
 '(user-full-name "Lorenzo Bolla")
 '(vc-annotate-background "#D9D9D9")
 '(vc-annotate-color-map
   (quote
    ((20 . "#616161")
     (40 . "#3C3C3C")
     (60 . "#3C3C3C")
     (80 . "#252525")
     (100 . "#252525")
     (120 . "#161616")
     (140 . "#161616")
     (160 . "#0E0E0E")
     (180 . "#0E0E0E")
     (200 . "#0E0E0E")
     (220 . "#080808")
     (240 . "#080808")
     (260 . "#080808")
     (280 . "#080808")
     (300 . "#080808")
     (320 . "#080808")
     (340 . "#080808")
     (360 . "#080808"))))
 '(vc-annotate-very-old-color "#161616")
 '(vc-follow-symlinks nil)
 '(vc-log-show-limit 50)
 '(whitespace-style (quote (face trailing lines-tail)))
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

;; Standard pkgs bindings
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "C-c h") 'windmove-left)
(global-set-key (kbd "C-c j") 'windmove-down)
(global-set-key (kbd "C-c k") 'windmove-up)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c i")
                (lambda ()
                  (interactive)
                  (find-file "~/.emacs.d/pkgs.el")))
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") (lambda () (interactive) (text-scale-set 0)))
;; (global-set-key (kbd "<f6>") 'gdb)
;; (global-set-key (kbd "<f7>") 'async-shell-command)
(global-set-key (kbd "<f8>") 'pass)
(global-set-key (kbd "S-<f8>") 'password-store-copy)
(global-set-key (kbd "C-c b b") 'browse-url-at-point)
(global-set-key (kbd "C-c b w")
                (lambda ()
                  (interactive)
                  (w3m-goto-url (thing-at-point 'word))))
(global-set-key (kbd "C-c b e")
                (lambda ()
                  (interactive)
                  (eww (thing-at-point 'word))))

;; TODO use "require"
(load-file "~/.emacs.d/defuns.el")
(load-file "~/.emacs.d/private.el")
(load-file "~/.emacs.d/yg.el")
(load-file "~/.emacs.d/pkgs.el")

(server-start)

(provide 'init)
;;; init.el ends here
