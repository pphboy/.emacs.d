;;; package --- Sum packages Configuration
;;; Commentary:
;;; Code:

(use-package restart-emacs)


(use-package neotree
  :init
   (add-hook 'neotree-mode-hook
		(lambda ()
			(define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
			(define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
			(define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
			(define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
	;; 当执行 projectile-switch-project (C-c p p) 时，NeoTree 会自动改变根目录。
	(setq projectile-switch-project-action 'neotree-projectile-action)
	;; 关闭固定窗口
	;; (setq neo-window-fixed-size nil)
	;; 改变默认宽度
	;; (setq neo-window-width 28)
	;; 主题 
	:config
	(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  :bind (("<f8>" . neotree-toggle)))

;; treemacs start
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-directory-name-transformer      #'identity
          treemacs-display-in-side-window          t
          treemacs-eldoc-display                   'simple
          treemacs-file-event-delay                5000
          treemacs-file-extension-regex            treemacs-last-period-regex-value
          treemacs-file-follow-delay               0.2
          treemacs-file-name-transformer           #'identity
          treemacs-follow-after-init               t
          treemacs-expand-after-init               t
          treemacs-find-workspace-method           'find-for-file-or-pick-first
          treemacs-goto-tag-strategy               'refetch-index
          treemacs-indentation                     2
          treemacs-indentation-string              " "
          treemacs-is-never-other-window           nil
          treemacs-missing-project-action          'ask
          treemacs-move-forward-on-expand          nil
          treemacs-no-png-images                   nil
          treemacs-no-delete-other-windows         t
          treemacs-project-follow-cleanup          nil
          treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                        'left
          treemacs-read-string-input               'from-child-frame
          treemacs-recenter-distance               0.1
          treemacs-recenter-after-file-follow      nil
          treemacs-recenter-after-tag-follow       nil
          treemacs-recenter-after-project-jump     'always
          treemacs-recenter-after-project-expand   'on-distance
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
          treemacs-show-cursor                     nil
          treemacs-show-hidden-files               t
          treemacs-silent-filewatch                nil
          treemacs-silent-refresh                  nil
          treemacs-sorting                         'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes        t
          treemacs-tag-follow-cleanup              t
          treemacs-tag-follow-delay                1.5
          treemacs-text-scale                      nil
          treemacs-user-mode-line-format           nil
          treemacs-user-header-line-format         nil
          treemacs-wide-toggle-width               70
          treemacs-width                           35
          treemacs-width-increment                 1
          treemacs-width-is-initially-locked       t
          treemacs-workspace-switch-cleanup        nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t c f"   . treemacs-create-file)
        ("C-x t c d"   . treemacs-create-dir)
        ("C-x t c r"   . treemacs-rename-file)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))


(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)


;; 目前没有使用 persp
;(use-package treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
  ;:after (treemacs persp-mode) ;;or perspective vs. persp-mode
  ;:ensure t
  ;:config (treemacs-set-scope-type 'Perspectives))

;; 目前没有使用projectile
;(use-package treemacs-projectile
;  :after (treemacs projectile)
;  :ensure t)

;; treemacs end


;; 开启Evil
(use-package evil
  :init
  (evil-mode 1)
  :config
  (evil-set-initial-state 'dired-mode 'emacs))

(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))

;; 删除光标所在当前行pp
(use-package crux
  :bind ("C-c k" . crux-smart-kill-line))

;; 删除连续的非空字符
(use-package hungry-delete
  :bind (("C-c DEL" . hungry-delete-backward))
  :bind (("C-c d" . hungry-delete-forward)))

(use-package drag-stuff
  :bind (("<M-up>" . drag-stuff-up)
	 ("<M-down>" . drag-stuff-down)))

(use-package ivy
  :defer 1
  :demand
  :hook (after-init . ivy-mode)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
	ivy-initial-inputs-alist nil
	ivy-count-format "%d%d"
	enable-recursive-minibuffers t
	ivy-re-builders-alist '((t . ivy--regex-ignore-order))))

(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("C-c f" . counsel-recentf)
	 ("C-c g" . counsel-git)))

(use-package swiper
  :after (ivy)
  :bind (("C-s" . swiper)
	 ("C-r" . swiper-isearch-backward))
  :config (setq swiper-action-recenter t
		swiper-include-line-number-in-search t))

;; 语法检查插件
(use-package flycheck
  :hook (after-init . global-flycheck-mode))

;; 快捷操作
(use-package crux
  :bind (("C-a" . crux-move-beginning-of-line)
	 ("C-c ^" . crux-top-join-line)
	 ("C-x ," . crux-find-user-init-file)
	 ("C-S-d" . crux-duplicate-current-line-or-region)
	 ("C-S-k" . crux-smart-kill-line)))

;; 快捷键查询
(use-package which-key
  :defer nil
  :config (which-key-mode))


;; 管理窗口
(use-package ace-window
  :bind (("M-o" . ace-window)))


;; Lang Plugin
;; Rust Lang
(use-package rust-mode)

;; web mode 可以包括 vue-mode
(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
  )

;; Emmet插件 快速编写 HTML 代码
(use-package emmet-mode
  :defer 3
  :init (setq emmet-expand-jsx-className? t)
  :hook (web-mode typescript-mode js-mode vue-mode)
  :config
  (add-to-list 'emmet-jsx-major-modes 'js-mode)
  (add-to-list 'emmet-jsx-major-modes 'typescript-mode))

;; typescript语法插件
(use-package typescript-mode)

;; markdown 插件
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))


;; 彩虹括号
(use-package rainbow-delimiters
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))



;;; init-packages.el ends here
(provide 'init-packages)
