;;compilation
(setq compilation-scroll-output t)

;;cedet
(require 'semantic-ia)
(require 'semantic-gcc)

(semantic-load-enable-excessive-code-helpers)
(setq semantic-load-turn-everything-on t)
(require 'semantic-load)

(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)

(setq c-basic-offset 4)

(defun my-c-mode-common-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  (setq default-tab-width 4)
  (setq column-number-mode t)
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (define-key company-mode-map "\t" nil)
  (define-key company-mode-map [(backtab)] 'company-complete-common)

  (setq c-macro-shrink-window-flag t)
  (setq c-macro-preprocessor "cpp")
  (setq c-macro-cppflags " ")
  (setq c-macro-prompt-flag t)
  (setq hs-minor-mode t)
  (setq abbrev-mode t)
)

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/company-mode"))
(load-file "~/.emacs.d/plugins/company-mode/company.el")

(add-hook 'c++-mode-hook 'company-mode)
(add-hook 'c-mode-hook 'company-mode)

(setq company-idle-delay nil)
(setq company-complete-on-idle-min-chars 100)
(setq company-tooltip-delay 1)
(setq company-complete-on-edit nil)

(autoload 'senator-try-expand-semantic "senator")
(setq semantic-idle-scheduler-idle-time 432000)

(setq hippie-expand-try-functions-list
	  '(
		senator-try-expand-semantic
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-expand-list
        try-expand-list-all-buffers
        try-expand-line
        try-expand-line-all-buffers
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-whole-kill
        )
)

(global-set-key [(f11)] 'semantic-ia-show-summary)

(global-ede-mode t)

(add-to-list 'auto-mode-alist '("\\.cc$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hh$" . c++-mode))


(setq semanticdb-project-roots
      (list
       (expand-file-name "/")))


(require 'ecb)

(ecb-layout-define "my-cscope-layout" left nil
                   (ecb-set-methods-buffer)
                   (ecb-split-ver 0.3 t)
                   (other-window 1)
                   (ecb-split-ver 0.4 t)
                   (ecb-set-history-buffer)
                   (other-window 1)
                   (ecb-set-cscope-buffer))

(defecb-window-dedicator ecb-set-cscope-buffer " *ECB cscope-buf*"
                         (switch-to-buffer "*cscope*"))
(setq ecb-layout-name "my-cscope-layout")

(provide 'lang-cc)
