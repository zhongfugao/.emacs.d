;; add load path
;(setq load-path (cons "~/.emacs.d" load-path))
;(setq load-path (cons "~/.emacs.d/customize" load-path))
;(setq load-path (cons "~/.emacs.d/utils" load-path))

;;;;;;;;;;;;;;;;;;;;;;add by Hadwin start;;;;;;;;;;;;;;;;;;;
;;try to load all config file under the base folder and subfolder, 
;;now we just support three level folder

(defun scanfolder(base)
  (add-to-list 'load-path base)
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name) 
		 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

(let ((base "~/.emacs.d"))           ;;;please change the base folder name here
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name) 
		 (not (equal f ".."))
                 (not (equal f ".")))
	(scanfolder name)))))

;;;;;;;;;;;;;;;;;;;;;;add by Hadwin end ;;;;;;;;;;;;;;;;;;;;


;; load configurations for different systems  
(if (string-equal system-type "darwin")
  (load "sys-macosx.el"))

(cond ((string-equal system-type "windows-nt")
      (load "sys-windows.el")))

;; Desktop save mode
(desktop-save-mode 1)

;; Common settings
(setq backup-directory-alist '(("" . "~/.emacs.d/.backups")))

;; Marking regions by C-2
(global-set-key (kbd "C-2") 'set-mark-command)

;; Highlight FIXME, TODO and BUG
(font-lock-add-keywords nil
			'(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))

;; Alternative for show-paren-mode
(require 'mic-paren)
(paren-activate)

;; Syntax highlight
(global-font-lock-mode t)

;; Bookmark
(setq 
 bookmark-default-file "~/.emacs.d/bookmarks"
 bookmark-save-flag 1)

;; Getting rid of the 'yes or no' prompt and replace it with 'y or n'
(fset 'yes-or-no-p 'y-or-n-p)

;; Color theme
(setq custom-theme-load-path  (cons "~/.emacs.d/utils/themes/emacs-color-theme-solarized" custom-theme-load-path))
(load-theme 'solarized-dark t)

;; Column display ON
(column-number-mode t)

;; Load GUI settings 
(cond
 ((eq initial-window-system nil)
  (message "Console"))
 (t (load "gui-settings.el")))

;; utils
(load "my-utils.el")

;; Ask before quitting
(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (save-buffers-kill-emacs)    
    (message "Canceled exit")))

(global-set-key (kbd "C-x C-c") 'ask-before-closing)


;; load customized configuration
;(require 'lang-python)
;(require 'lang-java)
(require 'lang-ruby)
(require 'lang-lisp)
(require 'misc-gnus)
(require 'misc-translate)
(require 'lang-shell)

