;;; package --- Roche public stuff
;;; Commentary:
;;; 17 Dec 2020

;;; Code:

(defvar org-agenda-files)
(defvar org-link-abbrev-alist)

(use-package dpkg-dev-el)
(use-package go-mode)
(use-package groovy-mode)
(use-package protobuf-mode)
(use-package typescript-mode)

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
  (let ((issue-re (rx
                   (group (zero-or-one "~"))
                   (group (one-or-more (not (any "/#")))) ;; user/project
                   "/"
                   (group (one-or-more (not (any "#")))) ;; repo
                   "#"
                   (group (one-or-more digit))))
        (mr-re (rx
                (group (zero-or-one "~"))
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

(defun roche-tfs-object-url (tag)
  "Generate a Tfs OBJECT url for TAG."
  (let ((base-url "https://tfsprod.emea.roche.com")
        (issue-re (rx
                   (group (one-or-more (not (any "#")))) ;; user/project
                   "/"
                   (group (one-or-more (not (any "#")))) ;; repo
                   "#"
                   (group (one-or-more digit))))
        (mr-re (rx
                (group (one-or-more (not (any "!")))) ;; user/project
                "/"
                (group (one-or-more (not (any "!")))) ;; repo
                "!"
                (group (one-or-more digit)))))
  (cond
   ((string-match issue-re tag)
    (concat base-url
            "/tfs/"
            (match-string 1 tag)
            "/"
            (match-string 2 tag)
            "/_workitems/edit/"
            (match-string 3 tag)))
   ((string-match mr-re tag)
    (concat base-url
            "/tfs/"
            (match-string 1 tag)
            "/_git/"
            (match-string 2 tag)
            "/pullrequest/"
            (match-string 3 tag))))))

(defun roche-bitbucket-git-clone (what)
  "Clone BitBucket repo WHAT where it belongs."
  (interactive "sRepo: ")
  (let ((repo (concat "ssh://git@bitbucket.roche.com:7999/" what ".git"))
        (outdir (concat "~/src/bitbucket.roche.com/" what)))
    (magit-clone-regular repo outdir nil)))

(defun roche-gitlab-git-clone (what)
  "Clone GitLab repo WHAT where it belongs."
  (interactive "sRepo: ")
  (let ((repo (concat "git@ssh.code.roche.com:" what ".git"))
        (outdir (concat "~/src/code.roche.com/" what)))
    (magit-clone-regular repo outdir nil)))

(provide 'roche)

;;; roche.el ends here
