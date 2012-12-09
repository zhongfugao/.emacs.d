(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/emacs-jabber-0.8.91"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/emacs-jabber-0.8.91/compat"))
(require 'jabber)

(require 'password-cache)

(setq jabber-account-list
      '(("joshuafufu@gmail.com" 
         (:network-server . "talk.google.com")
         (:connection-type . ssl))))

(provide 'misc-chat)
