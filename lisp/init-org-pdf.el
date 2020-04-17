;;-------------------------------------------------------
;;ox-latex export pdf
;;-------------------------------------------------------

(require 'ox-latex) ;;sudo pip install pygmentize https://emacs-china.org/t/spacemacs-org-mode-pdf/1577/15
;; (require 'ox-latex-subfigure)
(require 'org-ref)

(setq org-src-fontify-natively t)
(setq org-src-preserve-indentation t)
;; (setq org-latex-caption-above 1)
(setq org-latex-tables-booktabs t)
(setq org-latex-table-caption-above t)
;; (setq org-export-latex-tables-centered nil)

;; (setq org-export-latex-listings t)
;; ;;org-mode source code setup in exporting to latex
;; (add-to-list 'org-latex-packages-alist '("" "minted")) ;;pip install pygments
;; (setq org-latex-listings 'minted)

;; (setq org-latex-minted-options
;;       '(("frame" "lines")
;; 	("linenos=false")
;; 	;;("fontsize" "\\scriptsize")
;; 	("fontsize" "\\footnotesize")
;; 	("xleftmargin" "\\parindent")
;; 	("xrightmargin" "0.5cm")
;;         ("xleftmargin"  "0.5cm")
;; 	))

;; (setq org-latex-custom-lang-environments
;;            '(
;;             (emacs-lisp "common-lispcode")
;;              ))
;; (setq org-latex-minted-options
;;            '(("frame" "")
;;              ("fontsize" "\\scriptsize")
;;              ("linenos=false" "")))

(setq org-latex-minted-options
      '(("fontsize" "\\footnotesize")("bgcolor" "black")("obeytabs" "true")))


;; (setq org-latex-pdf-process
;;       '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(setq org-latex-pdf-process '("xelatex -shell-escape -interaction nonstopmode %f"
                              "bibtex %b"
                              "makeindex %b"
                              "xelatex -shell-escape -interaction nonstopmode %f"
                              "xelatex -shell-escape -interaction nonstopmode %f"))


;; specify the justification you want
(plist-put org-format-latex-options :justify 'left)


;; (setq org-latex-pdf-process
;;       '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))


;; (setq org-latex-inputenc-alist '(("utf8" . "utf8x")))
;; (add-to-list 'org-latex-packages-alist '("" "unicode-math"))
;; (setq org-preview-latex-default-process 'dvisvgm)
;;xelatex

;;(setq org-latex-create-formula-image-program 'dvipng)
(setq org-latex-create-formula-image-program 'imagemagick)

(add-hook 'LaTeX-mode-hook (lambda ()
                             (push 
                              '("Latex_outdir" "%`latex -auxt-directory=/tmp %(mode)%' %t" 
                                TeX-run-TeX nil (latex-mode doctex-mode) 
                                :help "Run pdflatex with output in /tmp")
                              TeX-command-list)))

;; (setq org-latex-logfiles-extensions (quote ("lof" "lot" "tex~" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl" "pyg")))
(setq org-latex-logfiles-extensions (quote ("lof" "lot" "tex~" "aux" "idx" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "pyg")))
(setq org-latex-remove-logfiles t)

;; (setq org-latex-logfiles-extensions (quote ("lof" "lot" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl" "pyg")))

;; (advice-add 'org-latex-compile :after #'delete-file)


(provide 'init-org-pdf)
