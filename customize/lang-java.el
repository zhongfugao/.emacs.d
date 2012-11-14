;; JDEE configuration
(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugin/jdee/lisp"))

(defun screen-width nil -1)
(define-obsolete-function-alias 'make-local-hook 'ignore "21.1")

;; 解决Cannot open load file: semantic-ctxt
;;(require 'semantic/analyze)
;;(provide 'semantic-analyze)
;;(provide 'semantic-ctxt)
;;(provide 'semanticdb)
;;(provide 'semanticdb-find)
;;(provide 'semanticdb-mode)
;;(provide 'semantic-load)
;;(provide 'semantic-sb)
;;(provide 'semantic-java)
;;(provide 'semantic-imenu)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugin/cedet-1.1/common"))
(load-file "~/.emacs.d/plugin/cedet-1.1/common/cedet.el")

(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugin/elib-1.0"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugin/ecb-2.40"))
(load-file (expand-file-name "~/.emacs.d/plugin/ecb-2.40/ecb.el"))

(require 'font-lock)
(require 'ecb)
(require 'ecb-autoloads)
(require 'jde)

(message "JDE is loaded")

;; defer the loading of jde
(setq defer-loading-jde t)
;;
(if defer-loading-jde
        (progn
          (autoload 'jde-mode "jde" "JDE mode." t)
          (setq auto-mode-alist
                (append
                 '(("\\.java\\'" . jde-mode))
                 auto-mode-alist)))
      (require 'jde))
(setq jde-jdk-registry 
	 (quote (("1.6.0_35" . "/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents")
		 ("1.7.0_07" . "/Library/Java/JavaVirtualMachines/jdk1.7.0_07.jdk/Contents"))))
(setq jde-jdk '("1.6.0_35"))

(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                      global-semanticdb-minor-mode
                                      global-semantic-idle-summary-mode
                                      global-semantic-decoration-mode
                                      global-semantic-highlight-func-mode
                                      global-semantic-stickyfunc-mode
                                      global-semantic-mru-bookmark-mode))
(setq semantic-load-turn-everything-on t)
;;(require 'semantic-mode)
;;(require 'semantic/senator)
;;(require 'semantic)
;;(require 'semantic/ia)
;;(require 'semantic/wisent)
;;(require 'semantic/wisent/java-tags)



;;(custom-set-varibles
;; '(jde-complete-function (quote jde-complete-function)))

(provide 'lang-java)
