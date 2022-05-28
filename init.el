;; -*- lexical-binding: t -*-


(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-startup)
(require 'init-kdb)
(require 'init-elpa)
(require 'init-packages)
(require 'init-ui)
(require 'init-php)
(require 'init-cc)
(require 'init-org)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yasnippet-snippets yasnippet smart-compile modern-cpp-font-lock restart-emacs which-key web-mode use-package typescript-mode treemacs-icons-dired treemacs-evil smart-mode-line rust-mode rainbow-delimiters org-bullets neotree material-theme markdown-mode hungry-delete flycheck emmet-mode drag-stuff dashboard crux counsel centaur-tabs benchmark-init all-the-icons-dired)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
