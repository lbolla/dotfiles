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

(define-minor-mode fancy-cursor-mode
  "Fancy Cursor Mode
Change the cursor, depending if the buffer is read-only, or if overwrite is enabled or otherwise"
  :init-value nil :lighter " FC"
  
  ;; TODO: use a better data structure
  ;; TODO: (fancy-cursor-mode ARG) accept an arg!
  ;; TODO: hide helper function
  ;; TODO: publish it
  (setq fancy-cursor-old-cursor-color      (frame-parameter nil 'cursor-color))
  (setq fancy-cursor-old-cursor-type       (frame-parameter nil 'cursor-type))

  (setq fancy-cursor-read-only-color       "gray")
  (setq fancy-cursor-read-only-cursor-type 'hbar)
  
  (setq fancy-cursor-overwrite-color       "red")
  (setq fancy-cursor-overwrite-cursor-type 'box)
  
  (setq fancy-cursor-normal-color          "black")
  (setq fancy-cursor-normal-cursor-type    'bar)

  (defun fancy-cursor-set-cursor ()
    "change cursor color and type according to some minor modes."
    (cond
     (buffer-read-only
      (set-cursor-color fancy-cursor-read-only-color)
      (setq cursor-type fancy-cursor-read-only-cursor-type))
     (overwrite-mode
      (set-cursor-color fancy-cursor-overwrite-color)
      (setq cursor-type fancy-cursor-overwrite-cursor-type))
     (t
      (set-cursor-color fancy-cursor-normal-color)
      (setq cursor-type fancy-cursor-normal-cursor-type))))
  
  ;; toggle minor-mode
  (if fancy-cursor-mode
      (add-hook 'post-command-hook 'fancy-cursor-set-cursor nil t)
    (progn
      (remove-hook 'post-command-hook 'fancy-cursor-set-cursor t)
      (set-cursor-color fancy-cursor-old-cursor-color)
      (setq cursor-type fancy-cursor-old-cursor-type))))
;;
;; Generic settings
;;

(menu-bar-mode 1)
(tool-bar-mode 0)
(transient-mark-mode 1)
(show-paren-mode 1)
(delete-selection-mode 1)

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

;; python indentation: which one is necessary?

(setq column-number-mode t)

(defun my-pystuff ()
  (setq tab-width 4
        python-indent 4))

(add-hook 'python-mode-hook 'my-pystuff)

;; Geneity stuff from Matt.
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq sgml-basic-offset 4)

;; grep: --exclude, --exclude-from, --exclude-dir