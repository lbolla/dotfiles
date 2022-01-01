;;; package --- lbolla init.el file
;;; Commentary:
;;; 14 March 2014

;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(when (< emacs-major-version 28)
  (package-initialize))

;; See https://www.reddit.com/r/emacs/comments/cdei4p/failed_to_download_gnu_archive_bad_request/
(when (= emacs-major-version 26)
  (when (< emacs-minor-version 3)
    (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")))

;; Environmental variables
(setenv "INSIDE_EMACS" "1")

;; Always use y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; https://stackoverflow.com/questions/234963/re-open-scratch-buffer-in-emacs#235069
(defadvice kill-buffer (around kill-buffer-around-advice activate)
  "Bury *scratch* buffer instead of killing it."
  (let ((buffer-to-kill (ad-get-arg 0)))
    (if (equal buffer-to-kill "*scratch*")
        (bury-buffer)
      ad-do-it)))

;; Show buffer path, relative to project root
;; https://www.reddit.com/r/emacs/comments/8xobt3/tip_in_modeline_show_buffer_file_path_relative_to/
(with-eval-after-load 'subr-x
  (setq-default mode-line-buffer-identification
                '(:eval (format-mode-line
                         (propertized-buffer-identification
                          (or (when-let* ((buffer-file-truename buffer-file-truename)
                                          (prj (cdr-safe (project-current)))
                                          (prj-parent (file-name-directory (directory-file-name (expand-file-name prj)))))
                                (concat (file-relative-name
                                         (file-name-directory buffer-file-truename)
                                         prj-parent) (file-name-nondirectory buffer-file-truename)))
                              "%b"))))))

(require 'init-defuns "~/.emacs.d/init-defuns.el")
(require 'init-pkgs "~/.emacs.d/init-pkgs.el")
(require 'init-themes "~/.emacs.d/init-themes.el")

;; Site-dependent settings
(let ((local-config (format "~/.emacs.d/config-%s.el" (system-name))))
  (when (file-exists-p local-config)
    (message "Loading %s" local-config)
    (require 'local-config local-config)))

(provide 'init)
;;; init.el ends here
