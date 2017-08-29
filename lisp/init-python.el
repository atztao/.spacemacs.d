;-------------------------
;;C++
;;-------------------------

;; ;; Load rtags and start the cmake-ide-setup process
;; (require 'rtags)
;; (require 'cmake-ide)
;; (cmake-ide-setup)
;; ;; Set cmake-ide-flags-c++ to use C++11
;; (setq cmake-ide-flags-c++ (append '("-std=c++11")))
;; ;; We want to be able to compile with a keyboard shortcut
;; (global-set-key (kbd "C-c m") 'cmake-ide-compile)

;; ;; Set rtags to enable completions and use the standard keybindings.
;; ;; A list of the keybindings can be found at:
;; ;; http://syamajala.github.io/c-ide.html
;; (setq rtags-autostart-diagnostics t)
;; (rtags-diagnostics)
;; (setq rtags-completions-enabled t)
;; (rtags-enable-standard-keybindings)

;; ;; clang-format can be triggered using C-M-tab
;; (require 'clang-format)
;; (global-set-key [C-M-tab] 'clang-format-region)
;; ;; Create clang-format file using google style
;; ;; clang-format -style=google -dump-config > .clang-format

;----------------
;python+c languge
;----------------

(elpy-enable)
(elpy-use-ipython)

;;(setq py-python-command "/usr/bin/python2")
(setq py-python-command "/usr/bin/python3")
;;we should install ipython
(add-to-list 'load-path "~/.emacs.d/elpa/python-mode")
(require 'python-mode)

;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:setup-keys t)                      ; optional
;; (setq jedi:complete-on-dot t)                 ; optional

;;jupyter----------------------------------------------
(require 'ein)
(require 'ein-loaddefs)
(require 'ein-notebook)
(require 'ein-subpackages)

;;(setq ein:jupyter-default-server-command "/usr/local/bin/jupyter")
(setq ein:jupyter-default-server-command "~/anaconda3/bin/jupyter")
(setq ein:jupyter-server-args (list "--no-browser"))

		  
;; (add-hook 'python-mode-hook 'elpy-mode)
;; (with-eval-after-load 'elpy
;;   (remove-hook 'elpy-modules 'elpy-module-flymake)
;;   (add-hook 'elpy-mode-hook 'elpy-rpc-python-command "python3")
;;   (add-hook 'elpy-mode-hook 'flycheck-mode)
;;   (add-hook 'elpy-mode-hook 'elpy-use-ipython)
;;   (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

(setq elpy-rpc-backend "jedi")

(setq python-shell-completion-native-enable nil)

(elpy-enable)
(elpy-use-ipython)


(with-eval-after-load 'python
  (defun python-shell-completion-native-try ()
    "Return non-nil if can trigger native completion."
    (let ((python-shell-completion-native-enable t)
	  (python-shell-completion-native-output-timeout
           python-shell-completion-native-try-output-timeout))
      (python-shell-completion-native-get-completions
       (get-buffer-process (current-buffer))
       nil "_"))))

(require 'cl-lib)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (cl-letf (((symbol-function #'process-list) (lambda ())))
    ad-do-it))

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(add-hook 'after-init-hook #'global-flycheck-mode)

(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3")
;; (setq elpy-rpc-python-command "python2")
;; (setq python-shell-interpreter "python2")
;;(elpy-use-ipython "ipython3")


;;apt-get install ipython then M-x edit-abbrevs
;;(require 'ipython)
;;(setq-default py-shell-name "ipython")

;;pip install autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; (require 'tramp)
;; (add-to-list 'Info-default-directory-list "~/.emacs.d/tramp/info/")

;-----------------
;Java + Jdee
;-----------------

;; (add-to-list 'load-path "~/.emacs.d/jdee-2.4.1/lisp")
;; (autoload 'jde-mode "jde" "JDE mode" t)
;; (setq auto-mode-alist
;;       (append '(("\\.java\\'" . jde-mode)) auto-mode-alist))

;------------------
;Html
;------------------

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)

;-----------------
;markdown-mode
;-----------------
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
;; (autoload 'gfm-mode "gfm-mode"
;;   "Major mode for editing GitHub Flavored Markdown files" t)
;; (add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
;;(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(setq markdown-enable-math t)
;; (setq markdown-css-paths "~/Dropbox/Linux/github-markdown.css")
(setq markdown-command
      "/usr/bin/pandoc -s -c ~/Dropbox/Markdown/css-org/markdown/Github.css --mathjax --highlight-style espresso")
;; (setq markdown-command "pandoc --smart -f markdown -t html")

;; (setq markdown-css-paths `(,(expand-file-name "~/Dropbox/Linux/github-markdown.css")))

;;(require 'w3m-load)

;;(google-this-mode 1)

;;  (setq browse-url-browser-function 'w3m-browse-url)
;;  (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;;  ;; optional keyboard short-cut
;; (global-set-key "\C-xm" 'browse-url-at-point)
;; (setq w3m-use-cookies t)

(provide 'init-python)
