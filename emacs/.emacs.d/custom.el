;;; package --- custom file
;;; Commentary:
;;; 13 December 2020

;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline success warning error])
 '(ansi-term-color-vector
   [unspecified "#fdf6e3" "#dc322f" "#859900" "#b58900" "#268bd2" "#6c71c4" "#268bd2" "#586e75"] t)
 '(auth-source-debug nil)
 '(auth-sources '("secrets:session" "secrets:Login" "~/.authinfo.gpg"))
 '(auto-hscroll-mode t)
 '(auto-revert-check-vc-info nil)
 '(backup-directory-alist '(("." . "~/.emacs.d/backups")))
 '(blink-cursor-mode t)
 '(browse-url-browser-function 'browse-url-xdg-open)
 '(c-default-style
   '((c-mode . "k&r")
     (c++-mode . "stroustrup-book")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu")))
 '(cc-search-directories
   '("." "/usr/include" "/usr/local/include/*" "../deps" "../../deps"))
 '(column-number-mode t)
 '(company-idle-delay 0.2 nil nil "Customized with use-package company")
 '(company-lsp-cache-candidates 'auto t)
 '(company-lsp-enable-snippet nil t)
 '(company-tooltip-align-annotations t nil nil "Customized with use-package company")
 '(custom-safe-themes t)
 '(deft-directory "~/zettelkasten/" t nil "Customized with use-package deft")
 '(deft-extensions '("org" "txt" "md") t nil "Customized with use-package deft")
 '(delete-old-versions t)
 '(delete-selection-mode t)
 '(dimmer-fraction 0.4 t)
 '(display-time-world-list
   '(("UTC" "UTC/GMT/Zulu")
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
     ("Australia/Sydney" "Sydney")))
 '(dumb-jump-selector 'ivy nil nil "Customized with use-package dumb-jump")
 '(dumb-jump-window 'other nil nil "Customized with use-package dumb-jump")
 '(dump-jump-prefer-searcher 'rg nil nil "Customized with use-package dumb-jump")
 '(ediff-split-window-function 'split-window-horizontally)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(elpy-modules
   '(elpy-module-sane-defaults elpy-module-company elpy-module-eldoc elpy-module-highlight-indentation elpy-module-pyvenv))
 '(epa-pinentry-mode 'loopback)
 '(epg-pinentry-mode 'loopback)
 '(erlang-root-dir "/usr" t nil "Customized with use-package erlang-start")
 '(evil-default-state (if my/lesser-evil 'emacs 'normal) nil nil "Customized with use-package evil")
 '(evil-lookup-func 'man-at-point nil nil "Customized with use-package evil")
 '(evil-undo-system 'undo-redo nil nil "Customized with use-package evil")
 '(evil-want-C-i-jump nil nil nil "Customized with use-package evil")
 '(evil-want-C-w-in-emacs-state (not my/lesser-evil) nil nil "Customized with use-package evil")
 '(evil-want-integration t nil nil "Customized with use-package evil")
 '(evil-want-keybinding nil nil nil "Customized with use-package evil")
 '(eww-search-prefix "https://www.startpage.com/do/search?q=")
 '(explain-pause-blocking-too-long-ms 100 t nil "Customized with use-package explain-pause-mode")
 '(eyebrowse-default-workspace-slot 0 nil nil "Customized with use-package eyebrowse")
 '(eyebrowse-keymap-prefix "e" nil nil "Customized with use-package eyebrowse")
 '(eyebrowse-new-workspace t nil nil "Customized with use-package eyebrowse")
 '(fci-rule-color "#383838")
 '(fill-column 79)
 '(flycheck-check-syntax-automatically '(save idle-change new-line mode-enabled) nil nil "Customized with use-package flycheck")
 '(flycheck-clang-include-path
   '("/usr/include/glib-2.0" "/usr/lib/x86_64-linux-gnu/glib-2.0/include" "../deps" "../../deps") nil nil "Customized with use-package flycheck")
 '(flycheck-clang-language-standard "c++11" nil nil "Customized with use-package flycheck")
 '(flycheck-cppcheck-checks '("all") nil nil "Customized with use-package flycheck")
 '(flycheck-cppcheck-suppressions '("constStatement") nil nil "Customized with use-package flycheck")
 '(flycheck-flake8rc "setup.cfg" nil nil "Customized with use-package flycheck")
 '(flycheck-gcc-language-standard "c++1y" nil nil "Customized with use-package flycheck")
 '(flycheck-ghc-language-extensions nil nil nil "Customized with use-package flycheck")
 '(flycheck-highlighting-mode 'lines nil nil "Customized with use-package flycheck")
 '(flycheck-javascript-flow-args nil nil nil "Customized with use-package flycheck")
 '(flycheck-shellcheck-excluded-warnings '("SC2006" "SC2086" "SC2181") nil nil "Customized with use-package flycheck")
 '(flymake-error-bitmap '(flymake-double-exclamation-mark modus-theme-fringe-red))
 '(flymake-note-bitmap '(exclamation-mark modus-theme-fringe-cyan))
 '(flymake-warning-bitmap '(exclamation-mark modus-theme-fringe-yellow))
 '(font-use-system-font t)
 '(gc-cons-threshold 100000000)
 '(global-hl-line-mode nil)
 '(gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
 '(hl-sexp-background-color "#efebe9")
 '(hl-todo-keyword-faces
   '(("HOLD" . "#e5f040")
     ("TODO" . "#feacd0")
     ("NEXT" . "#b6a0ff")
     ("THEM" . "#f78fe7")
     ("PROG" . "#00d3d0")
     ("OKAY" . "#4ae8fc")
     ("DONT" . "#58dd13")
     ("FAIL" . "#ff8059")
     ("DONE" . "#44bc44")
     ("NOTE" . "#f0ce43")
     ("KLUDGE" . "#eecc00")
     ("HACK" . "#eecc00")
     ("TEMP" . "#ffcccc")
     ("FIXME" . "#ff9977")
     ("XXX+" . "#f4923b")
     ("REVIEW" . "#6ae4b9")
     ("DEPRECATED" . "#aaeeee")))
 '(ibuffer-deletion-face 'dired-flagged)
 '(ibuffer-filter-group-name-face 'dired-mark)
 '(ibuffer-marked-face 'dired-marked)
 '(ibuffer-title-face 'dired-header)
 '(indent-tabs-mode nil)
 '(inferior-lisp-program "/usr/local/bin/sbcl --noinform" t)
 '(inhibit-startup-screen t)
 '(ivy-use-virtual-buffers t nil nil "Customized with use-package ivy")
 '(jdee-db-active-breakpoint-face-colors (cons "#fafafa" "#3b6ea8"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#fafafa" "#4f894c"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#fafafa" "#bdbdbd"))
 '(js2-mode-show-strict-warnings nil)
 '(json-reformat:indent-width 2 t nil "Customized with use-package json-mode")
 '(line-spacing 0.2)
 '(linum-format " %7i ")
 '(load-prefer-newer t)
 '(lsp-client-packages nil nil nil "Customized with use-package lsp-mode")
 '(lsp-clients-clangd-executable "clangd-10" nil nil "Customized with use-package lsp-mode")
 '(lsp-completion-provider t nil nil "Customized with use-package lsp-mode")
 '(lsp-diagnostics-flycheck-default-level 'info nil nil "Customized with use-package lsp-mode")
 '(lsp-enable-indentation nil nil nil "Customized with use-package lsp-mode")
 '(lsp-enable-snippet nil nil nil "Customized with use-package lsp-mode")
 '(lsp-headerline-breadcrumb-enable nil nil nil "Customized with use-package lsp-mode")
 '(lsp-keymap-prefix "C-c l" nil nil "Customized with use-package lsp-mode")
 '(lsp-modeline-diagnostics-scope :workspace nil nil "Customized with use-package lsp-mode")
 '(lsp-python-ms-disabled ["inherit-non-class"] nil nil "Customized with use-package lsp-python-ms")
 '(lsp-response-timeout 5 nil nil "Customized with use-package lsp-mode")
 '(lsp-rust-clippy-preference "on" nil nil "Customized with use-package lsp-mode")
 '(lsp-rust-server 'rls nil nil "Customized with use-package lsp-mode")
 '(lsp-signature-auto-activate nil nil nil "Customized with use-package lsp-mode")
 '(magit-branch-arguments nil nil nil "Customized with use-package magit")
 '(magit-completing-read-function 'ivy-completing-read nil nil "Customized with use-package ivy")
 '(magit-log-margin '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 18) nil nil "Customized with use-package magit")
 '(magit-log-section-commit-count 10 nil nil "Customized with use-package magit")
 '(magit-pull-or-fetch t nil nil "Customized with use-package magit")
 '(magit-push-always-verify nil nil nil "Customized with use-package magit")
 '(menu-bar-mode nil)
 '(message-citation-line-function 'message-insert-formatted-citation-line)
 '(message-kill-buffer-on-exit t)
 '(modus-operandi-theme-completions 'opinionated nil nil "Customized with use-package modus-operandi-theme")
 '(modus-operandi-theme-org-blocks 'greyscale nil nil "Customized with use-package modus-operandi-theme")
 '(modus-vivendi-theme-completions 'opinionated nil nil "Customized with use-package modus-vivendi-theme")
 '(modus-vivendi-theme-org-blocks 'greyscale nil nil "Customized with use-package modus-vivendi-theme")
 '(mouse-autoselect-window nil)
 '(mouse-yank-at-point t)
 '(network-security-level 'high nil nil "Customized with use-package nsm")
 '(objed-cursor-color "#99324b")
 '(org-roam-directory my/zettelkasten-directory nil nil "Customized with use-package org-roam")
 '(package-enable-at-startup nil)
 '(package-selected-packages
   '(typescript-mode org-plus-contrib dpkg-dev-el company highlight-indentation rust-mode yasnippet pyvenv undo-tree elixir-mode calfw-cal calfw-org calfw lsp-java all-the-icons lsp-treemacs dap-mode avy minions quasi-monochrome-theme org-roam org-ref deft modus-vivendi-theme modus-operandi-theme org-ql-view doom-themes org-ql lsp-ui tao-theme copy-as-format edit-server lsp-python-ms rjsx-mode eyebrowse lsp-mode ivy-hydra flycheck-color-mode-line flycheck-pycheckers expand-region esup magit-todos nnir poet-theme goose-theme flycheck-rust flycheck-popup-tip nim nim-mode text-mode prog-mode lisp-mode evil-org-agenda elpy which-key dumb-jump leuven-theme evil-collection tablist evil-org zoom-window rg dockerfile-mode racer toml-mode lua-mode ess counsel yaml-mode xclip web-mode use-package swiper spinner queue projectile pass paredit markdown-mode magit macrostep json-mode js2-mode hexrgb go-mode gnus-desktop-notify flycheck-flow flycheck-dialyzer flycheck-cython evil-nerd-commenter evil-matchit evil cython-mode cyberpunk-theme csv-mode))
 '(password-store-password-length 16)
 '(pdf-view-midnight-colors (cons "#2a2a2a" "#fafafa"))
 '(projectile-after-switch-project-hook '(my/eyebrowse-name-from-project projectile-vc) nil nil "Customized with use-package projectile")
 '(projectile-completion-system 'ivy nil nil "Customized with use-package ivy")
 '(projectile-globally-ignored-directories
   '(".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "deps" "node_modules" "build" "_build" "dist" ".cache" ".eggs" ".tox" "__pycache__" ".mypy_cache") nil nil "Customized with use-package projectile")
 '(projectile-globally-ignored-file-suffixes '("pyc" "beam") nil nil "Customized with use-package projectile")
 '(projectile-switch-project-action 'projectile-dired nil nil "Customized with use-package projectile")
 '(recentf-max-saved-items nil)
 '(reftex-default-bibliography '("~/zettelkasten/bibliography/references.bib"))
 '(rg-custom-type-aliases
   '((#("gn" 0 1
        (idx 0))
      . "*.gn *.gni")
     (#("gyp" 0 1
        (idx 1))
      . "*.gyp *.gypi")
     (#("tmpl" 0 1
        (idx 2))
      . "*.tmpl")) nil nil "Customized with use-package rg")
 '(rg-group-result nil nil nil "Customized with use-package rg")
 '(rust-format-on-save t nil nil "Customized with use-package rust-mode")
 '(safe-local-variable-values
   '((flycheck-gcc-include-path quote
                                ("/home/users/bollal/src/bitbucket.roche.com/RLXNEXT/rlx-osal/protobuf/" "/home/users/bollal/src/bitbucket.roche.com/RLXNEXT/rlx-osal/lib/"))
     (eval add-hook 'after-save-hook
           (lambda nil
             (org-ascii-export-to-ascii nil))
           t t)
     (elpy-test-runner . elpy-test-pytest-runner)
     (eval add-hook 'after-save-hook
           (lambda nil
             (org-html-export-to-html nil))
           t t)
     (eval setenv "LAUNCH_DB" "1")))
 '(scroll-bar-mode nil)
 '(scroll-conservatively 101)
 '(send-mail-function 'smtpmail-send-it)
 '(show-paren-mode t)
 '(shr-use-colors t)
 '(shr-use-fonts nil)
 '(tls-checktrust 'ask)
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh")
 '(undo-tree-auto-save-history nil t)
 '(undo-tree-history-directory-alist '(("." . "~/.emacs.d/.undo-tree")) t)
 '(vc-annotate-background-mode nil)
 '(vc-follow-symlinks nil)
 '(vc-handled-backends '(Git))
 '(vc-log-show-limit 50)
 '(vcs-resolve-exe "~/src/github.com/lbolla/vcs-resolve/vcs-resolve.py" nil nil "Customized with use-package vcs-resolve")
 '(w3m-home-page "about:")
 '(w3m-search-default-engine "startpage")
 '(w3m-search-engine-alist
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
 '(web-mode-code-indent-offset 4)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(whitespace-style '(face trailing lines-tail))
 '(xterm-color-names
   ["#000000" "#ff8059" "#44bc44" "#eecc00" "#33beff" "#feacd0" "#00d3d0" "#a8a8a8"])
 '(xterm-color-names-bright
   ["#181a20" "#f4923b" "#58dd13" "#e5f040" "#72a4ff" "#f78fe7" "#4ae8fc" "#ffffff"])
 '(yas-indent-line 'fixed nil nil "Customized with use-package yasnippet"))

;; Preferred fonts: Terminus, Iosevka, SourceSerifPro, EBGaramond
;; More at https://fonts.google.com/?category=Serif&sort=popularity
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka" :weight light :height 120))))
 '(fixed-pitch ((t (:family "Iosevka" :height 120))))
 '(fixed-pitch-serif ((t (:family "FreeMono" :height 120))))
 '(variable-pitch ((t (:family "Gentium" :height 140)))))
 ;; '(mode-line ((t (:background "gray55"))))
 ;; '(region ((t (:background "#50506f"))))

(provide 'custom)
;;; custom.el ends here
