;;------------------------------------------------}
(global-set-key [f8] 'neotree-toggle)
(setq-default neo-smart-open t)
(setq neo-theme (if (display-graphic-p) 'ascii))
;;(setq-default neo-mode-line-format nil)

;----------------
;python+c languge
;----------------
;;------------------------------------------------
;; Python Configuration
;; (add-hook 'prog-mode-hook #'fci-mode)    ;; Indicate fill column.
;; (setq fci-rule-color "darkred")
;; (setq fci-rule-character ?█)
;; (setq fci-rule-width 8)

;; Trigger completion immediately.
(setq company-idle-delay nil)
;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)
(setq company-dabbrev-downcase nil)


(pyvenv-activate "/home/zhangtao/anaconda3/")
(setq ein:jupyter-default-server-command "~/anaconda3/bin/jupyter")
(setq ein:jupyter-server-args (list "--no-browser"))
(setq ein:use-auto-complete t)

;; (setq python-shell-interpreter "/home/zhangtao/anaconda3/bin/python"
;;       python-shell-interpreter-args "-m IPython --simple-prompt -i"
;;       python-shell-interpreter-interactive-arg ""

;;       )
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt")

(setq python-shell-completion-native-enable nil)
(add-hook 'python-mode-hook (lambda () (add-hook 'before-save-hook 'yapfify-buffer nil t)))
(add-hook 'python-mode-hook 'yapf-mode)
(provide 'init-python)
