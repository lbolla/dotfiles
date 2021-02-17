;;; package --- custom file
;;; Commentary:
;;; 13 December 2020

;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-spacing 0.2)
 '(load-prefer-newer t)
 '(mouse-autoselect-window nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   '(groovy-mode protobuf-mode clang-format modus-themes typescript-mode org-plus-contrib dpkg-dev-el company highlight-indentation rust-mode yasnippet pyvenv undo-tree elixir-mode calfw-cal calfw-org calfw lsp-java all-the-icons lsp-treemacs dap-mode avy minions quasi-monochrome-theme org-roam org-ref deft org-ql-view doom-themes org-ql lsp-ui tao-theme copy-as-format edit-server lsp-python-ms rjsx-mode eyebrowse lsp-mode ivy-hydra flycheck-color-mode-line flycheck-pycheckers expand-region esup magit-todos nnir poet-theme goose-theme flycheck-rust flycheck-popup-tip nim nim-mode text-mode prog-mode lisp-mode evil-org-agenda elpy which-key dumb-jump leuven-theme evil-collection tablist evil-org zoom-window rg dockerfile-mode racer toml-mode lua-mode ess counsel yaml-mode xclip web-mode use-package swiper spinner queue projectile pass paredit markdown-mode magit macrostep json-mode js2-mode hexrgb go-mode gnus-desktop-notify flycheck-flow flycheck-dialyzer flycheck-cython evil-nerd-commenter evil-matchit evil cython-mode cyberpunk-theme csv-mode))
 '(safe-local-variable-values
   '((flycheck-pycheckers-checkers flake8)
     (flycheck-pycheckers-checkers "flake8")
     (flycheck-pycheckers-max-line-length . 120)
     (lsp-python-ms-extra-paths "system")
     (eval add-hook 'after-save-hook
           (lambda nil
             (org-ascii-export-to-ascii nil))
           t t)
     (elpy-test-runner . elpy-test-pytest-runner)
     (eval add-hook 'after-save-hook
           (lambda nil
             (org-html-export-to-html nil))
           t t)
     (eval setenv "LAUNCH_DB" "1")))
 '(scroll-conservatively 101))

;; Preferred fonts: Terminus, Iosevka, SourceSerifPro, EBGaramond
;; More at https://fonts.google.com/?category=Serif&sort=popularity
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka" :weight light :height 120))))
 '(fixed-pitch ((t (:family "Iosevka" :height 120))))
 '(fixed-pitch-serif ((t (:family "FreeMono" :height 120))))
 '(variable-pitch ((t (:family "Gentium" :height 140)))))
 ;; '(mode-line ((t (:background "gray55"))))
 ;; '(region ((t (:background "#50506f"))))

(provide 'custom)
;;; custom.el ends here
