;;; custom --- custom stuff
;;; Commentary:
;;; 11 May 2014

;;; Code:

(defcustom my-fonts '("Ubuntu Mono-12" "ProggyCleanTT" "Terminus-12") "List of fonts I like." :group 'local)

(defun cycle-fonts ()
  "Cycle between the fonts I like."
  (interactive)
  (set-frame-font (car my-fonts))
  (message "Using font %s" (car my-fonts))
  (setq my-fonts (cycle my-fonts)))

;;; custom.el ends here
