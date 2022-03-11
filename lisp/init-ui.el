;; 主题
(use-package material-theme
  :init (load-theme 'material t))

;; 下边栏
(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t
	sml/theme 'respectful)
  (sml/setup))

;; 相对行号
(use-package emacs
  :config
;  (setq display-line-numbers-type 'relative)
  (global-display-line-numbers-mode t)) 

; dashboard花了我一天 2022年1月13日
(use-package dashboard
  :ensure t
  :hook (after-init . dashboard-setup-startup-hook)
  :config
  (dashboard-setup-startup-hook)
  (dashboard-modify-heading-icons '((recents . "file-text") 
                                    (bookmarks . "book")))
  ;; 设置标题
  (setq dashboard-banner-logo-title
        "Help poor children in Uganda!")
  ;; 设置banner
  (setq dashboard-startup-banner 'official)
  (setq dashboard-center-content t)
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-navigator t)
  (add-hook 'after-init-hook (lambda () (dashboard-refresh-buffer))))


(provide 'init-ui)
