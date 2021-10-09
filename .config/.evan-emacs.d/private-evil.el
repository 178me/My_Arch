;; evil
(use-package evil
  :ensure t
  :hook (after-init . evil-mode)
  :bind ((:map evil-normal-state-map
               ;; 功能
			   (",," . push-button)
			   (",<" . previous-buffer)
			   (",>" . next-buffer)
               (",." . (lambda () (interactive) (evil-find-char 1 ?<) (delete-char 4) (evil-insert-state)))
               ;; 快速移动
               ("J" . (lambda () (interactive) (next-line 5)))
               ("K" . (lambda () (interactive) (previous-line 5)))
			   ("Q" . evil-quit)
			   ("S" . save-buffer)
			   ("zz" . evil-end-of-line)
			   ("za" . evil-digit-argument-or-evil-beginning-of-line))
		 (:map evil-insert-state-map
               ;; 被映射的原字符
               ("j`" . (lambda () (interactive) (insert "`")))
               ("jJ" . (lambda () (interactive) (insert "j")))
               ;; 快速编辑
               ("``" . (lambda () (interactive) (evil-find-char 1 ?<) (delete-char 4) (evil-insert-state)))
               ("`1" . (lambda () (interactive) (insert "<++> :: <++>")(evil-normal-state)(evil-backward-word-begin 4) (evil-insert-state)))
               ("`=" . (lambda () (interactive) (backward-char 4)))
               ;; 插入下的emacs操作
               ("C-n" . (lambda () (interactive) (next-line 1)))
               ("C-p" . (lambda () (interactive) (previous-line 1)))
               ("C-a" . (lambda () (interactive) (lispy-move-beginning-of-line)))
               ("C-e" . (lambda () (interactive) (lispy-move-end-of-line)))
               ;; org
               ("C-d" . (lambda () (interactive) (org-metaleft)))
               ("`-" . (lambda () (interactive) (lispy-move-beginning-of-line) (lispy-move-end-of-line) (org-meta-return) (org-metaleft) (lispy-move-beginning-of-line)(lispy-move-end-of-line) (recenter-top-bottom)))
               ("`=" . (lambda () (interactive) (lispy-move-beginning-of-line) (lispy-move-end-of-line) (org-meta-return) (org-metaright) (org-ctrl-c-minus) (lispy-move-beginning-of-line)(lispy-move-end-of-line) (recenter-top-bottom)))
               ;; ("M-d" . (lambda () (interactive) (org-metaleft)))
               ;; ("M-d" . (lambda () (interactive) (org-metaleft)))
               ;; 插入模式Paste
               ("`p" . clipboard-yank)
               ("`u" . undo)
               ;; 中文字符转换
               ("×" . (lambda () (interactive) (insert "*")))
               ("（" . (lambda () (interactive) (insert "(")))
               ("）" . (lambda () (interactive) (insert ")")))
               ("：" . (lambda () (interactive) (insert ":")))
               ;; 快速退出插入模式
               ("jj" . evil-normal-state))))

(provide 'private-evil)
