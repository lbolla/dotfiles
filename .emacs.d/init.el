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
 '(delete-old-versions t)
 '(display-time-world-list
   (quote
    (("America/Los_Angeles" "palmcal")
     ("America/Sao_Paulo" "diogo")
     ("America/New_York" "fesh")
     ("UTC" "UTC")
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
 '(eww-search-prefix "https://lite.qwant.com/?q=")
 '(explicit-shell-file-name "/usr/bin/bash")
 '(font-use-system-font t)
 '(gc-cons-threshold 5000000)
 '(indent-tabs-mode nil)
 '(inferior-lisp-program "/usr/local/bin/sbcl --noinform" t)
 '(inhibit-startup-screen t)
 '(linum-format " %7i ")
 '(message-citation-line-function (quote message-insert-formatted-citation-line))
 '(mouse-autoselect-window nil)
 '(mouse-yank-at-point t)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (evil-org evil-magit evil-mu4e org-bullets fzf zoom-window rg dockerfile-mode racer toml-mode flycheck-rust lua-mode ess counsel yaml-mode xclip web-mode w3m virtualenvwrapper use-package swiper spinner restclient queue projectile pass paredit mu4e-alert markdown-mode magit macrostep json-mode js2-mode jedi hexrgb go-mode gnus-desktop-notify flycheck-mypy flycheck-flow flycheck-elixir flycheck-dialyzer flycheck-cython evil-nerd-commenter evil-matchit evil cython-mode cyberpunk-theme csv-mode company-jedi)))
 '(password-store-password-length 16)
 '(show-paren-mode t)
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
 '(whitespace-style (quote (face trailing lines-tail))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monoid" :height 90)))))

;; Standard pkgs bindings
(global-set-key (kbd "C-x 2") 'split-window-below-and-switch-buffer)
(global-set-key (kbd "C-x 3") 'split-window-right-and-switch-buffer)
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "C-c i")
                (lambda ()
                  (interactive)
                  (find-file "~/.emacs.d/pkgs.el")))
(global-set-key (kbd "C-c z") 'zoom-window-zoom)
(global-set-key (kbd "<f8>") 'pass)
(global-set-key (kbd "S-<f8>") 'password-store-copy)
(global-set-key (kbd "<f10>") 'menu-bar-mode)

(require 'defuns "~/.emacs.d/defuns.el")
(require 'private "~/.emacs.d/private.el")
(require 'yg "~/.emacs.d/yg.el")
(require 'pkgs "~/.emacs.d/pkgs.el")

(blink-cursor-mode 1)
(column-number-mode 1)
(global-hl-line-mode)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode 1)
(tool-bar-mode 0)

(server-start)

(provide 'init)
;;; init.el ends here
