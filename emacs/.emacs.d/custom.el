;;; package --- custom file
;;; Commentary:
;;; 13 December 2020

;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(awesome-tray-mode-line-active-color "#2fafff")
 '(awesome-tray-mode-line-inactive-color "#323232")
 '(exwm-floating-border-color "#646464")
 '(flymake-error-bitmap '(flymake-double-exclamation-mark modus-themes-fringe-red))
 '(flymake-note-bitmap '(exclamation-mark modus-themes-fringe-cyan))
 '(flymake-warning-bitmap '(exclamation-mark modus-themes-fringe-yellow))
 '(highlight-tail-colors '(("#2f4a00" . 0) ("#00415e" . 20)))
 '(hl-todo-keyword-faces
   '(("HOLD" . "#cfdf30")
     ("TODO" . "#feacd0")
     ("NEXT" . "#b6a0ff")
     ("THEM" . "#f78fe7")
     ("PROG" . "#00d3d0")
     ("OKAY" . "#4ae8fc")
     ("DONT" . "#70c900")
     ("FAIL" . "#ff8059")
     ("BUG" . "#ff8059")
     ("DONE" . "#44bc44")
     ("NOTE" . "#f0ce43")
     ("KLUDGE" . "#eecc00")
     ("HACK" . "#eecc00")
     ("TEMP" . "#ffcccc")
     ("FIXME" . "#ff9977")
     ("XXX+" . "#f4923b")
     ("REVIEW" . "#6ae4b9")
     ("DEPRECATED" . "#bfd9ff")))
 '(ibuffer-deletion-face 'modus-themes-mark-del)
 '(ibuffer-filter-group-name-face 'modus-themes-mark-symbol)
 '(ibuffer-marked-face 'modus-themes-mark-sel)
 '(ibuffer-title-face 'modus-themes-pseudo-header)
 '(line-spacing 0.2)
 '(load-prefer-newer t t)
 '(mouse-autoselect-window nil)
 '(org-src-block-faces 'nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   '(zig-mode evil-org evil-org-mode poetry qml-mode lsp-haskell haskell-mode csharp-mode charp-mode yasnippet-snippets flycheck-checkbashisms exec-path-from-shell treemacs-magit treemacs-projectile modus-themes forge groovy-mode protobuf-mode clang-format typescript-mode org-plus-contrib dpkg-dev-el company highlight-indentation rust-mode yasnippet pyvenv undo-tree elixir-mode calfw-cal calfw-org calfw lsp-java all-the-icons lsp-treemacs dap-mode avy minions quasi-monochrome-theme org-roam org-ref deft org-ql-view doom-themes org-ql lsp-ui tao-theme copy-as-format edit-server lsp-python-ms rjsx-mode eyebrowse lsp-mode ivy-hydra flycheck-color-mode-line flycheck-pycheckers expand-region esup magit-todos nnir poet-theme goose-theme flycheck-rust flycheck-popup-tip nim nim-mode text-mode prog-mode lisp-mode evil-org-agenda elpy which-key dumb-jump leuven-theme evil-collection tablist zoom-window rg dockerfile-mode racer toml-mode lua-mode ess counsel yaml-mode xclip web-mode use-package swiper spinner queue projectile pass paredit markdown-mode magit macrostep json-mode js2-mode hexrgb go-mode gnus-desktop-notify flycheck-flow flycheck-dialyzer flycheck-cython evil-nerd-commenter evil-matchit evil cython-mode cyberpunk-theme csv-mode))
 '(safe-local-variable-values
   '((flycheck-pycheckers-max-line-length . 130)
     (flycheck-pycheckers-checkers flake8 mypy3)
     (flycheck-pycheckers-checkers flake8)
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
 '(scroll-conservatively 101)
 '(vc-annotate-background-mode nil)
 '(warning-suppress-types '((lsp-mode)))
 '(xterm-color-names
   ["black" "#ff8059" "#44bc44" "#eecc00" "#2fafff" "#feacd0" "#00d3d0" "gray65"])
 '(xterm-color-names-bright
   ["gray35" "#f4923b" "#70c900" "#cfdf30" "#79a8ff" "#f78fe7" "#4ae8fc" "white"]))

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
