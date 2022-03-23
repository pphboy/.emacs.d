;; 主题
(use-package material-theme
  :init (load-theme 'material t))


(use-package all-the-icons)

;; icon show
(use-package all-the-icons-dired
  :init
;	(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
  )
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


(use-package centaur-tabs
   ;;:load-path "~/.emacs.d/other/centaur-tabs"
   :config
   (setq centaur-tabs-style "bar"
	  centaur-tabs-height 32
	  centaur-tabs-set-icons t
	  centaur-tabs-set-modified-marker t
	  centaur-tabs-show-navigation-buttons t
	  centaur-tabs-set-bar 'under
	  x-underline-at-descent-line t)
   
   (centaur-tabs-headline-match)
   ;; (setq centaur-tabs-gray-out-icons 'buffer)
   ;; (centaur-tabs-enable-buffer-reordering)
   ;; (setq centaur-tabs-adjust-buffer-order t)
   (centaur-tabs-mode t)
    ;; 更换字体
    (centaur-tabs-change-fonts "Jetbrains Mono" 100)

   (setq uniquify-separator "/")
   (setq uniquify-buffer-name-style 'forward)
   (defun centaur-tabs-buffer-groups ()
     "`centaur-tabs-buffer-groups' control buffers' group rules.

 Group centaur-tabs with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
 All buffer name start with * will group to \"Emacs\".
 Other buffer group by `centaur-tabs-get-group-name' with project name."
     (list
      (cond
	;; ((not (eq (file-remote-p (buffer-file-name)) nil))
	;; "Remote")
	((or (string-equal "*" (substring (buffer-name) 0 1))
	     (memq major-mode '(magit-process-mode
				magit-status-mode
				magit-diff-mode
				magit-log-mode
				magit-file-mode
				magit-blob-mode
				magit-blame-mode
				)))
	 "Emacs")
	((derived-mode-p 'prog-mode)
	 "Editing")
	((derived-mode-p 'dired-mode)
	 "Dired")
	((memq major-mode '(helpful-mode
			    help-mode))
	 "Help")
	((memq major-mode '(org-mode
			    org-agenda-clockreport-mode
			    org-src-mode
			    org-agenda-mode
			    org-beamer-mode
			    org-indent-mode
			    org-bullets-mode
			    org-cdlatex-mode
			    org-agenda-log-mode
			    diary-mode))
	 "OrgMode")
	(t
	 (centaur-tabs-get-group-name (current-buffer))))))
   :hook
   (dashboard-mode . centaur-tabs-local-mode)
   (term-mode . centaur-tabs-local-mode)
   (calendar-mode . centaur-tabs-local-mode)
   (org-agenda-mode . centaur-tabs-local-mode)
   (helpful-mode . centaur-tabs-local-mode)
   :bind
   ("C-<prior>" . centaur-tabs-backward)
   ("C-<next>" . centaur-tabs-forward)
   ("C-c t s" . centaur-tabs-counsel-switch-group)
   ("C-c t p" . centaur-tabs-group-by-projectile-project)
   ("C-c t g" . centaur-tabs-group-buffer-groups)
   (:map evil-normal-state-map
	  ("g t" . centaur-tabs-forward)
	  ("g T" . centaur-tabs-backward)))


(provide 'init-ui)
