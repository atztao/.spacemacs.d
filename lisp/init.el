;; init.el -- ztao1991's emacs initialization file

;; Copyright (c) 2010-2017 Zhang Tao

;; Athor:Zhang Tao
;; Email:ztao1991@gmail.com
;; Gtihub:github.com/ztao1991
;; Version:v2017.5.11

;;Emacs Startup 
;;-----------------------------------------------

;;(server-start)  
;;(desktop-save-mode) 

;;Disable ad-handle-definition warnings
(setq ad-redefinition-action 'accept)
(setq gc-cons-threshold 100000000)

(setq frame-title-format
      (list ;;'(:eval (projectile-project-name)) 
            "(●—●) I'm Here @ "
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;;(set-fontset-font "fontset-default" 'gb18030' ("Microsoft YaHei" . "unicode-bmp"))

(setq initial-scratch-message "")
;; (defun display-startup-echo-area-message ()
;;   (message "Just Type For Fun Or Hacking The Write."))
(defun display-startup-echo-area-message ()
  (message ""))

(setq x-select-enable-clipboard t)
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(tool-bar-mode 0)  
(menu-bar-mode 0)  
(scroll-bar-mode 0)  
;;(set-scroll-bar-mode 'right)
;;(visual-line-mode 1)
(global-visual-line-mode 1)
(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)

;;Disable Fringer Mode
;;(set-fringe-mode '(0 . 0))

;;(fset 'yes-or-no-p 'y-or-n-p)

(add-to-list 'default-frame-alist '(height . 15))
(add-to-list 'default-frame-alist '(width . 62))

sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*"
sentence-end-double-space nil         ;;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格。

;;(setq default-directory "C:/Users/zhangtao/Dropbox/")
;;(cd "~/emacs/home/")  
;;(setq default-directory "~/Dropbox/")

(add-hook 'text-mode-hook 'auto-fill-mode)
;;(setq-default fill-column 80)

;;eshell
;;(setq shell-file-name "cmdproxy");; Copyright (c) 2010-2017 Dennis Ogbe

(setq shell-file-name "/bin/zsh")

;; turn on highlighting current line
;;(global-hl-line-mode 1)
;;(set-face-background hl-line-face "gray20")
;;(set-face-background hl-line-face "black")
;;(set-face-attribute hl-line-face  :underline t)
;;(global-hl-line-mode 1)

;; (require 'tramp)
;; (eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))
;; (setq tramp-default-method "ssh")
;; (setq password-cache-expiry nil)
;; (setq tramp-verbose 20)
;; (setq process-connection-type nil)
;; (setq tramp-terminal-type "dumb")
;; (setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")
;; ;;(setq tramp-ssh-controlmaster-options nil)

;; (setq tramp-ssh-controlmaster-options
;;       "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

(setq projectile-mode-line " Projectile")
;;(projectile-global-mode 1)
;;(set projectile-mode-line " Projectile")
;;(setq projectile-mode-line nil)
;; (add-hook 'text-mode-hook 'projectile-mode)
;; (add-hook 'prog-mode-hook 'projectile-mode)

(defun xah-open-in-desktop ()
  "Show current file in desktop (OS's file manager).
URL `http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html'
Version 2015-11-30"
  (interactive)
  (cond
   ((string-equal system-type "windows-nt")
    (w32-shell-execute "explore" (replace-regexp-in-string "/" "\\" default-directory t t)))
   ((string-equal system-type "darwin") (shell-command "open ."))
   ((string-equal system-type "gnu/linux")
    (let (
          (process-connection-type nil)
          (openFileProgram (if (file-exists-p "/usr/bin/gvfs-open")
                               "/usr/bin/gvfs-open"
                             "/usr/bin/xdg-open")))
      (start-process "" nil openFileProgram "."))
    ;; (shell-command "xdg-open .") ;; 2013-02-10 this sometimes froze emacs till the folder is closed. For example: with nautilus
    )))

(defun eshell-here ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 3))
         (name   (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    (insert (concat "ls"))
    (eshell-send-input)))

(global-set-key (kbd "C-!") 'eshell-here)

(defun eshell/x ()
  (insert "exit")
  (eshell-send-input)
  (delete-window))

;; (defun command-shell ()
;;   "opens a shell which can run programs as if run from cmd.exe from Windows"
;;   (interactive)
;;   (let ((explicit-shell-file-name "cmdproxy")
;;     (shell-file-name "cmdproxy") (comint-dynamic-complete t))
;;     (shell)))

(global-set-key [f2] 'eshell)
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)
(add-hook
 'eshell-mode-hook
 (lambda ()
   (setq pcomplete-cycle-completions nil)))
(setq eshell-cmpl-cycle-completions nil)

;; -*- mode: org -*-
(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))

;;Browser
(setq gnus-button-url 'browse-url-generic
      browse-url-generic-program "google-chrome"
      browse-url-browser-function gnus-button-url)

;;(setq line-spacing '0.20)
;; (setq-default line-spacing 2)
(setq-default line-spacing 0)

;;(setq-default major-mode 'org-mode)
(eval-after-load "linum"
  '(set-face-attribute 'linum nil :height 100))

;;(setq default-justificatio 'full)
;;(defalias 'ar #'align-regexp)

;;(transient-mark-mode 1)

(electric-pair-mode t) ;;括号补全
(show-paren-mode t)
(setq show-paren-style 'parenthesis)
;;(setq show-paren-style 'expression) 

;; (require 'autopair)
;; (autopair-global-mode) 

;;cursor
;;(setq default-cursor-type 'bar)
;;(set-cursor-color "#ffffff")

(set-display-table-slot standard-display-table 'wrap ?\ ) 

;;---------------------------
;;SOME CHANGE FOR KEYBINGDING
;;---------------------------
(global-set-key (kbd "C-x C-m") 'smex)
(global-set-key (kbd "C-c C-m") 'smex)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)


;;(global-unset-key (kbd "C-SPC"))  
;;(global-set-key (kbd "M-SPC") 'set-mark-command)

;;(defalias 'qrr 'query-replace-regexp) ;;define the alias

;;Fullscreen
;; (global-set-key [f11] 'my-fullscreen) 
;; (defun my-fullscreen ()
;;   (interactive)
;; (x-send-client-message
;;  nil 0 nil "_NET_WM_STATE" 32
;;  '(2 "_NET_WM_STATE_FULLSCREEN" 0))
;; )

(defun switch-full-screen (&optional ii)
  (interactive "p")
  (if (> ii 0)
      (shell-command "wmctrl -r :ACTIVE: -badd,fullscreen"))
  (if (< ii 0)
      (shell-command "wmctrl -r :ACTIVE: -bremove,fullscreen"))
  (if (equal ii 0)
      (shell-command "wmctrl -r :ACTIVE: -btoggle,fullscreen")))

;; Use xsel to access the X clipboard apt install xsel
;; From https://hugoheden.wordpress.com/2009/03/08/copypaste-with-emacs-in-terminal/
(unless window-system
  (when (getenv "DISPLAY")
    ;; Callback for when user cuts
    (defun xsel-cut-function (text &optional push)
      ;; Insert text to temp-buffer, and "send" content to xsel stdin
      (with-temp-buffer
        (insert text)
        ;; Use primary the primary selection
        ;; mouse-select/middle-button-click
        (call-process-region (point-min) (point-max) "xsel" nil 0 nil "--primary" "--input")))
    ;; Call back for when user pastes
    (defun xsel-paste-function()
      ;; Find out what is current selection by xsel. If it is different
      ;; from the top of the kill-ring (car kill-ring), then return
      ;; it. Else, nil is returned, so whatever is in the top of the
      ;; kill-ring will be used.
      (let ((xsel-output (shell-command-to-string "xsel --primary --output")))
        (unless (string= (car kill-ring) xsel-output)
          xsel-output)))
    ;; Attach callbacks to hooks
    (setq interprogram-cut-function 'xsel-cut-function)
    (setq interprogram-paste-function 'xsel-paste-function)))


;; Automatically set screen title
;; ref http://vim.wikia.com/wiki/Automatically_set_screen_title
;; FIXME: emacsclient in xterm will have problem if emacs daemon start in screen
;; (defun update-title ()
;;   (interactive)
;;   (if (getenv "STY")	; check whether in GNU screen
;; 	  (send-string-to-terminal (concat "\033k\033\134\033k" "Emacs("(buffer-name)")" "\033\134"))
;; 	(send-string-to-terminal (concat "\033]2; " "Emacs("(buffer-name)")" "\007"))))
;; (add-hook 'post-command-hook 'update-title)

;;bookmark
(setq bookmark-default-file "~/.emacs.d/.bookmarks.bmk")
(setq bookmark-save-flag 1)

;;----------------------------------------------------------------------------------
;;Package. Plugin.
;;----------------------------------------------------------------------------------
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'package)

;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                          ;; ("marmalade" . "https://marmalade-repo.org/packages/")
;;                          ("melpa" . "http://melpa.org/packages/")))

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))
;;(package-refresh-contents)
(package-initialize)

;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))

;; (eval-when-compile
;;   (require 'use-package))


;;-------------------Some Provide

;;emacs theme
(require 'init-themes)

;;necessary plugin you must need
(require 'init-plugin)

;--------------------Vim Way To Move - Evilode
;;(require 'init-evil)

;--------------------email
(require 'init-email)

;;-------------------this include programming seetings
(require 'init-python)

;;--------------------------support latex
(require 'init-latex)

;--------------------------org-mode
(require 'init-org)
(require 'init-org-html)
(require 'init-org-pdf)

;;-------------------------some color setting
(require 'init-color)

;;-------------------------some warning fix
(require 'init-fix)

;-------------------------------------------------------

;; (require 'epa-file) 
;; (epa-file-enable) 
;; (setq epa-file-select-keys 0)
;; ;;(setq epa-file-encrypt-to nil) 
;; ;;-*- epa-file-encrypt-to: ("your@email.address") -*-
;; (setq epa-file-cache-passphrase-for-symmetric-encryption t)
;; (setq epa-file-inhibit-auto-save nil) 

;;image
;; (image-type-available-p 'png)
;; (image-type-available-p 'jpeg)
;; (image-type-available-p 'gif)
;; (image-type-available-p 'tiff)
;; (image-type-available-p 'xbm)
;; (image-type-available-p 'xpm)

;; Setting up matlab-mode
;; ;; (add-to-list 'load-path "~/.emacs.d/elpa/matlab-emacs")
;; ;; (load-library "matlab-load")
;; (add-hook 'matlab-mode-hook 'auto-complete-mode)
;; (setq auto-mode-alist
;;       (cons
;;        '("\\.m$" . matlab-mode)
;;        auto-mode-alist))

;;flyspell-----------------------------------
;;apt install aspell
(setq-default ispell-program-name "aspell")
(ispell-change-dictionary "american" t)  

;Backup-----------------------------------------
(setq auto-save-interval 20)
(setq auto-save-visited-file-name t)

;; (setq auto-save-default nil)
;; (setq make-backup-files nil)

(setq backup-directory-alist '(("" . "~/.backup")))
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backp files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 7              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )

;;Save---------------------------------------------
(super-save-mode +1)
;; ;; (setq auto-save-default nil)
(setq super-save-auto-save-when-idle t)

;; (defun full-auto-save ()
;; 	  (interactive)
;; 	  (save-excursion
;; 		(dolist (buf (buffer-list))
;; 		  (set-buffer buf)
;; 		  (if (and (buffer-file-name) (buffer-modified-p))
;; 			  (basic-save-buffer)))))
;; 	(add-hook 'auto-save-hook 'full-auto-save)
;;-----------------------------------------------------------


;; '(markdown-command
;;   "/usr/bin/pandoc -c ~/Dropbox/Linux/css/markdown/Clearness.css")
;; '(matlab-shell-command-switches (quote ("-nodesktop -nosplash")))
;; '(org-agenda-files
;;   (quote
;;    ("~/Dropbox/Txt/todo.txt" "~/Dropbox/Txt/inbox.txt")))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#cccccc" "#f2777a" "#99cc99" "#ffcc66" "#6699cc" "#cc99cc" "#66cccc" "#515151"))
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" default)))
 '(fci-rule-color "#515151")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-files
   (quote
    ("~/Dropbox/Txt/inbox.txt" "~/Dropbox/Txt/todo.txt")))
 '(package-selected-packages
   (quote
    (ace-window helm-themes sr-speedbar evil evil-easymotion evil-escape evil-leader evil-magit evil-matchit evil-mu4e evil-multiedit evil-nerd-commenter evil-surround molokai-theme xterm-color ein smartparens ido-yes-or-no notmuch counsel color-theme-sanityinc-tomorrow blackboard-theme org projectile dracula-theme expand-region helm-swoop undo-tree rainbow-delimiters ox-reveal multiple-cursors esup window-number jedi zenburn-theme writeroom-mode window-numbering websocket web-mode super-save solarized-theme smooth-scrolling smex smart-mode-line-powerline-theme semi rtags request relative-line-numbers python-mode py-autopep8 pos-tip neotree multi-term minimap matlab-mode markdown-mode magit linum-relative key-chord jdee htmlize ht helm-ag gntp focus emmet-mode elpy cmake-ide clang-format cl-generic cal-china-x autopair auto-complete-clang auto-complete-c-headers ag)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(show-paren-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tool-bar-mode nil)
 '(truncate-partial-width-windows nil)
 '(user-full-name "Tao Zhang")
 '(user-mail-address "ztao1991@gmail.com")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f2777a")
     (40 . "#f99157")
     (60 . "#ffcc66")
     (80 . "#99cc99")
     (100 . "#66cccc")
     (120 . "#6699cc")
     (140 . "#cc99cc")
     (160 . "#f2777a")
     (180 . "#f99157")
     (200 . "#ffcc66")
     (220 . "#99cc99")
     (240 . "#66cccc")
     (260 . "#6699cc")
     (280 . "#cc99cc")
     (300 . "#f2777a")
     (320 . "#f99157")
     (340 . "#ffcc66")
     (360 . "#99cc99"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-done ((t (:foreground "Gray" :weight normal :strike-through t))))
 '(org-done ((t (:foreground "Gray" :weight extra-bold :strike-through t))))
 '(org-headline-done ((((class color) (min-colors 16) (background dark)) (:foreground "#999" :strike-through t)))))
