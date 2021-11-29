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

(use-package org-ref
  ;; :after org-roam
  :custom
  (reftex-default-bibliography `(,(concat my/zettelkasten-directory "/bibliography/references.bib")))
  (org-ref-default-bibliography `(,(concat my/zettelkasten-directory "/bibliography/references.bib")))
  (org-ref-bibliography-notes (concat my/zettelkasten-directory "/bibliography/notes.bib"))
  (org-ref-pdf-directory (concat my/zettelkasten-directory "/bibliography/bibtex-pdfs/")))

(use-package org-roam
  :custom
  (org-roam-directory my/zettelkasten-directory)
  (org-roam-v2-ack t)
  :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam-buffer-toggle)
               ("C-c n f" . org-roam-find-file)
               ("C-c n c" . org-ref-insert-link)
               ("C-c n b" . org-roam-switch-to-buffer)
               ("C-c n g" . org-roam-graph-show))
              :map org-mode-map
              (("C-c n i" . org-roam-insert)))
  :config
  (defun my/org-roam-rebuild-db ()
    (interactive)
    (org-roam-db--clear)
    (org-roam-db-build-cache))
  ;; (require 'org-ref)
  :init
  (setq org-roam-v2-ack t)
  (org-roam-db-autosync-mode))

(use-package zig-mode
  :hook (zig-mode . (lambda ()
                      (require 'lsp-zig)
                      (setq lsp-zig-zls-executable "/opt/zls-0.1.0/zls"))))

(provide 'personal)

;;; personal.el ends here
