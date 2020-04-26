(defun my-save-if-bufferfilename ()
  (if (buffer-file-name)
      (progn
        (save-buffer)
        )
    (message "no file is associated to this buffer: do nothing")
    )
  )

(add-hook 'evil-insert-state-exit-hook 'my-save-if-bufferfilename)
 
(save-place-mode 1)

;;Auto Save - Backup-----------------------------------------
(super-save-mode +1)
;; (setq super-save-auto-save-when-idle t)



(setq real-auto-save-interval 1) ;; in seconds


;; (setq auto-save-default nil)
;; (setq make-backup-files nil)

(setq backup-directory-alist '(("" . "~/.backup")))
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backp files silently
      auto-save-visited-file-name t
      delete-by-moving-to-trash t
      kept-old-versions 30               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 20               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 1               ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )

;;在mode line隐藏mode显示
(diminish 'super-save-mode)

(provide 'init-save)
