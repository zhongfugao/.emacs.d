;; Dired mode
(add-hook 'dired-load-hook
          (lambda ()
            (setq dired-font-lock-keywords
                  (append dired-font-lock-keywords
                          (list
                           (list dired-re-exe
                                 '(".+" (dired-move-to-filename) nil (0
								      font-lock-type-face))))))))

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; ibuffer mode
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(setq ibuffer-show-empty-filter-groups nil)

;; ido-mode
;; use to auto show all choices when switching buffers or files
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
;;;;;;;;;;;;;;;;;;;;;;;;add by Hadwin start;;;;;;;;;;;;;;;;;;;;;;
(setq ido-confirm-unique-completion t)  ;; confirm only once
(setq ido-default-buffer-method 'samewindow)  
(setq ido-use-filename-at-point t)
;;;;;;;;;;;;;;;;;;;;;;;add by Hadwin end;;;;;;;;;;;;;;;;;;;;;;;;;
(ido-mode 1)

;; Make buffer name unique
(require 'uniquify)
(setq
 uniquify-buffer-name-style 'post-forward
 uniquify-separator ":")

;; winner begin
(require 'winner)
(setq winner-dont-bind-my-keys t) ;; default bindings conflict with org-mode

(global-set-key (kbd "C-c <left>") 'winner-undo)
(global-set-key (kbd "C-c <right>") 'winner-redo)
(winner-mode t) ;; turn on the global minor mode
;; winner end

;; auto complete begin
(require 'auto-complete)
(global-auto-complete-mode t)
;; auto complete end

;; markdown begin 
(add-to-list 'load-path "~/.emacs.d/utils/markdown-mode")
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.markdown" . markdown-mode)
            (cons '("\\.md" . markdown-mode)
                  (cons '("\\.text" . markdown-mode) auto-mode-alist))))
;; markdown end

;; org-mode begin
(require 'misc-org)

;; w3m mode
(add-to-list 'load-path "~/.emacs.d/plugins/emacs-w3m")
(require 'w3m-load)
;;(require 'mime-w3m)
