;;; package --- lbolla defuns.el file
;;; Commentary:
;;; 7 November 2016

;;; Code:
;;; Keep these sexp sorted with (sort-paragraphs)

(use-package dash)

(defcustom my/fonts '(
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

(defcustom my/lesser-evil t
  "Only load minimal evil configuration." :group 'local :type 'boolean)

(defcustom my/mu4e-get-mail-command "mbsync -a"
  "Shell command to run to retrieve email manually." :group 'Mu4e :type 'string)

(defcustom my/zettelkasten-directory "~/Private/org/zettelkasten"
  "Direcory of my Zettelkasten" :group 'local :type 'string)

(defmacro my/maybe-with-evil (&rest body)
  "Execute BODY only if evil-mode is defined."
  `(when (boundp 'evil-mode-hook)
     (add-hook 'evil-mode-hook (lambda () ,@body))))

(defun lbolla.info/html-preamble (info)
  "Return a preamble given a plist INFO."
  (let* ((spec (org-html-format-spec info))
         (date (cdr (assq ?d spec)))
         (author (cdr (assq ?a spec))))
    (when (and date (> (length date) 0))
      (format "<span class=\"timestamp\"><%s></span> by <em>%s</em>" (format-time-string "%Y-%m-%d" (org-time-string-to-time date)) author))))

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

(defun my/append-to-path (paths)
  "Add PATHS to execution paths."
  (let ((epaths (mapcar #'expand-file-name paths)))
    (setq exec-path (append epaths exec-path))
    (setenv "PATH"
            (concat
             (mapconcat 'identity epaths ":") ":"
             (getenv "PATH")))))

(defun my/c-indent ()
  "Run `indent` on current buffer."
  ;; Use $HOME/.indent.pro to specify indent options
  (interactive)
  (when (eq major-mode 'c-mode)
    (let ((temp-point (point)))
      (shell-command-on-region (point-min) (point-max) "indent" nil t)
      (save-buffer)
      (goto-char temp-point))))

(defun my/chomp (str)
  "Chomp leading and tailing whitespace from STR."
  (replace-regexp-in-string (rx (or (: bos (* (any " \t\n")))
				    (: (* (any " \t\n")) eos)))
			    ""
			    str))

(defun my/choose-font ()
  "Choose a font."
  (interactive)
  (set-frame-font (ido-completing-read "Font: " my/fonts)))

(defun my/clang-format-keybindings ()
    (let ((mode-map (symbol-value (intern (concat (symbol-name major-mode) "-map")))))
      (my/maybe-with-evil
       (evil-define-key 'visual mode-map (kbd "=") 'clang-format-region))
      (define-key mode-map (kbd "C-c c f") 'clang-format-buffer)))

(defun my/cppref-search ()
  "Search word at point in cppreference.com."
  (interactive)
  (let (
        (cppurl "http://en.cppreference.com/mwiki/index.php?search=")
        (term (thing-at-point 'filename)))
    (browse-url (concat cppurl term))))

(defun my/cycle (lst)
  "Cycle elements of LST."
  (let ((item (pop lst)))
    (append lst `(,item))))

(defun my/cython-show-annotated ()
  "Show annotated cython code."
  (interactive)
  (shell-command (concat "cython -a " (buffer-file-name)))
  (browse-url (concat "file://" (replace-regexp-in-string "\.pyx$" ".html" (buffer-file-name)))))

