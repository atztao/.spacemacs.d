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

;;emacs with fcitx　cute-jumper/fcitx.el
(setq fcitx-active-evil-states '(insert emacs hybrid))

(fcitx-isearch-turn-on)
(setq fcitx-use-dbus t)

(fcitx-prefix-keys-add "C-x")
(fcitx-prefix-keys-add "C-s")
(fcitx-prefix-keys-add "C-c")
(fcitx-prefix-keys-turn-on)

(provide 'init-emacs)
