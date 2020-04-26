;; This config for some emacs keybindings
;;Keybingding For Emacs
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)

;;Switch 
;; (global-set-key (kbd "C-w") 'kill-ring-save)
;; (global-set-key (kbd "M-w") 'kill-region)

(add-hook 'lisp-mode-hook '(lambda ()
                             (local-set-key (kbd "RET") 'newline-and-indent)))
(provide 'init-emacs)
