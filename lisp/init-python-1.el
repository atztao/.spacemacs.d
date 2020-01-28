;;This Config For Python Enviorment

;; (defun my-python-mode-config ()
;;   (setq python-indent-offset 4
;;         python-indent 4
;;         indent-tabs-mode nil
;;         default-tab-width 4

;;         ;; 设置 run-python 的参数
;;         python-shell-interpreter "ipython"
;;         python-shell-interpreter-args "-i"
;;         python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;;         python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;;         python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
;;         python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
;;         python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;;   (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;;   (hs-minor-mode t)                     ;开启 hs-minor-mode 以支持代码折叠
;;   (auto-fill-mode 0)                    ;关闭 auto-fill-mode，拒绝自动折行
;;   (whitespace-mode t)                   ;开启 whitespace-mode 对制表符和行为空格高亮
;;   (hl-line-mode t)                      ;开启 hl-line-mode 对当前行进行高亮
;;   (pretty-symbols-mode t)               ;开启 pretty-symbols-mode 将 lambda 显示成希腊字符 λ
;;   (set (make-local-variable 'electric-indent-mode) nil)) ;关闭自动缩进

;; (add-hook 'python-mode-hook 'my-python-mode-config)

(setenv "IPY_TEST_SIMPLE_PROMPT" "1")


;;Elpy
(elpy-enable)

;; ;;Flycheck With Elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;;pip install autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


;;(setq py-python-command "/home/zhangtao/anaconda3/bin/python3")
(setq python-shell-completion-native-enable nil)

(setq python-shell-interpreter "~/anaconda3/bin/python3"
      python-shell-interpreter-args "-m IPython --simple-prompt -i")
     
;; ;;(setq elpy-rpc-python-command "python3")
;; ;;(setq elpy-rpc-backend "jedi")

(add-hook 'python-mode-hook
          (lambda () (setq tab-width 4)))


;;(elpy-use-ipython)
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)

;; (setq jedi:environment-root "jedi")


;; (defun config/enable-jedi ()
;;   (add-to-list 'company-backends 'company-jedi))
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (add-hook 'python-mode-hook 'config/enable-jedi)

;; (setq jedi:complete-on-dot t)
;; (setq jedi:use-shortcuts t)

;; (setq compandy-minimum-prefix-length 3)
;; (setq company-tooltip-align-annotations t)
;; (setq company-transformers '(company-sort-by-occurrence))
;; (setq company-selection-wrap-around t)

;; (define-key company-active-map (kbd "M-n") nil)
;; (define-key company-active-map (kbd "M-p") nil)
;; (define-key company-active-map (kbd "C-n") 'company-select-next)
;; (define-key company-active-map (kbd "C-p") 'company-select-previous)

;; (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
;; (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
;; (define-key company-active-map (kbd "S-TAB") 'company-select-previous)
;; (define-key company-active-map (kbd "<backtab>") 'company-select-previous)


;;(setq tab-width 4)
(set-variable 'py-indent-offset 4)
(set-variable 'python-indent-guess-indent-offset nil)
;;(setq python-indent-trigger-commands nil)
;; (add-hook 'python-mode-hook
;;    '(lambda () (set (make-local-variable 'yas-indent-line) 'fixed)))

(provide 'init-python-1)
