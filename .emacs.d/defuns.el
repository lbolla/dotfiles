;;; package --- lbolla defuns.el file
;;; Commentary:
;;; 7 November 2016

;;; Code:

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

(defcustom my-fonts '("Terminus-12" "Ubuntu Mono-12" "ProggyCleanTT-12" "Monoid-9" "IBM 3270 Narrow-14" "Input-12")
  "List of fonts I like." :group 'local)

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
  (man (thing-at-point 'word)))

(provide 'defuns)
;;; defuns.el ends here
