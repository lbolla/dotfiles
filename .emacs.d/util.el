;;; package --- utilities
;;; Commentary:
;;; 01 May 2014

;;; Code:

(defun zsh ()
  "Run a zsh."
  (interactive)
  (ansi-term "/usr/bin/zsh"))

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

(defmacro with-basic-http-auth (&rest body)
  "Execute BODY with basic http auth."
  `(let ((url-request-extra-headers
	  (cons `("Authorization" . ,(concat "Basic "
					    (base64-encode-string
					     (concat (read-string "Username: " "lorenzo.bolla")
						     ":"
						     (read-passwd "Password: "))))) url-request-extra-headers)))
     (progn ,@body)))

(defun set-indent (size)
  "Set indent equal to SIZE."
  (interactive "p")
  (setq indent-tabs-mode nil
        evil-shift-width size
	js-indent-level size
        tab-width size))

;;; util.el ends here
