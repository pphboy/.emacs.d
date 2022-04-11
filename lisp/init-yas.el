;; 配了补全，但没有配提示，提示影响写代码


(use-package yasnippet)

(use-package yasnippet-snippets )

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        ))

(yas-global-mode 1)

(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)


(provide 'init-yas)
