(setq evil-toggle-key "")   ; remove default evil-toggle-key C-z, manually setup later
(setq evil-want-C-i-jump nil)   ; don't bind [tab] to evil-jump-forward
(setq evil-shift-width 2)


(define-key ivy-switch-buffer-map (kbd "C-M-k") 'ivy-switch-buffer-kill)
(define-key ivy-switch-buffer-map (kbd "C-k") 'ivy-previous-line) 

;; (add-to-list 'evil-emacs-state-modes 'markdown-mode)
;;(add-to-list 'evil-emacs-state-modes 'magit-mode)
;;(add-to-list 'evil-emacs-state-modes 'org-mode)
;; (add-to-list 'evil-emacs-state-modes 'el-get-package-menu-mode)

;; remove default evil-toggle-key C-z, manually setup later
(setq evil-toggle-key "")

;; find pinyign char 
(evil-find-char-pinyin-mode +1)

;; remove all keybindings from insert-state keymap, use emacs-state when editing
;; (setcdr evil-insert-state-map nil)

;; ESC to switch back normal-state
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;; TAB to indent in normal-state
(define-key evil-normal-state-map (kbd "TAB") 'indent-for-tab-command)

;; Use j/k to move one visual line insted of gj/gk
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)

;; (setq evil-emacs-state-cursor '("red" box))
;; (setq evil-normal-state-cursor '("green" box))
;; (setq evil-visual-state-cursor '("orange" box))
;; (setq evil-insert-state-cursor '("red" bar))
;; (setq evil-replace-state-cursor '("red" bar))
;; (setq evil-operator-state-cursor '("red" hollow))

(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

;;(setq evil-default-state 'emacs)
;; (define-key evil-emacs-state-map (kbd "C-o") 'evil-execute-in-normal-state)
;;(define-key evil-normal-state-map "M-x" 'execute-extended-command)

;Org-Mode In Evil-Mode
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

;;在buffer list中使j/k键绑定为下/上移一行
(evil-define-key 'normal tabulated-list-mode-map
  (kbd "j") 'next-line
  (kbd "k") 'previous-line)

;;在agenda view中使j/k键绑定为下/上移一行（与默认的n/p交换）
;; (require 'org-agenda)
;; (define-key org-agenda-mode-map "j" 'org-agenda-next-line)
;; (define-key org-agenda-mode-map "k" 'org-agenda-previous-line)
;; (define-key org-agenda-mode-map "n" 'org-agenda-goto-date)
;; (define-key org-agenda-mode-map "p" 'org-agenda-capture)

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

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

;; (setq-default evil-search-module 'evil-search)

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

;; jk to normal mode
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

;; (require 'evil-mu4e)
;; (define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line) 
;; (define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line) 
;; (loop for (mode . state) in '((el-get-package-menu-mode . emacs)
;;                               (dired-mode . emacs)
;;                               (wdired-mode . normal))
;;       do (evil-set-initial-state mode state))

;; (require 'helm-smex)
;; (global-set-key (kbd "M-x") #'helm-smex)
;; (global-set-key (kbd "M-X") #'helm-smex-major-mode-commands)
(evil-ex-define-cmd "e" 'counsel-find-file)
(evil-ex-define-cmd "b" 'ivy-switch-buffer)

(provide 'init-evil)
