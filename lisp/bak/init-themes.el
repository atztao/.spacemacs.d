;;fonts-------------------------------------

(setq default-font-size-pt 10)

(set-frame-parameter nil 'alpha '(95 . 100))


;;(set-frame-font "Menlo-8")
;;(set-frame-font "Inconsolata-10")
;;(set-frame-font "Monaco-8")
;;(set-frame-font "Dejavu Sans Mono-8")
;;(set-frame-font "Source Code Pro-8")


(set-frame-font "Consolas-10")
;;(set-fontset-font "fontset-default" 'han "WenQuanYi Micro Hei Mono")
(set-fontset-font "fontset-default" 'han "Source Han Sans CN")

;Themes-------------------------------------------
(load-theme 'sanityinc-tomorrow-bright t)
;;(load-theme 'sanityinc-tomorrow-night t)

;;(set-face-attribute 'default nil :height 82)

;;colors
(setq cursor-type 'box)

(make-face-bold 'isearch)
(make-face-bold 'lazy-highlight)
(set-face-foreground 'isearch "#000000")
(set-face-background 'isearch "#ffff40")
(set-face-foreground 'lazy-highlight "#000000")
(set-face-background 'lazy-highlight "#ffff40")

(set-face-attribute 'region nil :foreground "#000000":background "#F0E68C" ) ;;#EEE8D6 F0E68C

(set-cursor-color "green")
;;(set-cursor-color "red")

;;(setq frame-background-mode 'dark)

;; (set-background-color "#000000")
;; ;; ;; ;; ;; ;;(set-background-color "ivory")
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
                (fundamental-mode . " Fd")
                (ibuffer-mode . " iBuf")
                (python-mode . " Py")
                (lisp-interaction-mode . " iEL")
                (emacs-lisp-mode . " EL")
                (super-save-mode . " XS")
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

;; (setq sml/theme 'dark)
;; ;;(setq sml/theme 'light)
;; ;;(setq sml/theme 'respectful)

;; ;;(setq sml/theme 'powerline)
;; ;; ;; ;(setq sml/theme 'light-powerline)
;; ;; (setq powerline-arrow-shape 'curves)
;; ;; (setq powerline-default-separator-dir '(right . left))
;; ;; (setq sml/mode-width 0)
;; ;; (setq sml/name-width 20)
;; ;;(rich-minority-mode 1)

;; (sml/setup)



(provide 'init-themes)
