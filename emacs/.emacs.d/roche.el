;;; package --- Roche public stuff
;;; Commentary:
;;; 17 Dec 2020

;;; Code:

(require 'private-roche "~/Private/emacs/private-roche.el")

(append-to-path '("/home/users/bollal/.nvm/versions/node/v10.19.0/bin"))

(defvar org-agenda-files)
(defvar org-link-abbrev-alist)

(use-package dpkg-dev-el)

(use-package forge
  :after magit
  :config
  (add-to-list 'forge-alist '("ssh.code.roche.com" "code.roche.com/api/v4" "code.roche.com" forge-gitlab-repository)))

(use-package go-mode)

(use-package groovy-mode)

(use-package ivy-virtualbox
  :load-path "~/src/github.com/lbolla/ivy-virtualbox/"
  :bind
  ("C-c v v" . ivy-virtualbox))

(add-to-list 'org-mode-hook (lambda ()
                              (add-to-list 'org-link-abbrev-alist '("GL" . roche-gitlab-object-url))
                              (add-to-list 'org-link-abbrev-alist '("BB" . roche-bitbucket-object-url))
                              (add-to-list 'org-agenda-files "~/org/roche.org")))

(use-package mu4e
  :load-path "/usr/local/share/emacs/site-lisp/mu4e/"
  :ensure nil  ;; installed system-wide
  ;; :demand t

  :defines
  mu4e-view-actions
  roche-smtp-user

  :functions
  my/mu4e-headers-narrow-thing-at-point
  my/mu4e-refresh-headers

  :bind (("C-c m m" . mu4e)
         ("C-c m n" . mu4e-compose-new)
         :map mu4e-main-mode-map
         ("C-c C-u" . my/mu4e-refresh-headers)
         :map mu4e-headers-mode-map
         ("C-c /" . my/mu4e-headers-narrow)
         ("C-c C-u" . my/mu4e-refresh-headers)
         ("<backspace>" . mu4e-headers-query-prev))

  :custom
  (user-mail-address roche-smtp-user)
  (user-full-name  "Lorenzo Bolla")
  (mu4e-drafts-folder "/Roche/[Gmail]/Drafts")
  (mu4e-sent-folder "/Roche/[Gmail]/Sent Mail")
  (mu4e-sent-messages-behavior 'delete)
  (mu4e-trash-folder "/Roche/[Gmail]/Trash")
  (mu4e-change-filenames-when-moving t)
  (mu4e-maildir-shortcuts '((:maildir "/Roche/Inbox"             :key ?i)
                            (:maildir "/Roche/Gitlab"            :key ?g)
                            (:maildir "/Roche/Bitbucket"         :key ?b)
                            (:maildir "/Roche/[Gmail]/Sent Mail" :key ?s)
                            (:maildir "/Roche/[Gmail]/All Mail"  :key ?a)
                            (:maildir "/Roche/[Gmail]/Trash"     :key ?t)))
  (mu4e-bookmarks '((:name "Unread"               :query "flag:unread AND NOT flag:trashed AND NOT maildir:/Roche/[Gmail]/*"                 :key ?u)
                    (:name "Unread Inbox"         :query "flag:unread AND NOT flag:trashed AND maildir:/Roche/Inbox"                         :key ?i)
                    (:name "Starred"              :query "flag:flagged"                                                                       :key ?f)
                    ;; (:name "Starred"              :query "flag:flagged AND NOT maildir:/Roche/[Gmail]/*"                                     :key ?f)
                    ;; (:name "Starred"              :query "maildir:/Roche/[Gmail]/Starred"       :key ?f)
                    ))
  ;; (mail-user-agent 'mu4e-user-agent)
  (mu4e-compose-complete-addresses t)
  (mu4e-compose-complete-only-after nil)
  (mu4e-compose-complete-only-personal nil)
  (mu4e-compose-dont-reply-to-self t)
  (mu4e-use-fancy-chars nil)
  (mu4e-get-mail-command "true")
  (mu4e-update-interval 300)
  ;; TODO
  ;; (mu4e-html2text-command "w3m -dump -cols 80 -T text/html")
  (mu4e-view-html-plaintext-ratio-heuristic 20)
  (message-kill-buffer-on-exit t)
  (mu4e-view-scroll-to-next nil)
  (mu4e-attachment-dir "/tmp")
  (mu4e-headers-skip-duplicates t)
  (mu4e-headers-date-format "%x %X")
  (mu4e-headers-fields '((:human-date . 18)
                         (:flags . 6)
                         (:mailing-list . 12)
                         (:from . 22)
                         (:subject)))
  (mu4e-mailing-list-patterns '("\\.\\([^.]+\\)\\.[^.]+\\.code\\.roche\\.com"
                                "\\.\\([^.]+\\)\\.code\\.roche\\.com"
                                "\\.\\([^.]+\\)\\.roche\\.com"))
  (mu4e-headers-include-related nil)
  ;; (mu4e-headers-results-limit 500)
  (mu4e-view-actions '(("capture message" . mu4e-action-capture-message)
                       ("view as pdf" . mu4e-action-view-as-pdf)
                       ("show this thread" . mu4e-action-show-thread)
                       ("browse" . mu4e-action-view-in-browser)))
  (mu4e-view-show-addresses t)
  (mu4e-view-show-images nil)
  (mu4e-view-use-gnus nil))

(use-package protobuf-mode)

(use-package smtpmail
  :demand t
  :defines
  roche-smtp-server
  roche-smtp-port
  roche-smtp-user
  :custom
  (send-mail-function 'smtpmail-send-it)
  (smtpmail-smtp-server roche-smtp-server)
  (smtpmail-smtp-service roche-smtp-port)
  (smtpmail-mail-address roche-smtp-user)
  (smtpmail-stream-type 'starttls))

(use-package typescript-mode
  :hook
  (typescript-mode . (lambda ()
                       (require 'lsp-javascript))))

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
