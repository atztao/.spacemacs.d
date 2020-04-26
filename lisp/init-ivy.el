(defun my-swiper-isearch-again ()
  "Start swiper-isearch with the last thing searched for."
  (interactive)
  (swiper-isearch (car swiper-history)))

(require 'ivy-rich)
(ivy-rich-mode 1)
(setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
(setq ivy-rich-display-transformers-list
      '(ivy-switch-buffer
        (:columns
         ((ivy-rich-switch-buffer-icon (:width 2))
          (ivy-rich-candidate (:width 30))
          (ivy-rich-switch-buffer-size (:width 7))
          (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right))
          (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))
          (ivy-rich-switch-buffer-project (:width 15 :face success))
          (ivy-rich-switch-buffer-path (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width 0.3))))))
         :predicate
         (lambda (cand) (get-buffer cand)))))
;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
(setq ivy-use-virtual-buffers t)
(setq ivy-virtual-abbreviate 'full)
;; number of result lines to display
(setq ivy-height 12)

;; (global-set-key (kbd "C-s") 'avy-goto-char)
;; (global-set-key (kbd "M-s") 'swiper-isearch)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-x C-b") 'ivy-switch-buffer)
(global-set-key (kbd "C-x C-r") 'counsel-recentf)

(setq counsel-grep-base-command
      "rg -i -M 120 --no-heading --line-number --color never %s %s")

(setq counsel-find-file-at-point t)
(defun ivy-switch-project ()
  (interactive)
  (ivy-read
   "Switch to project: "
   (if (projectile-project-p)
       (cons (abbreviate-file-name (projectile-project-root))
             (projectile-relevant-known-projects))
     projectile-known-projects)
   :action #'projectile-switch-project-by-name))

(global-set-key (kbd "C-x p") 'ivy-switch-project)

(provide 'init-ivy)
