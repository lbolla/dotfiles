;; package --- lbolla gnus.el file
;;; Commentary:
;;; 23 November 2015

;;; Code:

(use-package gnus
  :custom
  (gnus-select-method '(nntp "news.gmane.io"))
  (gnus-summary-line-format "%d %U%R%z%I%(%[%4L: %-23,23f%]%) %s\n"))

(provide '.gnus)
;;; .gnus ends here
