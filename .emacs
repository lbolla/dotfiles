;;
;; Generic settings
;;

(menu-bar-mode 1)
(tool-bar-mode 0)
(transient-mark-mode 1)
(show-paren-mode 1)

(display-time-mode t)
(setq display-time-day-and-date t)

;; make _ part of a word
(modify-syntax-entry ?_ "w")

(require 'w3m-load)
(setq w3m-use-cookies t)

;;
;; Functions
;;

(defun python-insert-breakpoint ()
  "Insert pdb breakpoint."
  (interactive)
  (move-beginning-of-line nil)
  (open-line 1)
  (indent-for-tab-command)
  (insert "import pdb; pdb.set_trace() # BREAKPOINT"))

;;
;; Mode specific settings
;;

(add-hook 'python-mode-hook
		  '(lambda ()
			 (local-set-key (kbd "RET") 'newline-and-indent)
			 (local-set-key (kbd "C-c b") 'python-insert-breakpoint)
			 (setq python-indent 4)))

(add-hook 'c-mode-hook
		  '(lambda ()
			 (local-set-key (kbd "RET") 'newline-and-indent)))

(add-hook 'lisp-mode-hook
		  '(lambda ()
			 (local-set-key (kbd "RET") 'newline-and-indent)))

(add-hook 'emacs-lisp-mode-hook
		  '(lambda ()
			 (local-set-key (kbd "RET") 'newline-and-indent)))

(setq auto-mode-alist
      (append '(("README" . text-mode)
				("\\.pk[sb]\\'" . sql-mode))
			  auto-mode-alist))

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

;; cursor handling

(setq djcb-read-only-color       "gray")
(setq djcb-read-only-cursor-type 'hbar)
(setq djcb-overwrite-color       "red")
(setq djcb-overwrite-cursor-type 'box)
(setq djcb-normal-color          "black")
(setq djcb-normal-cursor-type    'bar)

(defun djcb-set-cursor-according-to-mode ()
  "change cursor color and type according to some minor modes."
  (cond
   (buffer-read-only
	(set-cursor-color djcb-read-only-color)
	(setq cursor-type djcb-read-only-cursor-type))
   (overwrite-mode
	(set-cursor-color djcb-overwrite-color)
	(setq cursor-type djcb-overwrite-cursor-type))
   (t 
	(set-cursor-color djcb-normal-color)
	(setq cursor-type djcb-normal-cursor-type))))

(add-hook 'post-command-hook 'djcb-set-cursor-according-to-mode)
