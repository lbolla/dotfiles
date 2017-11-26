;;; package --- lbolla themes.el file
;;; Commentary:
;;; Utils and tweaks for themes I like
;;; 24 November 2017

;;; Code:
;;; TODO faces not defined when theme is enabled

(defvar current-theme 'nil "The current theme.")

(defun disable-current-theme ()
  "Disable current theme."
  (when (custom-theme-p current-theme)
    (disable-theme current-theme)))

(defun switch-theme (theme)
  "Disable current theme and enable THEME."
  (disable-current-theme)
  (load-theme theme)
  (setq current-theme theme))

(defun load-theme-quasi-monochrome ()
  "Load `quasi-monochrome` theme."
  (interactive)
  (use-package quasi-monochrome-theme
    :load-path "/home/lbolla/src/emacs-quasi-monochrome/"
    :demand t)
  (switch-theme 'quasi-monochrome))

(defun load-theme-leuven ()
  "Load `leuven` theme."
  (interactive)
  (switch-theme 'leuven)
  (custom-theme-set-faces 'leuven
   `(magit-diff-file-heading-highlight ((t (:background "gray80"))))
   `(magit-diff-hunk-heading           ((t (:background "gray90"))))
   `(magit-diff-hunk-heading-highlight ((t (:background "gray70"))))
   `(magit-section-highlight           ((t (:background "gray95"))))
   `(mu4e-header-highlight-face        ((t (:inherit (region) :underline nil))))
   `(org-canc                          ((t (:foreground "dark gray" :weight bold))))
   `(org-checkbox                      ((t (:foreground "gray60"))))
   `(org-delg                          ((t (:foreground "royal blue" :weight bold))))
   `(org-done                          ((t (:foreground "forest green" :weight bold))))
   `(org-scheduled-previously          ((t (:foreground "black" :weight normal))))
   `(org-scheduled-today               ((t (:background "white" :weight bold))))
   `(org-strt                          ((t (:foreground "dark orange" :weight bold))))
   `(org-todo                          ((t (:foreground "gray20" :weight bold))))
   `(org-wait                          ((t (:foreground "gold" :weight bold))))))

(defun load-theme-cyberpunk ()
  "Load `cyberpunk` theme."
  (interactive)
  (use-package cyberpunk-theme)
  (switch-theme 'cyberpunk)
  (custom-theme-set-faces 'cyberpunk
   `(hl-line                           ((t (:background "gray20"))))
   `(magit-section-highlight           ((t (:background "gray20"))))
   `(magit-diff-context-highlight      ((t (:background "gray10"))))
   `(magit-diff-hunk-heading           ((t (:background "gray15"))))
   `(magit-diff-removed-highlight      ((t (:inherit (magit-diff-removed) :background "gray10"))))
   `(magit-diff-added-highlight        ((t (:inherit (magit-diff-added) :background "gray10"))))
   `(mu4e-flagged-face                 ((t (:inherit font-lock-constant-face :foreground "firebrick" :weight bold))))
   `(mu4e-header-highlight-face        ((t (:inherit (region) :underline nil))))
   `(mu4e-replied-face                 ((t (:inherit font-lock-comment-face :weight normal))))
   `(org-canc                          ((t (:foreground "gray30" :weight bold :box t))))
   `(org-defr                          ((t (:foreground "gray50" :weight bold :box t))))
   `(org-delg                          ((t (:foreground "gray40" :weight bold :box t))))
   ;; `(org-meet                          ((t (:inherit (org-todo) :box (:color "yellow")))))
   `(org-meet                          ((t (:foreground "cyan" :weight bold :box t))))
   `(org-scheduled                     ((t (:foreground "gray80"))))
   `(org-scheduled-previously          ((t (:foreground "gray60"))))
   `(org-scheduled-today               ((t (:foreground "white"))))
   `(org-strt                          ((t (:foreground "orange" :weight bold :box t))))
   `(org-todo                          ((t (:foreground "white" :weight bold :box t))))
   `(org-wait                          ((t (:foreground "yellow" :weight bold :box t))))
   ))

(provide 'themes)
;;; themes.el ends here
