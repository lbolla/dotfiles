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
 '(auth-source-debug nil)
 '(auth-sources
   (quote
    ("secrets:session" "secrets:Login" "~/.authinfo.gpg")))
 '(auto-hscroll-mode t)
 '(auto-revert-check-vc-info t)
 '(backup-directory-alist (quote (("." . "~/.emacs.d/backups"))))
 '(blink-cursor-mode t)
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
 '(company-lsp-cache-candidates (quote auto) t)
 '(company-lsp-enable-snippet nil t)
 '(company-tooltip-align-annotations t)
 '(custom-safe-themes t)
 '(delete-old-versions t)
 '(delete-selection-mode t)
 '(display-time-world-list
   (quote
    (("UTC" "UTC/GMT/Zulu")
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
     ("Australia/Sydney" "Sydney"))))
 '(dumb-jump-selector (quote ivy))
 '(dumb-jump-window (quote other))
 '(dump-jump-prefer-searcher (quote rg) t)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(elpy-modules
   (quote
    (elpy-module-sane-defaults elpy-module-company elpy-module-eldoc elpy-module-highlight-indentation elpy-module-pyvenv)))
 '(epa-pinentry-mode (quote loopback))
 '(erlang-root-dir "/usr" t)
 '(evil-default-state (quote normal))
 '(evil-lookup-func (quote man-at-point))
 '(evil-want-C-i-jump nil)
 '(evil-want-C-w-in-emacs-state t)
 '(evil-want-integration t)
 '(evil-want-keybinding nil)
 '(eww-search-prefix "https://www.startpage.com/do/search?q=")
 '(eyebrowse-default-workspace-slot 0)
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
 '(flycheck-pycheckers-checkers (quote (flake8 mypy3)))
 '(font-use-system-font t)
 '(gc-cons-threshold 100000000)
 '(global-hl-line-mode nil)
 '(hl-sexp-background-color "#efebe9")
 '(indent-tabs-mode nil)
 '(inferior-lisp-program "/usr/local/bin/sbcl --noinform" t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message ";; SCRATCH

