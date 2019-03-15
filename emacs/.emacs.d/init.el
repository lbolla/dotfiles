;;; package --- lbolla init.el file
;;; Commentary:
;;; 14 March 2014

;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#282c34" "#ff6c6b" "#98be65" "#da8548" "#61afef" "#c678dd" "#1f5582" "#abb2bf"])
 '(auth-source-debug nil)
 '(auth-sources
   (quote
    ("secrets:session" "secrets:Login" "~/.authinfo.gpg")))
 '(auto-hscroll-mode t)
 '(auto-revert-check-vc-info t)
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
 '(company-idle-delay 0.2)
 '(company-tooltip-align-annotations t)
 '(custom-safe-themes t)
 '(delete-old-versions t)
 '(display-time-world-list
   (quote
    (("UTC" "UTC/GMT/Zulu")
     ("America/Los_Angeles" "palmcal")
     ("America/Sao_Paulo" "diogo")
     ("America/New_York" "fesh")
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
 '(doom-modeline-bar-width 3 t)
 '(doom-modeline-icon t t)
 '(doom-tomorrow-day-padded-modeline t t)
 '(doom-tomorrow-night-padded-modeline t)
 '(dumb-jump-selector (quote ivy))
 '(dumb-jump-window (quote other))
 '(dump-jump-prefer-searcher (quote rg) t)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(elpy-modules
   (quote
    (elpy-module-sane-defaults elpy-module-company elpy-module-eldoc elpy-module-highlight-indentation elpy-module-pyvenv)))
 '(epa-pinentry-mode (quote loopback))
 '(evil-lookup-func (quote man-at-point))
 '(evil-want-C-i-jump nil)
 '(evil-want-C-w-in-emacs-state t)
 '(evil-want-integration t)
 '(evil-want-keybinding nil)
 '(eww-search-prefix "https://www.ixquick.com/do/search?q=")
 '(explicit-shell-file-name "/usr/bin/bash")
 '(eyebrowse-keymap-prefix "e")
 '(eyebrowse-new-workspace t)
 '(fci-rule-color "#383838")
 '(fill-column 79)
 '(flycheck-check-syntax-automatically (quote (save idle-change new-line mode-enabled)))
 '(flycheck-clang-include-path
   (quote
    ("/usr/include/glib-2.0" "/usr/lib/x86_64-linux-gnu/glib-2.0/include" "../deps" "../../deps")))
 '(flycheck-clang-language-standard "c++11")
 '(flycheck-cppcheck-checks (quote ("all")))
 '(flycheck-cppcheck-suppressions (quote ("constStatement")))
 '(flycheck-flake8rc "setup.cfg")
 '(flycheck-gcc-language-standard "c++1y")
 '(flycheck-ghc-language-extensions nil)
 '(flycheck-highlighting-mode (quote lines))
 '(flycheck-javascript-flow-args nil t)
 '(flycheck-python-mypy-args
   (quote
    ("--incremental" "--ignore-missing-imports" "--follow-imports=skip")))
 '(font-use-system-font t)
 '(gc-cons-threshold 20000000)
 '(godef-command "/home/lbolla/src/go/bin/godef")
 '(hl-sexp-background-color "#efebe9")
 '(indent-tabs-mode nil)
 '(inferior-lisp-program "/usr/local/bin/sbcl --noinform" t)
 '(inhibit-startup-screen t)
 '(initial-major-mode (quote fundamental-mode))
 '(initial-scratch-message ";; SCRATCH

