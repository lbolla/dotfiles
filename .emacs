;;
;; Generic settings
;;

(menu-bar-mode 1)
(tool-bar-mode 0)

(display-time-mode t)
(setq display-time-day-and-date t)

;; make _ part of a word
(modify-syntax-entry ?_ "w")

(require 'w3m-load)
(setq w3m-use-cookies t)

;;
;; Mode specific settings
;;

(add-hook 'python-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "RET") 'newline-and-indent)))

(add-hook 'c-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "RET") 'newline-and-indent)))

(add-hook 'lisp-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "RET") 'newline-and-indent)))

;;
;; Pre-23 version settings
;;

(when (string< (emacs-version) "GNU Emacs 23")
  (message "Version %s" (emacs-version)))

;;
;; EEE specific settings
;;

(when (string= (getenv "HOSTNAME") "eee")
  (set-face-attribute 'default nil :height 80)
  (display-battery-mode t))

;;
;; To try
;;

;; (winner-mode 1)
;; (windmove-default-keybindings)
;; (global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
;; (global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
;; (global-set-key (kbd "S-C-<down>") 'shrink-window)
;; (global-set-key (kbd "S-C-<up>") 'enlarge-window)

