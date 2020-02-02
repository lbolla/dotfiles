;;; package --- lbolla defuns.el file
;;; Commentary:
;;; 7 November 2016

;;; Code:
;;; TODO replace evil-* and other non-Emacs functions with Emacs ones
;;; TODO rename file to "my.el"

(defun my/split-window-below-and-switch-buffer ()
  "Split window below and select a buffer."
  (interactive)
  (split-window-below)
  (windmove-down)
  (ivy-switch-buffer))

(defun my/split-window-right-and-switch-buffer ()
  "Split window right and select a buffer."
  (interactive)
  (split-window-right)
  (windmove-right)
  (ivy-switch-buffer))

(defun my/find-file-linkz ()
  "Visit file Linkz."
  (interactive)
  (find-file "~/Private/org/org-linkz/Linkz.org"))

(defun my/find-file-pkgs ()
  "Visit file pkgs.el."
  (interactive)
  (find-file "~/.emacs.d/pkgs.el"))

(defun my/find-file-init ()
  "Visit file init.el."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun my/elpy-test-at-point (top file module test)
  "Find Python test at point."
  (interactive (elpy-test-at-point))
  (cond
   (test
    (let ((test-list (split-string test "\\.")))
      (message (kill-new
                (mapconcat #'identity
                           (cons file test-list)
                           "::")))))
   (file
    (message (kill-new file)))
   (t
    (message "No test"))))

(defun cython-show-annotated ()
  "Show annotated cython code."
  (interactive)
  (shell-command (concat "cython -a " (buffer-file-name)))
  (browse-url (concat "file://" (replace-regexp-in-string "\.pyx$" ".html" (buffer-file-name)))))

