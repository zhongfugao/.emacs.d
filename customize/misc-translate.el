;; Text Translator
;; http://www.emacswiki.org/emacs/TextTranslator
(add-to-list 'load-path (expand-file-name "~/.emacs.d/utils/translate"))

(require 'text-translator)
(global-set-key "\C-x\M-t" 'text-translator)
(setq text-translator-default-engine "google.com_chen")

(defun text-translator-translate-by-auto-selection-ench (engine str)
  "Automatic selection function for English to Chinese(or Chinese to English)
translation.
If alphabet ratio is over 40%, select engine which is translating from English to Chinese.
Otherwise, from Chinese to English."
  (setq str (or str ""))
  (format
   "%s_%s"
   (text-translator-get-engine-type-or-site engine t)
   (if (> (/ (* (length (replace-regexp-in-string "[^A-Za-z]+" "" str)) 100)
             (length str))
          40)
       "ench" "chen")))

;; set function that use auto selection
(setq text-translator-auto-selection-func
      'text-translator-translate-by-auto-selection-ench)

;; set global-key
(global-set-key (kbd "C-x t") 'text-translator-translate-by-auto-selection)

;;(require 'popup)
;;(setq text-translator-display-popup t)

(provide 'misc-translate)
