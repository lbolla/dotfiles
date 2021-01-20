;;; package --- Roche public stuff
;;; Commentary:
;;; 17 Dec 2020

;;; Code:

(defvar org-agenda-files)
(defvar org-link-abbrev-alist)

(use-package dpkg-dev-el)
(use-package go-mode)
(use-package typescript-mode
  ;; :custom
  ;; (typescript-indent-level 2)
  )

(use-package ivy-virtualbox
  :load-path "~/src/github.com/lbolla/ivy-virtualbox/"
  :bind
  ("C-c v v" . ivy-virtualbox))

(add-to-list 'org-mode-hook (lambda ()
                              (add-to-list 'org-link-abbrev-alist '("GL" . roche-gitlab-object-url))
                              (add-to-list 'org-link-abbrev-alist '("BB" . roche-bitbucket-object-url))
                              (add-to-list 'org-agenda-files "~/org/roche.org")))

(defun roche-gitlab-object-url (tag)
  "Generate a Roche GitLab OBJECT url for TAG."
  (gitlab-object-url "https://code.roche.com/" tag))

(defun roche-bitbucket--build-url (tag what)
  "Build a url for a given TAG and WHAT."
  (let ((base-url "https://bitbucket.roche.com"))
    (concat base-url
            "/stash/"
            (if (= 0 (length (match-string 1 tag))) "projects" "users")
            "/"
            (match-string 2 tag)
            "/repos/"
            (match-string 3 tag)
            "/"
            what
            "/"
            (match-string 4 tag))))

(defun roche-bitbucket-object-url (tag)
  "Generate a BitBucket OBJECT url for TAG."
  (let ((base-url "https://bitbucket.roche.com")
        (issue-re (rx
                   (group (zero-or-one "~"))
                   (group (one-or-more (not (any "/#")))) ;; user/project
                   "/"
                   (group (one-or-more (not (any "!")))) ;; repo
                   "#"
                   (group (one-or-more digit))))
        (mr-re (rx
                (group (one-or-more (not (any "/!")))) ;; user/project
                "/"
                (group (one-or-more (not (any "!")))) ;; repo
                "!"
                (group (one-or-more digit)))))
  (cond
   ((string-match issue-re tag)
    (roche-bitbucket--build-url tag "issue"))
   ((string-match mr-re tag)
    (roche-bitbucket--build-url tag "pull-requests")))))

(provide 'roche)

;;; roche.el ends here
