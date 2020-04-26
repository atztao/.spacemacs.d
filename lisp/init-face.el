;;解决行号显示时的放大时行号的问题以及相对行号
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
(setq display-line-numbers 'relative)
(add-hook 'find-file-hook
          '(lambda () (setq display-line-numbers 'relative)))


;; This line delete spacemacs buffer, switch to scratch
;; (add-hook 'server-switch-hook (lambda nil ( (kill-buffer "*spacemacs*"))))
;; (switch-to-buffer "*scratch*")

(spacemacs/toggle-highlight-current-line-globally-off)

;; https://github.com/TheBB/spaceline#turning-segments-on-and-off
(spaceline-toggle-hud-off)


(setq powerline-default-separator nil)
(spaceline-compile)

;; (unless (display-graphic-p)
;;   (setq linum-relative-format "%3s "))

;; ;; Alternatively
;; (unless (display-graphic-p)
;;   (setq linum-relative-format (concat linum-relative-format " ")))

;;Window Title
;; (setq frame-title-format
;;       (list
;;        ;;'(:eval (projectile-project-name))
;;        "(●—●) I'm Here @ "
;;        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(setq frame-title-format
      (list
       ;;'(:eval (projectile-project-name))
       "I'm @ "
       '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))


(setq x-select-enable-clipboard t)

;;MarkDown
(custom-set-variables
 '(markdown-command "/usr/bin/pandoc"))

;; 自动断行
(global-visual-line-mode 1) ; 1 for on, 0 for off.

(add-hook 'org-mode-hook
          (lambda()
            (setq truncate-lines nil))) 



;; (setq tramp-ssh-controlmaster-options
;;       "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

;;emojify
(add-hook 'after-init-hook #'global-emojify-mode)

;; Isearch color
;; (set-face-attribute 'lazy-highlight nil :foreground "#FFFF00" :background "black")
;; (set-face-attribute 'isearch nil :foreground "#FFFF00" :background "black" :weight 'bold)


;; (set-cursor-color "green")
(set-cursor-color "#32cd32")
;; (set-cursor-color "Red")

;; (set-background-color "#000000")
;; (set-face-attribute 'region nil :background "#FFFFF0" :foreground "#000000")
;; ;; ;;(set-background-color "ivory")
;; (set-foreground-color "#32cd32")

;; Window Size
;; (set-frame-parameter nil 'alpha '(98 . 100)) ;;透明度

;;(add-to-list 'default-frame-alist '(height . 20)) ;;启动窗口大小
;;(add-to-list 'default-frame-alist '(width . 52))

(set-face-attribute 'mode-line nil :box nil :height 82) ;; Mode line 高度
(set-face-attribute 'mode-line-inactive nil :box nil  :height 82)


;; Reverse colors for the border to have nicer line split border for window
(set-face-inverse-video-p 'vertical-border nil)
(set-face-background 'vertical-border (face-background 'default))
(set-display-table-slot standard-display-table
                        'vertical-border
                        (make-glyph-code ?┃))

;;------------------------------------------------}
;;Chinese Fonts

(setq-default line-spacing 0.20) ;;行距
(setq default-font-size-pt 10)

(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset (font-spec :family "Hiragino Sans GB" :embolden t)))

;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;   (set-fontset-font (frame-parameter nil 'font)
;;                     charset (font-spec :family "WenQuanYi Micro Hei")))


(provide 'init-face)
