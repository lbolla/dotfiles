;;; package --- Personal public stuff
;;; Commentary:
;;; 17 Dec 2020

;;; Code:

(require 'private "~/Private/emacs/private.el")

(defvar org-agenda-files)

(add-to-list 'org-mode-hook (lambda ()
                              (add-to-list 'org-agenda-files "~/org/fun.org")
                              (add-to-list 'org-agenda-files "~/org/personal.org")
                              (add-to-list 'org-agenda-files "~/org/programming.org")))

(use-package deft
  :bind
  ("C-c n d" . deft)
  :custom
  (deft-directory my/zettelkasten-directory)
  (deft-recursive t)
  (deft-use-filter-string-for-filename t)
  (deft-strip-summary-regexp
   (concat "\\("
	   "[\n\t]"                      ;; blank
	   "\\|^#\\+[[:alpha:]_]+:.*$"   ;; org-mode metadata
	   "\\|^:PROPERTIES:\n\\(.+\n\\)+:END:\n"
	   "\\)"))
  :config
  ;; See https://github.com/jrblevin/deft/issues/75
  (defun cm/deft-parse-title (file contents)
    "Parse the given FILE and CONTENTS and determine the title.
  If `deft-use-filename-as-title' is nil, the title is taken to
  be the first non-empty line of the FILE.  Else the base name of the FILE is
  used as title."
    (let ((begin (string-match "^#\\+[tT][iI][tT][lL][eE]: .*$" contents)))
      (if begin
	  (string-trim (substring contents begin (match-end 0)) "#\\+[tT][iI][tT][lL][eE]: *" "[\n\t ]+")
        (deft-base-filename file))))
  (advice-add 'deft-parse-title :override #'cm/deft-parse-title))

(use-package nim-mode
  :hook
  (numsuggest-mode . company-mode)
  ;; (numsuggest-mode . flycheck-mode)
  (nimsuggest-mode . flycheck-nimsuggest-setup)
  (nim-mode . nimsuggest-mode)
  :init
  (my/append-to-path '("~/.nimble/bin")))

(use-package org-roam
  :custom
  (org-cite-global-bibliography '("~/Private/org/bibliography/references.bib"))
  (org-roam-directory my/zettelkasten-directory)
  (org-roam-v2-ack t)
  (org-roam-capture-templates
   '(("d" "default" plain "%?" :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n") :unnarrowed t)
     ("b" "Blog post" plain "%?" :target (file+head "~/src/github.com/lbolla/lbolla.info/org/${slug}.org" "#+TITLE: ${title}\n#+DATE: %t\n\n") :unnarrowed t)))
  :bind
  ("C-c n b" . org-roam-buffer-toggle)
  ("C-c n c" . org-roam-capture)
  ("C-c n f" . org-roam-node-find)
  ("C-c n i" . org-roam-node-insert)
  :init
  (setq org-roam-v2-ack t)
  (org-roam-db-autosync-mode))

(use-package zig-mode
  :hook (zig-mode . (lambda ()
                      (require 'lsp-zig)
                      (setq lsp-zig-zls-executable "/opt/zls-0.1.0/zls"))))

(provide 'personal)

;;; personal.el ends here
