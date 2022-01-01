;;; package --- YouGov public stuff
;;; Commentary:
;;; 01 May 2014

;;; Code:

(require 'secret-frieza "~/Private/emacs/secret-frieza.el")

;; Defined in private.el
(defvar yg-fogbugz-cli-buffer-name)
(defvar yg-fogbugz-url)
(defvar yg-fogbugz-user)
(defvar yg-fogbugz-password)
(defvar yg-paste-base-url)

(defvar org-agenda-files)
(defvar org-link-abbrev-alist)

(defun yg-gitlab-object-url (tag)
  "Generate a YG GitLab OBJECT url for TAG."
  (my/gitlab-object-url "https://gitlab.yougov.net/" tag))

(defun yg-fogbugz-cli ()
  "Open FogBugz command line interface."
  (interactive)
  (let ((b (get-buffer (concat "*" yg-fogbugz-cli-buffer-name "<1>*")))
        (multi-term-program "fb")
        (multi-term-buffer-name yg-fogbugz-cli-buffer-name))
    (if b
        (switch-to-buffer b)
      (progn
        (setenv "EDITOR" "emacsclient")
        (setenv "FBURL" yg-fogbugz-url)
        (setenv "FBUSER" yg-fogbugz-user)
        (setenv "FBPASS" yg-fogbugz-password)
        (multi-term)))))

(defun yg-fogbugz-browse (fbid)
  "Browse YG FogBugz ticket FBID."
  (interactive "nFB#")
  (let ((url (concat yg-fogbugz-url "/f/cases/" (number-to-string fbid))))
    (browse-url url)
    (message "Browsing to %s" url)))

(defun yg-fogbugz-get-id-at-point ()
  "Get the FogBugz id at point."
  (save-excursion
    (beginning-of-thing 'symbol)
    (search-forward-regexp "\\([[:digit:]]\\{5\\}\\)")
    (let ((id (string-to-number (match-string 1))))
      (if (> id 0)
	  id
	nil))))

(defun yg-fogbugz-browse-at-point ()
  "Browse YG FogBugz ticket at point."
  (interactive)
  (yg-fogbugz-browse (yg-fogbugz-get-id-at-point)))

(defun yg-paste-browse (pasteid)
  "Browse YG Paste PASTEID in a new Emacs window."
  (interactive "sHash: ")
   (browse-url-emacs (concat yg-paste-base-url "plain/" pasteid)))

(defun yg-paste-browse-at-point ()
  "Browse YG Paste at point."
  (interactive)
  (yg-paste-browse (thing-at-point 'word)))

(defun yg-paste-buffer ()
  "Like `yg-paste-region', but acts on the entire buffer."
  (interactive)
  (yg-paste-region (point-min) (point-max)))

(defun yg-paste-region (start end)
  "Create a YG Paste of the selected region between START and END."
  (interactive "r")
  (let* ((txt (buffer-substring start end))
         (crlf "\r\n")
         (boundary "----WebKitFormBoundaryLgGlAtSyzYnRsb1o")
         (boundary-prologue "--")
         (boundary-open (concat boundary crlf))
         (boundary-close (concat crlf "--"))
         (boundary-epilogue (concat boundary "--" crlf))
         (url-request-method "POST")
         (url-request-extra-headers
          `(("Content-Type" . ,(concat "multipart/form-data; boundary=" boundary))))
         (url-request-data (concat
                            boundary-prologue
                            boundary-open
                            "Content-Disposition: form-data; name=\"nick\""
                            crlf
                            crlf
                            "lbolla"
                            boundary-close
                            boundary-open
                            "Content-Disposition: form-data; name=\"makeshort\""
                            crlf
                            crlf
                            "True"
                            boundary-close
                            boundary-open
                            "Content-Disposition: form-data; name=\"file\"; filename=\"\""
                            crlf
                            "Content-Type: application/octet-stream"
                            crlf
                            crlf
                            boundary-close
                            boundary-open
                            "Content-Disposition: form-data; name=\"fmt\""
                            crlf
                            crlf
                            "_"
                            boundary-close
                            boundary-open
                            "Content-Disposition: form-data; name=\"code\""
                            crlf
                            crlf
                            txt
                            boundary-close
                            boundary-epilogue)))
    (url-retrieve yg-paste-base-url
                  '(lambda (status)
                     (save-match-data
                       (search-forward-regexp "Paste \\(.....\\)")
                       (let* ((pasteid (match-string 1))
                              (url (url-encode-url (concat yg-paste-base-url pasteid))))
                         (kill-new url)
                         (message url)
                         ;; ;; Insert link in another buffer
                         ;; (with-current-buffer (get-buffer-create "*YG Paste*")
                         ;;   (goto-char (point-max))
                         ;;   (insert "Region pasted to ")
                         ;;   (insert-button pasteid
                         ;; 		     'action (lambda (x) (browse-url (button-get x 'url)))
                         ;; 		     'url url)
                         ;;   (insert "\n")
                         ;;   (switch-to-buffer-other-window (current-buffer)))
                         ))))))

(defun python-indent-jaraco ()
  "Set jaraco-style indentation."
  (interactive)
  (python-indent-guess-indent-offset)
  (setq indent-tabs-mode t))

(add-to-list 'org-mode-hook (lambda ()
                              (add-to-list 'org-link-abbrev-alist `("FB" . ,(concat yg-fogbugz-url "/f/cases/%h")))
                              (add-to-list 'org-link-abbrev-alist `("BSD" . ,(concat yg-jira-url "/browse/BSD-%h")))
                              (add-to-list 'org-link-abbrev-alist `("BRI" . ,(concat yg-jira-url "/browse/BRI-%h")))
                              (add-to-list 'org-link-abbrev-alist `("DEVO" . ,(concat yg-jira-url "/browse/DEVO-%h")))
                              (add-to-list 'org-link-abbrev-alist '("GL" . yg-gitlab-object-url))
                              (add-to-list 'org-agenda-files "~/org/yougov.org")))

(add-to-list 'evil-mode-hook (lambda ()
                               (define-key evil-normal-state-map (kbd ",yp") 'yg-paste-buffer)
                               (define-key evil-visual-state-map (kbd ",yp") 'yg-paste-region)))

(setq org-publish-project-alist
      (cl-concatenate 'list org-publish-project-alist '(("kubernetes"
                                                         :components ("kubernetes-org" "kubernetes-html"))
                                                        ("kubernetes-org"
                                                         :base-directory "~/work/kubernetes/"
                                                         :base-extension "org"
                                                         :publishing-directory "/rsync:dev-lbolla:public_html/kubernetes/"
                                                         :publishing-function org-org-publish-to-org
                                                         :recursive t)
                                                        ("kubernetes-html"
                                                         :base-directory "~/work/kubernetes/"
                                                         :base-extension "org"
                                                         :publishing-directory "/rsync:dev-lbolla:public_html/kubernetes/"
                                                         :publishing-function org-html-publish-to-html
                                                         :html-head "<link rel=\"stylesheet\" href=\"http://gongzhitaao.org/orgcss/org.css\" type=\"text/css\">"
                                                         :recursive t)
                                                        ("cubeapi"
                                                         :components ("cubeapi-notes" "cubeapi-static"))
                                                        ("cubeapi-notes"
                                                         :base-directory "~/work/cubeapi/notes/"
                                                         :base-extension "org"
                                                         :publishing-directory "/rsync:dev-lbolla:public_html/cubeapi/"
                                                         :publishing-function org-html-publish-to-html
                                                         :html-head "<link rel=\"stylesheet\" href=\"http://gongzhitaao.org/orgcss/org.css\" type=\"text/css\">"
                                                         :recursive t)
                                                        ("cubeapi-static"
                                                         :base-directory "~/work/cubeapi/notes/"
                                                         :base-extension "png\\|jpg"
                                                         :publishing-directory "/rsync:dev-lbolla:public_html/cubeapi/"
                                                         :recursive t
                                                         :publishing-function org-publish-attachment))))

(use-package ess
  :disabled t
  :hook
  (ess-mode . (lambda ()
                (modify-syntax-entry ?\_ "w"))))

(provide 'yougov)

;;; yougov.el ends here
