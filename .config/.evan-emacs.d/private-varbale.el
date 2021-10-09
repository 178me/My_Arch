(setq
 ;; 字体相关
 ;; 英文字体
 is-need-meow-module t
 evan/en-font-size 23
 ;; 中文字体
 evan/zh-font-size 23
 ;; 翻页间隔行数
 scroll-margin 10
 hscroll-margin 20
 ;; 不需要meow
 is-need-meow-module nil
 ;; 代理相关
 evan/proxy-port "1081"
 ;; 默认浏览器打开
 browse-url-browser-function 'browse-url-default-browser
 )
;; (setq circadian-themes '((:sunrise . doom-one-light)
;; 						 (:sunset . doom-one-light)))
(use-package emacs 
  :config
 (setq display-line-numbers-type 'relative) 
 (global-display-line-numbers-mode t))

(setq mouse-avoidance-banish-position '((frame-or-window . frame)
                                              (side . right)
                                              (side-pos . 3)
                                              (top-or-bottom . top)
                                              (top-or-bottom-pos . 0)))

(provide 'private-varbale)
