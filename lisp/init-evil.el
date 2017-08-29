(setq evil-toggle-key "")   ; remove default evil-toggle-key C-z, manually setup later
(setq evil-want-C-i-jump nil)   ; don't bind [tab] to evil-jump-forward

(require 'evil-leader)
(global-evil-leader-mode)
(setq evil-leader/in-all-states 1)
(require 'evil-leader)
(global-evil-leader-mode)
(setq evil-leader/in-all-states 1)

(require 'evil) 
(evil-mode 1) 

(setq evil-shift-width 2)

;; (add-to-list 'evil-emacs-state-modes 'markdown-mode)
;;(add-to-list 'evil-emacs-state-modes 'magit-mode)
;;(add-to-list 'evil-emacs-state-modes 'org-mode)
(add-to-list 'evil-emacs-state-modes 'el-get-package-menu-mode)

;; remove all keybindings from insert-state keymap, use emacs-state when editing
;;(setcdr evil-insert-state-map nil)
 
;; ESC to switch back normal-state
(define-key evil-insert-state-map [escape] 'evil-normal-state)
 
;; TAB to indent in normal-state
(define-key evil-normal-state-map (kbd "TAB") 'indent-for-tab-command)
 
;; Use j/k to move one visual line insted of gj/gk
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)

;;(setq evil-default-state 'emacs)
(define-key evil-emacs-state-map (kbd "C-o") 'evil-execute-in-normal-state)
;;(define-key evil-normal-state-map "M-x" 'execute-extended-command)

;;(define-key evil-motion-state-map ";" 'smex)
(define-key evil-motion-state-map ":" 'evil-ex)
(define-key evil-ex-map "e" 'ido-find-file)
;;(define-key evil-ex-map "q" 'ido-kill-buffer)
;;(global-set-key (kbd "C-s") 'evil-write)

;; (evil-add-hjkl-bindings occur-mode 'emacs)
;; (evil-add-hjkl-bindings ibuffer-mode 'emacs)
;; (evil-set-initial-state 'magit-mode 'emacs)
;; (evil-set-initial-state 'magit-popup-mode 'emacs)
;; (evil-set-initial-state 'magit-popup-mode 'emacs)
;;magit
(require 'evil-magit)

;;evil helm
(evil-set-initial-state 'ibuffer-mode 'normal)
(setq evil-insert-state-cursor 'box)

;; esc quits
(defun minibuffer-keyboard-quit ()
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

(setq-default
 evil-normal-state-tag (propertize "N" 'face '((:background "green" :foreground "black")))
 evil-emacs-state-tag (propertize "E" 'face '((:background "orange" :foreground "black")))
 evil-insert-state-tag (propertize "I" 'face '((:background "red")))
 evil-motion-state-tag (propertize "M" 'face '((:background "blue")))
 evil-visual-state-tag (propertize "V" 'face '((:background "grey80" :foreground "cyan")))
 evil-operator-state-tag (propertize "O" 'face '((:background "purple"))))

(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

;;Org-Mode In Evil-Mode
(evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle)
;; (define-key org-agenda-mode-map "j" 'evil-next-line)
;; (define-key org-agenda-mode-map "k" 'evil-previous-line)
(setq evil-move-cursor-back t)

(defun toggle-org-or-message-mode ()
  (interactive)
  (if (eq major-mode 'message-mode)
      (org-mode)
    (if (eq major-mode 'org-mode) (message-mode))
    ))

;; (evil-set-initial-state 'org-mode 'emacs)
;; Remap org-mode meta keys for convenience
(evil-declare-key 'normal org-mode-map
  "gh" 'outline-up-heading
  "gl" 'outline-next-visible-heading
  "H" 'org-beginning-of-line ; smarter behaviour on headlines etc.
  "L" 'org-end-of-line ; smarter behaviour on headlines etc.
  "$" 'org-end-of-line ; smarter behaviour on headlines etc.
  "^" 'org-beginning-of-line ; ditto
  "-" 'org-ctrl-c-minus ; change bullet style
  "<" 'org-metaleft ; out-dent
  ">" 'org-metaright ; indent
  (kbd "TAB") 'org-cycle)

;;在buffer list中使j/k键绑定为下/上移一行
(evil-define-key 'normal tabulated-list-mode-map
    (kbd "j") 'next-line
    (kbd "k") 'previous-line) 
;;在agenda view中使j/k键绑定为下/上移一行（与默认的n/p交换）
(require 'org-agenda)
(define-key org-agenda-mode-map "j" 'org-agenda-next-line)
(define-key org-agenda-mode-map "k" 'org-agenda-previous-line)
(define-key org-agenda-mode-map "n" 'org-agenda-goto-date)
(define-key org-agenda-mode-map "p" 'org-agenda-capture)

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

(require 'evil-nerd-commenter)
;;(evilnc-default-hotkeys)

;; ;;evil-leader

;;(evil-leader/set-leader ", ,")
(evil-leader/set-leader ",")
(setq evil-leader/in-all-states 1)

(evil-leader/set-key
  "w" 'evil-ace-jump-word-mode ; ,e for Ace Jump (word)
  "l" 'evil-ace-jump-line-mode ; ,l for Ace Jump (line)
  "e" 'evil-ace-jump-char-mode ; ,x for Ace Jump (char)

  "h" 'dired-jump
  "v" 'split-window-right
  "," 'other-window
  "b" 'ibuffer
  "x" 'smex
  "r" 'ido-recentf-open
  "n" 'neotree-toggle
  ;; "ci" 'evilnc-comment-or-uncomment-lines
  ;; "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  ;; "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  ;; "cc" 'evilnc-copy-and-comment-lines ; Or use `evilnc-comment-and-kill-ring-save' instead
  ;; "cp" 'evilnc-comment-or-uncomment-paragraphs
  ;; "cr" 'comment-or-uncomment-region
  ;; "cv" 'evilnc-toggle-invert-comment-line-by-line
  ;; "."  'evilnc-copy-and-comment-operator
  ;; "\\" 'evilnc-comment-operator)
  )
(setq-default tab-width 4 indent-tabs-mode nil)
(define-key global-map (kbd "RET") 'newline-and-indent)
(setq evil-move-cursor-back nil)

(require 'evil-surround)
(global-evil-surround-mode 1)


(require 'evil-matchit)
(global-evil-matchit-mode)


;; (require 'key-chord)
;; (key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)
;; (key-chord-define evil-normal-state-map "jk" 'evil-force-normal-state)
;; (key-chord-define evil-visual-state-map "jk" 'evil-change-to-previous-state)
;; (key-chord-define evil-replace-state-map "jk" 'evil-normal-state)
;; (setq key-chord-two-keys-delay 0.4)
;; (key-chord-mode 1)

(setq-default evil-search-module 'evil-search)

;;expand-region
;; (require 'expand-region)
;; (global-set-key (kbd "C-=") 'er/expand-region)
;; ;;(global-set-key (kbd "C-c =") 'er/expand-region)

;; "after" macro definition
(if (fboundp 'with-eval-after-load)
    (defmacro after (feature &rest body)
      "After FEATURE is loaded, evaluate BODY."
      (declare (indent defun))
      `(with-eval-after-load ,feature ,@body))
  (defmacro after (feature &rest body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(eval-after-load ,feature
       '(progn ,@body))))

;;(require 'highlight)
;; (require 'evil-search-highlight-persist)
;; (global-evil-search-highlight-persist t)
;;  (define-key evil-normal-state-map (kbd "<escape>") 'evil-search-highlight-persist-remove-all)

;; (require 'evil-escape)
(setq-default evil-escape-key-sequence "jk")
(setq evil-escape-excluded-major-modes '(dired-mode))
(setq-default evil-escape-delay 0.2)
(evil-escape-mode 1)

(setq evil-move-cursor-back t)

;; {{ define my own text objects, works on evil v1.0.9 using older method
;; @see http://stackoverflow.com/questions/18102004/emacs-evil-mode-how-to-create-a-new-text-object-to-select-words-with-any-non-sp
(defmacro define-and-bind-text-object (key start-regex end-regex)
  (let ((inner-name (make-symbol "inner-name"))
        (outer-name (make-symbol "outer-name")))
    `(progn
       (evil-define-text-object ,inner-name (count &optional beg end type)
         (evil-select-paren ,start-regex ,end-regex beg end type count nil))
       (evil-define-text-object ,outer-name (count &optional beg end type)
         (evil-select-paren ,start-regex ,end-regex beg end type count t))
       (define-key evil-inner-text-objects-map ,key (quote ,inner-name))
       (define-key evil-outer-text-objects-map ,key (quote ,outer-name)))))

;; between dollar signs:
(define-and-bind-text-object "$" "\\$" "\\$")
;; between pipe characters:
(define-and-bind-text-object "|" "|" "|")
;; trimmed line
(define-and-bind-text-object "l" "^ *" " *$")
;; angular template
(define-and-bind-text-object "r" "\{\{" "\}\}")
;; }}

(require 'evil-mu4e)
;; (define-key helm-map (kbd "C-j") 'helm-next-line)
;; (define-key helm-map (kbd "C-k") 'helm-previous-line)
(loop for (mode . state) in '((el-get-package-menu-mode . emacs)
                              (dired-mode . emacs)
                              (wdired-mode . normal))
      do (evil-set-initial-state mode state))
(provide 'init-evil)
