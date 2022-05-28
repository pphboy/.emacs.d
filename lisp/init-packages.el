;;; package --- Sum packages Configuration
;;; Commentary:
;;; Code:

(use-package restart-emacs)


(use-package neotree
  :init
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

(use-package smart-compile)

;;; init-packages.el ends here
(provide 'init-packages)
