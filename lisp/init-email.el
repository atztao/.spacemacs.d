;;(require 'notmuch)
(require 'gnus-art)

;;the exact path may differ -- check it
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
(require 'org-mu4e)
;;store link to message if in header view, not to header query
(setq org-mu4e-link-query-in-headers-mode nil)

(require 'mu4e)

;; default
(setq mu4e-maildir (expand-file-name "~/Maildir"))

(setq mu4e-drafts-folder "/[Gmail].Drafts")
(setq mu4e-sent-folder   "/[Gmail].Sent Mail")
(setq mu4e-trash-folder  "/[Gmail].Trash")

;; don't save message to Sent Messages, GMail/IMAP will take care of this
(setq mu4e-sent-messages-behavior 'delete)

;; setup some handy shortcuts
(setq mu4e-maildir-shortcuts
      '(("/INBOX"             . ?i)
        ("/[Gmail].Sent Mail" . ?s)
        ("/[Gmail].Trash"     . ?t)))

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

(add-to-list 'mu4e-headers-actions
         '("in browser" . mu4e-action-view-in-browser) t)
(add-to-list 'mu4e-view-actions
	     '("in browser" . mu4e-action-view-in-browser) t)


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

(setq mu4e-org-contacts-file "~/Dropbox/Txt/contacts.txt")
(add-to-list 'mu4e-headers-actions
  '("org-contact-add" . mu4e-action-add-org-contact) t)
(add-to-list 'mu4e-view-actions
  '("org-contact-add" . mu4e-action-add-org-contact) t)

(require 'smtpmail)
(require 'starttls)

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


(provide 'init-email)