")
 '(ivy-use-virtual-buffers t)
 '(js2-mode-show-strict-warnings nil)
 '(json-reformat:indent-width 2 t)
 '(line-spacing 0.2)
 '(linum-format " %7i ")
 '(load-prefer-newer t)
 '(lsp-enable-indentation nil)
 '(lsp-enable-snippet nil)
 '(lsp-prefer-capf t)
 '(lsp-prefer-flymake nil t)
 '(lsp-response-timeout 5)
 '(lsp-rust-clippy-preference "on")
 '(lsp-ui-doc-enable nil)
 '(lsp-ui-flycheck-enable t t)
 '(lsp-ui-sideline-enable nil)
 '(magit-branch-arguments nil t)
 '(magit-completing-read-function (quote ivy-completing-read))
 '(magit-log-margin (quote (t "%Y-%m-%d %H:%M " magit-log-margin-width t 18)))
 '(magit-log-section-commit-count 10)
 '(magit-pull-or-fetch t)
 '(magit-push-always-verify nil t)
 '(mail-user-agent (quote mu4e-user-agent))
 '(menu-bar-mode nil)
 '(message-citation-line-function (quote message-insert-formatted-citation-line))
 '(message-kill-buffer-on-exit t)
 '(mouse-autoselect-window nil)
 '(mouse-yank-at-point t)
 '(mu4e-alert-style (quote log))
 '(mu4e-attachment-dir "/tmp")
 '(mu4e-bookmarks
   (quote
    (("flag:unread AND NOT flag:trashed" "Unread/flagged" 117)
     ("maildir:/YG/INBOX AND flag:unread AND NOT flag:trashed" "Unread inbox" 105)
     ("maildir:/YG/Errors AND flag:unread AND NOT flag:trashed" "Unread errors" 101)
     ("maildir:/YG/Tickets AND flag:unread AND NOT flag:trashed" "Unread tickets" 116)
     ("maildir:/YG/GitLab AND flag:unread AND NOT flag:trashed" "Unread GitLab" 103)
     ("flag:flagged" "Flagged" 102)
     ("flag:attach" "With attachment" 97))))
 '(mu4e-change-filenames-when-moving t)
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
 '(mu4e-maildir "/home/lbolla/Mail")
 '(mu4e-maildir-shortcuts
   (quote
    (("/YG/INBOX" . 105)
     ("/YG/Sent Items" . 115)
     ("/YG/Errors" . 101)
     ("/YG/GitLab" . 103)
     ("/YG/Tickets" . 116))))
 '(mu4e-mailing-list-patterns (quote ("\\([^.]*\\)\\.yougov\\.net")))
 '(mu4e-sent-folder "/YG/Sent Items")
 '(mu4e-trash-folder "/YG/Deleted Items")
 '(mu4e-update-interval 300)
 '(mu4e-use-fancy-chars nil)
 '(mu4e-user-mail-address-list (quote ("lorenzo.bolla@yougov.com")))
 '(mu4e-view-html-plaintext-ratio-heuristic 20)
 '(mu4e-view-scroll-to-next nil)
 '(mu4e-view-show-addresses t)
 '(mu4e-view-show-images nil)
 '(mu4e-view-use-gnus nil)
 '(network-security-level (quote high) nil nil "Customized with use-package nsm")
 '(org-agenda-block-separator "")
 '(org-agenda-custom-commands
   (quote
    (("." "Agenda/Refile/Archive"
      ((agenda "" nil)
       (tags-todo "-REFILE/NEXT|WAIT"
                  ((org-agenda-overriding-header "Next tasks")
                   (org-agenda-skip-function
                    (quote my/org-agenda-skip-scheduled))
                   (org-agenda-files
                    (quote
                     ("~/org/")))))
       (tags-todo "-REFILE/TODO"
                  ((org-agenda-overriding-header "Unscheduled tasks")
                   (org-agenda-skip-function
                    (quote my/org-agenda-skip-scheduled))
                   (org-agenda-files
                    (quote
                     ("~/org/")))))
       (org-ql-block
        (quote
         (tags-inherited "REFILE"))
        ((org-ql-block-header
          #("Tasks to Refile" 0 15
            (face org-agenda-structure)))))
       (org-ql-block
        (quote
         (and
          (done)
          (ts :to -60)))
        ((org-ql-block-header "Tasks to archive"))))))))
 '(org-agenda-files (quote ("~/org/")))
 '(org-agenda-include-diary t)
 '(org-agenda-log-mode-items (quote (clock closed)))
 '(org-agenda-sorting-strategy
   (quote
    ((agenda habit-down time-up deadline-down scheduled-up timestamp-up todo-state-down priority-down alpha-up category-up tag-up)
     (todo todo-state-down priority-down category-up alpha-up)
     (tags todo-state-down priority-down category-up alpha-up)
     (search todo-state-down priority-down category-up alpha-up))))
 '(org-agenda-span 1)
 '(org-agenda-start-on-weekday nil)
 '(org-agenda-start-with-log-mode t)
 '(org-agenda-tags-column (quote auto))
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
     ("m" "Meeting" entry
      (file "~/org/refile.org")
      "* TODO Meeting %? :MEET:
%U")
     ("h" "Habit" entry
      (file "~/org/refile.org")
      "* TODO %?
:PROPERTIES:
:STYLE:    habit
:END:
")
     ("n" "Note" entry
      (file "~/org/notes.org")
      "* %? 
%U
%a
")
     ("i" "Idea" entry
      (file "~/org/ideas.org")
      "* %? 
%U
%a
")
     ("l" "Link" entry
      (file+headline "~/Private/org/org-linkz/Linkz.org" "INBOX")
      "* %a
%i" :immediate-finish t))))
 '(org-clock-into-drawer "CLOCKS")
 '(org-clock-out-remove-zero-time-clocks t)
 '(org-clock-out-when-done (quote ("WAIT" "DONE" "CANC" "DELG")))
 '(org-columns-default-format
   "%50ITEM %TODO %3PRIORITY %TAGS %10EFFORT %CLOCKSUM %CLOCKSUM_T")
 '(org-deadline-warning-days 30)
 '(org-default-notes-file "~/org/refile.org")
 '(org-default-priority 68)
 '(org-export-backends (quote (ascii html icalendar latex odt confluence)))
 '(org-fast-tag-selection-single-key t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-fontify-whole-heading-line t)
 '(org-html-htmlize-output-type (quote css))
 '(org-html-validation-link nil)
 '(org-link-abbrev-alist
   (quote
    (("FB" . "https://yougov.fogbugz.com/f/cases/%h")
     ("BSD" . "https://jira.yougov.net/browse/BSD-%h")
     ("BRI" . "https://jira.yougov.net/browse/BRI-%h")
     ("DEVO" . "https://jira.yougov.net/browse/DEVO-%h")
     ("GH" . github-issue-url)
     ("GL" . yg-gitlab-object-url))))
 '(org-log-done (quote time))
 '(org-log-into-drawer t)
 '(org-module
   (quote
    (org-habit ox-confluence org-protocol ol-w3m ol-bbdb ol-bibtex ol-docview ol-info ol-eww)) t)
 '(org-outline-path-complete-in-steps nil)
 '(org-priority-faces
   (quote
    ((65 . font-lock-warning-face)
     (67 . font-lock-comment-face))))
 '(org-priority-start-cycle-with-default nil)
 '(org-protocol-default-template-key "l" t)
 '(org-publish-project-alist
   (quote
    (("home" :base-directory "~/Private/org/" :exclude "\\.*" :include
      ("home.org")
      :with-broken-links t :publishing-directory "~/Private/org/" :publishing-function org-html-publish-to-html :description "My links" :html-postamble "<link rel=\"stylesheet\" href=\"http://gongzhitaao.org/orgcss/org.css\" type=\"text/css\">")
     ("lbolla.info" :components
      ("lbolla.info-html" "lbolla.info-static" "lbolla.info-cv.pdf"))
     ("lbolla.info-static" :base-directory "~/src/github.com/lbolla/lbolla.info/static/" :base-extension "png\\|jpg\\|\\|gif\\|gz\\|css\\|woff2" :publishing-directory "~/src/github.com/lbolla/lbolla.info/html/" :recursive t :publishing-function org-publish-attachment)
     ("lbolla.info-cv.pdf" :base-directory "~/src/github.com/lbolla/lbolla.info/org/" :exclude "\\.*" :include
      ("cv.org")
      :publishing-directory "~/src/github.com/lbolla/lbolla.info/html/" :publishing-function org-latex-publish-to-pdf)
     ("lbolla.info-html" :base-directory "~/src/github.com/lbolla/lbolla.info/org/" :publishing-directory "~/src/github.com/lbolla/lbolla.info/html/" :recursive t :section-numbers nil :auto-sitemap t :sitemap-format-entry lbolla\.info/org-publish-sitemap-format-entry :sitemap-function lbolla\.info/org-publish-sitemap-function :sitemap-sort-files anti-chronologically :sitemap-style tree :sitemap-title "Sitemap" :with-toc nil :description "Lorenzo Bolla homepage" :html-doctype "html5" :html-head-include-default-style nil :html-head-include-scripts nil :html-link-home "<ignored>" :html-link-up "<ignored>" :html-home/up-format "<div id=\"org-div-home-and-up\"><a accesskey=\"h\" href=\"/\">Home</a> | <a accesskey=\"a\" href=\"/articles\">Articles</a> | <a accesskey=\"c\" href=\"/cv\">CV</a> (<a href=\"/cv.pdf\">pdf</a>)</div>" :html-preamble lbolla\.info/html-preamble :html-postamble nil :html-head "<link rel=\"stylesheet\" href=\"./css/org.css\" type=\"text/css\">" :html-head-extra "<link rel=\"stylesheet\" href=\"./css/extra.css\" type=\"text/css\">" :publishing-function org-html-publish-to-html)
     ("kubernetes" :components
      ("kubernetes-org" "kubernetes-html"))
     ("kubernetes-org" :base-directory "~/work/kubernetes/" :base-extension "org" :publishing-directory "/rsync:dev-lbolla:public_html/kubernetes/" :publishing-function org-org-publish-to-org :recursive t)
     ("kubernetes-html" :base-directory "~/work/kubernetes/" :base-extension "org" :publishing-directory "/rsync:dev-lbolla:public_html/kubernetes/" :publishing-function org-html-publish-to-html :html-head "<link rel=\"stylesheet\" href=\"http://gongzhitaao.org/orgcss/org.css\" type=\"text/css\">" :recursive t)
     ("cubeapi" :components
      ("cubeapi-notes" "cubeapi-static"))
     ("cubeapi-notes" :base-directory "~/work/cubeapi/notes/" :base-extension "org" :publishing-directory "/rsync:dev-lbolla:public_html/cubeapi/" :publishing-function org-html-publish-to-html :html-head "<link rel=\"stylesheet\" href=\"http://gongzhitaao.org/orgcss/org.css\" type=\"text/css\">" :recursive t)
     ("cubeapi-static" :base-directory "~/work/cubeapi/notes/" :base-extension "png\\|jpg" :publishing-directory "/rsync:dev-lbolla:public_html/cubeapi/" :recursive t :publishing-function org-publish-attachment))))
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
     ("TODO" "NEXT" "SOMEDAY" "WAIT" "CANC" "DELG")
     ("@ignore")
     "")))
 '(org-tag-alist
   (quote
    ((:startgroup)
     ("@family" . 102)
     ("@home" . 104)
     ("@work" . 119)
     ("@ignore" . 105)
     (:endgroup)
     ("MEET" . 109)
     ("FLAG" . 43))))
 '(org-todo-keyword-faces
   (quote
    (("TODO" . org-todo)
     ("NEXT" . org-strt)
     ("SDAY" . org-sday)
     ("WAIT" . org-wait)
     ("DELG" . org-delg)
     ("CANC" . org-canc)
     ("DONE" . org-done))))
 '(org-todo-keywords
   (quote
    ((sequence "TODO(t)" "NEXT(n!)" "WAIT(w@/!)" "SDAY(s!)" "|" "DONE(d!)" "CANC(c@)" "DELG(l@)"))))
 '(org-treat-S-cursor-todo-selection-as-state-change nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (dimmer org-ql-view doom-themes org-ql lsp-ui tao-theme org-plus-contrib copy-as-format edit-server lsp-python-ms rjsx-mode eyebrowse company-lsp lsp-mode ivy-hydra flycheck-color-mode-line flycheck-pycheckers expand-region esup magit-todos nnir poet-theme goose-theme flycheck-rust flycheck-popup-tip nim nim-mode text-mode prog-mode org-mu4e mu4e lisp-mode evil-org-agenda elpy which-key diminish dumb-jump leuven-theme evil-collection tablist evil-org evil-magit evil-mu4e zoom-window rg dockerfile-mode racer toml-mode lua-mode ess counsel yaml-mode xclip web-mode use-package swiper spinner queue projectile pass paredit mu4e-alert markdown-mode magit macrostep json-mode js2-mode hexrgb go-mode gnus-desktop-notify flycheck-flow flycheck-dialyzer flycheck-cython evil-nerd-commenter evil-matchit evil cython-mode cyberpunk-theme csv-mode)))
 '(password-store-password-length 16)
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
 '(rg-group-result nil)
 '(rust-format-on-save t t)
 '(safe-local-variable-values
   (quote
    ((eval add-hook
           (quote after-save-hook)
           (lambda nil
             (org-html-export-to-html nil))
           t t)
     (eval setenv "LAUNCH_DB" "1"))))
 '(scroll-bar-mode nil)
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(shr-use-colors t)
 '(shr-use-fonts nil)
 '(smtpmail-mail-address "lorenzo.bolla@yougov.com" t)
 '(smtpmail-smtp-server "smtp.yougov.com")
 '(smtpmail-smtp-service 465)
 '(smtpmail-stream-type (quote starttls))
 '(tls-checktrust (quote ask))
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh")
 '(undo-tree-auto-save-history t)
 '(undo-tree-history-directory-alist (quote (("." . "~/.emacs.d/.undo-tree"))))
 '(user-full-name "Lorenzo Bolla")
 '(user-mail-address "lorenzo.bolla@yougov.com")
 '(vc-follow-symlinks nil)
 '(vc-log-show-limit 50)
 '(vcs-resolve-exe
   "/home/lbolla/src/github.com/lbolla/vcs-resolve/vcs-resolve.py" t)
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
 '(web-mode-code-indent-offset 4)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
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
 '(variable-pitch ((t (:family "Gentium" :height 140)))))
 ;; '(mode-line ((t (:background "gray55"))))
 ;; '(region ((t (:background "#50506f"))))

