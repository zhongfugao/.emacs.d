;; Text Translator
;; http://www.emacswiki.org/emacs/TextTranslator
(add-to-list 'load-path (expand-file-name "~/.emacs.d/utils/translate"))

(require 'text-translator)
(global-set-key "\C-x\M-t" 'text-translator)
(setq text-translator-default-engine "google.com_ench")

;; set global-key
(global-set-key (kbd "C-x t") 'text-translator-translate-by-auto-selection)

(provide 'misc-translate)
