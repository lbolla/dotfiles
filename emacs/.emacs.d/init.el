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

;; Store all customizations in custom file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Environmental variables
(setenv "INSIDE_EMACS" "1")
(setenv "RIPGREP_CONFIG_PATH" (expand-file-name "~/.ripgreprc"))

(global-set-key (kbd "<f5>") 'compile)
(global-set-key (kbd "M-o") 'my/open-line)
(global-set-key (kbd "M-O") 'my/open-line-above)
(global-set-key (kbd "C-x 2") 'my/split-window-below-and-switch-buffer)
(global-set-key (kbd "C-x 3") 'my/split-window-right-and-switch-buffer)
;; (global-set-key (kbd "C-x n") 'narrow-or-widen-dwim)

(global-set-key (kbd "C-x C-b") 'ibuffer)
;; (global-set-key (kbd "C-c e") 'eshell)
;; (global-set-key (kbd "C-c f") 'variable-pitch-mode)
(global-set-key (kbd "C-c t c") 'my/switch-theme)
(global-set-key (kbd "C-c t t") 'modus-themes-toggle)
(global-set-key (kbd "C-c v w") 'venv-workon-and-cdproject)
;; (global-set-key (kbd "C-c w") 'w3m)
(global-set-key (kbd "C-c z") 'zoom-window-zoom)
;; (global-set-key (kbd "C-c f l") 'my/find-file-linkz)
;; (global-set-key (kbd "C-c f i") 'my/find-file-init)
;; (global-set-key (kbd "C-c f p") 'my/find-file-pkgs)

(defadvice kill-buffer (around kill-buffer-around-advice activate)
  "Bury *scratch* buffer instead of killing it.
See https://stackoverflow.com/questions/234963/re-open-scratch-buffer-in-emacs#235069"
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

(require 'defuns "~/.emacs.d/defuns.el")
(require 'pkgs "~/.emacs.d/pkgs.el")
(require 'themes "~/.emacs.d/themes.el")

;; Site-dependent settings
(pcase (system-name)
  ("jiren"
   (require 'personal "~/.emacs.d/personal.el"))
  ("frieza"
   (require 'yougov "~/.emacs.d/yougov.el"))
  ((or "troulwn0333" "rabuwprlc0004")
   (require 'roche "~/.emacs.d/roche.el")))

;; For local customizations
(when (file-exists-p "~/.emacs.d/local.el")
  (require 'local "~/.emacs.d/local.el"))

;; Optimizations
;; https://emacs.stackexchange.com/questions/28736/emacs-pointcursor-movement-lag/28746
;; (setq auto-window-vscroll nil)

;; Theme
;; (my/switch-theme 'modus-vivendi)

(provide 'init)
;;; init.el ends here
