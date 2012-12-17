(add-to-list 'load-path "/Applications/Emacs.app/Contents/Resources/site-lisp")

(message "Mac OS X detected.")

(setq-default ispell-program-name "/usr/local/bin/aspell")

;; add path and exec-path within MacOS 
;;(setenv "PATH" (concat "/usr/local/bin:/usr/local/sbin:" (getenv "PATH")))
;;(setq exec-path (append '("/usr/local/bin" "/usr/local/sbin") exec-path))

(setq jde-jdk-registry 
	 (quote (("1.6.0_35" . "/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents")
		 ("1.7.0_07" . "/Library/Java/JavaVirtualMachines/jdk1.7.0_07.jdk/Contents"))))
(setq jde-jdk '("1.6.0_35"))

(require 'init-exec-path)
(require 'lang-auctex)
