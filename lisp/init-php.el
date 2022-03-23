(use-package php-mode)
(add-hook 'php-mode-hook 'php-enable-default-coding-style)
(with-eval-after-load 'php-mode
  (define-key php-mode-map (kbd "C-c C--") 'php-current-class)
  (define-key php-mode-map (kbd "C-c C-=") 'php-current-namespace))

(provide 'init-php)
