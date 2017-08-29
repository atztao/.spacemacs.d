;-------------
;org-mode
;-------------


;; (setq org-todo-keywords
;;       '((sequence "☐" "☑")))

(defun my/org-mode-hook ()
  "Stop the org-level headers from increasing in height relative to the other text."
  (dolist (face '(org-level-1
                  org-level-2
                  org-level-3
                  org-level-4
                  org-level-5))
    (set-face-attribute face nil :weight 'semi-bold :height 1.0)))

(add-hook 'org-mode-hook 'my/org-mode-hook)


;; (set-face-attribute 'org-agenda-diary nil
;;                     :foreground "red"
;;                     :background nil
;;                     :bold 'normal
;;                     :box '(:color "green" :line-width 2 :style nil))

;;(org-entry-get nil "ITEM")

;; (add-to-list 'load-path "~/.emacs.d/elpa/org-20170515" )
;; (require 'org)
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

(add-hook 'hack-local-variables-hook (lambda () (setq
truncate-lines nil)))
(add-hook 'org-mode-hook   
          (lambda () (setq truncate-lines nil)))  

(defun comment-auto-fill ()
      (setq-local comment-auto-fill-only-comments t)
      (auto-fill-mode 1))

;;Archive All Done Tas
(setq org-archive-location (concat "archive/archive-" (format-time-string "%Y%m" (current-time)) ".org_archive::"))

(defun my-org-archive-done-tasks ()
  (interactive)
  (org-map-entries 'org-archive-subtree "/DONE" '~/Dropbox/Txt/archive/done.txt))

(defun channing/archive-when-done ()
  "Archive current entry if it is marked as DONE (see `org-done-keywords')."
  (when (org-entry-is-done-p)
    (org-archive-subtree-default)))

;; (add-hook 'org-mode-hook '(lambda () 
;; (setq visual-line-fringe-indicators t) 
;; (visual-line-mode) 
;; (if visual-line-mode 
;; (setq word-wrap nil)))) 

;;(add-hook 'org-mode-hook (lambda () (variable-pitch-mode t)))
;;org-mode display
(setq org-fontify-done-headline t)
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(org-agenda-done ((t (:foreground "Gray" :weight normal :strike-through t))))
;;  ;; '(org-done ((t (:foreground "Gray" :weight normal :strike-through t))))
;;  '(org-headline-done ((((class color) (min-colors 16) (background light)) (:foreground "Gray" :strike-through t))))

;; ;;'(term ((t (:background "#ffffff" :foreground "#000000"))))
;;  )

;;the mouse cursor from highlighting lines in the agenda
(add-hook 'org-agenda-finalize-hook
      (lambda () (remove-text-properties
		  (point-min) (point-max) '(mouse-face t))))

(setq org-startup-indented t)
(setq org-hide-leading-stars t)
(setq org-use-speed-commands t)

(setq org-odd-level-only nil) 
(setq org-insert-heading-respect-content nil)

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

;;org-capture

;;org-capture-extension

;; (load "~/.emacs.d/elpa/org-contacts.el")
;; (require 'org-contacts)

;; (load "~/.emacs.d/elpa/outline-presentation.el")
;; (require 'outline-presentation)

                                        
;(setq org-default-notes-file (concat org-directory "~/Dropbox/inbox.txt"))
;;(define-key global-map [f12] 'org-capture)
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
        ("c" "Contact" entry (file+headline "~/Dropbox/Txt/contacts.txt" "Contact")
         "* %?
:PROPERTIES:
:EMAIL: 
:URL:
:MOBILE:
:LOCATION:
:BIRTHDAY: 
:NOTE:
:END:")))

(global-set-key "\C-ca" 'org-agenda)
(setq org-export-coding-system 'utf-8)
(setq org-agenda-convert-date 'Chinese)
(setq diary-file "~/Dropbox/Txt/diary")
(setq org-agenda-include-diary t)
;;(setq org-agenda-files '("~/org"))

;;org-timeline
;; (defvar org-timeline-files nil
;;   "The files to be included in `org-timeline-all-files'. Follows
;;   the same rules as `org-agenda-files'")

;; (setq org-timeline-files '("/home/zhangtao/Dropbox/log/org/"))

;; (add-to-list 'org-agenda-custom-commands
;;              '("R" "Week in review"
;;                 agenda ""
;;                 ;; agenda settings
;;                 ((org-agenda-span 'week)
;;                   (org-agenda-start-on-weekday 0) ;; start on Sunday
;;                   (org-agenda-overriding-header "Week in Review")
;;                   (org-agenda-files 
;;                     (let ((org-agenda-files org-timeline-files))
;;                           (org-agenda-files nil 'ifmode)))
;;                   (org-agenda-start-with-log-mode t)
;;                   (org-agenda-log-mode-items '(clock state))
;;                   (org-agenda-archives-mode t) ; include archive files
;;                 )))


;; (require 'org-crypt)
;; (org-crypt-use-before-save-magic)
;; (setq org-crypt-tag-matcher "Secret")
;; (setq org-tags-exclude-from-inheritance (quote("Secret")))
;; (setq org-crypt-key nil)

;; use org-bullets-mode for utf8 symbols as org bullets
;; (require 'org-bullets)
;; ;; (setq org-ellipsis "+")
;; (setq org-bullets-bullet-LIST '("•"))


;; ;; make available "org-bullet-face" such that I can control the font size individually
;; (setq org-bullets-face-name (quote org-bullet-face))
;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; (setq org-bullets-bullet-list '("•"))


(setq org-publish-project-alist
  '(("html"
     ;; :base-directory "~/org/"
     ;; :base-extension "org"
     :publishing-directory "~/Dropbox/export"
     :publishing-function org-publish-org-to-html)
    ("pdf"
     ;; :base-directory "~/org/"
     ;; :base-extension "org"
     :publishing-directory "~/Dropbox/export"
     :publishing-function org-publish-org-to-pdf)))

(provide 'init-org)
