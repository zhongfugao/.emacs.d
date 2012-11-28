(global-font-lock-mode 1)
(set-face-font 'default "Monaco-13")

(message "Windows detected.")
;;Toggle off tool-bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode 0))

;; Maximize windows
(defun w32-maximize-frame ()
    "Maximize the current frame"
      (interactive)
        (w32-send-sys-command 61488))
 
(add-hook 'window-setup-hook 'w32-maximize-frame t)

(setq make-backup-files nil)

(setq desktop-dirname "~/.emacs.d/")

;; add the cygwin path
(if (file-directory-p "c:/work/cygwin/bin")
        (add-to-list 'exec-path "c:/work/cygwin/bin"))

(setq shell-file-name "c:/work/cygwin/bin/bash")
