;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (defaul奇异恩典t 'spacemacs)
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
     mu4e
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      ;;evil-mu4e
                                      super-save
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
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
   dotspacemacs-install-packages 'used-only))

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
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
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
                         ;;default
                         ;;sanityinc-solarized-dark
                         ;;zenburn
                         ;;sanityinc-tomorrow-night
                         ;;sanityinc-tomorrow-eighties
                         sanityinc-tomorrow-bright
                         spacemacs-dark
                         spacemacs-light
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Monaco"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
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
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
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


  ;;flyspell-----------------------------------
  ;;apt install aspell
  (setq-default ispell-program-name "aspell")
  (ispell-change-dictionary "american" t)  

  ;;Backup-----------------------------------------
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


  ;; (set-background-color "#000000")
  ;; (set-foreground-color "#32cd32")
  ;;Some Configuration For Face

  (setq frame-title-format
        (list ;;'(:eval (projectile-project-name)) 
         "(●—●) I'm Here @ "
         '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

  (setq x-select-enable-clipboard t)

  (setq shell-file-name "/bin/zsh")

  ;;(set-face-attribute 'mode-line nil  :height 70)
  ;;(set-face-attribute 'mode-line-inactive nil  :height 70)

  ;;Chinese Fonts
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset (font-spec :family "Source Han Sans CN" :size 16)))

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

  ;;Fullscreen
  ;; (global-set-key [f11] 'my-fullscreen) 
  ;; (defun my-fullscreen ()
  ;;   (interactive)
  ;; (x-send-client-message
  ;;  nil 0 nil "_NET_WM_STATE" 32
  ;;  '(2 "_NET_WM_STATE_FULLSCREEN" 0))
  ;; )


  ;;Setting For Vim Mode
  ;;{------------------------------------------------
  ;;jk Escape All The Mode
  (evil-escape-mode 1)
  (setq-default evil-escape-key-sequence "jk")
  (setq evil-escape-excluded-major-modes '(dired-mode))
  (setq-default evil-escape-delay 0.2)

  ;;Diffrent Color With Diffrent Mode
  ;; (setq-default
  ;;  evil-normal-state-tag (propertize "N" 'face '((:background "green" :foreground "black")))
  ;;  evil-emacs-state-tag (propertize "E" 'face '((:background "orange" :foreground "black")))
  ;;  evil-insert-state-tag (propertize "I" 'face '((:background "red")))
  ;;  evil-motion-state-tag (propertize "M" 'face '((:background "blue")))
  ;;  evil-visual-state-tag (propertize "V" 'face '((:background "grey80" :foreground "cyan")))
  ;;  evil-operator-state-tag (propertize "O" 'face '((:background "purple"))))

  ;;-----------------------------------------------}

  ;;Org-Mode
  ;;{------------------------------------------------

  (defun my/org-mode-hook ()
    "Stop the org-level headers from increasing in height relative to the other text."
    (dolist (face '(org-level-1
                    org-level-2
                    org-level-3
                    org-level-4
                    org-level-5))
      (set-face-attribute face nil :weight 'semi-bold :height 1.0)))

  (add-hook 'org-mode-hook 'my/org-mode-hook)

  (setq org-list-description-max-indent 5)
  (setq org-adapt-indentation nil)

  (setq org-latex-images-centered t)
  (setq org-startup-xindented t)

  (setq org-log-done 'time)
  ;;(setq org-log-done 'note)
  (setq org-agenda-skip-scheduled-if-done t)
  (setq org-agenda-skip-deadline-if-done t)

  (setq org-use-speed-commands t)

  (setq org-todo-state-tags-triggers
        '(("CANCELLED" ("ARCHIVE" . t)))) 
  ;;export image width
  (setq org-image-actual-width 100)
  ;;Auto Fill
  (add-hook 'text-mode-hook 'turn-on-auto-fill)

  (add-hook 'hack-local-variables-hook (lambda () (setq truncate-lines nil)))
  (add-hook 'org-mode-hook   
            (lambda () (setq truncate-lines nil)))  


  ;;(add-hook 'org-mode-hook (lambda () (variable-pitch-mode t)))
  ;;org-mode display
  (setq org-fontify-done-headline t)

  ;;the mouse cursor from highlighting lines in the agenda
  (add-hook 'org-agenda-finalize-hook
            (lambda () (remove-text-properties
                        (point-min) (point-max) '(mouse-face t))))

  (setq org-startup-indented t)
  (setq org-hide-leading-stars t)

  (setq org-confirm-babel-evaluate nil)

  ;;source code

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((lisp . t)))

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)))

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((latex . t)))

  (setq org-src-fontify-natively t)
  (setq org-src-tab-acts-natively t)

  (setq org-export-babel-evaluate nil)

  (setq org-use-speed-commands t)

  (defun org-babel-tangle-block()
    (interactive)
    (let ((current-prefix-arg '(4)))
      (call-interactively 'org-babel-tangle)
      ))

  (setq org-ascii-links-to-notes nil)
  (setq org-ascii-headline-spacing (quote (1 . 1)))

  ;;Text
  ;; (add-to-list 'org-emphasis-alist
  ;;              '("*" (:foreground "red")
  ;;                ))
  ;; (setq org-emphasis-alist
  ;;       (cons '("*" '(:emphasis t :foreground "yellow"))
  ;;             (delete* "*" org-emphasis-alist :key 'car :test 'equal)))
  (setq org-hide-emphasis-markers t)
  (add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))

  (define-key global-map "\C-cc" 'org-capture)
  (setq org-capture-templates
        ;; `(("t" "Todo" entry (file+headline "~/Dropbox/Txt/todo.txt" "Inbox")
        ;;    "* TODO %? ")
        `(("t" "Todo" entry (file+headline "~/Dropbox/Txt/todo.txt" "Inbox")
           "* TODO  %? ")
          ("n" "Note" entry (file+headline "~/Dropbox/Txt/inbox.txt" "Note")
           "* %U\n%? ")
          ;; ("l" "Link" entry (file+headline "~/Dropbox/Txt/inbox.txt" "Link")
          ;;  "* %? \n%U\n")
          ))

  (global-set-key "\C-ca" 'org-agenda)
  (setq org-export-coding-system 'utf-8)
  (setq org-agenda-convert-date 'Chinese)
  (setq diary-file "~/Dropbox/Txt/diary")
  (setq org-agenda-include-diary t)
  ;;------------------------------------------------}

  (global-set-key [f8] 'neotree-toggle)
  (setq-default neo-smart-open t)
  (setq neo-theme (if (display-graphic-p) 'ascii))
  (setq-default neo-mode-line-format nil)

  ;;Some Color
  ;;{------------------------------------------------
  ;;(make-face-bold 'isearch)
  ;;(make-face-bold 'lazy-highlight)
  ;;(set-face-foreground 'isearch "#000000")
  ;;(set-face-background 'isearch "#ffff00")
  ;;(set-face-foreground 'lazy-highlight "#000000")
  ;;(set-face-background 'lazy-highlight "#ffff00")

  ;;(set-face-attribute 'region nil :foreground "#000000":background "#F0E68C" ) ;;#EEE8D6 F0E68C

  ;;(set-cursor-color "green")
  ;;(set-cursor-color "red")
  ;;------------------------------------------------}


  ;;Mail With Mu4e
  ;;{------------------------------------------------

  ;;(require 'notmuch)
  ;;the exact path may differ -- check it
  ;;store link to message if in header view, not to header query
  ;;(require 'evil-mu4e)

  ;; default
  (setq mu4e-maildir "~/Maildir"
        mu4e-drafts-folder "/[Gmail].Drafts"
        mu4e-sent-folder   "/[Gmail].Sent Mail"
        mu4e-trash-folder  "/[Gmail].Trash")
  ;; ;; don't save message to Sent Messages, GMail/IMAP will take care of this
  (setq mu4e-sent-messages-behavior 'delete)

  ;; setup some handy shortcuts
  ;; (setq mu4e-maildir-shortcuts
  ;;       '(("/INBOX"             . ?i)
  ;;         ("/[Gmail].Sent Mail" . ?s)
  ;;         ("/[Gmail].Trash"     . ?t)))

  ;; allow for updating mail using 'U' in the main view:
  (setq mu4e-get-mail-command "offlineimap")
  ;; (setq mu4e-html2text-command "/usr/bin/google-chrome -T text/html")
  (defun mu4e-action-view-in-browser (msg)
    (let* ((q mu4e-html2text-command)
           )
      (setq mu4e-html2text-command "mu4e-showinbrowser.sh")
      (mu4e-message-body-text msg)
      (setq mu4e-html2text-command q)
      ))

  ;; (add-to-list 'mu4e-headers-actions
  ;;              '("in browser" . mu4e-action-view-in-browser) t)
  ;; (add-to-list 'mu4e-view-actions
  ;;              '("in browser" . mu4e-action-view-in-browser) t)


  ;; (ido-completing-read "Complete contact: " (mu4e~compose-complete-contact))
  ;; (defun select-and-insert-contact ()
  ;;   (interactive)
  ;;   (insert (ido-completing-read "Contact: " mu4e~contacts-for-completion)))

  (setq
   user-mail-address "ztao1991@gmail.com"
   user-full-name  "zhangtao"
   mu4e-compose-signature
   (concat
    "Tao Zhang\n"
    "https://ztao1991.github.io\n"
    "Edit By GNU Emacs")
   )

  (setq mu4e-view-show-images t)

  ;; (setq mu4e-compose-signature "天行健，君子以自强不息。地势坤，君子以厚德载物。——《周易》")
  ;; (setq mu4e-compose-signature "")


  (setq
   message-send-mail-function 'smtpmail-send-it
   user-full-name "zhangtao"
   user-mail-address "ztao1991@gmail.com"
   smtpmail-starttls-credentials '(("smtp.gmail.com" "587" nil nil))
   smtpmail-auth-credentials (expand-file-name "~/.authinfo.gpg")
   smtpmail-default-smtp-server "smtp.gmail.com"
   smtpmail-smtp-server "smtp.gmail.com"
   smtpmail-smtp-service 587
   smtpmail-debug-info t
   starttls-extra-arguments nil
   starttls-gnutls-program "/usr/bin/gnutls-cli"
   smtpmail-stream-type 'starttls
   starttls-extra-arguments nil
   starttls-use-gnutls t
   )

  (setq eww-search-prefix "http://www.bing.com/search?q=")

  ;;------------------------------------------------}


  ;;Python SHOULD SET :export PATH=$HOME/anaconda3/bin:$PATH IN .zshenv
  (setenv "WORKON_HOME" "/home/zhangtao/anaconda3/")
  (setq python-shell--interpreter "/home/zhangtao/anaconda3/bin/python3")
  (setq python-shell--interpreter-args "")
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
 '(org-agenda-files (quote ("~/Dropbox/Txt/todo.txt")))
 '(org-agenda-done ((t (:foreground "Gray" :weight normal :strike-through t))))
 '(org-done ((t (:foreground "Gray" :weight extra-bold :strike-through t))))
 '(org-headline-done ((((class color) (min-colors 16) (background dark)) (:foreground "#999" :strike-through t))))
 '(package-selected-packages
   (quote
    (web-mode pug-mode persp-mode mu4e-alert move-text live-py-mode link-hint info+ hy-mode dash-functional highlight-numbers fill-column-indicator evil-surround evil-nerd-commenter evil-escape eshell-prompt-extras esh-help ein websocket deferred dumb-jump cython-mode ace-link iedit smartparens evil goto-chg flycheck yasnippet company helm helm-core markdown-mode projectile org-plus-contrib magit magit-popup git-commit async hydra s yapfify xterm-color ws-butler with-editor winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package unfill undo-tree toc-org tagedit super-save spaceline smex smeargle slim-mode skewer-mode shell-pop scss-mode sass-mode restart-emacs request-deferred rainbow-delimiters pyvenv pytest pyenv-mode py-isort popwin pkg-info pip-requirements pcre2el parent-mode paradox orgit org-projectile org-present org-pomodoro org-download open-junk-file neotree mwim multi-term mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum linum-relative less-css-mode indent-guide hungry-delete htmlize ht hl-todo highlight-parentheses highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md fuzzy flycheck-pos-tip flx-ido fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-search-highlight-persist evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z emmet-mode elisp-slime-nav diff-hl define-word company-web company-statistics company-auctex company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-compile auctex-latexmk aggressive-indent adaptive-wrap ace-window ace-jump-helm-line ac-ispell))))