(defun electric-indent-ignore-python (char)
  "Ignore electric indentation for 'python-mode' after CHAR."
  (if (equal major-mode 'python-mode)
      `no-indent'
    nil))

(defun erlang-typer ()
  "Run `typer` on current buffer."
  (interactive)
  (save-buffer)
  (let ((outbuf (get-buffer-create "*Typer*")))
    (shell-command (concat "typer " (buffer-file-name)) outbuf)
    (with-current-buffer outbuf
      (setq buffer-read-only t)
      (display-buffer outbuf))))

(defun eww-at-point ()
  "Run eww on thing at poing."
  (interactive)
  (eww (thing-at-point 'word)))

(defun eww-region (start end)
  "Run eww on region from START to END."
  (interactive "r")
  (eww (buffer-substring start end)))

(defun js-insert-breakpoint ()
  "Insert JS Chrome breakpoint above point."
  (interactive)
  (evil-open-above 1)
  (insert "debugger;  // TODO")
  (evil-normal-state))

(defun js-fix-style ()
  "Call `fixjsstyle` on current buffer."
  (interactive)
  (save-buffer)
  (let ((outbuf (get-buffer-create "*FixJSStyle output*")))
    (shell-command (concat "fixjsstyle " (buffer-name)) outbuf)
    (with-current-buffer outbuf
      (setq buffer-read-only t)
      (unless (= 0 (buffer-size outbuf))
        (display-buffer outbuf))))
  (revert-buffer :ignore-auto :noconfirm))

(defun js-clang-format ()
  "Call `clang-format` on current buffer."
  (interactive)
  (save-buffer)
  (shell-command (concat "clang-format-3.9 -i " (buffer-name)))
  (revert-buffer :ignore-auto :noconfirm))

(defun js-beautify ()
  "Call `uglifyjs` on current buffer to make it prettier."
  (interactive)
  (save-excursion
    (shell-command-on-region (point-min) (point-max) "uglifyjs -b --comments=all -q 1" (current-buffer) t)))

(defun markdown-help ()
  "Browse to markdown help."
  (interactive)
  (browse-url "https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet"))

(defcustom my/mu4e-get-mail-command "offlineimap"
  "Shell command to run to retrieve email manually." :group 'Mu4e)

(defcustom my/lesser-evil nil
  "Only load minimal evil configuration." :group 'local)

(defun my/mu4e-refresh-headers (args)
  "Refresh headers calling 'my/mu4e-get-mail-command' if ARGS."
  (interactive "P")
  (let ((mu4e-get-mail-command (if args my/mu4e-get-mail-command "true")))
    (mu4e-update-mail-and-index nil))
  (mu4e-headers-rerun-search))

(defun my/org-agenda-skip-scheduled ()
  "Sckip org trees that are not scheduled."
  (org-agenda-skip-entry-if 'scheduled 'deadline))

(defun my/org-agenda-skip-non-archivable ()
  "Skip org trees that are not available for archiving."
  (save-restriction
    (widen)
    ;; Consider only tasks with done todo headings as archivable candidates
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max))))
          (subtree-end (save-excursion (org-end-of-subtree t))))
      ;; (message "Headline %s -- %s %s in? %s %s" (thing-at-point 'line t) next-headline (org-get-todo-state) org-done-keywords org-todo-keywords-1)
      (if (member (org-get-todo-state) org-todo-keywords-1)
          (if (member (org-get-todo-state) org-done-keywords)
              (let* ((daynr (string-to-number (format-time-string "%d" (current-time))))
                     (a-month-ago (* 60 60 24 (+ daynr 1)))
                     (last-month (format-time-string "%Y-%m-" (time-subtract (current-time) (seconds-to-time a-month-ago))))
                     (this-month (format-time-string "%Y-%m-" (current-time)))
                     (subtree-is-current (save-excursion
                                           (forward-line 1)
                                           (and (< (point) subtree-end)
                                                (re-search-forward (concat last-month "\\|" this-month) subtree-end t)))))
                ;; (message "  current: %s" subtree-is-current)
                (if subtree-is-current
                    ;; Has a date in this month or last month, skip it
                    subtree-end
                  nil))  ; available to archive
            (or subtree-end (point-max)))
        next-headline))))

(defun chomp (str)
  "Chomp leading and tailing whitespace from STR."
  (replace-regexp-in-string (rx (or (: bos (* (any " \t\n")))
				    (: (* (any " \t\n")) eos)))
			    ""
			    str))

(defun read-file-in-string (fn)
  "Read FN and return its content as a string."
  (with-temp-buffer
    (insert-file-contents fn)
    (buffer-string)))

(defun cycle (lst)
  "Cycle elements of LST."
  (let ((item (pop lst)))
    (append lst `(,item))))

(defun is-theme-enabled (theme)
  "Check if THEME is enabled."
  (member theme custom-enabled-themes))

(defun set-whitespace-line-column (width)
  "Configure whitespace mode for line WIDTH."
  (interactive "p")
  (defvar whitespace-line-column)
  (whitespace-mode 0)
  (setq whitespace-line-column width)
  (whitespace-mode 1))

(defun c-indent ()
  "Run `indent` on current buffer."
  (interactive)
  (when (eq major-mode 'c-mode)
    (let ((temp-point (point)))
      ;; Use $HOME/.indent.pro to specify indent options
      (shell-command-on-region (point-min) (point-max) "indent" nil t)
      (save-buffer)
      (goto-char temp-point))))

(defcustom my-fonts '(
                      "Monoid-10"
                      ;; "Operator Mono Light-14"
                      ;; "Ubuntu Mono-12"
                      "Terminus-12"
                      "ProggyCleanTT-12"
                      ;; "IBM 3270 Narrow-14"
                      "Input-12"
                      "DejaVu Sans Mono-12"
                      "Iosevka-12"
                      ) "List of fonts I like." :group 'local :type 'list)

(defun choose-font ()
  "Choose a font."
  (interactive)
  (set-frame-font (ido-completing-read "Font: " my-fonts)))

