;; -*- lexical-binding: t -*-

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-startup)
(require 'init-kdb)
(require 'init-elpa)
(require 'init-packages)
(require 'init-ui)
(require 'init-org)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(material-theme nimbus-theme yasnippet-snippets which-key web-mode use-package typescript-mode treemacs-magit treemacs-icons-dired treemacs-evil smart-mode-line rust-mode restart-emacs rainbow-delimiters org-bullets nyan-mode neotree monokai-theme meghanada markdown-mode hungry-delete git-gutter emmet-mode drag-stuff dashboard crux counsel company-box benchmark-init all-the-icons-dired)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
