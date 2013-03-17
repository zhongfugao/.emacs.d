;; Toggle off scroll bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Toggle off tool-bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode 0))

;; Maximize windows
;;(require 'maxframe)
;;(add-hook 'window-setup-hook 'maximize-frame t)

;;(message "max frame is set.")

;; Speedbar hotkey
(global-set-key [(f8)] 'speedbar)

(cond ((eq window-system 'ns)
       (set-default-font "Monaco-13")
       (set-fontset-font (frame-parameter nil 'font)
			 'han (font-spec :family "STHeiTi" :size 14))
       (set-fontset-font (frame-parameter nil 'font)
			 'symbol (font-spec :family "STHeiTi" :size 14))
       (set-fontset-font (frame-parameter nil 'font)
			 'cjk-misc (font-spec :family "STHeiTi" :size 14))
       (set-fontset-font (frame-parameter nil 'font)
			 'bopomofo (font-spec :family "STHeiTi" :size 14)))
      ((eq window-system 'w32)
       (message "windows-font")
       (setq w32-ch-font "-outline-XHei Mono-normal-normal-normal-mono-16-*-*-*-c-*-iso8859-1")
       (set-default-font "Monaco-13")
       (set-fontset-font (frame-parameter nil 'font)
			 'han (font-spec :family "XHei" :size 15))
       (set-fontset-font (frame-parameter nil 'font)
			 'symbol (font-spec :family "XHei" :size 15))
       (set-fontset-font (frame-parameter nil 'font)
			 'cjk-misc (font-spec :family "XHei" :size 15))
       (set-fontset-font (frame-parameter nil 'font)
			 'bopomofo (font-spec :family "XHei" :size 15))))
