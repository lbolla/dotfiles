;; package --- lbolla gnus.el file
;;; Commentary:
;;; 23 November 2015

;;; Code:

;;@see http://www.emacswiki.org/emacs/GnusGmail#toc1
;;@see http://www.emacswiki.org/emacs/GnusTutorial
;;@see https://github.com/redguardtoo/mastering-emacs-in-one-year-guide/blob/master/gnus-guide-en.org
;;@see https://github.com/drewr/dotemacs/blob/master/d/gnus.el
;;@see https://github.com/jwiegley/dot-emacs/blob/master/dot-gnus.el

(use-package gnus
  :init (progn
          (use-package nnir)
          (use-package epa))
  :config (progn
            (setq gnus-select-method '(nntp "nntp.aioe.org"))
            (setq gnus-summary-line-format "%d %U%R%z%I%(%[%4L: %-23,23f%]%) %s\n")
            (add-to-list 'gnus-secondary-select-methods '(nntp "news.gmane.org"))))

(provide '.gnus)
;;; .gnus ends here
