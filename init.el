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
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#282c34" :foreground "#bbc2cf" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 129 :width normal :foundry "CTDB" :family "Fira Code"))))
 '(dashboard-items-face ((t (:inherit widget-button :height 1.0))))
 '(fixed-pitch ((t (:inherit default))))
 '(fixed-pitch-serif ((t (:family "Iosevka"))))
 '(link ((t (:foreground "#a9a1e1" :underline t :weight bold))))
 '(olivetti-fringe ((t (:inherit fringe))))
 '(org-agenda-column-dateline ((t (:inherit (org-column default)))))
 '(org-column ((t (:inherit default))))
 '(org-document-title ((t (:foreground "#c678dd" :weight bold :height 2.0))))
 '(org-link ((t (:inherit link :foreground "#a9a1e1"))))
 '(org-list-dt ((t (:weight bold))))
 '(org-roam-header-line ((t (:extend t :foreground "tomato" :weight bold :height 1.25))))
 '(org-roam-shielded ((t (:inherit warning :height 1.5))))
 '(org-roam-title ((t (:weight bold))))
 '(org-super-agenda-header ((t (:foreground "LightCoral" :weight bold))))
 '(org-superstar-header-bullet ((t (:family "Source Code Pro"))))
 '(org-superstar-leading ((t (:inherit org-hide :height 0.35))))
 '(org-target ((t (:inherit nil :underline t))))
 '(org-variable-pitch-fixed-face ((t (:weight normal :family "Fira Code"))))
 '(powerline-evil-base-face ((t (:inherit mode-line :foreground "black"))))
 '(variable-pitch ((t (:family "Fira Sans")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#282c34" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#bbc2cf"])
 '(beacon-color "#cc6666")
 '(bibtex-completion-bibliography '("~/notes/pages/sources.bib"))
 '(bibtex-completion-library-path '("~/notes/pages/bibtex-pdfs/"))
 '(custom-enabled-themes '(doom-one))
 '(custom-safe-themes
   '("0466adb5554ea3055d0353d363832446cd8be7b799c39839f387abb631ea0995" "846b3dc12d774794861d81d7d2dcdb9645f82423565bfb4dad01204fa322dbd5" "333958c446e920f5c350c4b4016908c130c3b46d590af91e1e7e2a0611f1e8c5" "a9a67b318b7417adbedaab02f05fa679973e9718d9d26075c6235b1f0db703c8" "5784d048e5a985627520beb8a101561b502a191b52fa401139f4dd20acb07607" "3d54650e34fa27561eb81fc3ceed504970cc553cfd37f46e8a80ec32254a3ec3" "e19ac4ef0f028f503b1ccafa7c337021834ce0d1a2bca03fcebc1ef635776bea" "1278c5f263cdb064b5c86ab7aa0a76552082cf0189acf6df17269219ba496053" "b5803dfb0e4b6b71f309606587dd88651efe0972a5be16ece6a958b197caeed8" "b0e446b48d03c5053af28908168262c3e5335dcad3317215d9fdeb8bac5bacf9" "a82ab9f1308b4e10684815b08c9cac6b07d5ccb12491f44a942d845b406b0296" "1d44ec8ec6ec6e6be32f2f73edf398620bb721afeed50f75df6b12ccff0fbb15" "23c806e34594a583ea5bbf5adf9a964afe4f28b4467d28777bcba0d35aa0872e" "8d7b028e7b7843ae00498f68fad28f3c6258eda0650fe7e17bfb017d51d0e2a2" "97db542a8a1731ef44b60bc97406c1eb7ed4528b0d7296997cbb53969df852d6" "da186cce19b5aed3f6a2316845583dbee76aea9255ea0da857d1c058ff003546" "028c226411a386abc7f7a0fba1a2ebfae5fe69e2a816f54898df41a6a3412bb5" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "246a9596178bb806c5f41e5b571546bb6e0f4bd41a9da0df5dfbca7ec6e2250c" "0d01e1e300fcafa34ba35d5cf0a21b3b23bc4053d388e352ae6a901994597ab1" "c2aeb1bd4aa80f1e4f95746bda040aafb78b1808de07d340007ba898efa484f5" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "cf922a7a5c514fad79c483048257c5d8f242b21987af0db813d3f0b138dfaf53" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "6bdcff29f32f85a2d99f48377d6bfa362768e86189656f63adbf715ac5c1340b" "7eea50883f10e5c6ad6f81e153c640b3a288cd8dc1d26e4696f7d40f754cc703" "6b1abd26f3e38be1823bd151a96117b288062c6cde5253823539c6926c3bb178" "7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" "75b8719c741c6d7afa290e0bb394d809f0cc62045b93e1d66cd646907f8e6d43" "a37d20710ab581792b7c9f8a075fcbb775d4ffa6c8bce9137c84951b1b453016" "e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" "93ed23c504b202cf96ee591138b0012c295338f38046a1f3c14522d4a64d7308" "0e2a7e1e632dd38a8e0227d2227cb8849f877dd878afb8219cb6bcdd02068a52" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "aaa4c36ce00e572784d424554dcc9641c82d1155370770e231e10c649b59a074" "27a1dd6378f3782a593cc83e108a35c2b93e5ecc3bd9057313e1d88462701fcd" "f703efe04a108fcd4ad104e045b391c706035bce0314a30d72fbf0840b355c2c" "1623aa627fecd5877246f48199b8e2856647c99c6acdab506173f9bb8b0a41ac" "d9646b131c4aa37f01f909fbdd5a9099389518eb68f25277ed19ba99adeb7279" "95d0ed21bb0e919be7687a25ad59a1c2c8df78cbe98c9e369d44e65bfd65b167" "ca70827910547eb99368db50ac94556bbd194b7e8311cfbdbdcad8da65e803be" "5b809c3eae60da2af8a8cfba4e9e04b4d608cb49584cb5998f6e4a1c87c057c4" "d74c5485d42ca4b7f3092e50db687600d0e16006d8fa335c69cf4f379dbd0eee" "0fe24de6d37ea5a7724c56f0bb01efcbb3fe999a6e461ec1392f3c3b105cc5ac" "4a8d4375d90a7051115db94ed40e9abb2c0766e80e228ecad60e06b3b397acab" "cae81b048b8bccb7308cdcb4a91e085b3c959401e74a0f125e7c5b173b916bf9" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "3df5335c36b40e417fec0392532c1b82b79114a05d5ade62cfe3de63a59bc5c6" "fd22c8c803f2dac71db953b93df6560b6b058cb931ac12f688def67f08c10640" "3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" "d6603a129c32b716b3d3541fc0b6bfe83d0e07f1954ee64517aa62c9405a3441" "4bca89c1004e24981c840d3a32755bf859a6910c65b829d9441814000cf6c3d0" "fce3524887a0994f8b9b047aef9cc4cc017c5a93a5fb1f84d300391fba313743" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "990e24b406787568c592db2b853aa65ecc2dcd08146c0d22293259d400174e37" "e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" default))
 '(desktop-save-mode t)
 '(doom-modeline-buffer-file-name-style 'truncate-upto-project)
 '(doom-modeline-height 40)
 '(doom-modeline-hud t)
 '(doom-modeline-mode t)
 '(doom-one-brighter-modeline t)
 '(evil-digit-bound-motions '(evil-beginning-of-visual-line))
 '(evil-org-key-theme
   '(navigation insert return textobjects additional shift todo heading calendar))
 '(evil-org-retain-visual-state-on-shift t)
 '(exwm-floating-border-color "#191b20")
 '(fast-but-imprecise-scrolling t)
 '(fci-rule-color "#5B6268")
 '(fit-frame-to-buffer-margins '(10 10 10 10))
 '(frame-background-mode nil)
 '(fringe-mode 30 nil (fringe))
 '(helm-completion-style 'emacs)
 '(helm-left-margin-width 0)
 '(highlight-tail-colors
   ((("#333a38" "#99bb66" "green")
	 . 0)
	(("#2b3d48" "#46D9FF" "brightcyan")
	 . 20)))
 '(indent-tabs-mode t)
 '(indicate-empty-lines t)
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(line-spacing 0.3)
 '(menu-bar-mode nil)
 '(minibuffer-auto-raise t)
 '(mouse-wheel-scroll-amount '(1 ((shift) . 1) ((meta)) ((control) . text-scale)))
 '(objed-cursor-color "#ff6c6b")
 '(olivetti-body-width 110)
 '(olivetti-mode-off-hook '(visual-line-mode))
 '(olivetti-style 'fancy)
 '(orb-citekey-format "cite:&%s" t)
 '(orb-note-actions-interface 'hydra)
 '(org-adapt-indentation nil)
 '(org-agenda-files
   '("~/notes/pages/20211121135742-health_stress_poster.org" "~/notes/pages/20211121134239-science_research_presentation_2021_11_22.org" "~/notes/pages/20211111211405-meeting_with_dr_van_essen_2021_11_11.org" "~/notes/journals/2021-11-01.org" "/home/jadench/notes/journals/2021-10-17.org" "/home/jadench/notes/journals/2021_09_20.org" "/home/jadench/notes/pages/20210921110418-how_to_science_research_presentations.org" "/home/jadench/notes/pages/20210921110743-science_research_co2_monitor_project_presentation.org" "/home/jadench/notes/pages/20210928124526-abigail_finan_psilocybin_presentation_notes.org" "/home/jadench/notes/pages/20210929180741-something.org" "/home/jadench/notes/pages/20211005212814-sketching_polynomials.org" "/home/jadench/notes/pages/20211005212849-math.org" "/home/jadench/notes/pages/20211005213010-synthetic_division.org" "/home/jadench/notes/pages/20211005213056-polynomial_long_division.org" "/home/jadench/notes/pages/20211005213445-multiplicity_polynomials.org" "/home/jadench/notes/pages/20211005214032-rational_root_theorem.org" "/home/jadench/notes/pages/20211005215139-remainder_theorem.org" "/home/jadench/notes/pages/20211005215907-complex_numbers.org" "/home/jadench/notes/pages/20211007174547-columbia_science_honors_program.org" "/home/jadench/notes/pages/20211007181548-computer_science_club.org" "/home/jadench/notes/pages/20211009100017-columbia_shp_introduction_to_algorithms.org" "/home/jadench/notes/pages/20211009101036-insertion_sort.org" "/home/jadench/notes/pages/20211009101111-algorithm.org" "/home/jadench/notes/pages/20211009101307-computers.org" "/home/jadench/notes/pages/20211009101319-programming.org" "/home/jadench/notes/pages/20211009101702-sorting_problem.org" "/home/jadench/notes/pages/20211009101920-substring_matching_problem.org" "/home/jadench/notes/pages/20211009102140-shortest_path_problem.org" "/home/jadench/notes/pages/20211009102410-largest_common_substring.org" "/home/jadench/notes/pages/20211009102514-dynamic_programming.org" "/home/jadench/notes/pages/20211009102622-topological_sort_problem.org" "/home/jadench/notes/pages/20211009110344-bubble_sort.org" "/home/jadench/notes/pages/20211009111219-in_place_sorting.org" "/home/jadench/notes/pages/20211009111627-worst_case_analysis.org" "/home/jadench/notes/pages/20211009111859-average_case_analysis.org" "/home/jadench/notes/pages/20211009114137-selection_sort_algorithm.org" "/home/jadench/notes/pages/20211009114325-merge_sort_algorithm.org" "/home/jadench/notes/pages/20211009114412-quick_sort_algorithm.org" "/home/jadench/notes/pages/20211009114620-heap_sort_algorithm.org" "/home/jadench/notes/pages/20211009114652-counting_sort_algorithm.org" "/home/jadench/notes/pages/20211009114717-radix_sort_algorithm.org" "/home/jadench/notes/pages/20211009114729-bucket_sort_algorithm.org" "/home/jadench/notes/pages/20211010144854-keyboard_lubrication.org" "/home/jadench/notes/pages/20211010144923-mechanical_keyboards.org" "/home/jadench/notes/pages/20211010144952-computer_projects.org" "/home/jadench/notes/pages/20211010145035-mechanical_keyswitches.org" "/home/jadench/notes/pages/20211010155257-gaming.org" "/home/jadench/notes/pages/20211010155325-hobbies.org" "/home/jadench/notes/pages/20211015140410-test_file.org" "/home/jadench/notes/pages/20211017151707-yes.org" "/home/jadench/notes/pages/20211023094336-big_o_notation.org" "/home/jadench/notes/pages/20211023101235-lower_bound_of_sorting.org" "/home/jadench/notes/pages/20211023101517-solving_recursions.org" "/home/jadench/notes/pages/20211023104904-master_s_theorem.org" "/home/jadench/notes/pages/20211023141802-sketching_rational_expressions.org" "/home/jadench/notes/pages/20211023151759-rational_expression.org" "/home/jadench/notes/pages/20211025183045-head_tracking.org" "/home/jadench/notes/pages/How To_ Science Research Project Proposals.org" "/home/jadench/notes/pages/How-To--Research Project Proposals.org" "/home/jadench/notes/pages/Science Research CO2 Monitor Project.org" "/home/jadench/notes/pages/Science Research.org" "/home/jadench/notes/pages/asdfadsfasdf.org" "/home/jadench/notes/pages/contents.org" "/home/jadench/notes/pages/somethingasdfasdfasdfasdfasdf.org" "/home/jadench/notes/pages/test.org" "~/notes/pages/20211023101517-solving_recursions.org" "/home/jadench/notes/daily/2021-10-07.org" "/home/jadench/notes/daily/2021-10-08.org" "/home/jadench/notes/pages/How-To--Research Project Proposals.org" "/home/jadench/notes/pages/contents.org" "/home/jadench/notes/pages/somethingasdfasdfasdfasdfasdf.org" "/home/jadench/notes/pages/test.org" "/home/jadench/Dropbox/todo-two.org" "/home/jadench/Dropbox/APCSP/apcsp.org" "/home/jadench/Dropbox/non_school_academics.org" "/home/jadench/.emacs.d/settings.org"))
 '(org-agenda-prefix-format
   ''((agenda . " %i %-12:c%?-12t% s")
	  (todo . " %i %-12:c")
	  (tags . " %i %-12:c")
	  (search . " %i %-12:c")))
 '(org-ascii-paragraph-spacing 'auto)
 '(org-blank-before-new-entry '((heading . t) (plain-list-item)))
 '(org-cycle-include-plain-lists t)
 '(org-deadline-warning-days 99)
 '(org-display-remote-inline-images 'download)
 '(org-download-display-inline-images nil)
 '(org-fontify-whole-heading-line t)
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
 '(org-roam-bibtex-mode t)
 '(org-roam-ui-follow-mode t)
 '(org-special-ctrl-a/e t)
 '(org-startup-shrink-all-tables t)
 '(org-startup-with-inline-images t)
 '(org-stuck-projects '("+LEVEL=2/-DONE" ("TODO" "NEXT" "NEXTACTION" "") nil ""))
 '(org-super-agenda-mode t)
 '(org-superstar-cycle-headline-bullets nil)
 '(org-superstar-headline-bullets-list '(9679 9673 9675))
 '(org-superstar-item-bullet-alist '((42 . 9702) (43 . 8227) (45 . 8226)))
 '(org-superstar-prettify-item-bullets t)
 '(org-superstar-special-todo-items t)
 '(org-superstar-todo-bullet-alist
   '(("TODO" . 9744)
	 ("NEXT" "→" 9673)
	 ("PROG" "☐~" 9673)
	 ("EXTD" "☐" 9673)
	 ("POST" "☐⁄" 9673)
	 ("DONE" "☑" 9673)
	 ("CNCL" "☐X" 9673)
	 ("FAIL" "☐X" 9673)))
 '(org-use-fast-tag-selection t)
 '(org-use-fast-todo-selection 'expert)
 '(org-variable-pitch-fixed-faces
   '(org-block org-block-begin-line org-block-end-line org-code org-document-info-keyword org-formula org-indent org-meta-line org-special-keyword org-table org-verbatim org-date org-drawer centaur-tabs-default org-property-value org-priority org-hide org-superstar-leading org-superstar-bullet org-target org-headline-done org-done))
 '(package-selected-packages
   '(good-scroll-mode good-scroll lorem-ipsum org-roam-ui org-gcal origami origami-mode org-ref-cite helm-bibtex org-roam-bibtex ligature olivetti org-ql lsp-java page-break-lines doom-modeline simple-httpd websocket org-autolist org-roam pdf-view org hc-zenburn-theme color-theme-sanityinc-tomorrow moe-theme dark-souls figlet latex-unicode-math-mode org-caldav polymode org-brain vterm org-superstar-mode bibtex-utils bibtex-actions org-ref org-drill org-download general org-sidebar haxe-mode flyspell-mode undo-tree calfw-org calfw diminish org-superstar dic-lookup-w3m helm-w3m org-notebook gnuplot latex-extra pandoc ob-ipython evil-org spaceline-config linum-mode highlight-indent-guides powerline-evil ox-pandoc lsp-mode org-babel-eval-in-repl org-agenda doom-themes dap-mode helm-lsp exwm magithub magit writeroom-mode which-key use-package typing soothe-theme right-click-context quelpa powerthesaurus paper-theme org-variable-pitch org-super-links org-super-agenda org-preview-html org-noter-pdftools org-bullets neotree monokai-theme monokai-pro-theme lsp-ui ivy image+ highlight-numbers helm-org-rifle gruvbox-theme grandshell-theme flyspell-correct flycheck evil emacsql-sqlite3 eglot dracula-theme dashboard company ccls buffer-move babel all-the-icons alert))
 '(pdf-view-continuous t)
 '(pdf-view-display-size 'fit-page)
 '(pdf-view-midnight-colors (cons "#bbc2cf" "#282c34"))
 '(pixel-scroll-mode t)
 '(powerline-display-buffer-size nil)
 '(python-indent-guess-indent-offset nil)
 '(python-indent-offset 4)
 '(rustic-ansi-faces
   ["#282c34" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#bbc2cf"])
 '(safe-local-variable-values
   '((org-ref-default-bibliography "~/notes/pages/sources.bib")
	 (org-ref-default-bibliography "./sources.bib")
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
 '(vc-annotate-background "#282c34")
 '(vc-annotate-color-map
   (list
	(cons 20 "#98be65")
	(cons 40 "#b4be6c")
	(cons 60 "#d0be73")
	(cons 80 "#ECBE7B")
	(cons 100 "#e6ab6a")
	(cons 120 "#e09859")
	(cons 140 "#da8548")
	(cons 160 "#d38079")
	(cons 180 "#cc7cab")
	(cons 200 "#c678dd")
	(cons 220 "#d974b7")
	(cons 240 "#ec7091")
	(cons 260 "#ff6c6b")
	(cons 280 "#cf6162")
	(cons 300 "#9f585a")
	(cons 320 "#6f4e52")
	(cons 340 "#5B6268")
	(cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil)
 '(visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
 '(window-divider-mode nil))

(org-babel-tangle-file
 (expand-file-name "settings.org"
		   user-emacs-directory))
(org-babel-load-file
 (expand-file-name "settings.org"
                   user-emacs-directory))
(server-start)
(put 'narrow-to-region 'disabled nil)