")
 '(ivy-use-virtual-buffers t)
 '(js2-mode-show-strict-warnings nil t)
 '(line-spacing 0.2)
 '(linum-format " %7i ")
 '(load-prefer-newer t)
 '(magit-branch-arguments nil t)
 '(magit-completing-read-function (quote ivy-completing-read))
 '(magit-log-margin (quote (t "%Y-%m-%d %H:%M " magit-log-margin-width t 18)))
 '(magit-log-section-commit-count 0)
 '(magit-pull-or-fetch t)
 '(magit-push-always-verify nil t)
 '(magit-todos-exclude-globs (quote ("concatenated" "node_modules" "vendor")))
 '(magit-todos-keyword-suffix ":\\| \\|$")
 '(magit-todos-update 60)
 '(mail-user-agent (quote mu4e-user-agent))
 '(message-citation-line-function (quote message-insert-formatted-citation-line))
 '(message-kill-buffer-on-exit t)
 '(mouse-autoselect-window nil)
 '(mouse-yank-at-point t)
 '(mu4e-alert-interesting-mail-query "(flag:unread OR flag:flagged) AND NOT flag:trashed")
 '(mu4e-attachment-dir "/tmp")
 '(mu4e-bookmarks
   (quote
    (("(flag:unread OR flag:flagged) AND NOT flag:trashed" "Unread/flagged" 117)
     ("maildir:/YG/INBOX AND flag:unread AND NOT flag:trashed" "Unread inbox" 105)
     ("maildir:/YG/Errors AND flag:unread AND NOT flag:trashed" "Unread errors" 101)
     ("maildir:/YG/Tickets AND flag:unread AND NOT flag:trashed" "Unread tickets" 116)
     ("flag:flagged" "Flagged" 102)
     ("flag:attach" "With attachment" 97))))
 '(mu4e-compose-complete-addresses t)
 '(mu4e-compose-complete-only-after nil)
 '(mu4e-compose-complete-only-personal nil)
 '(mu4e-compose-dont-reply-to-self t)
 '(mu4e-drafts-folder "/YG/Drafts")
 '(mu4e-get-mail-command "true")
 '(mu4e-headers-date-format "%x %X")
 '(mu4e-headers-fields
   (quote
    ((:human-date . 18)
     (:flags . 6)
     (:mailing-list . 10)
     (:from . 22)
     (:subject))))
 '(mu4e-headers-include-related t)
 '(mu4e-headers-skip-duplicates t)
 '(mu4e-html2text-command "w3m -dump -cols 80 -T text/html")
 '(mu4e-maildir "/home/lbolla/Mail")
 '(mu4e-maildir-shortcuts
   (quote
    (("/YG/INBOX" . 105)
     ("/YG/Sent Items" . 115)
     ("/YG/Errors" . 101)
     ("/YG/Tickets" . 116))))
 '(mu4e-sent-folder "/YG/Sent Items")
 '(mu4e-trash-folder "/YG/Deleted Items")
 '(mu4e-update-interval 300)
 '(mu4e-use-fancy-chars nil)
 '(mu4e-user-mail-address-list (quote ("lorenzo.bolla@yougov.com")))
 '(mu4e-view-html-plaintext-ratio-heuristic 20)
 '(mu4e-view-scroll-to-next nil)
 '(mu4e-view-show-addresses t)
 '(mu4e-view-show-images t)
 '(my/mu4e-get-mail-command "mbsync -a")
 '(network-security-level (quote high) nil nil "Customized with use-package nsm")
 '(org-agenda-custom-commands
   (quote
    ((" " "Agenda"
      ((agenda "" nil)
       (tags "REFILE"
             ((org-agenda-overriding-header "Tasks to Refile")
              (org-tags-match-list-sublevels nil)))
       (tags "-REFILE/"
             ((org-agenda-overriding-header "Tasks to Archive")
              (org-agenda-skip-function
               (quote bh/skip-non-archivable-tasks))
              (org-tags-match-list-sublevels nil)))))
     ("n" "Notes" tags "NOTE"
      ((org-agenda-overriding-header "Notes")
       (org-tags-match-list-sublevels nil)))
     ("i" "Ideas" tags "IDEA"
      ((org-agenda-overriding-header "Ideas")
       (org-tags-match-list-sublevels nil)))
     ("A" agenda "Prioritized tasks"
      ((org-agenda-skip-function
        (lambda nil
          (org-agenda-skip-entry-if
           (quote notregexp)
           "\\=.*\\[#[ABC]\\]")))
       (org-agenda-overriding-header "Prioritized tasks")))
     ("u" . "Unscheduled")
     ("ut" "Unscheduled TODO" todo "TODO"
      ((org-agenda-skip-function
        (lambda nil
          (org-agenda-skip-entry-if
           (quote scheduled)
           (quote deadline))))
       (org-agenda-overriding-header "Unscheduled TODO")))
     ("ud" "Unscheduled DONE|CANC" todo "DONE|CANC"
      ((org-agenda-skip-function
        (lambda nil
          (org-agenda-skip-entry-if
           (quote scheduled)
           (quote deadline))))
       (org-agenda-overriding-header "Unscheduled DONE|CANC")))
     ("c" . "Filter by category")
     ("cb" "BrandIndex" tags-todo "+CATEGORY=\"BrandIndex\"")
     ("cd" "DevOps" tags-todo "+CATEGORY=\"DevOps\"")
     ("ce" "Emacs" tags-todo "+CATEGORY=\"Emacs\"")
     ("cp" "Python" tags-todo "+CATEGORY=\"Python\"")
     ("cr" "Rust" tags-todo "+CATEGORY=\"Rust\""))))
 '(org-agenda-files (quote ("~/org/")))
 '(org-agenda-include-diary t)
 '(org-agenda-sorting-strategy
   (quote
    ((agenda habit-down time-up deadline-up scheduled-up timestamp-up todo-state-down priority-down alpha-up category-keep tag-up)
     (todo priority-down category-keep alpha-up)
     (tags priority-down category-keep)
     (search category-keep))))
 '(org-agenda-span 1)
 '(org-agenda-start-on-weekday nil)
 '(org-agenda-tags-column (quote auto))
 '(org-archive-location "%s_archive::* Archived Tasks")
 '(org-babel-load-languages
   (quote
    ((emacs-lisp . t)
     (ledger . t)
     (shell . t)
     (sql . t)
     (python . t))))
 '(org-capture-templates
   (quote
    (("t" "Todo" entry
      (file "~/org/refile.org")
      "* TODO %?
%i
%a
")
     ("c" "Clipboard" entry
      (file "~/org/refile.org")
      "* TODO %?
%i
%x
")
     ("m" "Meeting" entry
      (file "~/org/refile.org")
      "* TODO Meeting %? :MEET:
%U")
     ("p" "Phone" entry
      (file "~/org/refile.org")
      "* TODO Phone %? :PHON:
%U")
     ("n" "Note" entry
      (file "~/org/notes.org")
      "* %? :NOTE:
%U
%a
")
     ("i" "Idea" entry
      (file "~/org/ideas.org")
      "* %? :IDEA:
%U
%a
")
     ("j" "Journal" entry
      (file+olp+datetree "~/org/diary.org")
      "* %?
Entered on %U
  %i
  %a"))))
 '(org-clock-out-remove-zero-time-clocks t t)
 '(org-clock-out-when-done t t)
 '(org-deadline-warning-days 30)
 '(org-default-notes-file "~/org/refile.org")
 '(org-default-priority 68)
 '(org-fast-tag-selection-single-key t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-fontify-whole-heading-line t)
 '(org-html-htmlize-output-type (quote css) t)
 '(org-link-abbrev-alist
   (quote
    (("FB" . "https://yougov.fogbugz.com/f/cases/%h")
     ("GH" . github-issue-url)
     ("GL" . yg-gitlab-object-url))))
 '(org-log-done (quote time))
 '(org-log-into-drawer t)
 '(org-outline-path-complete-in-steps nil)
 '(org-priority-faces
   (quote
    ((65 . font-lock-warning-face)
     (67 . font-lock-comment-face))))
 '(org-priority-start-cycle-with-default nil)
 '(org-publish-project-alist
   (quote
    (("home" :base-directory "~/Private/org/" :exclude "\\.*" :include
      ("home.org")
      :with-broken-links t :publishing-directory "~/Private/org/" :publishing-function org-html-publish-to-html :description "My links" :html-postamble "<link rel=\"stylesheet\" href=\"http://gongzhitaao.org/orgcss/org.css\" type=\"text/css\">")
     ("lbolla.info" :components
      ("lbolla.info-html" "lbolla.info-static" "lbolla.info-cv.pdf"))
     ("lbolla.info-static" :base-directory "~/src/lbolla.info/static/" :base-extension "png\\|jpg\\|\\|gif\\|gz\\|css\\|woff2" :publishing-directory "~/src/lbolla.info/html/" :recursive t :publishing-function org-publish-attachment)
     ("lbolla.info-cv.pdf" :base-directory "~/src/lbolla.info/org/" :exclude "\\.*" :include
      ("cv.org")
      :publishing-directory "~/src/lbolla.info/html/" :publishing-function org-latex-publish-to-pdf)
     ("lbolla.info-html" :base-directory "~/src/lbolla.info/org/" :publishing-directory "~/src/lbolla.info/html/" :recursive t :section-numbers nil :auto-sitemap t :sitemap-format-entry lbolla\.info/org-publish-sitemap-format-entry :sitemap-function lbolla\.info/org-publish-sitemap-function :sitemap-sort-files anti-chronologically :sitemap-style tree :sitemap-title "Sitemap" :with-toc nil :description "Lorenzo Bolla homepage" :html-doctype "html5" :html-head-include-default-style nil :html-head-include-scripts nil :html-link-home "<ignored>" :html-link-up "<ignored>" :html-home/up-format "<div id=\"org-div-home-and-up\"><a accesskey=\"h\" href=\"/\">Home</a> | <a accesskey=\"a\" href=\"/articles\">Articles</a> | <a accesskey=\"c\" href=\"/cv\">CV</a> (<a href=\"/cv.pdf\">pdf</a>)</div>" :html-preamble lbolla\.info/html-preamble :html-postamble nil :html-head "<link rel=\"stylesheet\" href=\"./css/org.css\" type=\"text/css\">" :html-head-extra "<link rel=\"stylesheet\" href=\"./css/extra.css\" type=\"text/css\">" :publishing-function org-html-publish-to-html)
     ("kubernetes" :components
      ("kubernetes-org" "kubernetes-html"))
     ("kubernetes-org" :base-directory "~/work/kubernetes/" :base-extension "org" :publishing-directory "/rsync:dev-lbolla:public_html/kubernetes/" :publishing-function org-org-publish-to-org :recursive t)
     ("kubernetes-html" :base-directory "~/work/kubernetes/" :base-extension "org" :publishing-directory "/rsync:dev-lbolla:public_html/kubernetes/" :publishing-function org-html-publish-to-html :html-head "<link rel=\"stylesheet\" href=\"http://gongzhitaao.org/orgcss/org.css\" type=\"text/css\">" :recursive t)
     ("cubeapi" :components
      ("cubeapi-notes" "cubeapi-static"))
     ("cubeapi-notes" :base-directory "~/work/cubeapi/notes/" :base-extension "org" :publishing-directory "/rsync:dev-lbolla:public_html/cubeapi/" :publishing-function org-html-publish-to-html :html-head "<link rel=\"stylesheet\" href=\"http://gongzhitaao.org/orgcss/org.css\" type=\"text/css\">" :recursive t)
     ("cubeapi-static" :base-directory "~/work/cubeapi/notes/" :base-extension "png\\|jpg" :publishing-directory "/rsync:dev-lbolla:public_html/cubeapi/" :recursive t :publishing-function org-publish-attachment))) t)
 '(org-refile-allow-creating-parent-nodes (quote confirm))
 '(org-refile-targets (quote ((org-agenda-files :level . 1))))
 '(org-refile-use-outline-path t)
 '(org-return-follows-link t)
 '(org-src-fontify-natively t)
 '(org-src-tab-acts-natively t)
 '(org-startup-indented t)
 '(org-stuck-projects
   (quote
    ("+LEVEL=2/-DONE"
     ("TODO" "STRT" "WAIT" "CANC" "DELG")
     ("@ignore")
     "")))
 '(org-tag-alist
   (quote
    ((:startgroup)
     ("@family" . 102)
     ("@home" . 104)
     ("@ignore" . 105)
     (:endgroup)
     ("NOTE" . 110)
     ("MEET" . 109)
     ("PHON" . 112)
     ("FLAGGED" . 43))))
 '(org-todo-keyword-faces
   (quote
    (("TODO" . org-todo)
     ("STRT" . org-strt)
     ("WAIT" . org-wait)
     ("DELG" . org-delg)
     ("MEET" . org-meet)
     ("CANC" . org-canc)
     ("DEFR" . org-defr)
     ("DONE" . org-done))))
 '(org-todo-keywords
   (quote
    ((sequence "TODO(t)" "STRT(s!)" "|" "DONE(d!)" "CANC(c@)")
     (sequence "WAIT(w@/!)" "DELG(l@)" "|" "DEFR(f@)" "MEET(m@)"))))
 '(org-treat-S-cursor-todo-selection-as-state-change nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (flycheck-color-mode-line flycheck-pycheckers org expand-region esup magit-todos nnir poet-theme rmsbolt goose-theme flycheck-rust flycheck-popup-tip nim nim-mode text-mode prog-mode org-mu4e mu4e lisp-mode evil-org-agenda elpy which-key diminish dumb-jump leuven-theme evil-collection tablist evil-org evil-magit evil-mu4e zoom-window rg dockerfile-mode racer toml-mode lua-mode ess counsel yaml-mode xclip web-mode use-package swiper spinner queue projectile pass paredit mu4e-alert markdown-mode magit macrostep json-mode js2-mode hexrgb go-mode gnus-desktop-notify flycheck-flow flycheck-dialyzer flycheck-cython evil-nerd-commenter evil-matchit evil cython-mode cyberpunk-theme csv-mode)))
 '(password-store-password-length 16)
 '(prettier-js-args
   (quote
    ("--bracket-spacing" "false" "--single-quote" "true" "--tab-width" "4" "--trailing-comma" "none")) t)
 '(projectile-completion-system (quote ivy))
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "deps" "node_modules" "build" "_build" "dist" ".cache" ".eggs" ".tox" "__pycache__" ".mypy_cache")))
 '(projectile-globally-ignored-file-suffixes (quote ("pyc" "beam")))
 '(projectile-switch-project-action (quote projectile-dired))
 '(recentf-max-saved-items nil)
 '(rg-custom-type-aliases
   (quote
    ((#("gn" 0 1
        (idx 0))
      . "*.gn *.gni")
     (#("gyp" 0 1
        (idx 1))
      . "*.gyp *.gypi")
     (#("tmpl" 0 1
        (idx 2))
      . "*.tmpl"))))
 '(rg-define-toggle "--context 3" t)
 '(rg-group-result nil)
 '(rust-format-on-save t t)
 '(safe-local-variable-values (quote ((eval setenv "LAUNCH_DB" "1"))))
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(shr-use-fonts t)
 '(smtpmail-mail-address "lorenzo.bolla@yougov.com" t)
 '(smtpmail-smtp-server "smtp.yougov.com")
 '(smtpmail-smtp-service 465)
 '(smtpmail-stream-type (quote starttls))
 '(tls-checktrust (quote ask))
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh")
 '(undo-tree-visualizer-diff nil)
 '(undo-tree-visualizer-timestamps nil)
 '(user-full-name "Lorenzo Bolla")
 '(user-mail-address "lorenzo.bolla@yougov.com")
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
 '(vcs-resolve-exe
   "/home/lbolla/src/github.com/lbolla/vcs-resolve/vcs-resolve.py")
 '(w3m-home-page "about:")
 '(w3m-search-default-engine "startpage")
 '(w3m-search-engine-alist
   (quote
    (("searx" "https://searx.me/?q=%s" utf-8)
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
     ("duckduckgo" "https://duckduckgo.com/?q=%s" utf-8))))
 '(web-mode-code-indent-offset 4 t)
 '(web-mode-css-indent-offset 2 t)
 '(web-mode-markup-indent-offset 2 t)
 '(whitespace-style (quote (face trailing lines-tail)))
 '(yas-indent-line (quote fixed)))

