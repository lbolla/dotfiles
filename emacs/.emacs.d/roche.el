;;; package --- Roche public stuff
;;; Commentary:
;;; 17 Dec 2020

;;; Code:

(defvar org-agenda-files)

(add-to-list 'org-mode-hook (lambda ()
                              (add-to-list 'org-agenda-files "~/org/roche.org")))

(use-package dpkg-dev-el)

(provide 'roche)

;;; roche.el ends here
