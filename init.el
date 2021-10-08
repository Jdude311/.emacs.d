(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'load-path "~/.emacs.d/customPrograms/")
(add-to-list 'load-path "~/.emacs.d/elpa/")
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.

					;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(require 'use-package)
(require 'org)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dashboard-items-face ((t (:inherit widget-button :height 1.0))))
 '(fixed-pitch ((t (:family "Iosevka"))))
 '(fixed-pitch-serif ((t (:family "Iosevka"))))
 '(org-agenda-structure ((t (:foreground "#bbc2cf" :weight ultra-bold :height 1.5))))
 '(org-column ((t nil)))
 '(org-document-title ((t (:foreground "#c678dd" :weight bold :height 2.0))))
 '(org-level-1 ((t (:inherit default :extend nil :weight bold :height 1.5))))
 '(org-level-2 ((t (:inherit default :extend nil :weight bold :height 1.5))))
 '(org-level-3 ((t (:inherit default :extend nil :weight bold :height 1.5))))
 '(org-level-4 ((t (:inherit default :extend nil :weight bold :height 1.5))))
 '(org-level-5 ((t (:inherit default :extend nil :weight bold :height 1.5))))
 '(org-level-6 ((t (:inherit default :extend nil :weight bold :height 1.5))))
 '(org-level-7 ((t (:inherit default :extend nil :weight bold :height 1.5))))
 '(org-level-8 ((t (:inherit default :extend nil :weight bold :height 1.5))))
 '(org-list-dt ((t (:inherit default :foreground "#bbc2cf"))))
 '(org-roam-header-line ((t (:extend t :foreground "tomato" :weight bold :height 1.25))))
 '(org-roam-shielded ((t (:inherit warning :height 1.5))))
 '(org-roam-title ((t (:weight bold))))
 '(org-super-agenda-header ((t (:inherit org-level-1 :underline t :weight bold :height 0.8))))
 '(org-superstar-leading ((t (:inherit org-hide :height 0.4))))
 '(org-target ((t (:inherit nil :underline t))))
 '(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
 '(org-variable-pitch-fixed-face ((t (:family "Iosevka"))))
 '(powerline-evil-base-face ((t (:inherit mode-line :foreground "black"))))
 '(variable-pitch ((t (:weight normal :family "Droid Serif")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(beacon-color "#cc6666")
 '(custom-safe-themes
   '("835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "246a9596178bb806c5f41e5b571546bb6e0f4bd41a9da0df5dfbca7ec6e2250c" "0d01e1e300fcafa34ba35d5cf0a21b3b23bc4053d388e352ae6a901994597ab1" "c2aeb1bd4aa80f1e4f95746bda040aafb78b1808de07d340007ba898efa484f5" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "cf922a7a5c514fad79c483048257c5d8f242b21987af0db813d3f0b138dfaf53" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "6bdcff29f32f85a2d99f48377d6bfa362768e86189656f63adbf715ac5c1340b" "7eea50883f10e5c6ad6f81e153c640b3a288cd8dc1d26e4696f7d40f754cc703" "6b1abd26f3e38be1823bd151a96117b288062c6cde5253823539c6926c3bb178" "7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" "75b8719c741c6d7afa290e0bb394d809f0cc62045b93e1d66cd646907f8e6d43" "a37d20710ab581792b7c9f8a075fcbb775d4ffa6c8bce9137c84951b1b453016" "e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" "93ed23c504b202cf96ee591138b0012c295338f38046a1f3c14522d4a64d7308" "0e2a7e1e632dd38a8e0227d2227cb8849f877dd878afb8219cb6bcdd02068a52" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "aaa4c36ce00e572784d424554dcc9641c82d1155370770e231e10c649b59a074" "27a1dd6378f3782a593cc83e108a35c2b93e5ecc3bd9057313e1d88462701fcd" "f703efe04a108fcd4ad104e045b391c706035bce0314a30d72fbf0840b355c2c" "1623aa627fecd5877246f48199b8e2856647c99c6acdab506173f9bb8b0a41ac" "d9646b131c4aa37f01f909fbdd5a9099389518eb68f25277ed19ba99adeb7279" "95d0ed21bb0e919be7687a25ad59a1c2c8df78cbe98c9e369d44e65bfd65b167" "ca70827910547eb99368db50ac94556bbd194b7e8311cfbdbdcad8da65e803be" "5b809c3eae60da2af8a8cfba4e9e04b4d608cb49584cb5998f6e4a1c87c057c4" "d74c5485d42ca4b7f3092e50db687600d0e16006d8fa335c69cf4f379dbd0eee" "0fe24de6d37ea5a7724c56f0bb01efcbb3fe999a6e461ec1392f3c3b105cc5ac" "4a8d4375d90a7051115db94ed40e9abb2c0766e80e228ecad60e06b3b397acab" "cae81b048b8bccb7308cdcb4a91e085b3c959401e74a0f125e7c5b173b916bf9" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "3df5335c36b40e417fec0392532c1b82b79114a05d5ade62cfe3de63a59bc5c6" "fd22c8c803f2dac71db953b93df6560b6b058cb931ac12f688def67f08c10640" "3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" "d6603a129c32b716b3d3541fc0b6bfe83d0e07f1954ee64517aa62c9405a3441" "4bca89c1004e24981c840d3a32755bf859a6910c65b829d9441814000cf6c3d0" "fce3524887a0994f8b9b047aef9cc4cc017c5a93a5fb1f84d300391fba313743" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "990e24b406787568c592db2b853aa65ecc2dcd08146c0d22293259d400174e37" "e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" default))
 '(doom-modeline-buffer-file-name-style 'truncate-upto-project)
 '(fast-but-imprecise-scrolling t)
 '(frame-background-mode nil)
 '(helm-completion-style 'emacs)
 '(indent-tabs-mode t)
 '(indicate-empty-lines t)
 '(line-spacing 0.2)
 '(mouse-wheel-scroll-amount '(1 ((shift) . 1) ((meta)) ((control) . text-scale)))
 '(org-agenda-files
   '("/home/jadench/notes/daily/2021-10-07.org" "/home/jadench/notes/daily/2021-10-08.org" "/home/jadench/notes/pages/How-To--Research Project Proposals.org" "/home/jadench/notes/pages/contents.org" "/home/jadench/notes/pages/somethingasdfasdfasdfasdfasdf.org" "/home/jadench/notes/pages/test.org" "/home/jadench/notes/20210921110418-how_to_science_research_presentations.org" "/home/jadench/notes/20210921110743-science_research_co2_monitor_project_presentation.org" "/home/jadench/notes/20210928124526-abigail_finan_psilocybin_presentation_notes.org" "/home/jadench/notes/20210929180741-something.org" "/home/jadench/notes/20211005212814-sketching_polynomials.org" "/home/jadench/notes/20211005212849-math.org" "/home/jadench/notes/20211005213010-synthetic_division.org" "/home/jadench/notes/20211005213056-polynomial_long_division.org" "/home/jadench/notes/20211005213445-multiplicity_polynomials.org" "/home/jadench/notes/20211005214032-rational_root_theorem.org" "/home/jadench/notes/20211005215139-remainder_theorem.org" "/home/jadench/notes/20211005215907-complex_numbers.org" "/home/jadench/notes/20211007174547-columbia_science_honors_program.org" "/home/jadench/notes/20211007181548-computer_science_club.org" "/home/jadench/notes/asdfadsfasdf.org" "~/notes/pages/science_research/CO2_monitor_project/Science Research CO2 Monitor Project Proposal.org" "/home/jadench/Dropbox/todo-two.org" "/home/jadench/Dropbox/APCSP/apcsp.org" "/home/jadench/Dropbox/non_school_academics.org" "/home/jadench/.emacs.d/settings.org"))
 '(org-agenda-skip-scheduled-if-deadline-is-shown nil)
 '(org-ascii-paragraph-spacing 'auto)
 '(org-blank-before-new-entry '((heading . t) (plain-list-item)))
 '(org-cycle-include-plain-lists t)
 '(org-deadline-warning-days 99)
 '(org-download-display-inline-images nil)
 '(org-habit-graph-column 65)
 '(org-habit-preceding-days 14)
 '(org-habit-show-all-today t)
 '(org-habit-show-habits-only-for-today nil)
 '(org-hide-emphasis-markers t)
 '(org-id-track-globally t)
 '(org-image-actual-width 600)
 '(org-latex-pdf-process '("latexmk -shell-escape -bibtex -f -pdf %f"))
 '(org-list-demote-modify-bullet '(("-" . "+") ("+" . "*") ("*" . "*")))
 '(org-log-into-drawer t)
 '(org-noter-pdftools-markup-pointer-color "#FFFF00")
 '(org-outline-path-complete-in-steps nil)
 '(org-pandoc-command "pandoc")
 '(org-pandoc-options
   '((standalone . t)
	 (css . "/home/jadench/.emacs.d/html5-pdf-margins.css")))
 '(org-pandoc-options-for-html5-pdf '((pdf-engine . "weasyprint")))
 '(org-pandoc-options-for-ms '((template . "~/.emacs.d/template.docx")))
 '(org-pandoc-options-for-odt
   '((template . "/home/jadench/Templates/mla-test.opendocument")
	 (reference-doc . "/home/jadench/.emacs.d/pandoc/custom-reference.odt")))
 '(org-pandoc-options-for-pptx nil)
 '(org-pdftools-markup-pointer-function 'pdf-annot-add-highlight-markup-annotation)
 '(org-pretty-entities t)
 '(org-refile-targets '((org-agenda-files :maxlevel . 15)))
 '(org-refile-use-outline-path 'file)
 '(org-roam-ui-follow-mode t)
 '(org-roam-ui-mode t)
 '(org-startup-shrink-all-tables t)
 '(org-stuck-projects '("+LEVEL=2/-DONE" ("TODO" "NEXT" "NEXTACTION" "") nil ""))
 '(org-super-agenda-mode t)
 '(org-superstar-cycle-headline-bullets nil)
 '(org-superstar-headline-bullets-list '(9673))
 '(org-superstar-item-bullet-alist '((42 . 8227) (43 . 8226) (45 . 8213)))
 '(org-superstar-prettify-item-bullets t)
 '(org-superstar-todo-bullet-alist '(("TODO" . 9744) ("DONE" "BALLS" 9673)))
 '(org-use-fast-tag-selection t)
 '(org-use-fast-todo-selection 'expert)
 '(org-variable-pitch-fixed-faces
   '(org-block org-block-begin-line org-block-end-line org-code org-document-info-keyword org-formula org-indent org-meta-line org-special-keyword org-table org-verbatim org-date org-drawer centaur-tabs-default org-property-value org-priority org-hide org-superstar-leading org-superstar-bullet org-target org-headline-done org-done))
 '(package-selected-packages
   '(org-ql lsp-java page-break-lines doom-modeline simple-httpd websocket org-autolist org-roam pdf-view org hc-zenburn-theme color-theme-sanityinc-tomorrow moe-theme dark-souls figlet latex-unicode-math-mode org-caldav polymode org-brain vterm org-superstar-mode bibtex-utils bibtex-actions org-ref org-drill org-download general org-sidebar haxe-mode flyspell-mode undo-tree calfw-org calfw diminish org-superstar dic-lookup-w3m helm-w3m org-notebook gnuplot latex-extra pandoc ob-ipython evil-org spaceline-config linum-mode highlight-indent-guides powerline-evil ox-pandoc lsp-mode org-babel-eval-in-repl org-agenda doom-themes dap-mode helm-lsp exwm magithub magit writeroom-mode which-key use-package typing soothe-theme smooth-scrolling right-click-context quelpa powerthesaurus paper-theme org-variable-pitch org-super-links org-super-agenda org-preview-html org-noter-pdftools org-bullets neotree monokai-theme monokai-pro-theme lsp-ui lsp-treemacs ivy image+ highlight-numbers helm-org-rifle gruvbox-theme grandshell-theme flyspell-correct flycheck evil emacsql-sqlite3 eglot dracula-theme dashboard company centaur-tabs ccls buffer-move babel all-the-icons alert))
 '(pdf-view-continuous t)
 '(pdf-view-display-size 'fit-page)
 '(powerline-display-buffer-size nil)
 '(python-indent-guess-indent-offset nil)
 '(python-indent-offset 4)
 '(safe-local-variable-values
   '((org-ref-default-bibliography "./sources.bib")
	 (org-ref-default-bibliography . "./sources.bib")
	 (org-ref-default-bibliography "./references.bib")
	 (org-ref-default-bibliography . "./references.bib")
	 (reftex-default-bibliography . "~/Documents/School/Apocalypse-2021_School_Year/Science_Research/references.bib")
	 (reftex-default-bibliography . "./references.bib")))
 '(sage-shell:use-prompt-toolkit nil)
 '(sage-shell:use-simple-prompt t)
 '(scroll-preserve-screen-position nil)
 '(smooth-scroll-margin 10)
 '(smooth-scrolling-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(tool-bar-style 'both-horiz)
 '(undo-tree-visualizer-relative-timestamps t)
 '(undo-tree-visualizer-timestamps t)
 '(window-divider-mode nil)
 '(writeroom-global-effects
   '(writeroom-set-fullscreen writeroom-set-alpha writeroom-set-menu-bar-lines writeroom-set-tool-bar-lines writeroom-set-vertical-scroll-bars writeroom-set-bottom-divider-width)))

(org-babel-tangle-file
 (expand-file-name "settings.org"
		   user-emacs-directory))
(org-babel-load-file
 (expand-file-name "settings.org"
                   user-emacs-directory))
(server-start)
(put 'narrow-to-region 'disabled nil)
