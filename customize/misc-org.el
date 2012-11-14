;; 中文编辑自动换行
(add-hook 'org-mode-hook 
(lambda () (setq truncate-lines nil)))

(setq org-todo-keywords
      '((sequence "TODO" "ONGOING" "|" "DONE")))

(setq org-support-shift-select t)
(setq org-log-done t)

(provide 'misc-org)
