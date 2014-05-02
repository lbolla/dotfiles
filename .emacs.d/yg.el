;;; package --- yg public stuff
;;; Commentary:
;;; 01 May 2014

;;; Code:

;; Defined in private.el
(defvar yg-fogbugz-base-url)
(defvar yg-paste-base-url)

(defun yg-fogbugz-browse (fbid)
  "Browse YG FogBugz ticket FBID."
  (interactive "nFB#")
  (let ((url (concat yg-fogbugz-base-url (number-to-string fbid))))
    (browse-url url)))

(defun yg-fogbugz-browse-at-point ()
  "Browse YG FogBugz ticket at point."
  (interactive)
  (yg-fogbugz-browse (thing-at-point 'number)))

(defun yg-paste-browse (pasteid)
  "Browse YG Paste PASTEID in a new Emacs window."
  (interactive "sHash: ")
  (with-basic-http-auth
   (browse-url-emacs (concat yg-paste-base-url pasteid))))

(defun yg-paste-browse-at-point ()
  "Browse YG Paste at point."
  (interactive)
  (yg-paste-browse (thing-at-point 'word)))

;;; yg.el ends here