;; Preferred fonts: Terminus, Iosevka, SourceSerifPro, EBGaramond
;; More at https://fonts.google.com/?category=Serif&sort=popularity
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka" :weight light :height 120))))
 '(fixed-pitch ((t (:family "Iosevka" :height 120))))
 '(region ((t (:background "#c1caa1" :distant-foreground "black"))))
 '(variable-pitch ((t (:family "EBGaramond" :height 140)))))

;; https://emacs.stackexchange.com/questions/28736/emacs-pointcursor-movement-lag/28746
(setq auto-window-vscroll nil)

;; Standard pkgs bindings
(global-set-key (kbd "C-x 2") 'split-window-below-and-switch-buffer)
(global-set-key (kbd "C-x 3") 'split-window-right-and-switch-buffer)
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "C-c f") 'variable-pitch-mode)
(global-set-key (kbd "C-c t") 'cycle-themes)
(global-set-key (kbd "C-c w") 'w3m)
(global-set-key (kbd "C-c z") 'zoom-window-zoom)
;; (global-set-key (kbd "C-c C-q")
;;                 (lambda ()
;;                   (interactive)
;;                   ;; Kill daemonized Emacs
;;                   (when (y-or-n-p "Quit Emacs? ")
;;                     (save-buffers-kill-emacs))))
;; (global-set-key (kbd "<f10>") 'menu-bar-mode)

(require 'defuns "~/.emacs.d/defuns.el")
(require 'private "~/.emacs.d/private.el")
(require 'yg "~/.emacs.d/yg.el")
(require 'pkgs "~/.emacs.d/pkgs.el")
(require 'themes "~/.emacs.d/themes.el")

(defadvice kill-buffer (around kill-buffer-around-advice activate)
  "Bury *scratch* buffer instead of killing it.
See https://stackoverflow.com/questions/234963/re-open-scratch-buffer-in-emacs#235069"
  (let ((buffer-to-kill (ad-get-arg 0)))
    (if (equal buffer-to-kill "*scratch*")
        (bury-buffer)
      ad-do-it)))

(blink-cursor-mode 0)
(column-number-mode 1)
(delete-selection-mode 1)
(global-hl-line-mode)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode 1)
(tool-bar-mode 0)

;; (load-theme-cyberpunk)
;; (load-theme-goose)
;; (load-theme-leuven)
;; (load-theme-quasi-monochrome)
;; (load-theme-zerodark)
(cycle-themes)

(provide 'init)
;;; init.el ends here
