;;-------------------------------------------------------
;;ox-latex export pdf
;;-------------------------------------------------------

(require 'ox-latex) ;;sudo pip install pygmentize https://emacs-china.org/t/spacemacs-org-mode-pdf/1577/15


;; ;;org-mode source code setup in exporting to latex
;; (setq org-latex-listings 'minted)
;; (add-to-list 'org-latex-packages-alist '("" "minted"))
;; (setq org-latex-minted-options
;;       '(("frame" "lines")
;; 	("linenos=false")
;; 	;;("fontsize" "\\scriptsize")
;; 	("fontsize" "\\footnotesize")
;; 	("xleftmargin" "\\parindent")
;; 	("xrightmargin" "0.5cm")
;;         ("xleftmargin"  "0.5cm")
;; 	))

;; ;; (setq org-latex-custom-lang-environments
;; ;;            '(
;; ;;             (emacs-lisp "common-lispcode")
;; ;;              ))
;; ;; (setq org-latex-minted-options
;; ;;            '(("frame" "")
;; ;;              ("fontsize" "\\scriptsize")
;; ;;              ("linenos=false" "")))

;; ;;(setq org-export-latex-listings t)
;; ;; (add-to-list 'org-latex-listings
;; ;;              '("" "listings"))
;; ;; (add-to-list 'org-latex-packages-alist
;; ;;              '("" "listings" t))
;; ;; (add-to-list 'org-latex-listings
;; ;;   	     '("" "color"))

;; (add-to-list 'org-latex-packages-alist
;;              '("" "xcolor" t))
;; (add-to-list 'org-latex-packages-alist
;;              '("" "fontspec" t))
;; (add-to-list 'org-latex-packages-alist
;;              '("" "indentfirst" t))
;; (add-to-list 'org-latex-packages-alist
;;              '("" "xunicode" t))
;; (add-to-list 'org-latex-packages-alist
;;              '("" "geometry"))
;; (add-to-list 'org-latex-packages-alist
;;              '("" "float"))
;; (add-to-list 'org-latex-packages-alist
;;              '("" "longtable"))
;; (add-to-list 'org-latex-packages-alist
;;              '("" "tikz"))
;; (add-to-list 'org-latex-packages-alist
;;              '("" "fancyhdr"))
;; (add-to-list 'org-latex-packages-alist
;;              '("" "textcomp"))
;; (add-to-list 'org-latex-packages-alist
;;              '("" "amsmath"))
;; (add-to-list 'org-latex-packages-alist
;;              '("" "tabularx" t))
;; (add-to-list 'org-latex-packages-alist
;;              '("" "booktabs" t))
;; (add-to-list 'org-latex-packages-alist
;;              '("" "grffile" t))
;; (add-to-list 'org-latex-packages-alist
;;              '("" "wrapfig" t))
;; (add-to-list 'org-latex-packages-alist
;;              '("normalem" "ulem" t))
;; (add-to-list 'org-latex-packages-alist
;;              '("" "amssymb" t))
;; (add-to-list 'org-latex-packages-alist
;;              '("" "capt-of" t))
;; (add-to-list 'org-latex-packages-alist
;;              '("figuresright" "rotating" t))
;; (add-to-list 'org-latex-packages-alist
;;              '("Lenny" "fncychap" t))

;; (add-to-list 'org-latex-classes
;;              '("org-book"
;;                "\\documentclass{book}
;; \\usepackage[slantfont, boldfont]{xeCJK}
;; % chapter set
;; \\usepackage{titlesec}
;;             \\usepackage{hyperref}

;; [NO-DEFAULT-PACKAGES]
;; [PACKAGES]

;; \\setmainfont{Times New Roman}
;; \\setsansfont{Helvetica}
;; \\setmonofont{Courier New}
;; \\setCJKmainfont{SimSun} 
;; \\setCJKsansfont{Microsoft YaHei} 
;; \\setCJKmonofont{FZYTK.ttf} 

;; %如果没有它，会有一些 tex 特殊字符无法正常使用，比如连字符。
;; \\defaultfontfeatures{Mapping=tex-text}

;; % 中文断行
;; \\XeTeXlinebreaklocale \"zh\"
;; \\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt

;; % 代码设置
;; \\lstset{numbers=left,
;; numberstyle= \\tiny,
;; keywordstyle= \\color{ blue!70},commentstyle=\\color{red!50!green!50!blue!50},
;; frame=shadowbox,
;; breaklines=true,
;; rulesepcolor= \\color{ red!20!green!20!blue!20}
;; }

;; [EXTRA]
;; "
;;                  ("\\chapter{%s}" . "\\chapter*{%s}")
;;                  ("\\section{%s}" . "\\section*{%s}")
;;                  ("\\subsection{%s}" . "\\subsection*{%s}")
;;                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                  ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                  ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;;   (add-to-list 'org-latex-classes
;;                '("org-article"
;;                  "\\documentclass{article}
;; \\usepackage[slantfont, boldfont]{xeCJK}
;; \\usepackage{titlesec}
;; \\usepackage{hyperref}

;; [NO-DEFAULT-PACKAGES]
;; [PACKAGES]

;; \\parindent 2em

;; \\setmainfont{Times New Roman}
;; \\setsansfont{Helvetica}
;; \\setmonofont{Courier New}

;; \\setCJKmainfont{SimSun} 
;; \\setCJKsansfont{Microsoft YaHei} 
;; \\setCJKmonofont{FZYTK.ttf} 

;; %如果没有它，会有一些 tex 特殊字符无法正常使用，比如连字符。
;; \\defaultfontfeatures{Mapping=tex-text}

;; % 中文断行
;; \\XeTeXlinebreaklocale \"zh\"
;; \\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt

;; % 代码设置
;; % \\lstset{numbers=left,
;; % numberstyle= \\tiny,
;; % keywordstyle= \\color{ blue!70},commentstyle=\\color{red!50!green!50!blue!50},
;; % frame=shadowbox,
;; % breaklines=true,
;; % rulesepcolor= \\color{ red!20!green!20!blue!20}
;; % }

;; [EXTRA]
;; "
;;                  ("\\section{%s}" . "\\section*{%s}")
;;                  ("\\subsection{%s}" . "\\subsection*{%s}")
;;                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                  ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                  ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;;   (add-to-list 'org-latex-classes
;;                '("org-beamer"
;;                  "\\documentclass{beamer}
;; \\usepackage[SlantFont, BoldFont]{xeCJK}
;; % beamer set
;; \\usepackage[none]{hyphenat}
;; \\usepackage[abs]{overpic}

;; [NO-DEFAULT-PACKAGES]
;; [PACKAGES]

;; \\setmainfont{Times New Roman}
;; \\setsansfont{Helvetica}
;; \\setmonofont{Courier New}

;; \\setCJKmainfont{SimSun} 
;; \\setCJKsansfont{Microsoft YaHei} 
;; \\setCJKmonofont{FZYTK.ttf} 

;; %如果没有它，会有一些 tex 特殊字符无法正常使用，比如连字符。
;; \\defaultfontfeatures{Mapping=tex-text}

;; % 中文断行
;; \\XeTeXlinebreaklocale \"zh\"
;; \\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt

;; % 代码设置
;; \\lstset{numbers=left,
;; numberstyle= \\tiny,
;; keywordstyle= \\color{ blue!70},commentstyle=\\color{red!50!green!50!blue!50},
;; frame=shadowbox,
;; breaklines=true,
;; rulesepcolor= \\color{ red!20!green!20!blue!20}
;; }

;; [EXTRA]
;; "
;;                  ("\\section{%s}" . "\\section*{%s}")
;;                  ("\\subsection{%s}" . "\\subsection*{%s}")
;;                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                  ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                  ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; ;; (add-hook 'org-mode-hook
;; ;;       (lambda () 
;; ;;         (add-to-list 'org-latex-classes
;; ;;              '("ctexart"
;; ;;                "\\documentclass{ctexart}"
;; ;;                ("\\section{%s}" . "\\section*{%s}")
;; ;;                ("\\subsection{%s}" . "\\subsection*{%s}")
;; ;;                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;; ;;                ("\\paragraph{%s}" . "\\paragraph*{%s}")
;; ;;                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))))

;; ;; (setq org-latex-pdf-process '("xelatex -shell-escape -interaction nonstopmode %f"
;; ;;                               "xelatex -shell-escape -interaction nonstopmode %f"))




;; specify the justification you want
(plist-put org-format-latex-options :justify 'center)


(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; (require 'server)
;; (server-force-delete)  ;; WARNING: Kills any existing edit server

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

;;(setq org-latex-logfiles-extensions (quote ("lof" "lot" "tex~" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl" "pyg")))
(setq org-latex-remove-logfiles t)

(setq org-latex-logfiles-extensions (quote ("lof" "lot" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl" "pyg")))

(advice-add 'org-latex-compile :after #'delete-file)


(provide 'init-org-pdf)
