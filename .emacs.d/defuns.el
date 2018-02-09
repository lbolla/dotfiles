;;; package --- lbolla defuns.el file
;;; Commentary:
;;; 7 November 2016

;;; Code:

(defun split-window-below-and-switch-buffer ()
  "Split window below and select a buffer."
  (interactive)
  (split-window-below)
  (windmove-down)
  (ivy-switch-buffer))

(defun split-window-right-and-switch-buffer ()
  "Split window right and select a buffer."
  (interactive)
  (split-window-right)
  (windmove-right)
  (ivy-switch-buffer))

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

(defun mu4e-refresh-headers (args)
  "Refresh headers calling 'offlineimap' if prefix is used and in ARGS."
  (interactive "P")
  (let ((mu4e-get-mail-command (if args "offlineimap" "true")))
    (mu4e-update-mail-and-index nil))
  (mu4e-headers-rerun-search))

(defun bh/skip-non-archivable-tasks ()
  "Skip org trees that are not available for archiving."
  (save-restriction
    (widen)
    ;; Consider only tasks with done todo headings as archivable candidates
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max))))
          (subtree-end (save-excursion (org-end-of-subtree t))))
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
                (if subtree-is-current
                    subtree-end ; Has a date in this month or last month, skip it
                  nil))  ; available to archive
            (or subtree-end (point-max)))
        next-headline))))

(defun my-log (msg)
  "Log a timestamped MSG."
  (message (concat (number-to-string (float-time)) " " msg)))

(defun insert-x-primary-selection ()
  "Insert selection from X primary clipboard."
  (interactive)
  (insert (gui-get-primary-selection)))

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

(defun my-beep ()
  "Play an alert sound."
  (let ((alert "/usr/share/sounds/gnome/default/alerts/glass.ogg"))
    (start-process "beep" nil "mplayer" (expand-file-name alert))))

