;;; package --- lbolla .emacs file
;;; Commentary:
;;; 14 March 2014

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote (("." . "~/.emacs.d/backups"))))
 '(custom-safe-themes (quote ("b905f1a2ee4653ea1bfbc0184d3338122782acf03d7104123c07670a8fab9bff" default)))
 '(delete-old-versions t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-set-key "\C-x\C-b" 'buffer-menu)
(set-face-attribute 'default nil :height 120)
(load-theme 'lorenzo)

(defmacro timeit (what &rest body)
  "Time WHAT and run BODY and report real time taken to do so."
  `(let ((start-time (float-time)))
     (progn ,@body)
     (let ((elapsed-time (- (float-time) start-time)))
       (message "Completed %s in %.4f seconds" ,what elapsed-time)
       elapsed-time)))

(defmacro hook-into-modes (func modes)
  "Add FUNC to MODES hooks."
  `(dolist (mode-hook ,modes)
     (add-hook mode-hook ,func)))

;;; Packages
(require 'package)

;; Repositories
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Load all downloaded packages
(package-initialize)

;; Package management
;; See https://github.com/jwiegley/dot-emacs/blob/master/init.el
(require 'use-package)

(use-package evil
  :ensure t
  :init (timeit
	 "EVIL"

	 (defun new-tab ()
	   "Open file in new tab."
	   (interactive)
	   (ido-find-file-other-frame))

	 (defun delete-tab ()
	   "Delete current tab."
	   (interactive)
	   (delete-frame))

	 (defun next-tab ()
	   "Switch to next tab."
	   (interactive)
	   (other-frame 1))

	 (defun previous-tab ()
	   "Switch to previous tab."
	   (interactive)
	   (other-frame -1))

	 (use-package evil-nerd-commenter
	   :ensure t)

	 (evil-mode t)
	 (define-key evil-normal-state-map (kbd ",t") 'new-tab)
	 (define-key evil-normal-state-map (kbd "C-w t") 'new-tab)
	 (define-key evil-normal-state-map (kbd "C-w x") 'delete-tab)
	 (define-key evil-normal-state-map (kbd "gt") 'next-tab)
	 (define-key evil-normal-state-map (kbd "gT") 'previous-tab)
	 (define-key evil-normal-state-map (kbd ",gg") 'vc-git-grep)
	 (define-key evil-normal-state-map (kbd ",c") 'evilnc-comment-or-uncomment-lines)
	 (define-key evil-visual-state-map (kbd ",c") 'evilnc-comment-or-uncomment-lines)))

(use-package flycheck
  :ensure t
  :init (timeit
	 "FLYCHECK"
	 (add-hook 'after-init-hook #'global-flycheck-mode)
	 (setq flycheck-highlighting-mode 'lines)
	 (setq python-check-function "flake8")))

(use-package ido
  :ensure t
  :init (timeit
	 "IDO"
	 (ido-mode t)
	 (ido-everywhere t)
	 (setq ido-enable-flex-matching t)
	 (setq ido-file-extensions-order '(".py" ".js" ".emacs" t))))

(use-package tool-bar
  :init (progn
	  (tool-bar-mode 0)))

(use-package hl-line
  :init (progn
	  (global-hl-line-mode)))

(use-package scroll-bar
  :init (progn
	  (scroll-bar-mode nil)))

(use-package menu-bar
  :init (progn
	  (menu-bar-mode t)))

(use-package frame
  :init (progn
	  (blink-cursor-mode nil)))

(use-package paren
  :init (progn
	  (show-paren-mode t)))

(use-package xclip
  :ensure t
  :init (timeit
	 "XCLIP"
	 (xclip-mode t)))

(use-package projectile
  :ensure t
  :init (timeit
	 "PROJECTILE"
	  (projectile-global-mode)
	  (define-key evil-normal-state-map "\C-p" 'projectile-find-file)))

(use-package go-mode
  :ensure t
  :defer t
  :config (timeit
	   "GO-MODE"
	   (add-hook 'before-save-hook 'gofmt-before-save)
	   (add-hook 'go-mode-hook 'auto-complete-mode)))

(use-package virtualenvwrapper
  :ensure t
  :defer t
  :config (timeit
	   "VENV"
	   (venv-initialize-interactive-shells)
	   (venv-initialize-eshell)))

(use-package w3m
  :ensure t
  :defer t)

(use-package xclip
  :disabled t
  :ensure t
  :defer t)

(use-package yaml-mode
  :ensure t
  :mode ("\\.ya?ml\\'" . yaml-mode))

(use-package text-mode
  :mode "README"
  :init (progn
	  (add-hook 'text-mode-hook
		    (lambda ()
		      (flyspell-mode t)))))

(use-package jedi
  :ensure t
  :commands jedi:setup
  :config (timeit
	   "JEDI"
	   (setq jedi:complete-on-dot t)
	   (setq jedi:tooltip-method nil)))

(use-package electric
  :init (timeit
	 "ELECTRIC"
	 ;; Ignoring electric indentation
	 (defun electric-indent-ignore-python (char)
	   "Ignore electric indentation for 'python-mode' after CHAR."
	   (if (equal major-mode 'python-mode)
	       `no-indent'
	     nil))
	 (electric-indent-mode t)
	 (add-hook 'electric-indent-functions
		   'electric-indent-ignore-python)))

(use-package python
  :mode ("\\.pyx\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :init (progn
	  (defun python-insert-breakpoint ()
	    "Insert Python breakpoint above point."
	    (interactive)
	    (evil-open-above 1)
	    (insert "import ipdb; ipdb.set_trace()  # BREAKPOINT")
	    (evil-normal-state)))
  :config (timeit
	 "PYTHON"
	  (font-lock-add-keywords
	   'python-mode
	   '(("\\<\\(TODO\\)\\>" 1 font-lock-warning-face t)
	     ("\\<\\(FIXME\\)\\>" 1 font-lock-warning-face t)))
	  (add-hook 'python-mode-hook
		    (lambda ()
		      ;; Underscore part of word in Python
		      (modify-syntax-entry ?\_ "w" python-mode-syntax-table)
		      ;; Autocompletion
		      (jedi:setup)
		      ;; Keybidings
		      (define-key evil-normal-state-map (kbd ",b") 'python-insert-breakpoint)
		      ;; Enter key executes newline-and-indent
		      (local-set-key (kbd "RET") 'newline-and-indent)))))

(use-package js
  :init (progn
	  (add-hook 'js-mode-hook
		    (lambda ()
		      (modify-syntax-entry ?\_ "w")))))

(use-package sql
  :init (progn
	  (add-hook 'sql-mode-hook
		    (lambda ()
		      (modify-syntax-entry ?\_ "w")))))

(use-package whitespace
  :ensure t
  :init (timeit
	 "WHITESPACE"
	 (hook-into-modes 'whitespace-mode '(python-mode-hook))
	 ;; Highlight portion of lines >79
	 (setq whitespace-line-column 79)
	 (setq whitespace-style '(face lines-tail))))

(use-package smtpmail
  :config (progn
	    (setq send-mail-function 'smtpmail-send-it
		  smtpmail-smtp-server "smtp.yougov.com"
		  smtpmail-smtp-service 465
		  ;; smtpmail-mail-address "Lorenzo Bolla <lorenzo.bolla@yougov.com>"
		  smtpmail-stream-type 'starttls)))

(use-package rcirc
  :ensure t
  :defer t
  :config (timeit
	   "RCIRC"
	   (defun my-rcirc-print-hook (process sender response target text)
	     "In PROCESS, if SENDER is not self, ignore RESPONSE and TARGET, beep when TEXT equals current nick."
	     (let ((alert "/usr/share/sounds/gnome/default/alerts/glass.ogg"))
	       (when (and (string-match (regexp-quote (rcirc-nick process)) text)
			  (not (string= (rcirc-nick process) sender))
			  (not (string= (rcirc-server-name process) sender)))
		 (start-process "beep" nil "mplayer" (expand-file-name alert)))))
	   (add-hook 'rcirc-print-functions 'my-rcirc-print-hook)
	   (add-hook 'rcirc-mode-hook
		     (lambda ()
		       (set (make-local-variable 'scroll-conservatively) 8192)
		       (rcirc-track-minor-mode t)
		       (flyspell-mode t)))
	   (setq rcirc-server-alist
		 '(("irc.yougov.net"
		    :nick "lbolla"
		    :password "pol1chat"
		    :port 6697
		    :encryption tls
		    :channels ("#brandindex" "#datum"))))
	   (defun-rcirc-command reconnect (arg)
	     "Reconnect the server process."
	     (interactive "i")
	     (unless process
	       (error "There's no process for this target"))
	     (let* ((server (car (process-contact process)))
		    (port (process-contact process :service))
		    (nick (rcirc-nick process))
		    channels query-buffers)
	       (dolist (buf (buffer-list))
		 (with-current-buffer buf
		   (when (eq process (rcirc-buffer-process))
		     (remove-hook 'change-major-mode-hook
				  'rcirc-change-major-mode-hook)
		     (if (rcirc-channel-p rcirc-target)
			 (setq channels (cons rcirc-target channels))
		       (setq query-buffers (cons buf query-buffers))))))
	       (delete-process process)
	       (rcirc-connect server port nick
			      rcirc-default-user-name
			      rcirc-default-full-name
			      channels)))))

(provide '.emacs)
;;; .emacs ends here
