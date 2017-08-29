;;relative-number------------------------

;;rainbow-delimiters---------------------
(require 'rainbow-delimiters)
;; Enables rainbow-delimiters-mode in Emacs Lisp buffers
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'python-mode-hook 'rainbow-delimiters-mode)
;; Enables rainbow-delimiters-mode in Clojure buffers.
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
;; enables rainbow-delimiters-mode in other Lisp mode buffers.
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)

;;file explore-----------------
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq-default neo-smart-open t)
(setq neo-theme (if (display-graphic-p) 'ascii))
(setq-default neo-mode-line-format nil)

;;Terminal------------------
(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(setq system-uses-terminfo nil)

(add-hook 'term-mode-hook
          (lambda ()
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))))
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)))
(add-hook 'term-mode-hook
          (lambda ()
            (setq show-trailing-whitespace nil)
            (autopair-mode -1)))
(add-hook 'term-mode-hook
          (lambda ()
            (define-key term-raw-map (kbd "C-y") 'term-paste)))

;;-----------------
;;Calendar
;;-----------------
(require 'cal-china-x)
(setq mark-holidays-in-calendar t)
(setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
(setq calendar-holidays cal-china-x-important-holidays)
(setq my-holidays '((holiday-fixed 2 14 "情人节") (holiday-fixed 9 10 "教师节") (holiday-float 6 0 3 "父亲节")
                    (holiday-lunar 1 1 "春节" 0) (holiday-lunar 1 15 "元宵节" 0) (holiday-solar-term "清明" "清明节") (holiday-lunar 5 5 "端午节" 0) (holiday-lunar 7 7 "七夕情人节" 0) (holiday-lunar 8 15 "中秋节" 0)
                    (holiday-lunar 12 23 "妈妈生日" 0) (holiday-lunar 5 9 "爸爸生日" 0) (holiday-lunar 10 17 "姐姐生日" 0) (holiday-lunar 10 18 "姐夫生日" 0) (holiday-fixed 10 29 "宝宝生日") ))
(setq calendar-holidays my-holidays)
;;(holiday-lunar 9 17 "宝宝生日" 0)

;; (require 'ibuffer)
;; (global-set-key (kbd "C-x C-b") 'ibuffer)

;; (defun close-all-buffers ()
;;   (interactive)
;;   (mapc 'kill-buffer (buffer-list)))

;; ;;ido-mode--------------------------------
(require 'ido)
(ido-mode t)
(ido-everywhere t)
(setq ido-file-extensions-order '(".org" ".txt" ))
(setq ido-use-filename-at-point 'guess)
(setq ido-file-extensions-order '(".txt" ".org" ".py" ".emacs" ".xml" ".el" ".ini" ".cfg" ".cnf" "" t))
(setq org-completion-use-ido t)

(defun ido-bookmark-jump (bname)
  "*Switch to bookmark interactively using `ido'."
  (interactive (list (ido-completing-read "Bookmark: " (bookmark-all-names) nil t)))
  (bookmark-jump bname))
(global-set-key (kbd "C-x r l") 'ido-bookmark-jump)
;;(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

;;(setq ido-separator "\n")
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
;;(setq max-mini-window-height 0.5)

;;(setq ido-use-virtual-buffers t)

(savehist-mode 1)


;; ;;keep a list of recently opened files                                              


(defun ido-recentf-open ()
  "Use `ido-completing-read' to find a recent file."
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
(setq recentf-max-saved-items 150)


;; ;; (require 'flx-ido)
;; ;; (flx-ido-mode 1)
;; ;; ;; disable ido faces to see flx highlights.
;; ;; (setq ido-enable-flex-matching t)
;; ;; (setq ido-use-faces nil)

;; (require 'ido-ubiquitous)
;; (ido-ubiquitous-mode 1)

;;(require 'ido-describe-fns)

;; (require 'ido-yes-or-no)
;; (ido-yes-or-no-mode 1)

;; ;;ivy-mode
;; ;;Ivy is split into three packages: ivy, swiper and counsel
;; (require 'ivy)
;; (ivy-mode 1)
;; (setq ivy-virtual-abbreviate 'full)
;; (setq ivy-use-virtual-buffers t)
;; (setq ivy-initial-inputs-alist nil)
;; (setq ivy-height 10)
;; (setq ivy-count-format "")
;; (setq ivy-re-builders-alist
;;       '((t . ivy--regex-fuzzy)))
;; (setq counsel-ag-base-command "ag -U --nocolor --nogroup %s -- .")


;; (global-set-key (kbd "C-s") 'swiper)
;; (setq projectile-completion-system 'ivy)
;; (global-set-key (kbd "C-c C-r") 'ivy-resume)
;; ;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (global-set-key (kbd "C-c k") 'counsel-ag)

;;---------------
;;smex
;;---------------

(require 'smex)
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;---------------
;;undo-tree c-x u
;;---------------
(global-undo-tree-mode 1)

;;----------------
;;windows switch
;;----------------
(global-set-key (kbd "M-p") 'ace-window)

;; (require 'window-number)
;; (window-number-mode)

(windmove-default-keybindings)
(global-set-key [M-left] 'windmove-left)          ; move to left window
(global-set-key [M-right] 'windmove-right)        ; move to right window
(global-set-key [M-up] 'windmove-up)              ; move to upper window
(global-set-key [M-down] 'windmove-down)          ; move to lower window

;;SrSpeedbar
(require 'sr-speedbar)
(setq speedbar-use-images nil)

;;fringer
;;(set-window-fringes (selected-window) 0 0 nil)

;;Disable Fringer Mode
(set-fringe-mode '(0 . 0))

;; (custom-set-faces
;;   '(default ((t (:backgroun "black" :foreground "grey"))))
;;   '(fringe (( (:background "black")))))

;;smooth-scroll---------------------------------
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)
(setq scroll-margin 1
      scroll-conservatively 10000)

;;-----------------------
;;Ag apt-get install silversearcher-ag
;;-----------------------
(require 'ag)
;;(defalias 'find-grep 'ag)
(setq ag-highlight-search t)
(setq ag-reuse-window 't)
(setq ag-reuse-buffers 't)
(global-set-key (kbd "M-s a")   #'helm-ag) ;;apt-get install silversearcher-ag

;;-----------------------
;;helm-mode Helm 作为前端使用 helm-swoop+helm-ag
;;-----------------------
;; (setq tramp-mode nil)
;; (setq ad-redefinition-action 'accept)


(require 'recentf)
(setq recentf-auto-cleanup 'never)
(recentf-mode 1)
(setq-default recent-save-file "~/.emacs.d/recentf")


(require 'helm-config)
(require 'helm)
(helm-mode t)
;;(helm-recent t)

(defadvice helm-display-mode-line (after undisplay-header activate) (setq header-line-format nil))
(defun helm-display-mode-line (source &optional force) (setq mode-line-format nil))

(setq helm-ff-transformer-show-only-basename nil
      ;;helm-adaptive-history-file           "~/.emacs.d/recentf.txt"
      helm-ff-auto-update-initial-value t
      helm-yank-symbol-first                 t
      helm-move-to-line-cycle-in-source      t
      helm-completion-in-region-fuzzy-match  t
      helm-M-x-fuzzy-match                   t
      helm-recentf-fuzzy-match               t
      helm-ff-file-name-history-use-recentf  t
      helm-buffers-fuzzy-matching            t
      helm-ff-auto-update-initial-value      t)

;; (global-set-key (kbd "C-x C-f")   #'helm-find-files) 
;; (global-set-key (kbd "C-x C-r") 'helm-for-files)
;; (global-set-key (kbd "C-x b") 'helm-mini)
;; (global-set-key (kbd "C-x C-b") 'helm-mini)
;; (global-set-key (kbd "C-s")   #'helm-swoop)
;;(global-set-key (kbd "M-x")   #'helm-M-x)

;;(global-set-key (kbd "M-y")     #'helm-show-kill-ring)

;; (global-set-key (kbd "M-s /")   #'helm-multi-swoop)
;; (global-set-key (kbd "M-s /") 'helm-multi-swoop-all)
(global-set-key (kbd "M-s a")   #'helm-ag) ;;apt-get install silversearcher-ag


(helm-autoresize-mode 1)

(setq save-place-file "~/.emacs.d/saveplace")
(save-place-mode 1) 

;; (define-key helm-map (kbd "C-j") 'helm-next-line)
;; (define-key helm-map (kbd "C-k") 'helm-previous-line)

;;--------------------------multilple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;--------------
;ace-jump
;--------------

;; (require 'ace-jump-mode)
;; (ace-isearch-mode +1)
;; (global-ace-isearch-mode +1)

;; (require 'ace-pinyin)
;; (setq ace-pinyin-use-avy nil)
;; (ace-pinyin-global-mode +1)
;; (setq ace-pinyin-treat-word-as-char nil)
;; (setq ace-pinyin-use-avy nil) ;; uncomment if you want to use `ace-jump-mode'

;; (define-key global-map (kbd "C-c SPC") 'ace-pinyin-jump-char)

;; (add-to-list 'load-path "which-folder-ace-jump-mode-file-in/")

;; ;; (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
;; ;;(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

;; ;;--------------The Key Disable In org-mode
;; (with-eval-after-load 'org
;;   (define-key org-mode-map (kbd "C-c SPC") nil))
;; ;; When org-mode starts it (org-mode-map) overrides the ace-jump-mode.

;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "\C-c SPC") 'ace-pinyin-jump-char)))

;----------------
;yasnippet - A template system for Emacs
;----------------

(require 'yasnippet)
(yas-global-mode 1)

;; (yas-reload-all)
;; (add-hook 'prog-mode-hook #'yas-minor-mode)

(setq yas-snippet-dirs "~/.emacs.d/snippets/")
;;(setq debug-on-error t)

;----------------
;auto-complete - An Intelligent auto-completion extension for Emacs
;----------------
(require 'popup)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete/dict")
(ac-config-default)

(defun my:ac-c-headers-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))

(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)

;; auto-completion with snippets
(setq-default dotspacemacs-configuration-layers
              '((auto-completion :variables
                                 auto-completion-enable-snippets-in-popup t)))

;;(add-to-list 'ac-modes 'org-mode)
;;(ac-set-trigger-key "TAB")


;;--------------------
;;Flycheck - On the fly syntax checking for GNU Emacs
;;--------------------
(require 'flycheck)
;; Force flycheck to always use c++11 support. We use
;; the clang language backend so this is set to clang
(add-hook 'after-init-hook #'global-flycheck-mode)
;;(add-hook 'python-mode-hook             #'flycheck-mode)
(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-clang-language-standard "c++11")))
;; Turn flycheck on everywhere
;;(global-flycheck-mode)

;;turn off SOME unwanted flycheck warnings(https://lists.gnu.org/archive/html/help-gnu-emacs/2015-02/msg00134.html)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc emacs-lisp))


;;(setq flycheck-check-syntax-automatically '(mode-enabled save idle-change))
;;(setq flycheck-highlighting-mode 'lines)
;;(setq flycheck-indication-mode 'left-fringe)
(set-face-attribute 'flycheck-warning nil :underline nil)


;; Use flycheck-pyflakes for python. Seems to work a little better.
;; (require 'flycheck-pyflakes)

;;(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))

;;smartparens
(require 'smartparens-config)
(add-hook 'js-mode-hook #'smartparens-mode)

(provide 'init-plugin)
