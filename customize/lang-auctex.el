;; AucTex
(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugin/auctex-11.87"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugin/auctex-11.87/preview"))
(setenv "PATH" (concat "/usr/texbin:/usr/local/bin:" (getenv "PATH")))
(setq exec-path (append '("/usr/texbin" "/usr/local/bin") exec-path))
(auto-image-file-mode)
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-Master nil)

(provide 'lang-auctex)
