;;; package --- lbolla themes.el file
;;; Commentary:
;;; Utils and tweaks for themes I like
;;; 24 November 2017

;;; Code:

;; Note: defer/demand is required to make the custom-theme-set-faces work on
;; hooks
(use-package cyberpunk-theme
  :defer t
  :demand t)

(use-package doom-themes
  :defer t
  :demand t)

(use-package goose-theme
  :defer t
  :demand t)

(use-package leuven-theme
  :defer t
  :demand t)

(use-package the-matrix-theme
  :defer t
  :demand t)

(use-package modus-themes
  :defer t
  :demand t
  :custom
  (modus-themes-region 'bg-only)
  (modus-themes-org-blocks 'greyscale)
  (modus-themes-completions 'opinionated))

(use-package quasi-monochrome-theme
  :defer t
  :demand t
  :load-path "~/src/github.com/lbolla/emacs-quasi-monochrome/"
  :init
  (add-to-list 'custom-theme-load-path "~/src/github.com/lbolla/emacs-quasi-monochrome/"))

(defmacro my/custom-theme-set-faces (theme &rest args)
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
        (my/custom-theme-set-faces
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
        (my/custom-theme-set-faces
         'deeper-blue
         `(mode-line                         ((t (:background "gray55"))))
         `(region                            ((t (:background "#50506f"))))))

       ;; Doom 1337
       ((eq theme 'doom-1337)
        (my/custom-theme-set-faces
         'doom-1337
         `(highlight                         ((t (:foreground "#191919" :background "#ffffff"))))
         `(ivy-current-match                 ((t (:weight bold :underline t))))))

       ;; Doom Ayu Mirage
       ((eq theme 'doom-ayu-mirage)
        (my/custom-theme-set-faces
         'doom-ayu-mirage
         `(ivy-current-match                 ((t (:weight bold :underline t))))))

       ;; Doom Ayu Light
       ((eq theme 'doom-ayu-light)
        (my/custom-theme-set-faces
         'doom-ayu-light
         `(ivy-current-match                 ((t (:weight bold :underline t))))))

       ;; ;; Doom Homage White
       ;; TODO just change foreground not set the whole face
       ;; ((eq theme 'doom-homage-white)
       ;;  (my/custom-theme-set-faces
       ;;   'doom-homage-white
       ;;   `(magit-header-line                 ((t (:foreground "white"))))))

       ;; Doom Laserwave
       ((eq theme 'doom-laserwave)
        (my/custom-theme-set-faces
         'doom-laserwave
         `(ivy-current-match                 ((t (:weight bold :underline t))))
         `(org-mode-line-clock               ((t (:slant italic :weight bold))))
         `(org-mode-line-clock-overrun       ((t (:inherit font-lock-warning-face :slant italic :weight bold))))
         `(popup-tip-face                    ((t (:inherit popup-face :foreground "#B381C5" :background "black"))))))

       ;; Doom Monokai Classic
       ((eq theme 'doom-monokai-classic)
        (my/custom-theme-set-faces
         'doom-monokai-classic
         `(ivy-current-match                 ((t (:weight bold :underline t))))))

       ;; Doom Opera Light
       ((eq theme 'doom-opera-light)
        (my/custom-theme-set-faces
         'doom-opera-light
         `(popup-tip-face                    ((t (:inherit popup-face :foreground "#842879" :background "khaki1"))))))

       ;; Modus Operandi
       ((eq theme 'modus-operandi)
        (my/custom-theme-set-faces
         'modus-operandi
         `(magit-tag                         ((t (:inherit bold :foreground "#863927"))))))  ;; yellow-alt-other

       ;; Modus Vivendi
       ((eq theme 'modus-vivendi)
        (my/custom-theme-set-faces
         'modus-vivendi
         `(org-block                         ((t (:background "#2a2a2a"))))))

       ;; Goose
       ((eq theme 'goose)
        (my/custom-theme-set-faces
         'goose
         `(font-lock-string-face             ((t (:foreground "#666666" :slant italic))))
         `(mu4e-flagged-face                 ((t (:inherit (font-lock-constant-face) :foreground "firebrick" :weight bold))))
         `(org-block                         ((t (:background "#dddddd"))))
         `(org-canc                          ((t (:foreground "#666666" :weight bold))))
         `(org-scheduled                     ((t (:inherit (default)))))
         `(org-scheduled-previously          ((t (:foreground "#666666" :weight normal))))
         `(org-scheduled-today               ((t (:inherit (default)))))))

       ;; Leuven
        ((eq theme 'leuven)
         (my/custom-theme-set-faces
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
          `(org-ctodo                          ((t (:foreground "gray20" :weight bold :box t))))
          `(org-wait                          ((t (:inherit (org-todo) :foreground "gold"))))))

        ;; The Matrix
        ((eq theme 'the-matrix)
         ;; From original theme
         ;; TODO remove when https://github.com/monkeyjunglejuice/matrix-emacs-theme/pull/7 is merged
         (let* ((color-bg      "#000000")
                (color-bg-alt  "#011a0d")
                (color-bg-red  "#330800")
                (color-bg-blue "#001733")
                (color-hl      "#00ff7f")
                (color-bright  "#00ee76")
                (color-middle  "#00cd66")
                (color-fg      "#00a250")
                (color-dark    "#007338")
                (color-darker  "#004020")
                (color-red     "#d92000")
                (color-blue    "#006bf2"))
           (my/custom-theme-set-faces
            'the-matrix
            ;; tab-line/tab-bar (Emacs 27+)
            `(tab-line ((t (:background ,color-bg-alt :foreground ,color-fg))))
            `(tab-line-tab ((t (:background ,color-bg :foreground ,color-fg))))
            `(tab-line-tab-inactive ((t (:inherit tab-line-tab :background ,color-bg-alt :foreground ,color-fg))))
            `(tab-line-tab-inactive-alternate ((t (:inherit tab-line-tab-inactive))))
            `(tab-line-tab-current ((t (:background ,color-bg :foreground ,color-fg))))
            `(tab-line-highlight ((t (:inherit tab-line-tab))))
            `(tab-line-close-highlight ((t (:foreground color-hl))))
            `(tab-bar ((t (:background ,color-bg-alt :foreground ,color-fg))))
            `(tab-bar-tab ((t (:background ,color-bg :foreground ,color-fg))))
            `(tab-bar-tab-inactive ((t (:inherit tab-line-tab :background ,color-bg-alt :foreground ,color-fg)))))))

        )))
  "Hook run after a color theme is loaded using `load-theme'.")

(defadvice load-theme (after run-after-load-theme-hook activate)
  "Run `after-load-theme-hook'."
  (run-hooks 'after-load-theme-hook))

(provide 'init-themes)
;;; init-themes.el ends here
