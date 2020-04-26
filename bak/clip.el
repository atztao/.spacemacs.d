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
  ;; (global-set-key (kbd "M-w") 'copy-to-clipboard)
  ;; (global-set-key (kbd "C-y") 'paste-from-clipboard)
  
  ;; (evil-leader/set-key "o y" 'copy-to-clipboard)
  ;; (evil-leader/set-key "o p" 'paste-from-clipboard)
