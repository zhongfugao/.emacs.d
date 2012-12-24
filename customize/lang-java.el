;; JDEE configuration
(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/jdee/lisp"))

(defun screen-width nil -1)
(define-obsolete-function-alias 'make-local-hook 'ignore "21.1")

(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/cedet-1.1/common"))
(load-file "~/.emacs.d/plugins/cedet-1.1/common/cedet.el")

(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/elib-1.0"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/ecb-2.40"))
(load-file (expand-file-name "~/.emacs.d/plugins/ecb-2.40/ecb.el"))

(require 'font-lock)
(require 'ecb)
(require 'ecb-autoloads)
(require 'jde)

(message "JDE is loaded")

(setq jde-complete-function (quote jde-complete-in-line))

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