(defun cppref-search ()
  "Search word at point in cppreference.com."
  (interactive)
  (let (
        (cppurl "http://en.cppreference.com/mwiki/index.php?search=")
        (term (thing-at-point 'filename)))
    (browse-url (concat cppurl term))))

(defun man-at-point ()
  "Call `man` on the current word."
  (interactive)
  (woman (thing-at-point 'word)))

(defun github-issue-url (tag)
  "Generate a GitHub issue url for TAG."
  (let* ((tokens (reverse (split-string tag "#")))
         (issue (car tokens))
         (repo (mapconcat 'identity (reverse (cdr tokens)) "/")))
    (format "https://github.com/%s/issues/%s" repo (url-hexify-string issue))))

(defun python-insert-breakpoint (ipdb)
  "Insert Python PDB or IPDB breakpoint above point."
  (interactive "P")
  (let ((mod (if ipdb "ipdb" "pdb")))
    (evil-open-above 1)
    (insert (format "import %s; %s.set_trace()  # BREAKPOINT" mod mod))
    (evil-normal-state)))

(defun python-insert-breakpoint-celery()
  "Insert Celery breakpoint above point."
  (interactive)
  (evil-open-above 1)
  (insert "from celery.contrib import rdb; rdb.set_trace()  # BREAKPOINT")
  (evil-normal-state))

(defun python-insert-pylint-ignore (eol)
  "Insert pylint disable comment, possibly on EOL."
  (interactive "P")
  (if eol
      (progn
        (end-of-line)
        (insert "  # pylint: disable="))
    (progn
      (evil-open-above 1)
      (insert "# pylint: disable=")))
  (evil-insert-state))

(defun python-insert-type-annotation (eol)
  "Insert type annotation possibly at EOL."
  (interactive "P")
  (if eol
      (progn
        (end-of-line)
        (insert "  # type: ")
        (evil-insert-state))
    (progn
      (evil-open-below 1)
      (insert "# type: ")
      (evil-insert-state))))

(defun python--run-in-new-buffer (cmd args bufname)
  "Run CMD + ARGS and output to BUFNAME."
  (let ((outbuf (get-buffer-create bufname))
        (what (or (buffer-file-name) default-directory)))
    (shell-command (concat cmd " " args " " what) outbuf)
    (with-current-buffer outbuf
      (diff-mode)
      (setq buffer-read-only t)
      (unless (= 0 (buffer-size outbuf))
        (display-buffer outbuf)))))

(defun python-2to3 (inplace)
  "Run 2to3 on current buffer or directory, possibly INPLACE."
  (interactive "P")
  (python--run-in-new-buffer "2to3" (if inplace "-nw " "") "*2to3*"))

(defun python-modernize (inplace)
  "Run modernize on current buffer or directory, possibly INPLACE."
  (interactive "P")
  (python--run-in-new-buffer "python-modernize" (if inplace "-nw " "") "*modernize*"))

(defun python-indent-jaraco ()
  "Set jaraco-style indentation."
  (interactive)
  (python-indent-guess-indent-offset)
  (setq indent-tabs-mode t))

;; TODO use elpy yapf instead
(defun python-pyformat-buffer ()
  "Run pyformat on current buffer."
  (interactive)
  (shell-command (concat "pyformat --in-place " (buffer-name)))
  (revert-buffer :noconfirm t))

(defun venv-get-proj-dir ()
  "While in a venv, return the project directory or nil."
  (let ((fn (concat (file-name-as-directory (getenv "VIRTUAL_ENV")) ".project")))
    (when (file-exists-p fn)
      (chomp (read-file-in-string fn)))))

(defun venv-workon-and-cdproject (venv)
  "Activate VENV and cd to it."
  (interactive
   (list
    (completing-read "Work on: " (progn (elpy-enable) (pyvenv-virtualenv-list))
                     nil t nil 'pyvenv-workon-history nil nil)))
  (pyvenv-workon venv)
  (elpy-rpc-restart)
  (let ((dir (venv-get-proj-dir)))
    (when (not (string-equal (getenv "HOME") dir))
      (delete-other-windows)
      (dired dir)
      (when (functionp 'eyebrowse-rename-window-config)
        (eyebrowse-rename-window-config (eyebrowse--get 'current-slot) venv))
      (projectile-switch-project-by-name dir)
      (projectile-vc dir)
      (other-window 1))))

(defun lbolla.info/org-publish-sitemap-format-entry (entry style project)
  "Format ENTRY for sitemap STYLE for PROJECT lbolla.info."
  (cond ((not (directory-name-p entry))
         (let ((date (org-publish-find-property entry :date project)))
           (if date
             (format "<%s> [[file:%s][%s]]"
                     (format-time-string "%Y-%m-%d" (org-publish-find-date entry project))
                     entry
                     (org-publish-find-title entry project))
             ;; Don't show if no date is set
             "")))
        ((eq style 'tree)
         ;; Return only last subdir.
         (file-name-nondirectory (directory-file-name entry)))
        (t entry)))

(defun lbolla.info/org-publish-sitemap-function (title list)
  "Default site map, as a string.
TITLE is the the title of the site map.  LIST is an internal
representation for the files to include, as returned by
`org-list-to-lisp'.  PROJECT is the current project."
  (let* ((hd (car list))
         (tl (seq-remove (lambda (x) (equal x '(""))) (cdr list)))
         (new-list (cons hd tl)))
    (concat "#+TITLE: " title "\n\n"
            (org-list-to-org new-list))))

(defun lbolla.info/html-preamble (info)
  "Return a preamble given a plist INFO."
  (let* ((spec (org-html-format-spec info))
         (date (cdr (assq ?d spec)))
         (author (cdr (assq ?a spec))))
    (when (and date (> (length date) 0))
      (format "<span class=\"timestamp\"><%s></span> by <em>%s</em>" (format-time-string "%Y-%m-%d" (org-time-string-to-time date)) author))))

(defun my/mu4e-headers-narrow-subject (q)
  "Narrow m4e search by subject Q."
  (let ((query (concat "s:/" q "/")))
    (message query)
    (mu4e-headers-search-narrow query)))

(defun my/mu4e-headers-narrow-thing-at-point ()
  "Narrow mu4e search querying for thing at point."
  (interactive)
  (let ((q (thing-at-point 'filename)))
    (my/mu4e-headers-narrow-subject q)))

(defun my/mu4e-headers-narrow ()
  "Narrow mu4e search querying for ticket."
  (interactive)
  (beginning-of-line)
  (cond
   ((or (search-forward-regexp (rx (or "FogBugz" "Manuscript") " (" (one-or-more letter) " " (one-or-more digit)) (point-at-eol) t)
        (search-forward-regexp (rx "JIRA:  Updates for " (>= 3 upper-case) "-" (one-or-more digit)) (point-at-eol) t)
        (search-forward-regexp (rx (>= 3 upper-case) "-" (one-or-more digit)) (point-at-eol) t)
        (search-forward-regexp (rx (or "#" "!") (one-or-more digit)) (point-at-eol) t)
        (search-forward-regexp (rx (or "Context" "weighting" "Template")) (point-at-eol) t))
    (my/mu4e-headers-narrow-thing-at-point))
   ((search-forward-regexp (rx "Bix2 " (one-or-more letter) " Error") (point-at-eol) t)
    (my/mu4e-headers-narrow-subject (match-string 0)))))

(defun my/true-color-p ()
  "Return non-nil on displays that support 256 colors."
  (or
   (display-graphic-p)
   (= (tty-display-color-cells) 16777216)))

(defun my/open-line-above ()
  "Insert an empty line above the current line.
Position the cursor at it's beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

(defun my/open-line ()
  "Insert an empty line after the current line.
Position the cursor at its beginning, according to the current mode."
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

;; ;; From https://github.com/jethrokuan/.emacs.d/blob/master/init.el
;; (defun my/org-process-inbox ()
;;   "Called in org-agenda-mode, processes all inbox items."
;;   (interactive)
;;   (org-agenda-bulk-mark-regexp "inbox:")
;;   (my/bulk-process-entries))

;; (defun my/bulk-process-entries ()
;;   "Bulk process inbox entries."
;;   (if (not (null org-agenda-bulk-marked-entries))
;;       (let ((entries (reverse org-agenda-bulk-marked-entries))
;;             (processed 0)
;;             (skipped 0))
;;         (dolist (e entries)
;;           (let ((pos (text-property-any (point-min) (point-max) 'org-hd-marker e)))
;;             (if (not pos)
;;                 (progn (message "Skipping removed entry at %s" e)
;;                        (cl-incf skipped))
;;               (goto-char pos)
;;               (let (org-loop-over-headlines-in-active-region) (funcall 'my/org-agenda-process-inbox-item))
;;               ;; `post-command-hook' is not run yet.  We make sure any
;;               ;; pending log note is processed.
;;               (when (or (memq 'org-add-log-note (default-value 'post-command-hook))
;;                         (memq 'org-add-log-note post-command-hook))
;;                 (org-add-log-note))
;;               (cl-incf processed))))
;;         (org-agenda-redo)
;;         (unless org-agenda-persistent-marks (org-agenda-bulk-unmark-all))
;;         (message "Acted on %d entries%s%s"
;;                  processed
;;                  (if (= skipped 0)
;;                      ""
;;                    (format ", skipped %d (disappeared before their turn)"
;;                            skipped))
;;                  (if (not org-agenda-persistent-marks) "" " (kept marked)")))))

;; (defun my/org-agenda-process-inbox-item ()
;;   "Process a single item in the org-agenda."
;;   (interactive)
;;   (org-with-wide-buffer
;;    (org-agenda-set-tags)
;;    (org-agenda-priority)
;;    (call-interactively 'my/org-agenda-set-effort)
;;    (org-agenda-refile nil nil t)))

;; (defcustom my/org-current-effort "1:00" "Current effort for agenda items." :group 'local :type 'list)

;; (defun my/org-agenda-set-effort (effort)
;;   "Set the effort property for the current headline."
;;   (interactive
;;    (list (read-string (format "Effort [%s]: " my/org-current-effort) nil nil my/org-current-effort)))
;;   (setq my/org-current-effort effort)
;;   (org-agenda-check-no-diary)
;;   (let* ((hdmarker (or (org-get-at-bol 'org-hd-marker)
;;                        (org-agenda-error)))
;;          (buffer (marker-buffer hdmarker))
;;          (pos (marker-position hdmarker))
;;          (inhibit-read-only t)
;;          newhead)
;;     (org-with-remote-undo buffer
;;       (with-current-buffer buffer
;;         (widen)
;;         (goto-char pos)
;;         (org-show-context 'agenda)
;;         (funcall-interactively 'org-set-effort nil my/org-current-effort)
;;         (end-of-line 1)
;;         (setq newhead (org-get-heading)))
;;       (org-agenda-change-all-lines newhead hdmarker))))

;; From https://www.emacswiki.org/emacs/RecreateScratchBuffer
(defun create-scratch-buffer ()
  "Create a scratch buffer."
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (insert initial-scratch-message)
  (lisp-interaction-mode))

;; From https://www.emacswiki.org/emacs/RecreateScratchBuffer
(defun unkillable-scratch-buffer ()
  "Clear instead of delete scratch buffer."
  (if (equal (buffer-name (current-buffer)) "*scratch*")
      (progn
        (delete-region (point-min) (point-max))
        nil)
    t))

(add-hook 'kill-buffer-query-functions 'unkillable-scratch-buffer)

(provide 'defuns)
;;; defuns.el ends here
