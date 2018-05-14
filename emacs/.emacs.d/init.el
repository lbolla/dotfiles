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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#282c34" "#ff6c6b" "#98be65" "#da8548" "#61afef" "#c678dd" "#1f5582" "#abb2bf"])
 '(auth-source-debug nil)
 '(auth-sources
   (quote
    ("secrets:session" "secrets:Login" "~/.authinfo.gpg")))
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
     ("Asia/Singapore" "Singapore")
     ("Asia/Kuala_Lumpur" "Kuala Lumpur")
     ("Asia/Shanghai" "Shanghai")
     ("Asia/Tokyo" "Tokyo")
     ("Australia/Sydney" "Sydney"))))
 '(dumb-jump-selector (quote ivy))
 '(dump-jump-prefer-searcher (quote rg) t)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(elpy-modules
   (quote
    (elpy-module-sane-defaults elpy-module-company elpy-module-eldoc elpy-module-highlight-indentation elpy-module-pyvenv)))
 '(evil-lookup-func (quote man-at-point))
 '(evil-want-C-w-in-emacs-state t)
 '(evil-want-integration nil)
 '(eww-search-prefix "https://www.ixquick.com/do/search?q=")
 '(explicit-shell-file-name "/usr/bin/bash")
 '(fci-rule-color "#383838")
 '(flycheck-check-syntax-automatically (quote (save idle-change new-line mode-enabled)))
 '(flycheck-idle-change-delay 3)
 '(flycheck-javascript-flow-args nil t)
 '(flycheck-python-mypy-args
   (quote
    ("--incremental" "--ignore-missing-imports" "--follow-imports=skip")) t)
 '(font-use-system-font t)
 '(gc-cons-threshold 5000000)
 '(godef-command "/home/lbolla/src/go/bin/godef")
 '(hl-sexp-background-color "#efebe9")
 '(indent-tabs-mode nil)
 '(inferior-lisp-program "/usr/local/bin/sbcl --noinform" t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message ";; SCRATCH

")
 '(ivy-use-virtual-buffers t)
 '(js2-mode-show-strict-warnings nil t)
 '(linum-format " %7i ")
 '(magit-completing-read-function (quote ivy-completing-read) t)
 '(message-citation-line-function (quote message-insert-formatted-citation-line))
 '(mouse-autoselect-window nil)
 '(mouse-yank-at-point t)
 '(mu4e-alert-interesting-mail-query "flag:unread OR flag:flagged AND NOT flag:trashed")
 '(network-security-level (quote high))
 '(org-deadline-warning-days 30)
 '(org-html-htmlize-output-type (quote css) t)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (nim nim-mode text-mode prog-mode org-mu4e mu4e lisp-mode evil-org-agenda gnu-apl-mode olivetti prettier-js elpy which-key diminish zerodark-theme dumb-jump org leuven-theme htmlize evil-collection tablist evil-org evil-magit evil-mu4e org-bullets zoom-window rg dockerfile-mode racer toml-mode flycheck-rust lua-mode ess counsel yaml-mode xclip web-mode w3m use-package swiper spinner restclient queue projectile pass paredit mu4e-alert markdown-mode magit macrostep json-mode js2-mode hexrgb go-mode gnus-desktop-notify flycheck-mypy flycheck-flow flycheck-dialyzer flycheck-cython evil-nerd-commenter evil-matchit evil cython-mode cyberpunk-theme csv-mode)))
 '(password-store-password-length 16)
 '(prettier-js-args
   (quote
    ("--bracket-spacing" "false" "--single-quote" "true" "--tab-width" "4" "--trailing-comma" "none")) t)
 '(projectile-completion-system (quote ivy))
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "deps" "node_modules" "build" "dist" ".cache" ".eggs" ".tox" "__pycache__" ".mypy_cache")))
 '(projectile-globally-ignored-file-suffixes (quote ("pyc")))
 '(projectile-switch-project-action (quote projectile-dired))
 '(recentf-max-saved-items 100)
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
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(tls-checktrust (quote ask))
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh")
 '(undo-tree-visualizer-diff nil)
 '(undo-tree-visualizer-timestamps nil)
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
 '(whitespace-style (quote (face trailing lines-tail))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Terminus" :weight light :height 120)))))
 ;; '(default ((t (:family "Monoid" :height 110)))))

;; https://emacs.stackexchange.com/questions/28736/emacs-pointcursor-movement-lag/28746
(setq auto-window-vscroll nil)

;; Standard pkgs bindings
(global-set-key (kbd "C-x 2") 'split-window-below-and-switch-buffer)
(global-set-key (kbd "C-x 3") 'split-window-right-and-switch-buffer)
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "C-c f h")
                (lambda ()
                  (interactive)
                  (find-file "~/Private/home.org")))
(global-set-key (kbd "C-c f i")
                (lambda ()
                  (interactive)
                  (find-file "~/.emacs.d/init.el")))
(global-set-key (kbd "C-c f p")
                (lambda ()
                  (interactive)
                  (find-file "~/.emacs.d/pkgs.el")))
;; (global-set-key (kbd "C-c w") 'eww)
(global-set-key (kbd "C-c w") 'w3m)
(global-set-key (kbd "C-c z") 'zoom-window-zoom)
(global-set-key (kbd "C-c C-q")
                (lambda ()
                  (interactive)
                  ;; Kill daemonized Emacs
                  (when (y-or-n-p "Quit Emacs? ")
                    (save-buffers-kill-emacs))))
(global-set-key (kbd "<f8>") 'pass)
(global-set-key (kbd "S-<f8>") 'password-store-copy)
(global-set-key (kbd "<f10>") 'menu-bar-mode)

(require 'defuns "~/.emacs.d/defuns.el")
(require 'private "~/.emacs.d/private.el")
(require 'yg "~/.emacs.d/yg.el")
(require 'pkgs "~/.emacs.d/pkgs.el")
(require 'themes "~/.emacs.d/themes.el")

(blink-cursor-mode 0)
(column-number-mode 1)
(global-hl-line-mode)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode 1)
(tool-bar-mode 0)

;; TODO https://www.reddit.com/r/emacs/comments/8fyzjd/theme_not_loading_completly_with_emacsserver/
;; (add-hook 'after-make-frame-functions
;;           (lambda (frame)
;;             (select-frame frame)
;;             ;; (load-theme-leuven)
;;             (load-theme-quasi-monochrome)
;;             ))

(load-theme-cyberpunk)
;; (load-theme-leuven)
;; (load-theme-quasi-monochrome)
;; (load-theme-zerodark)

(pinentry-start)
(server-start)

(provide 'init)
;;; init.el ends here
