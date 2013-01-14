(require 'yasnippet)
(yas-global-mode 1)

(setq yas-snippet-dirs (append '("~/.emacs.d/customize/snippets/") yas-snippet-dirs))

(yas-reload-all)

(provide 'lang-help-yasnippet)
