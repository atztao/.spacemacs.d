;; You should not put any user code in this function besides modifying the variable values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     lua
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ipython-notebook
     python
     helm
     html
     latex
     auto-completion
     better-defaults
     emacs-lisp
     git
     markdown
     org
     ;;smex
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;;spell-checking
     syntax-checking
     version-control
     ;;mu4e
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      company-jedi
                                      evil-mu4e
                                      ;;super-save
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    org-projectile
                                    auto-complete
                                    mu4e-maildirs-extension
                                    org-bullets
                                    )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all'(setq python-shell-interpreter-args "") installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only)

(defun dotspacemacs/init ()
  "Initialimu4e-maildirs-extensionzation funcmu4e-maildirs-extensiontion.
This function is called at thhi Function term=bold       ctermfg=White guifg=White
e very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading proress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         ;;zenburn
                         sanityinc-tomorrow-bright
                         solarized-dark
                         spacemacs-dark
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Inconsolata For Powerline"
                               :size 18
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   ;;hether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 10
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 100
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  (setq configuration-layer--elpa-archives
        '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
          ("org-cn"   . "http://elpa.emacs-china.org/org/")
          ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

  ;; https://github.com/syl20bnr/spacemacs/issues/2705
  (setq tramp-ssh-controlmaster-options "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (evil-define-key 'normal evil-jumper-mode-map (kbd "TAB") nil)

  ;; (define-key evil-normal-state-map (kbd "TAB") 'org-cycle)

  (setq ns-use-srgb-colorspace t)

  (setq powerline-default-separator nil)
  (spaceline-compile)

  (require 'helm-bookmark)
  
  ;;flyspell-----------------------------------
  ;;apt install aspell
  ;; (setq-default ispell-program-name "aspell")
  ;; (ispell-change-dictionary "american" t)

  ;;Auto Save - Backup-----------------------------------------
  (defun my-save-if-bufferfilename ()
    (if (buffer-file-name)
        (progn
          (save-buffer)
          )
      (message "")
      )
    )

  (add-hook 'evil-insert-state-exit-hook 'my-save-if-bufferfilename)

  (defun full-auto-save ()
    (interactive)
    (save-excursion
      (dolist (buf (buffer-list))
        (set-buffer buf)
        (if (and (buffer-file-name) (buffer-modified-p))
            (basic-save-buffer)))))
  (add-hook 'auto-save-hook 'full-auto-save)

  (defun save-all ()
    (interactive)
    (save-some-buffers t))
  
  (add-hook 'focus-out-hook 'save-all) 

  (setq auto-save-interval 1)
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


  (set-background-color "#000000")
  (set-foreground-color "#32cd32")

  ;;-----------------------------------------------}
  ;;Some Configuration For Face
  (set-face-inverse-video-p 'vertical-border nil)

  ;;(set-face-foreground 'vertical-border "gray")
  ;; (set-face-background 'vertical-border "#FFFFFF")


  (set-face-background 'vertical-border (face-background 'default))
  (set-face-foreground 'vertical-border "gray37")

  ;; (set-face-background 'vertical-border "#284b54")

  (set-display-table-slot standard-display-table
                          'vertical-border 
                          (make-glyph-code ?│))


  (setq frame-title-format
        (list ;;'(:eval (projectile-project-name))
         "(●—●) I'm Here @ "
         '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

  (setq x-select-enable-clipboard t)

  (setq shell-file-name "/bin/zsh")

  (set-face-attribute 'mode-line nil :box nil :height 92)
  (set-face-attribute 'mode-line-inactive nil :box nil  :height 92)

  ;;Chinese Fonts
  (set-fontset-font "fontset-default" 'han "Source Han Sans CN")

  ;;(add-to-list 'default-frame-alist '(height . 20))
  ;;(add-to-list 'default-frame-alist '(width . 52))

  sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*"
  sentence-end-double-space nil         ;;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格。

  ;;(setq default-directory "C:/Users/zhangtao/Dropbox/")
  ;;(cd "~/emacs/home/")
  ;;(setq default-directory "~/Dropbox/")

  (add-hook 'text-mode-hook 'auto-fill-mode)
  ;;(setq-default fill-column 80)

  ;;eshell
  ;;(setq shell-file-name "cmdproxy");; Copyright (c) 2010-2017 Dennis Ogbe

  ;; (setq tramp-ssh-controlmaster-options
  ;;       "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

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

  (set-display-table-slot standard-display-table 'wrap ?\ )

  ;;-----------------------------------------------}
  ;;Copy To System Clipboard apt install xel
  (defun copy-to-clipboard ()
    "Copies selection to x-clipboard."
    (interactive)
    (if (display-graphic-p)
        (progn
          (message "Yanked region to x-clipboard!")
          (call-interactively 'clipboard-kill-ring-save)
          )
      (if (region-active-p)
          (progn
            (shell-command-on-region (region-beginning) (region-end) "xsel --clipboard --input")
            (message "Yanked region to clipboard!")
            (deactivate-mark))
        (message "No region active; can't yank to clipboard!")))
    )

  (defun paste-from-clipboard ()
    "Pastes from x-clipboard."
    (interactive)
    (if (display-graphic-p)
        (progn
          (clipboard-yank)
          (message "graphics active")
          )
      (insert (shell-command-to-string "xsel --clipboard --output"))
      )
    )
  (evil-leader/set-key "o y" 'copy-to-clipboard)
  (evil-leader/set-key "o p" 'paste-from-clipboard)

  ;;Setting For Vim Mode
  ;;{------------------------------------------------
  ;;jk Escape All The Mode
  (evil-escape-mode 1)
  (setq-default evil-escape-key-sequence "jk")
  (setq evil-escape-excluded-major-modes '(dired-mode))
  (setq-default evil-escape-delay 0.2)

  ;;-----------------------------------------------}

 
  ;;{------------------------------------------------
  ;;Org-Mode
  (push "~/.spacemacs.d/lisp" load-path)
  (require 'init-org)
  (require 'init-org-pdf)

  ;;Mu4e
  ;; (require 'init-email)

  ;;------------------------------------------------}

  (global-set-key [f8] 'neotree-toggle)
  (setq-default neo-smart-open t)
  (setq neo-theme (if (display-graphic-p) 'ascii))
  ;;(setq-default neo-mode-line-format nil)

  ;;Some Color
  ;;{------------------------------------------------
  (make-face-bold 'isearch)
  (make-face-bold 'lazy-highlight)
  (set-face-foreground 'isearch "#000000")
  (set-face-background 'isearch "#ffff99")
  (set-face-foreground 'lazy-highlight "#000000")
  (set-face-background 'lazy-highlight "#ffff99")

  ;; (set-face-attribute 'region nil :foreground "#FFFFFF" :background "Grey20" ) ;;#EEE8D6 F0E68C

  (set-cursor-color "green")
  ;;(set-cursor-color "red")
  ;;------------------------------------------------}


  (setq default-font-size-pt 10)

  (set-frame-parameter nil 'alpha '(98 . 100))


  (set-background-color "#000000")                                                
  ;; ;;(set-background-color "ivory")                                             
  (set-foreground-color "#32cd32")


  ;;----------------
  ;;yasnippet - A template system for Emacs
  ;;----------------

  (yas-global-mode 1)
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  (setq yas-snippet-dirs "~/.spacemacs.d/snippets/")
  ;;(setq debug-on-error t)

  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)


  ;; Bind `SPC' to `yas-expand' when snippet expansion available (it
  ;; will still call `self-insert-command' otherwise).
  (define-key yas-minor-mode-map (kbd "SPC") yas-maybe-expand)
  ;; Bind `C-c y' to `yas-expand' ONLY.
  (define-key yas-minor-mode-map (kbd "C-c y") #'yas-expand)

  ;;------------------------------------------------}
  ;; Python Configuration
  (pyvenv-activate "/home/zhangtao/anaconda3/")
  (setq ein:jupyter-default-server-command "~/anaconda3/bin/jupyter")
  (setq ein:jupyter-server-args (list "--no-browser"))

  ;;Company mode completion in Spacemacs
  (global-company-mode t)
  (setq  company-idle-delay 0)

  (global-auto-complete-mode -1)
  (setq company-minimum-prefix-length 1)

  (add-hook 'ein:notebook-mode-hook #'anaconda-mode)
  (add-hook 'ein:notebook-mode-hook (lambda ()
                                      (global-auto-complete-mode -1)))

  ;; (defun my/python-mode-hook ()
  ;;   (add-to-list 'company-backends 'company-jedi))

  ;; (add-hook 'python-mode-hook 'my/python-mode-hook)

  ;;Python SHOULD SET :export PATH=$HOME/anaconda3/bin:$PATH IN .zshenv ~/.bash_profile
  ;;(setenv "WORKON_HOME" "/home/zato1991/anaconda3/")   And pip install yapf 

  (setq python-shell-interpreter "/home/zhangtao/anaconda3/bin/python3"
        python-shell-interpreter-args "-m IPython --simple-prompt -i")


  ;;-------------------------------END---------------------------------------
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(org-agenda-files
     (quote
      ("~/Dropbox/Txt/inbox.txt" "~/Dropbox/Txt/todo.txt")))))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-done ((t (:foreground "Gray" :weight normal :strike-through t))))
 '(org-agenda-files (quote ("~/Dropbox/Txt/todo.txt")))
 '(org-done
   ((t
     (:foreground "Gray" :weight extra-bold :strike-through t))))
 '(org-headline-done
   ((((class color)
      (min-colors 16)
      (background dark))
     (:foreground "#999" :strike-through t))))
 '(package-selected-packages
   (quote
    (mu4e-maildirs-extension evil-mu4e mu4e-alert ht company-jedi jedi-core python-environment epc ctable concurrent powerline spinner org-category-capture alert log4e gntp org-plus-contrib markdown-mode hydra dash-functional parent-mode projectile haml-mode gitignore-mode fringe-helper git-gutter+ git-gutter pos-tip flycheck pkg-info epl flx magit magit-popup git-commit ghub let-alist with-editor smartparens iedit anzu evil goto-chg undo-tree highlight skewer-mode request-deferred websocket request deferred js2-mode simple-httpd diminish web-completion-data company bind-map bind-key yasnippet packed auctex anaconda-mode pythonic f dash s helm avy helm-core async auto-complete popup zenburn-theme yapfify xterm-color ws-butler winum which-key web-mode volatile-highlights vi-tilde-fringe uuidgen use-package unfill toc-org tagedit spaceline smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-download open-junk-file neotree mwim multi-term move-text mmm-mode markdown-toc magit-gitflow macrostep lua-mode lorem-ipsum live-py-mode linum-relative link-hint less-css-mode info+ indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md fuzzy flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav ein dumb-jump diff-hl define-word cython-mode company-web company-statistics company-auctex company-anaconda column-enforce-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-compile auctex-latexmk aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