(global-set-key (kbd "M-o") 'my/open-line)
(global-set-key (kbd "M-O") 'my/open-line-above)
(global-set-key (kbd "C-x 2") 'my/split-window-below-and-switch-buffer)
(global-set-key (kbd "C-x 3") 'my/split-window-right-and-switch-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; (global-set-key (kbd "C-c e") 'eshell)
;; (global-set-key (kbd "C-c f") 'variable-pitch-mode)
(global-set-key (kbd "C-c t") 'my/switch-theme)
(global-set-key (kbd "C-c v w") 'venv-workon-and-cdproject)
;; (global-set-key (kbd "C-c w") 'w3m)
(global-set-key (kbd "C-c z") 'zoom-window-zoom)
;; (global-set-key (kbd "C-c f l") 'my/find-file-linkz)
;; (global-set-key (kbd "C-c f i") 'my/find-file-init)
;; (global-set-key (kbd "C-c f p") 'my/find-file-pkgs)

(defadvice kill-buffer (around kill-buffer-around-advice activate)
  "Bury *scratch* buffer instead of killing it.
See https://stackoverflow.com/questions/234963/re-open-scratch-buffer-in-emacs#235069"
  (let ((buffer-to-kill (ad-get-arg 0)))
    (if (equal buffer-to-kill "*scratch*")
        (bury-buffer)
      ad-do-it)))

;; Show buffer path, relative to project root
;; https://www.reddit.com/r/emacs/comments/8xobt3/tip_in_modeline_show_buffer_file_path_relative_to/
(with-eval-after-load 'subr-x
  (setq-default mode-line-buffer-identification
                '(:eval (format-mode-line
                         (propertized-buffer-identification
                          (or (when-let* ((buffer-file-truename buffer-file-truename)
                                          (prj (cdr-safe (project-current)))
                                          (prj-parent (file-name-directory (directory-file-name (expand-file-name prj)))))
                                (concat (file-relative-name
                                         (file-name-directory buffer-file-truename)
                                         prj-parent) (file-name-nondirectory buffer-file-truename)))
                              "%b"))))))

(require 'defuns "~/.emacs.d/defuns.el")
(require 'private "~/.emacs.d/private.el")
(require 'yg "~/.emacs.d/yg.el")
(require 'pkgs "~/.emacs.d/pkgs.el")
(require 'themes "~/.emacs.d/themes.el")

;; Optimizations
;; https://emacs.stackexchange.com/questions/28736/emacs-pointcursor-movement-lag/28746
(setq auto-window-vscroll nil)

(provide 'init)
;;; init.el ends here
