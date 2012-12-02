(add-to-list 'load-path "/Applications/Emacs.app/Contents/Resources/site-lisp")

(message "Mac OS X detected.")

(setq-default ispell-program-name "/usr/local/bin/aspell")

;; add path and exec-path within MacOS 
;;(setenv "PATH" (concat "/usr/local/bin:/usr/local/sbin:" (getenv "PATH")))
;;(setq exec-path (append '("/usr/local/bin" "/usr/local/sbin") exec-path))

(require 'init-exec-path)
(require 'lang-auctex)
