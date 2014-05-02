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
	  `(("Authorization" . ,(concat "Basic "
					(base64-encode-string
					 (concat (read-string "Username: " "lorenzo.bolla")
						 ":"
						 (read-passwd "Password: "))))))))
     (progn ,@body)))

;;; util.el ends here