(defun my/electric-indent-ignore-python (char)
  "Ignore electric indentation for 'python-mode' after CHAR."
  (if (equal major-mode 'python-mode)
      `no-indent'
    nil))

(defun my/erlang-typer ()
  "Run `typer` on current buffer."
  (interactive)
  (save-buffer)
  (let ((outbuf (get-buffer-create "*Typer*")))
    (shell-command (concat "typer " (buffer-file-name)) outbuf)
    (with-current-buffer outbuf
      (setq buffer-read-only t)
      (display-buffer outbuf))))

(defun my/eww-at-point ()
  "Run eww on thing at poing."
  (interactive)
  (eww (thing-at-point 'word)))

(defun my/eww-region (start end)
  "Run eww on region from START to END."
  (interactive "r")
  (eww (buffer-substring start end)))

(defun my/github-git-clone (what)
  "Clone GitHub repo WHAT where it belongs."
  (interactive "sRepo: ")
  (let ((repo (concat "git@github.com:" what ".git"))
        (outdir (concat "~/src/github.com/" what)))
    (magit-clone-regular repo outdir nil)))

(defun my/github-git-clone-https (what)
  "Clone GitHub repo WHAT where it belongs (using HTTPS)."
  (interactive "sRepo: ")
  (let ((repo (concat "https://github.com/" what ".git"))
        (outdir (concat "~/src/github.com/" what)))
    (magit-clone-regular repo outdir nil)))

(defun my/github-object-url (tag)
  "Generate a GitHub OBJECT url for TAG."
  (let ((base-url "https://github.com/")
        (issue-re (rx (group (one-or-more (not (any "#")))) "#" (group (one-or-more digit))))
        (pr-re (rx (group (one-or-more (not (any "!")))) "!" (group (one-or-more digit)))))
  (cond
   ((string-match issue-re tag)
    (concat base-url (match-string 1 tag) "/issues/" (match-string 2 tag)))
   ((string-match pr-re tag)
    (concat base-url (match-string 1 tag) "/pull/" (match-string 2 tag))))))

(defun my/gitlab-object-url (base-url tag)
  "Generate a GitLab BASE-URL OBJECT url for TAG."
  (let ((issue-re (rx (group (one-or-more (not (any "#")))) "#" (group (one-or-more digit))))
        (mr-re (rx (group (one-or-more (not (any "!")))) "!" (group (one-or-more digit))))
        (snippet-re (rx "$" (group (one-or-more digit)))))
  (cond
   ((string-match issue-re tag)
    (concat base-url (match-string 1 tag) "/issues/" (match-string 2 tag)))
   ((string-match mr-re tag)
    (concat base-url (match-string 1 tag) "/merge_requests/" (match-string 2 tag)))
   ((string-match snippet-re tag)
    (concat base-url "/-/snippets/" (match-string 1 tag))))))

(defun my/is-theme-enabled (theme)
  "Check if THEME is enabled."
  (member theme custom-enabled-themes))

(defun my/js-beautify ()
  "Call `uglifyjs` on current buffer to make it prettier."
  (interactive)
  (save-excursion
    (shell-command-on-region (point-min) (point-max) "uglifyjs -b --comments=all -q 1" (current-buffer) t)))

(defun my/js-clang-format ()
  "Call `clang-format` on current buffer."
  (interactive)
  (save-buffer)
  (shell-command (concat "clang-format-3.9 -i " (buffer-name)))
  (revert-buffer :ignore-auto :noconfirm))

(defun my/js-fix-style ()
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

(defun my/js-insert-breakpoint ()
  "Insert JS Chrome breakpoint above point."
  (interactive)
  (my/open-line-above)
  (insert "debugger;  // TODO"))

(defun my/lsp-find-definition-other-window ()
  "Find definiton in other window."
  (interactive)
  (lsp-find-definition :display-action 'window)) ; or nil or 'frame

(defun my/lsp-python-ms-version ()
  (interactive)
  (let* ((fname (concat lsp-python-ms-dir "Python-Language-Server-linux-x64.nuspec"))
         (msg (substring (string-trim (shell-command-to-string (concat "grep '<version>' " fname))) 9 -10)))
    (message (concat "Installed: " msg " - Available: " (lsp-python-ms-latest-nupkg-url)))))

(defun my/man-at-point ()
  "Call `man` on the current word."
  (interactive)
  (woman (thing-at-point 'word)))

(defun my/markdown-help ()
  "Browse to markdown help."
  (interactive)
  (browse-url "https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet"))

(defun my/mu4e-headers-narrow ()
  "Narrow mu4e search querying for ticket."
  (interactive)
  (beginning-of-line)
  (cond
   ((or (search-forward-regexp (rx (or "FogBugz" "Manuscript") " (" (one-or-more letter) " " (one-or-more digit)) (point-at-eol) t)
        (search-forward-regexp (rx "JIRA:  Updates for " (>= 3 upper-case) "-" (one-or-more digit)) (point-at-eol) t)
        (search-forward-regexp (rx (>= 3 upper-case) "-" (one-or-more digit)) (point-at-eol) t)
        (search-forward-regexp (rx (or "#" "!") (one-or-more digit)) (point-at-eol) t)
        (search-forward-regexp (rx (or "Context" "weighting" "Template" "confluence")) (point-at-eol) t))
    (my/mu4e-headers-narrow-thing-at-point))
   ((search-forward-regexp (rx "Bix2 " (one-or-more letter) " Error") (point-at-eol) t)
    (my/mu4e-headers-narrow-subject (match-string 0)))))

(defun my/mu4e-headers-narrow-subject (q)
  "Narrow m4e search by subject Q in current message's maildir."
  (let* ((msg (mu4e-message-at-point))
         (maildir (mu4e-message-field msg :maildir))
         (query (concat "maildir:\"" maildir "\" AND s:/" q "/")))
    (message query)
    (mu4e-headers-search-narrow (list query))))

(defun my/mu4e-headers-narrow-thing-at-point ()
  "Narrow mu4e search querying for thing at point."
  (interactive)
  (define-thing-chars my/mu4e-search-thing "-[:alnum:]_")
  (let ((q (thing-at-point 'my/mu4e-search-thing)))
    (my/mu4e-headers-narrow-subject q)))

(defun my/mu4e-refresh-headers (args)
  "Refresh headers calling 'my/mu4e-get-mail-command' if ARGS."
  (interactive "P")
  (let ((mu4e-get-mail-command (if args my/mu4e-get-mail-command "true")))
    (mu4e-update-mail-and-index nil))
  (mu4e-headers-rerun-search))

(defun my/open-line ()
  "Insert an empty line after the current line.
Position the cursor at its beginning, according to the current mode."
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

(defun my/open-line-above ()
  "Insert an empty line above the current line.
Position the cursor at it's beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (open-line 1)
  (indent-according-to-mode))

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

(defun my/org-agenda-skip-scheduled ()
  "Skip org trees that are not scheduled."
  (org-agenda-skip-entry-if 'scheduled 'deadline))

(defun my/password-store-change (entry &optional password-length)
  "Change password for ENTRY with PASSWORD-LENGTH.

Default PASSWORD-LENGTH is `password-store-password-length'."
  (interactive (list (read-string "Password entry: ")
                     (when current-prefix-arg
                       (abs (prefix-numeric-value current-prefix-arg)))))
  (let ((pass-len (or password-length password-store-password-length)))
    (password-store--run "generate" "--in-place" entry (number-to-string password-length)))
  ;; This nil prevents the output from the above command to be displayed
  nil)

(defun my/project-short-name (&optional project-dir)
  "Return the project name in short form."
  (cond
   (project-dir (file-name-nondirectory (directory-file-name project-dir)))
   ((project-current) (file-name-nondirectory (directory-file-name (project-root (project-current)))))))

(defun my/python--run-in-new-buffer (cmd args bufname)
  "Run CMD + ARGS and output to BUFNAME."
  (let ((outbuf (get-buffer-create bufname))
        (what (or (buffer-file-name) default-directory)))
    (shell-command (concat cmd " " args " " what) outbuf)
    (with-current-buffer outbuf
      (diff-mode)
      (setq buffer-read-only t)
      (unless (= 0 (buffer-size outbuf))
        (display-buffer outbuf)))))

(defun my/python-2to3 (inplace)
  "Run 2to3 on current buffer or directory, possibly INPLACE."
  (interactive "P")
  (my/python--run-in-new-buffer "2to3" (if inplace "-nw " "") "*2to3*"))

(defun my/python-insert-breakpoint (ipdb)
  "Insert Python PDB or IPDB breakpoint above point."
  (interactive "P")
  (let ((mod (if ipdb "ipdb" "pdb")))
    (my/open-line-above)
    (insert (format "import %s; %s.set_trace()  # BREAKPOINT" mod mod))))

(defun my/python-insert-breakpoint-celery()
  "Insert Celery breakpoint above point."
  (interactive)
  (my/open-line-above)
  (insert "from celery.contrib import rdb; rdb.set_trace()  # BREAKPOINT"))

(defun my/python-insert-pylint-ignore (eol)
  "Insert pylint disable comment, possibly on EOL."
  (interactive "P")
  (if eol
      (progn
        (end-of-line)
        (insert "  # pylint: disable="))
    (progn
      (my/open-line-above)
      (insert "# pylint: disable="))))

(defun my/python-insert-type-annotation (eol)
  "Insert type annotation possibly at EOL."
  (interactive "P")
  (if eol
      (progn
        (end-of-line)
        (insert "  # type: "))
    (progn
      (my/open-line)
      (insert "# type: "))))

(defun my/python-modernize (inplace)
  "Run modernize on current buffer or directory, possibly INPLACE."
  (interactive "P")
  (my/python--run-in-new-buffer "python-modernize" (if inplace "-nw " "") "*modernize*"))

(defun my/python-pyformat-buffer ()
  "Run pyformat on current buffer."
  (interactive)
  (shell-command (concat "pyformat --in-place " (buffer-name)))
  (revert-buffer :noconfirm t))

(defun my/read-file-in-string (fn)
  "Read FN and return its content as a string."
  (with-temp-buffer
    (insert-file-contents fn)
    (buffer-string)))

(defun my/set-whitespace-line-column (width)
  "Configure whitespace mode for line WIDTH."
  (interactive "p")
  (defvar whitespace-line-column)
  (whitespace-mode 0)
  (setq whitespace-line-column width)
  (whitespace-mode 1))

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

(defun my/switch-theme (theme)
  "Disable active themes and load THEME."
  (interactive (list (intern (completing-read "Theme: "
                                              (->> (custom-available-themes)
                                                   (-map #'symbol-name))))))
  ;; (-map #'disable-theme custom-enabled-themes)
  ;; Don't disabled "use-package" theme
  (-map-when (lambda (x) (not (eq x 'use-package))) #'disable-theme custom-enabled-themes)
  (load-theme theme 'no-confirm))

;; https://emacs.stackexchange.com/questions/7409/is-there-a-generic-toggle-previous-window-function
(defun my/switch-to-last-window ()
  (interactive)
  (let ((win (get-mru-window t t t)))
    (unless win (error "Last window not found"))
    (let ((frame (window-frame win)))
      (select-frame-set-input-focus frame)
      (select-window win))))

(defun my/tab-name-from-project (&optional project-dir)
  "Name tab bar after current project."
  (tab-bar-rename-tab (my/project-short-name project-dir)))

(defun my/true-color-p ()
  "Return non-nil on displays that support 256 colors."
  (or
   (display-graphic-p)
   (= (tty-display-color-cells) 16777216)))

(defun my/venv-get-proj-dir ()
  "While in a venv, return the project directory or nil."
  (let ((fn (concat (file-name-as-directory (getenv "VIRTUAL_ENV")) ".project")))
    (when (file-exists-p fn)
      (my/chomp (my/read-file-in-string fn)))))

(defun my/workon-project-in-tab (venv)
  "Activate workon VENV in a new tab."
  (interactive
   (list
    (completing-read "Work on: "
                     (pyvenv-virtualenv-list)
                     nil t nil 'pyvenv-workon-history nil nil)))
  (tab-duplicate)
  (pyvenv-workon venv)
  (let ((dir (my/venv-get-proj-dir)))
    (when (not (string-equal (getenv "HOME") dir))
      (delete-other-windows)
      (dired dir)
      (let ((project-switch-commands 'magit-status))
        (ignore-errors
          (project-switch-project dir))))))

;; From https://endlessparentheses.com/emacs-narrow-or-widen-dwim.html
(defun my/narrow-or-widen-dwim (p)
  "Widen if buffer is narrowed, narrow-dwim otherwise.
Dwim means: region, org-src-block, org-subtree, or
defun, whichever applies first.  Narrowing to
org-src-block actually calls `org-edit-src-code'.
With prefix P, don't widen, just narrow even if buffer
is already narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (buffer-narrowed-p) (not p)) (widen))
        ((region-active-p)
         (narrow-to-region (region-beginning)
                           (region-end)))
        ((derived-mode-p 'org-mode)
         ;; `org-edit-src-code' is not a real narrowing
         ;; command. Remove this first conditional if
         ;; you don't want it.
         (cond ((ignore-errors (org-edit-src-code) t)
                (delete-other-windows))
               ((ignore-errors (org-narrow-to-block) t))
               (t (org-narrow-to-subtree))))
        ((derived-mode-p 'latex-mode)
         (LaTeX-narrow-to-environment))
        (t (narrow-to-defun))))

;; From https://www.emacswiki.org/emacs/RecreateScratchBuffer
(defun my/create-scratch-buffer ()
  "Create a scratch buffer."
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (insert initial-scratch-message)
  (lisp-interaction-mode))

;; https://www.emacswiki.org/emacs/KillingAndYanking
(defun my/unix-werase-or-kill (arg)
  "Kill region or backward word."
  (interactive "*p")
  (if (and transient-mark-mode
           mark-active)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word arg)))

;; From https://www.emacswiki.org/emacs/RecreateScratchBuffer
(defun my/unkillable-scratch-buffer ()
  "Clear instead of delete scratch buffer."
  (if (equal (buffer-name (current-buffer)) "*scratch*")
      (progn
        (delete-region (point-min) (point-max))
        nil)
    t))

(provide 'init-defuns)
;;; init-defuns.el ends here
