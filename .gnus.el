;; package --- lbolla gnus.el file
;;; Commentary:
;;; 23 November 2015

;;; Code:

;;@see http://www.emacswiki.org/emacs/GnusGmail#toc1
;;@see http://www.emacswiki.org/emacs/GnusTutorial
;;@see https://github.com/redguardtoo/mastering-emacs-in-one-year-guide/blob/master/gnus-guide-en.org
;;@see https://github.com/drewr/dotemacs/blob/master/d/gnus.el
;;@see https://github.com/jwiegley/dot-emacs/blob/master/dot-gnus.el

(require 'nnir)
(require 'epa)

;;@see http://gnus.org/manual/gnus_397.html
(add-to-list 'gnus-secondary-select-methods
             '(nnimap "yougov"
                      (nnimap-address "imap.yougov.com")
                      (nnimap-server-port 993)
                      (nnimap-stream ssl)
                      (nnir-search-engine imap)
                      ; @see http://www.gnu.org/software/emacs/manual/html_node/gnus/Expiring-Mail.html
                      ;; press 'E' to expire email
                      (nnmail-expiry-target "nnimap+yougov:Trash")
                      (nnmail-expiry-wait 90)))

;; ;; TODO offlineimap+Maildir
;; (add-to-list 'gnus-secondary-select-methods
;; 	     '(nnmaildir "NS"
;; 			 (directory "~/Mail/Networkscale/")
;; 			 (directory-files nnheader-directory-files-safe)
;; 			 (get-new-mail nil)))

;; Flag messages with attachments
(defun gnus-user-format-function-@ (header)
  "Display @ for message with attachment in summary line.
You need to add `Content-Type' to `nnmail-extra-headers' and
`gnus-extra-headers', see Info node `(gnus)To From Newsgroups'."
  (let ((case-fold-search t)
	(ctype (or (cdr (assq 'Content-Type (mail-header-extra header)))
		   "text/plain"))
	indicator)
    (cond
     ((string-match "^multipart" ctype) "@")
     (t " "))))

(setq user-mail-address yg-smtp-mail-address
      gnus-select-method '(nntp "nntp.aioe.org")
      ;; ask encyption password once
      epa-file-cache-passphrase-for-symmetric-encryption t
      ;; NO 'passive
      gnus-use-cache t
      ;; Mark Gcc articles as read
      gnus-gcc-mark-as-read t
      ;; Additional headers
      gnus-extra-headers '(To Newsgroups Cc Content-Type)
      ;; Forwarding
      message-wash-forwarded-subjects t
      message-forward-as-mime t
      message-make-forward-subject-function 'message-forward-subject-fwd
      gnus-face-6 'font-lock-variable-name-face
      gnus-face-9 'font-lock-warning-face
      gnus-face-10 'font-lock-type-face
      gnus-user-date-format-alist '((t . "%Y-%m-%d %H:%M"))
      gnus-summary-line-format (concat
				"%0{%U%R%z%}"
				"%10{│%}"
				"%6{%&user-date;%}"
				"%10{│%}%* "
				"%9{%u&@;%}"
				"%(%-15,15f%) "
				"%10{│%}"
				"%10{%B%}"
				"%s\n")
      gnus-summary-display-arrow t
      ;; Save sent emails
      gnus-message-archive-group '(
				   ;; (format-time-string "sent.%Y-%m")
				   "nnimap+yougov:Sent Items"
				   )
      ;; Sort by date, reversed
      gnus-thread-sort-functions '(gnus-thread-sort-by-most-recent-number
				   gnus-thread-sort-by-most-recent-date)
      ;; Fetch only part of the article if we can.
      ;; I saw this in someone's .gnus
      gnus-read-active-file 'some
      ;; Show previous messages in thread when a new followup arrives
      gnus-fetch-old-headers t
      ;; Threads!  I hate reading un-threaded email -- especially mailing
      ;; lists.  This helps a ton!
      gnus-summary-thread-gathering-function 'gnus-gather-threads-by-subject
      ;; ;; Also, I prefer to see only the top level message.  If a message has
      ;; ;; several replies or is part of a thread, only show the first
      ;; ;; message.  'gnus-thread-ignore-subject' will ignore the subject and
      ;; ;; look at 'In-Reply-To:' and 'References:' headers.
      ;; gnus-thread-hide-subtree t
      ;; gnus-thread-ignore-subject t
      ;; You need install the command line brower 'w3m' and Emacs plugin 'w3m'
      mm-text-html-renderer 'w3m
      ;; http://www.gnu.org/software/emacs/manual/html_node/gnus/_005b9_002e2_005d.html
      gnus-use-correct-string-widths nil
      )

;; Nicer formatting
(when window-system
  (setq gnus-sum-thread-tree-indent "  "
	gnus-sum-thread-tree-root "● "
	gnus-sum-thread-tree-false-root "◯ "
	gnus-sum-thread-tree-single-indent "◎ "
	gnus-sum-thread-tree-vertical "│"
	gnus-sum-thread-tree-leaf-with-other "├─ "
	gnus-sum-thread-tree-single-leaf "╰─ "))

;; ;; BBDB: Address list
;; ;; (add-to-list 'load-path "/where/you/place/bbdb/")
;; ;; (require 'bbdb)
;; ;; (bbdb-initialize 'message 'gnus 'sendmail)
;; ;; (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
;; ;; (setq bbdb/mail-auto-create-p t
;; ;;       bbdb/news-auto-create-p t)

;; Set nnmail headers to match gnus'
(setq nnmail-extra-headers gnus-extra-headers)

;; Check new messages every 5 minutes
(gnus-demon-add-handler 'gnus-group-get-new-news 5 nil)
;; and notify
(use-package gnus-desktop-notify
  :init (progn
	  (setq gnus-desktop-notify-function 'gnus-desktop-notify-send)
	  (gnus-desktop-notify-mode)
	  (gnus-demon-add-scanmail)))
;; TODO notify on the modeline, too

;; Tree view for groups.  I like the organisational feel this has.
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; auto-complete emacs address using bbdb UI
(add-hook 'message-mode-hook
          '(lambda ()
             (flyspell-mode t)
             ;; (local-set-key "<TAB>" 'bbdb-complete-name)
	     ))

(provide '.gnus)
;;; .gnus ends here
