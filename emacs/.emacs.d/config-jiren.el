;;; package --- Personal public stuff
;;; Commentary:
;;; 17 Dec 2020

;;; Code:

(require 'local-secret "~/Private/emacs/secret-jiren.el")

(defvar org-agenda-files)

(add-to-list 'org-mode-hook (lambda ()
                              (add-to-list 'org-agenda-files "~/org/fun.org")
                              (add-to-list 'org-agenda-files "~/org/personal.org")
                              (add-to-list 'org-agenda-files "~/org/programming.org")))

(use-package elixir-mode
  :mode (((rx ".mxs" eos) . elixir-mode)))

(use-package erlang-start
  :load-path "/usr/share/emacs/site-lisp/erlang/" ;; Part of erlang-solutions packages
  :mode (((rx ".erl" eos) . erlang-mode)
         ((rx ".app.src" eos) . erlang-mode)
         ((rx ".hrl" eos) . erlang-mode)
         ((rx ".config" eos) . erlang-mode)
         ((rx "rebar") . erlang-mode))
  :custom
  (erlang-root-dir "/usr/share")  ; For man pages
  :config
  (setq erlang-man-file-regexp "\\(.*\\)/man[^/]*/\\([^.]+\\.3erl\\)\\(\\.gz\\)?$")
  (defun erlang-man-get-files (dir)
    "Return files in directory DIR."
    (directory-files dir t ".+\\.3erl\\(\\.gz\\)?\\'"))
  :hook
  (erlang-mode . (lambda ()
                   (my/maybe-with-evil
                    (evil-define-key 'normal erlang-mode-map (kbd "K") 'erlang-man-function))))
  (erlang-shell-mode . (lambda ()
                         (my/maybe-with-evil
                          (evil-define-key 'normal erlang-shell-mode-map (kbd "K") 'erlang-man-function)))))

(use-package nim-mode
  :hook
  (numsuggest-mode . company-mode)
  ;; (numsuggest-mode . flycheck-mode)
  (nimsuggest-mode . flycheck-nimsuggest-setup)
  (nim-mode . nimsuggest-mode)
  :init
  (my/append-to-path '("~/.nimble/bin")))

(use-package zig-mode
  :hook (zig-mode . (lambda ()
                      (require 'lsp-zig)
                      (setq lsp-zig-zls-executable "/opt/zls-0.1.0/zls"))))

(provide 'local-config)

;;; config-jiren.el ends here
