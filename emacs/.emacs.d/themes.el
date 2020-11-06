;;; package --- lbolla themes.el file
;;; Commentary:
;;; Utils and tweaks for themes I like
;;; 24 November 2017

;;; Code:

(use-package quasi-monochrome-theme
  :load-path "/home/lbolla/src/github.com/lbolla/emacs-quasi-monochrome/"
  ;; :defer t
  :no-require t
  :demand t
  :config
  (add-to-list 'custom-theme-load-path "/home/lbolla/src/github.com/lbolla/emacs-quasi-monochrome/"))

(use-package leuven-theme
  :defer t
  :demand t)

(use-package cyberpunk-theme
  :defer t
  :demand t)

(use-package goose-theme
  :defer t
  :demand t)

(use-package doom-themes
  :defer t
  :demand t)

(use-package poet-theme
  :defer t
  :demand t)

(use-package tao-theme
  :defer t
  :demand t)

(use-package modus-operandi-theme
  :defer t
  :demand t
  :custom
  ;; See https://www.reddit.com/r/emacs/comments/j7eruf/favorite_light_themes/g857g7e/
  (modus-operandi-theme-org-blocks 'greyscale)
  (modus-operandi-theme-completions 'opinionated))

(use-package modus-vivendi-theme
  :defer t
  :demand t
  :custom
  (modus-vivendi-theme-org-blocks 'greyscale)
  (modus-vivendi-theme-completions 'opinionated))

(use-package dash
  :demand t)

(defun my/switch-theme (theme)
  "Disable active themes and load THEME."
  (interactive (list (intern (completing-read "Theme: "
                                              (->> (custom-available-themes)
                                                   (-map #'symbol-name))))))
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme theme 'no-confirm))

(defmacro lbolla/custom-theme-set-faces (theme &rest args)
  "Set and activate ARGS faces in THEME."
  `(progn
     (custom-theme-set-faces
      ,theme
      ,@args)
     ,@(mapcar (lambda (face &rest _rest) `(custom-theme-recalc-face ',(caadr face))) args)))

(defvar after-load-theme-hook
  '(lambda ()
    (let ((theme (car custom-enabled-themes)))
      (cond

       ;; Cyberpunk
       ((eq theme 'cyberpunk)
        (lbolla/custom-theme-set-faces
         'cyberpunk
         `(font-lock-warning-face            ((t (:foreground "#ff69b4" :inverse-video t :weight bold))))
         `(highlight-indentation-face        ((t (:inherit (fringe) :background "gray5"))))
         `(hl-line                           ((t (:background "gray10"))))
         `(magit-section-highlight           ((t (:background "gray20"))))
         `(magit-diff-context-highlight      ((t (:background "gray10"))))
         `(magit-diff-hunk-heading           ((t (:background "gray15"))))
         `(magit-diff-removed-highlight      ((t (:inherit (magit-diff-removed) :background "gray10"))))
         `(magit-diff-added-highlight        ((t (:inherit (magit-diff-added) :background "gray10"))))
         `(mu4e-flagged-face                 ((t (:inherit (font-lock-constant-face) :foreground "firebrick" :weight bold))))
         `(mu4e-header-highlight-face        ((t (:inherit (region) :underline nil))))
         `(mu4e-forwarded-face               ((t (:inherit (font-lock-builtin-face) :foreground "gray30" :weight bold))))
         `(mu4e-replied-face                 ((t (:inherit (font-lock-comment-face) :weight normal))))
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
         `(org-wait                          ((t (:foreground "yellow" :weight bold :box t))))))

       ;; Deeper blue
       ((eq theme 'deeper-blue)
        (lbolla/custom-theme-set-faces
         'deeper-blue
         `(mode-line                         ((t (:background "gray55"))))
         `(region                            ((t (:background "#50506f"))))))

       ;; Doom Laserwave
       ((eq theme 'doom-laserwave)
        (lbolla/custom-theme-set-faces
         'doom-laserwave
         `(ivy-current-match                 ((t (:background "#4e2e49" :inherit (region)))))
         `(mode-line-emphasis                ((t (:foreground "#1b1720" :weight bold))))
         `(org-mode-line-clock               ((t (:slant italic :weight bold))))
         `(org-mode-line-clock-overrun       ((t (:inherit font-lock-warning-face :slant italic :weight bold))))
         `(popup-tip-face                    ((t (:inherit popup-face :foreground "#B381C5" :background "black"))))))

       ;; Doom Monokai Classic
       ((eq theme 'doom-monokai-classic)
        (lbolla/custom-theme-set-faces
         'doom-monokai-classic
         `(ivy-current-match                 ((t (:background "#4E4E4E" :inherit (region)))))))

       ;; Doom Opera Light
       ((eq theme 'doom-opera-light)
        (lbolla/custom-theme-set-faces
         'doom-opera-light
         `(popup-tip-face                    ((t (:inherit popup-face :foreground "#842879" :background "khaki1"))))))

       ;; Modus Vivendi
       ((eq theme 'modus-vivendi)
        (lbolla/custom-theme-set-faces
         'modus-vivendi
         `(org-block                         ((t (:background "#2a2a2a"))))))

       ;; Goose
       ((eq theme 'goose)
        (lbolla/custom-theme-set-faces
         'goose
         `(font-lock-string-face             ((t (:foreground "#666666" :slant italic))))
         `(mu4e-flagged-face                 ((t (:inherit (font-lock-constant-face) :foreground "firebrick" :weight bold))))
         `(org-canc                          ((t (:foreground "#666666" :weight bold))))
         `(org-scheduled                     ((t (:inherit (default)))))
         `(org-scheduled-previously          ((t (:foreground "#666666" :weight normal))))
         `(org-scheduled-today               ((t (:inherit (default)))))))

       ;; Leuven
        ((eq theme 'leuven)
         (lbolla/custom-theme-set-faces
          'leuven
          `(highlight-indentation-face        ((t (:inherit (fringe) :background "gray97"))))
          ;; `(magit-diff-file-heading-highlight ((t (:background "gray80"))))
          ;; `(magit-diff-hunk-heading           ((t (:background "gray90"))))
          ;; `(magit-diff-hunk-heading-highlight ((t (:background "gray70"))))
          ;; `(magit-section-highlight           ((t (:background "gray95"))))
          `(magit-tag                         ((t (:foreground "Goldenrod4" :box t :weight bold))))
          ;; `(mu4e-header-highlight-face        ((t (:inherit (region) :underline nil))))
          `(org-canc                          ((t (:inherit (org-todo) :foreground "dark gray" :strike-through t))))
          `(org-delg                          ((t (:inherit (org-todo) :foreground "royal blue"))))
          '(org-done                          ((t (:inherit (org-todo) :foreground "forest green"))))
          `(org-scheduled-previously          ((t (:foreground "gray50" :weight normal))))
          `(org-scheduled-today               ((t (:background "white" :weight bold))))
          `(org-strt                          ((t (:inherit (org-todo) :foreground "dark orange"))))
          `(org-todo                          ((t (:foreground "gray20" :weight bold :box t))))
          `(org-wait                          ((t (:inherit (org-todo) :foreground "gold")))))))))

  "Hook run after a color theme is loaded using `load-theme'.")

(defadvice load-theme (after run-after-load-theme-hook activate)
  "Run `after-load-theme-hook'."
  (run-hooks 'after-load-theme-hook))

(provide 'themes)
;;; themes.el ends here
