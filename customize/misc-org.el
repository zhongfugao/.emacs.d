;; 中文编辑自动换行
(add-hook 'org-mode-hook 
(lambda () (setq truncate-lines nil)))

(setq org-todo-keywords
      '((sequence "TODO" "ONGOING" "|" "DONE")))

(setq org-support-shift-select t)
(setq org-log-done t)

;; iimage in org
;;(add-to-list 'iimage-mode-image-regex-alist
;;	     (cons (concat "\\[\\[file:\\(~?" iimage-mode-image-filename-regex
;;			   "\\)\\]")  1))

(defun org-toggle-iimage-in-org ()
  "display images in your org file"
  (interactive)
  (if (face-underline-p 'org-link)
      (set-face-underline-p 'org-link nil)
    (set-face-underline-p 'org-link t))
  (iimage-mode))

(add-hook 'org-mode-hook
	  (lambda ()
	    ;; display images
	    (local-set-key "\M-I" 'org-toggle-iimage-in-org)
	    ;; fix tab
	    (local-set-key "\C-y" 'yank)
	    ;; yasnippet (allow yasnippet to do its thing in org files
	    
		;; publish
		(local-set-key "\M-e" 'org-export-as-html)
		(org-set-local 'yas/trigger-key [tab])
	    (define-key yas/keymap [tab] 'yas/next-field-group)))

(provide 'misc-org)
