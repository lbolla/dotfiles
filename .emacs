(menu-bar-mode +1)
(tool-bar-mode -1)

(display-time-mode t)
(setq display-time-day-and-date t)
(display-battery-mode t)

(set-face-attribute 'default nil :height 80)

(require 'w3m-load)
(setq w3m-use-cookies t)

(add-hook 'python-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "RET") 'newline-and-indent)))