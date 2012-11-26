(defun yodao-dict-search-wordap (word)
  "Use python script dict to look up word under point"
  (interactive "sYodao search word: ")
 ;; (or word (setq word (current-word)))
  (shell-command (format "python ~/.emacs.d/utils/pyton-dict.1.0.1/dict.py %s" word)))


(global-set-key [f7] 'yodao-dict-search-wordap)


(provide 'misc-yodao-dictionary)
