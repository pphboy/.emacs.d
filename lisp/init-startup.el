;; 编码
(set-language-info
     "UTF-8"
     'coding-priority
     '(utf-8 gb18030 gbk gb2312 iso-2022-cn chinese-big5 chinese-iso-8bit iso-8859-1))
    (prefer-coding-system 'cp950)
    (prefer-coding-system 'gb2312)
    (prefer-coding-system 'cp936)
    (prefer-coding-system 'gb18030)
    (prefer-coding-system 'utf-16)
    (prefer-coding-system 'utf-8-dos)
    (prefer-coding-system 'utf-8-unix)
    (prefer-coding-system 'utf-8)

 (setq file-name-coding-system 'gb18030)
(setq default-buffer-file-conding-system 'utf-8)



;; 字体 
;.;(set-frame-font "JetBrains Mono 13" )
(add-to-list 'default-frame-alist '(font . "JetBrains Mono-13"))
;; 中文字体
(set-fontset-font "fontset-default" 'gb18030' ("微软雅黑" . "unicode-bmp"))
;;(set-fontset-font "fontset-default" 'gb18030' ("宋体" . "unicode-bmp"))
;; 卡顿问题
(global-font-lock-mode t)
(setq font-lock-maximum-size 5000000)
;; 关闭菜单栏
(menu-bar-mode -1)
;; 关闭工具栏
(tool-bar-mode -1)
;; 关闭滚动条
(scroll-bar-mode -1)
;; 关闭启动界面
(setq inhibit-startup-screen t)
;; 关闭tab
(setq indent-tabs-mode nil)
;; 关闭emacs临时文件
(setq auto-save-default nil)
;; 关闭备份文件
(setq make-backup-files nil)
;; 设置 tab 为两个空格宽度
(setq-default tab-width 4)
(setq tab-width 4)
;;设置窗口位置为屏库左上角(0,0) WSL 中启动Emacs可能 需要使用到
;;(set-frame-position (selected-frame) 0 0)
;; 窗口最大化
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))

;; 关闭自动调节行高
(setq auto-window-vscroll nil)
;; 关闭自动换行的功能
(setq truncate-partial-width-windows nil)
;; 关闭代码展示居中
(setq mouse-yank-at-point nil)
;; 高亮对应的括号
(show-paren-mode 1)
;; 高亮当前行
(global-hl-line-mode 1)
;; 默认目录为~/.emacs.d/
(cd "~/.emacs.d/")

;; =------------
(setq url-gateway-method 'socks)
(setq socks-server '("Default server" "127.0.0.1" 10808 5))
;; -------- proxy config end

(provide 'init-startup)
