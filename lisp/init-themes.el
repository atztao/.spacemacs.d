;;fonts-------------------------------------

(setq default-font-size-pt 12)

;;(set-frame-parameter nil 'alpha '(90 . 100))

;;(set-frame-font "Menlo-8")
;;(set-frame-font "Inconsolata-9")
(set-frame-font "Monaco-8")
;;(set-frame-font "Dejavu Sans Mono-8")
;;(set-frame-font "Source Code Pro-8")

;;(setq default-font-size-pt 10)
(set-fontset-font "fontset-default" 'han "Source Han Sans CN")
;;(set-fontset-font "fontset-default" 'han "Source Han Sans CN")

;Themes-------------------------------------------
;;(load "~/.emacs.d/themes/monokai-theme.el")
;;(require 'color-theme-sanityinc-tomorrow)
;;(load-theme 'sanityinc-tomorrow-eighties t)

(load-theme 'sanityinc-tomorrow-bright t)

;;zenburn

;; (defvar zenburn-override-colors-alist
;;    '(("zenburn-bg" . "#2d2d2d"))) ;#1d1f21 #111111 #2d2d2d #1C1C1C
;;(load-theme 'zenburn t)

;; (setq solarized-termcolors 256)
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/color-theme-solarized/")
;;(load-theme 'solarized t)


;; ;; (add-hook 'after-make-frame-functions
;; ;;           (lambda (frame)
;; ;;             (let ((mode (if (display-graphic-p frame) 'light )))
;; ;;               (set-frame-parameter frame 'background-mode mode)
;; ;;               (set-terminal-parameter frame 'background-mode mode))
;; ;;              (enable-theme 'solarized)))


;; (set-frame-parameter nil 'background-mode 'dark)    
;; (enable-theme 'solarized)

;;(set-face-attribute 'default nil :height 82)

;;colors
(setq cursor-type 'box)

(make-face-bold 'isearch)
(make-face-bold 'lazy-highlight)
(set-face-foreground 'isearch "#000000")
(set-face-background 'isearch "#ffff00")
(set-face-foreground 'lazy-highlight "#000000")
(set-face-background 'lazy-highlight "#ffff00")

(set-face-attribute 'region nil :foreground "#000000":background "#F0E68C" ) ;;#EEE8D6 F0E68C

;;(set-cursor-color "green")
(set-cursor-color "red")

;;(setq frame-background-mode 'dark)

;; (set-background-color "#000000")
;; ;; ;; ;; ;;(set-background-color "ivory")
;; (set-foreground-color "#32cd32")

;;--------------------------
;;mode-line
;;--------------------------
;;(setq-default mode-line-format nil)


;;(require 'diminish)
(column-number-mode 1)

;; (set-face-attribute 'mode-line nil  :height 80)
;; (set-face-attribute 'mode-line-inactive nil  :height 80)

;; (set-face-attribute 'mode-line nil :font "Monaco-7")
;; (set-face-attribute 'mode-line-inactive nil :font "Monaco-7")

;;---------------------------Vertical-border
;; Reverse colors for the border to have nicer line  

(set-face-inverse-video-p 'vertical-border nil)

;; (set-face-foreground 'vertical-border "gray")
;; (set-face-background 'vertical-border "#FFFFFF")


(set-face-background 'vertical-border (face-background 'default))
(set-face-foreground 'vertical-border "gray27")

;;(set-face-background 'vertical-border "#284b54")

(set-display-table-slot standard-display-table
                        'vertical-border 
                        (make-glyph-code ?│))

;;(set-face-background 'fringe "#809088")

(setq-default mode-line-cleaner-alist
              `((auto-complete-mode . " á")
                (company-mode . " CA")
                (undo-tree-mode-lighter " Ü")
                (helm-completion-mode-string " H")
                (yas-minor-mode . " ý")
                (undo-tree-mode . " Út")
                (golden-ratio-mode . "")
                (flymake-mode . " Fly")
                ;; major mode
                (fundamental-mode . "Fd")
                (ibuffer-mode . "iBuf")
                (python-mode . "Py")
                (lisp-interaction-mode . "iEL")
                (emacs-lisp-mode . "EL")
                (super-save-mode . "XS")
		(helm-mode . " H")))

(defun clean-mode-line ()
  (interactive)
  (dolist (cleaner mode-line-cleaner-alist)
    (let* ((mode (car cleaner))
           (mode-str (cdr cleaner))
           (old-mode-str (cdr (assq mode minor-mode-alist))))
      (when old-mode-str
        (setcar old-mode-str mode-str))
      ;; major mode
      (when (eq mode major-mode)
        (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)


(setq-default mode-line-buffer-identification
	      (propertized-buffer-identification "%b"))


;;smart-mode-line------------------------
;;(display-time-mode)
;; (require 'smart-mode-line)
;; ;; (require 'powerline)
;; (setq sml/no-confirm-load-theme t)

;; ;;(setq sml/theme 'dark)
;; ;;(setq sml/theme 'light)
;; ;;(setq sml/theme 'respectful)

;; ;;(setq sml/theme 'powerline)
;; (setq sml/theme 'light-powerline)
;; (setq powerline-arrow-shape 'curves)
;; (setq powerline-default-separator-dir '(right . left))
;; ;; (setq sml/mode-width 0)
;; ;; (setq sml/name-width 20)
;; ;;(rich-minority-mode 1)

;; (sml/setup)

;; (set-face-attribute 'mode-line           nil :underline t :box nil :background "#000000" :foreground "Grey50") ;;#A7A5A7
;; (set-face-attribute 'mode-line-inactive           nil :underline t :box nil :background "#000000" :foreground "Grey30") ;;#A7A5A7
;; ;; ;;(set-face-attribute 'mode-line-inactive  nil :box nil :background "#BCBCBC" :foreground "#000000")
;; (set-face-attribute 'mode-line-buffer-id nil :background "#000000" :foreground "Grey70" :bold t )

;; ;; (set-face-attribute 'mode-line-highlight nil :box nil :background "deep sky blue")
;; ;;(set-face-attribute 'mode-line-inactive  nil :box nil :background "grey52" :foreground "black")

(provide 'init-themes)