(defun cycle (lst)
  "Cycle elements of LST."
  (let ((item (pop lst)))
    (append lst `(,item))))

(defun is-theme-enabled (theme)
  "Check if THEME is enabled."
  (member theme custom-enabled-themes))

(defmacro timeit (what &rest body)
  "Time WHAT and run BODY and report real time taken to do so."
  `(let ((start-time (float-time)))
     (progn ,@body)
     (let ((elapsed-time (- (float-time) start-time)))
       (message "Completed %s in %.4f seconds" ,what elapsed-time)
       elapsed-time)))

(defmacro hook-into-modes (func modes)
  "Add FUNC to MODES hooks."
  `(dolist (mode-hook ,modes)
     (add-hook mode-hook ,func)))

;; (defmacro with-basic-http-auth (&rest body)
;;   "Execute BODY with basic http auth."
;;   `(let ((url-request-extra-headers
;;           (cons `("Authorization" . ,(concat "Basic "
;;                                              (base64-encode-string
;;                                               (concat (read-string "Username: " "lorenzo.bolla")
;;                                                       ":"
;;                                                       (read-passwd "Password: "))))) url-request-extra-headers)))
;;      (progn ,@body)))

(defun set-indent (size)
  "Set indent equal to SIZE."
  (interactive "p")
  (defvar evil-shift-width)
  (defvar js-indent-level)
  (setq evil-shift-width size
        js-indent-level size
        tab-width size))

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
                      "Ubuntu Mono-12"
                      "ProggyCleanTT-12"
                      "Terminus-12"
                      "IBM 3270 Narrow-14"
                      "Input-12"
                      ;; "Monoid-9"
                      "Monoid-11"
                      ) "List of fonts I like." :group 'local)

(defun cycle-fonts ()
  "Cycle between the fonts I like."
  (interactive)
  (set-frame-font (car my-fonts))
  (message "Using font %s" (car my-fonts))
  (setq my-fonts (cycle my-fonts)))

(defun icalendar-import-buffer-in-default-diary ()
  "Import icalendar files into default diary."
  (interactive)
  (defvar diary-file)
  (icalendar-import-buffer diary-file t t))

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
  (let* ((tokens (reverse (split-string tag "/")))
         (issue (car tokens))
         (repo (mapconcat 'identity (reverse (cdr tokens)) "/")))
    (format "https://github.com/%s/issues/%s" repo (url-hexify-string issue))))

(defun python-insert-breakpoint ()
  "Insert Python breakpoint above point."
  (interactive)
  (evil-open-above 1)
  (insert "import ipdb; ipdb.set_trace()  # BREAKPOINT")
  (evil-normal-state))

(defun python-insert-breakpoint-celery()
  "Insert Celery breakpoint above point."
  (interactive)
  (evil-open-above 1)
  (insert "from celery.contrib import rdb; rdb.set_trace()  # BREAKPOINT")
  (evil-normal-state))

(defun python-insert-pylint-ignore ()
  "Insert pylint ignore comment."
  (interactive)
  (evil-open-above 1)
  (insert "# pylint: disable=")
  (evil-insert-state))

(defun python-insert-type-annotation ()
  "Insert type annotation."
  (interactive)
  (end-of-line)
  (insert "  # type: ")
  (evil-insert-state))
(defun python-current-function ()
  (save-excursion
    (end-of-line)
    (beginning-of-defun)
    (search-forward-regexp " *def \\(\\w+\\)")
    (match-string-no-properties 1)))

(defun python-2to3 ()
  (interactive)
  (let ((outbuf (get-buffer-create "*2to3*"))
        (what (or (buffer-file-name) default-directory)))
    (shell-command (concat "2to3 " what) outbuf)
    (with-current-buffer outbuf
      (diff-mode)
      (setq buffer-read-only t)
      (unless (= 0 (buffer-size outbuf))
        (display-buffer outbuf)))))

(defmacro venv-pytest (&rest what)
  `(async-shell-command
    (concat
     "cd "
     (venv-get-proj-dir)
     " && "
     "py.test --color=no -sv "
     ,@what)))

(defun python-indent-jaraco ()
  "Set jaraco-style indentation."
  (interactive)
  (python-indent-guess-indent-offset)
  (setq indent-tabs-mode t))

(defun python-pytest-current-file ()
  "Run py.test for current file."
  (interactive)
  (venv-pytest (buffer-file-name)))

(defun python-pytest-at-point ()
  "Run py.test thing at point."
  (interactive)
  (venv-pytest
   (buffer-file-name)
   " -k "
   (thing-at-point 'word)))

(defun python-pytest-current-function ()
  "Run py.test for current function."
  (interactive)
  (venv-pytest
   (buffer-file-name)
   " -k "
   (python-current-function)))

(defun python-pyformat-buffer ()
  "Run pyformat on current buffer."
  (interactive)
  (shell-command (concat "pyformat --in-place " (buffer-name)))
  (revert-buffer :noconfirm t))

(defun venv-get-proj-dir ()
  "While in a venv, return the project directory or nil."
  (let ((fn (concat (getenv "VIRTUAL_ENV") ".project")))
    (if (file-exists-p fn)
        (chomp (read-file-in-string fn)))))

(defun venv-cdproject ()
  "Change directory to the current project directory, if set."
  (interactive)
  (let ((dir (venv-get-proj-dir)))
    (if dir
        (cd dir))))

(defun venv-build-python-etags ()
  "Build etags for venv."
  (interactive)
  (let ((dir (venv-get-proj-dir)))
    (shell-command
     (concat "find " dir " -name \"*.py\" | fgrep -ve node_modules/ -ve build/ -ve dist/ -ve .egg/ | xargs etags -f " dir "/TAGS")
     nil nil)
    (setq tags-file-name (concat dir "/TAGS"))))

(defun venv-workon-and-cdproject (venv)
  "Activate VENV and cd to it."
  (interactive "i")
  (venv-workon venv)
  (venv-cdproject)
  ;; Replaced etags with dumb-jump
  ;; (venv-build-python-etags)
  (dired default-directory)
  (projectile-switch-project-by-name default-directory)
  (revert-buffer)
  (projectile-vc default-directory)
  (other-window 1))

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

(defun mu4e-headers-narrow-thing-at-point ()
  "Narrow mu4e search querying for thing at point."
  (interactive)
  (let ((q (thing-at-point 'symbol)))
    (mu4e-headers-search-narrow q)))

(provide 'defuns)
;;; defuns.el ends here
