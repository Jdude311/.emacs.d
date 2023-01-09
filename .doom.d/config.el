(setq doom-font (font-spec :family "Cascadia Code" :size 16))
(doom/reload-font)

(setq-default line-spacing 3)

(setq +helm-posframe-text-scale 0)

(doom-modeline-mode t)
(setq doom-modeline-height 36)

(setq doom-theme 'doom-gruvbox)
(load-theme 'doom-gruvbox t)

(use-package! org-superstar
  :hook (org-mode . org-superstar-mode))

(after! org-superstar
  (setq org-superstar-headline-bullets-list '(9679 9673 9675))
  (setq org-superstar-item-bullet-alist '((42 . 9642) (43 . 9702) (45 . 8226 )))
  (setq org-superstar-leading-bullet "-")
  (setq org-superstar-special-todo-items t)
  (org-superstar-restart))

(setq fringe-mode 50)
(use-package! olivetti
  :config
  (setq olivetti-body-width 100)
  (setq olivetti-margin-width 10)
  (setq olivetti-minimum-body-width 20)
  (setq olivetti-style 'fancy)
  (set-face-attribute 'olivetti-fringe nil :inherit 'org-block)
  :hook ((org-mode . olivetti-mode)
        (olivetti-mode-on . (lambda () (org-indent-mode -1)))
        (olivetti-mode-on . (lambda () (company-mode -1)))
        (olivetti-mode-on . (lambda () (flyspell-lazy-mode -1)))
        (olivetti-mode-on . (lambda () (flyspell-mode 1)))
        (olivetti-mode-on . adaptive-wrap-prefix-mode)))

(use-package! org-variable-pitch
  :config
  (setq org-variable-pitch-fixed-faces
        '(org-block
          org-block-begin-line
          org-block-end-line
          org-code
          org-document-info-keyword
          org-done
          org-formula
          org-indent
          org-meta-line
          org-special-keyword
          org-table
          org-todo
          org-verbatim
          org-date
          org-drawer
          org-property-value
          org-priority
          org-hide
          org-superstar-leading
          org-ellipsis
          line-number
          org-tag
          org-target))
  :hook ((org-mode) . org-variable-pitch-minor-mode))
(set-face-attribute 'variable-pitch nil :family "Latin Modern Roman" :weight 'normal)
;; (set-face-attribute 'variable-pitch nil :family "Latin Modern Mono" :weight 'medium)
;; (set-face-attribute 'variable-pitch nil :family "Latin Modern Mono" :weight 'medium)

(add-hook 'org-mode-hook #'+org-pretty-mode)

(setq! global-hl-line-mode nil)
(setq doom--hl-line-mode -1)
(setq! global-display-line-numbers-mode nil)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'hl-line-mode)

(remove-hook! text-mode #'display-line-numbers-mode)
(add-hook 'org-mode-hook #'(lambda () (global-display-line-numbers-mode -1)))
(add-hook 'org-mode-hook #'(lambda () (global-hl-line-mode -1)))

(after! org
  (let (var (heading-scale 1.25))
    (set-face-attribute 'org-level-1 nil :height heading-scale :extend t)
    (set-face-attribute 'org-level-2 nil :height heading-scale :extend t)
    (set-face-attribute 'org-level-3 nil :height heading-scale :extend t)
    (set-face-attribute 'org-level-4 nil :height heading-scale :extend t)
    (set-face-attribute 'org-level-5 nil :height heading-scale :extend t)
    (set-face-attribute 'org-level-6 nil :height heading-scale :extend t)
    (set-face-attribute 'org-level-7 nil :height heading-scale :extend t)
    (set-face-attribute 'org-level-8 nil :height heading-scale :extend t)))

(setq! org-pretty-mode t)

(use-package! org-ref-prettify
  :after org
  :hook (org-mode . org-ref-prettify-mode))

(setq evil-respect-visual-line-mode t)
(evil-better-visual-line-on)
(map! :map evil-org-mode-map
    :desc "0"
    :nvr "0" #'evil-beginning-of-visual-line)
(map! :map evil-org-mode-map
    :desc "$"
    :nvr "$" #'evil-end-of-visual-line)
(map! :map evil-ex-map
    :desc "0"
    :nvr "0" #'evil-beginning-of-visual-line)
(map! :map evil-ex-map
    :desc "$"
    :nvr "$" #'evil-end-of-visual-line)

(after! org
  (setq org-blank-before-new-entry '((heading . always) (plain-list-item))
        org-ascii-headline-spacing '(1 . 2)))
(add-hook! evil-org-mode
  (map! :map evil-org-mode-map
        :desc "<C-return>"
        :nvi "<C-return>" #'evil-org-org-insert-heading-respect-content-below))

(use-package org-roam
  :hook ((after-init . org-roam-setup)
         (org-roam-backlinks-mode . visual-line-mode))
  :config
  '(org-roam-dailies-capture-templates
    '(("d" "default" entry "* %?\
        " :target
        (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>
              ")
        :empty-lines-after 1
        :empty-lines-before 1)))

  (setq org-roam-capture-templates
        '(("d" "default" plain "%?" :target
           (file+head "pages/%<%Y%m%d%H%M%S>-${slug}.org" "
  #+filetags:
  #+title: ${title}
  - Links ::


      ")
           :unnarrowed t)))
  (setq org-roam-v2-ack t)
  (setq org-roam-directory "~/notes")
  (setq org-roam-dailies-directory "journals/")
  (setq org-roam-db-node-include-function
        (lambda ()
          (not (member "roam_exclude" (org-get-tags)))))
  (setq org-roam-mode-section-functions
        (list #'org-roam-backlinks-section
              #'org-roam-reflinks-section
              ;; #'org-roam-unlinked-references-section
              ))
  :bind (("C-c n f" . org-roam-node-find)
         ("C-c n c" . org-roam-capture)
         ("C-c n g" . org-roam-ui-mode)
         ("C-c n r" . org-roam-node-random)
         ("C-c n d" . org-roam-dailies-capture-today)
         (:map org-mode-map
          (("C-c n i" . org-roam-node-insert)
           ("C-c C-w" . org-roam-refile)
           ("C-c n o" . org-id-get-create)
           ("C-c n t" . org-roam-tag-add)
           ("C-c n a" . org-roam-alias-add)
           ("C-c n l" . org-roam-buffer-toggle)))))
(org-roam-db-autosync-mode)

  (use-package! org-ref
    ;; :after org-cite
    :config
    (setq
        bibtex-autokey-titlewords 3
        bibtex-completion-bibliography '("~/notes/pages/sources.bib")
        bibtex-completion-library-path '("~/notes/pages/bibtex-pdfs/")
        bibtex-completion-notes-path "~/notes/pages"
        bibtex-completion-additional-search-fields '(keywords))
        ;; bibtex-completion-display-formats
        ;; '((article       . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${journal:40}")
        ;;     (inbook        . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} Chapter ${chapter:32}")
        ;;     (incollection  . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
        ;;     (inproceedings . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
        ;;     (t             . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*}"))
        ;;     bibtex-completion-pdf-open-function
        ;;     (lambda (fpath)
        ;;         (call-process "open" nil 0 nil fpath)))

    :bind ("C-c r i" . org-ref-cite-insert-helm))

(use-package! helm-bibtex
  :after org-ref)

  (use-package! org-roam-bibtex
    :after org-ref
    :config (require 'org-ref)
    (setq bibtex-completion-edit-notes-function 'orb-edit-citation-note))
(org-roam-bibtex-mode t)

    ;;; ox-extra.el --- Convenience functions for org export

    ;; Copyright (C) 2014  Aaron Ecay

    ;; Author: Aaron Ecay <aaronecay@gmail.com>

    ;; This program is free software; you can redistribute it and/or modify
    ;; it under the terms of the GNU General Public License as published by
    ;; the Free Software Foundation, either version 3 of the License, or
    ;; (at your option) any later version.

    ;; This program is distributed in the hope that it will be useful,
    ;; but WITHOUT ANY WARRANTY; without even the implied warranty of
    ;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    ;; GNU General Public License for more details.

    ;; You should have received a copy of the GNU General Public License
    ;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

    ;;; Commentary:

    ;; This file contains some convenience functions for org export, which
    ;; are not part of org's core.  Call `ox-extras-activate' passing a
    ;; list of symbols naming extras, which will be installed globally in
    ;; your org session.
    ;;
    ;; For example, you could include the following in your .emacs file:
    ;;
    ;;    (require 'ox-extra)
    ;;    (ox-extras-activate '(latex-header-blocks ignore-headlines))
    ;;

    ;; Currently available extras:

    ;; - `latex-header-blocks' -- allow the use of latex blocks, the
    ;; contents of which which will be interpreted as #+latex_header lines
    ;; for export.  These blocks should be tagged with #+header: :header
    ;; yes.  For example:
    ;; #+header: :header yes
    ;; #+begin_export latex
    ;;   ...
    ;; #+end_export

    ;; - `ignore-headlines' -- allow a headline (but not its children) to
    ;; be ignored.  Any headline tagged with the 'ignore' tag will be
    ;; ignored (i.e. will not be included in the export), but any child
    ;; headlines will not be ignored (unless explicitly tagged to be
    ;; ignored), and will instead have their levels promoted by one.

    ;; TODO:
    ;; - add a function to org-mode-hook that looks for a ox-extras local
    ;;   variable and activates the specified extras buffer-locally
    ;; - allow specification of desired extras to be activated via
    ;;   customize

    ;;; Code:

    (require 'ox)
    (eval-when-compile (require 'cl))

    (defun org-latex-header-blocks-filter (backend)
      (when (org-export-derived-backend-p backend 'latex)
        (let ((positions
         (org-element-map (org-element-parse-buffer 'greater-element nil) 'export-block
           (lambda (block)
             (when (and (string= (org-element-property :type block) "LATEX")
            (string= (org-export-read-attribute
                :header block :header)
               "yes"))
         (list (org-element-property :begin block)
               (org-element-property :end block)
               (org-element-property :post-affiliated block)))))))
          (mapc (lambda (pos)
            (goto-char (nth 2 pos))
            (destructuring-bind
          (beg end &rest ignore)
          (org-edit-src-find-region-and-lang)
        (let ((contents-lines (split-string
                   (buffer-substring-no-properties beg end)
                   "\n")))
          (delete-region (nth 0 pos) (nth 1 pos))
          (dolist (line contents-lines)
            (insert (concat "#+latex_header: "
                (replace-regexp-in-string "\\` *" "" line)
                "\n"))))))
          ;; go in reverse, to avoid wrecking the numeric positions
          ;; earlier in the file
          (reverse positions)))))


    ;; During export headlines which have the "ignore" tag are removed
    ;; from the parse tree.  Their contents are retained (leading to a
    ;; possibly invalid parse tree, which nevertheless appears to function
    ;; correctly with most export backends) all children headlines are
    ;; retained and are promoted to the level of the ignored parent
    ;; headline.
    ;;
    ;; This makes it possible to add structure to the original Org-mode
    ;; document which does not effect the exported version, such as in the
    ;; following examples.
    ;;
    ;; Wrapping an abstract in a headline
    ;;
    ;;     * Abstract                        :ignore:
    ;;     #+LaTeX: \begin{abstract}
    ;;     #+HTML: <div id="abstract">
    ;;
    ;;     ...
    ;;
    ;;     #+HTML: </div>
    ;;     #+LaTeX: \end{abstract}
    ;;
    ;; Placing References under a headline (using ox-bibtex in contrib)
    ;;
    ;;     * References                     :ignore:
    ;;     #+BIBLIOGRAPHY: dissertation plain
    ;;
    ;; Inserting an appendix for LaTeX using the appendix package.
    ;;
    ;;     * Appendix                       :ignore:
    ;;     #+LaTeX: \begin{appendices}
    ;;     ** Reproduction
    ;;     ...
    ;;     ** Definitions
    ;;     #+LaTeX: \end{appendices}
    ;;
    (defun org-export-ignore-headlines (data backend info)
      "Remove headlines tagged \"ignore\" retaining contents and promoting children.
    Each headline tagged \"ignore\" will be removed retaining its
    contents and promoting any children headlines to the level of the
    parent."
      (org-element-map data 'headline
        (lambda (object)
          (when (member "ignore" (org-element-property :tags object))
            (let ((level-top (org-element-property :level object))
                  level-diff)
              (mapc (lambda (el)
                      ;; recursively promote all nested headlines
                      (org-element-map el 'headline
                        (lambda (el)
                          (when (equal 'headline (org-element-type el))
                            (unless level-diff
                              (setq level-diff (- (org-element-property :level el)
                                                  level-top)))
                            (org-element-put-property el
                              :level (- (org-element-property :level el)
                                        level-diff)))))
                      ;; insert back into parse tree
                      (org-element-insert-before el object))
                    (org-element-contents object)))
            (org-element-extract-element object)))
        info nil)
      data)

    (defconst ox-extras
      '((latex-header-blocks org-latex-header-blocks-filter org-export-before-parsing-hook)
        (ignore-headlines org-export-ignore-headlines org-export-filter-parse-tree-functions))
      "A list of org export extras that can be enabled.
    Should be a list of items of the form (NAME FN HOOK).  NAME is a
    symbol, which can be passed to `ox-extras-activate'.  FN is a
    function which will be added to HOOK.")

    (defun ox-extras-activate (extras)
      "Activate certain org export extras.
    EXTRAS should be a list of extras (defined in `ox-extras') which
    should be activated."
      (dolist (extra extras)
        (let* ((lst (assq extra ox-extras))
         (fn (nth 1 lst))
         (hook (nth 2 lst)))
          (when (and fn hook)
      (add-hook hook fn)))))

    (defun ox-extras-deactivate (extras)
      "Deactivate certain org export extras.
    This function is the opposite of `ox-extras-activate'.  EXTRAS
    should be a list of extras (defined in `ox-extras') which should
    be activated."
      (dolist (extra extras)
        (let* ((lst (assq extra ox-extras))
         (fn (nth 1 lst))
         (hook (nth 2 lst)))
          (when (and fn hook)
      (remove-hook hook fn)))))

  (ox-extras-activate '(ignore-headlines))

(require 'org-ref-scopus)
(require 'org-ref-pubmed)
(require 'org-ref-sci-id)

;; (setq org-ref-default-bibliography "~/notes/pages/sources.bib")
;; (setq reftex-default-bibliography "~/notes/pages/sources.bib")
;; (setq org-export-with-broken-links t)
;; (setq latex-run-command "pdflatex")
   (setq bibtex-dialect 'biblatex)
;; (setq org-cite-export-processors '((t bibtex)))
;; (setq org-latex-pdf-process
;; '("%latex -shell-escape -interaction nonstopmode %f" "biber %f" "%latex -shell-escape -interaction nonstopmode %f" "%latex -shell-escape -interaction nonstopmode %f"))
(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))
;;(setq org-latex-pdf-process (list "%latex -interaction nonstopmode -output-directory %o %f" "%latex -interaction nonstopmode -output-directory %o %f" "%latex -interaction nonstopmode -output-directory %o %f"))

(use-package! ox-pandoc)

  (use-package! org-noter-pdftools)
  (use-package! org-noter
    :config
    (require 'org-noter-pdftools))

(add-hook! org-agenda #'org-agenda-to-appt)
(map! :map global :m "C-c a" 'org-agenda)

(after! org
  (setq org-agenda-columns-add-appointments-to-effort-sum t
        org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "PROG(r)" "EXTD(e!)" "POST(p@!/@!)" "|" "DONE(d!)" "CNCL(c@!/@!)"  "FAIL(f!)"))
        org-agenda-span 1
        org-deadline-warning-days 99
        org-agenda-skip-deadline-if-done nil
        org-habit-show-all-today t
        org-habit-show-habits-only-for-today nil
        org-agenda-start-day "-0d"
        org-agenda-skip-timestamp-if-done nil
        org-agenda-skip-deadline-if-done nil
        org-agenda-skip-scheduled-if-deadline-is-shown 'not-today;'repeated-after-deadline
        org-agenda-skip-timestamp-if-deadline-is-shown nil
        org-agenda-entry-text-maxlines 20
        org-agenda-include-diary t
        org-agenda-prefix-format " %?-3t %-11s %3e "
        org-agenda-keyword-format '("")
        org-agenda-remove-tags t
        org-agenda-sorting-strategy '(;(agenda deadline-down todo-state-up effort-down priority-down  category-keep)
                                      (agenda time-up deadline-up priority-down todo-state-down effort-down scheduled-up)
                                      (todo priority-down category-keep)
                                      (tags priority-down category-keep)
                                      (search category-keep))
        org-agenda-skip-scheduled-if-done t
        org-agenda-span 'day))

(after! org
  (setq org-agenda-custom-commands
        '(("g" "Good agenda"
           ((agenda ""
                    ((org-agenda-overriding-header "Agenda and Tonight's Homework")))
            (alltodo ""
                     ((org-agenda-overriding-header "PROJECTS")
                      (org-agenda-prefix-format " %?-3t %?-11s %3e ")
                      (org-super-agenda-groups
                       '((:discard (:todo "SOMEDAY" :not (:tag "PROJECT")))
                         (:auto-outline-path t)
                         (:discard
                          (:anything))))))
            (alltodo ""
                     ((org-agenda-overriding-header "Other")
                      (org-agenda-prefix-format " %?-3t %3e ")
                      (org-super-agenda-groups
                       '((:name "Bucket List" :and
                          (:todo "SOMEDAY" :tag "PERSONAL")
                          :order 1)
                         (:name "Someday Maybe" :todo "SOMEDAY" :order 10)
                         (:name "Everything Else" :anything t :order 20))))))
           nil nil)
          ("n" "Agenda and all TODOs"
           ((agenda "" nil)
            (alltodo "" nil))
           nil))))

 (setq org-agenda-files
	 '("~/notes/pages/20220204195459-english_essay_the_black_cat_due_2022_02_11.org" "~/Documents/personal.org" "~/notes/pages/Science Research CO2 Monitor Project Proposal.org" "~/notes/pages/20220120165322-meeting_with_dr_van_essen_2022_01_20.org" "~/notes/pages/20220112171535-english_top_nine_writing_2022_01_12.org" "~/notes/pages/20211121135742-health_stress_poster.org" "~/notes/pages/20211121134239-science_research_presentation_2021_11_22.org" "~/notes/pages/20211111211405-meeting_with_dr_van_essen_2021_11_11.org" "~/notes/journals/2021-11-01.org" "/home/jadench/notes/journals/2021-10-17.org" "/home/jadench/notes/journals/2021_09_20.org" "/home/jadench/notes/pages/20210921110418-how_to_science_research_presentations.org" "/home/jadench/notes/pages/20210921110743-science_research_co2_monitor_project_presentation.org" "/home/jadench/notes/pages/20210928124526-abigail_finan_psilocybin_presentation_notes.org" "/home/jadench/notes/pages/20210929180741-something.org" "/home/jadench/notes/pages/20211005212814-sketching_polynomials.org" "/home/jadench/notes/pages/20211005212849-math.org" "/home/jadench/notes/pages/20211005213010-synthetic_division.org" "/home/jadench/notes/pages/20211005213056-polynomial_long_division.org" "/home/jadench/notes/pages/20211005213445-multiplicity_polynomials.org" "/home/jadench/notes/pages/20211005214032-rational_root_theorem.org" "/home/jadench/notes/pages/20211005215139-remainder_theorem.org" "/home/jadench/notes/pages/20211005215907-complex_numbers.org" "/home/jadench/notes/pages/20211007174547-columbia_science_honors_program.org" "/home/jadench/notes/pages/20211007181548-computer_science_club.org" "/home/jadench/notes/pages/20211009100017-columbia_shp_introduction_to_algorithms.org" "/home/jadench/notes/pages/20211009101036-insertion_sort.org" "/home/jadench/notes/pages/20211009101111-algorithm.org" "/home/jadench/notes/pages/20211009101307-computers.org" "/home/jadench/notes/pages/20211009101319-programming.org" "/home/jadench/notes/pages/20211009101702-sorting_problem.org" "/home/jadench/notes/pages/20211009101920-substring_matching_problem.org" "/home/jadench/notes/pages/20211009102140-shortest_path_problem.org" "/home/jadench/notes/pages/20211009102410-largest_common_substring.org" "/home/jadench/notes/pages/20211009102514-dynamic_programming.org" "/home/jadench/notes/pages/20211009102622-topological_sort_problem.org" "/home/jadench/notes/pages/20211009110344-bubble_sort.org" "/home/jadench/notes/pages/20211009111219-in_place_sorting.org" "/home/jadench/notes/pages/20211009111627-worst_case_analysis.org" "/home/jadench/notes/pages/20211009111859-average_case_analysis.org" "/home/jadench/notes/pages/20211009114137-selection_sort_algorithm.org" "/home/jadench/notes/pages/20211009114325-merge_sort_algorithm.org" "/home/jadench/notes/pages/20211009114412-quick_sort_algorithm.org" "/home/jadench/notes/pages/20211009114620-heap_sort_algorithm.org" "/home/jadench/notes/pages/20211009114652-counting_sort_algorithm.org" "/home/jadench/notes/pages/20211009114717-radix_sort_algorithm.org" "/home/jadench/notes/pages/20211009114729-bucket_sort_algorithm.org" "/home/jadench/notes/pages/20211010144854-keyboard_lubrication.org" "/home/jadench/notes/pages/20211010144923-mechanical_keyboards.org" "/home/jadench/notes/pages/20211010144952-computer_projects.org" "/home/jadench/notes/pages/20211010145035-mechanical_keyswitches.org" "/home/jadench/notes/pages/20211010155257-gaming.org" "/home/jadench/notes/pages/20211010155325-hobbies.org" "/home/jadench/notes/pages/20211015140410-test_file.org" "/home/jadench/notes/pages/20211017151707-yes.org" "/home/jadench/notes/pages/20211023094336-big_o_notation.org" "/home/jadench/notes/pages/20211023101235-lower_bound_of_sorting.org" "/home/jadench/notes/pages/20211023101517-solving_recursions.org" "/home/jadench/notes/pages/20211023104904-master_s_theorem.org" "/home/jadench/notes/pages/20211023141802-sketching_rational_expressions.org" "/home/jadench/notes/pages/20211023151759-rational_expression.org" "/home/jadench/notes/pages/20211025183045-head_tracking.org" "/home/jadench/notes/pages/How To_ Science Research Project Proposals.org" "/home/jadench/notes/pages/How-To--Research Project Proposals.org" "/home/jadench/notes/pages/Science Research CO2 Monitor Project.org" "/home/jadench/notes/pages/Science Research.org" "/home/jadench/notes/pages/asdfadsfasdf.org" "/home/jadench/notes/pages/contents.org" "/home/jadench/notes/pages/somethingasdfasdfasdfasdfasdf.org" "/home/jadench/notes/pages/test.org" "~/notes/pages/20211023101517-solving_recursions.org" "/home/jadench/notes/daily/2021-10-07.org" "/home/jadench/notes/daily/2021-10-08.org" "/home/jadench/notes/pages/How-To--Research Project Proposals.org" "/home/jadench/notes/pages/contents.org" "/home/jadench/notes/pages/somethingasdfasdfasdfasdfasdf.org" "/home/jadench/notes/pages/test.org" "/home/jadench/Dropbox/todo-two.org" "/home/jadench/Dropbox/APCSP/apcsp.org" "/home/jadench/Dropbox/non_school_academics.org" "/home/jadench/.emacs.d/settings.org"))

(use-package! org-super-agenda)
(setq org-super-agenda-header-map (make-sparse-keymap)
      org-super-agenda-groups
      `(
        (:name "Today's Schedule" :time-grid t :order 2)
        (:name "Meetings" :tag "meeting" :tag "clubs" :tag "club" :order 2)
        (:name "OVERDUE"
         :and (:not (:todo "CNCL" :todo "DONE" :todo "FAIL") :deadline past)
         :order 1)
        (:name "School Habits" :and (:tag "school" :tag "habit") :order 4)
        (:name "Homework"
         :and (:tag "school" :tag "homework" :deadline (before ,(org-read-date nil nil "+8d")))
         :order 5 )
        (:name "Tests and Quizzes" :tag
         ("test" "quiz" "assessment" "conference")
         :order 3)
        (:name "Upcoming Schoolwork/Homework"
         :and (:tag ("school" "homework") :deadline future)
         :order 6)
        (:name "Extracurriculars/College"
         :and (:tag "extracurricular")
         :order 7 )
        (:name "Personal Habits"
         :and (:tag "personal" :habit t)
         :order 9)
        (:name "Personal TODO list"
         :tag ("personal")
         :order 8)
        (:name "Emails" :tag "email" :order 8)
        (:name "Scheduled work"
         :scheduled t
         :order 11)
        (:time-grid t)
        (:discard (:tag "drill"))))
(add-hook! org-agenda-before-finalize #'org-super-agenda-mode)
(org-super-agenda-mode)

  (global-set-key (kbd "C-c c") 'org-capture)
  (setq org-capture-templates
        '(("p" "Personal TODO" entry
           (file+headline "~/Documents/personal.org" "Personal TODO list")
           "* TODO %^{Headline} :personal:%^{Tags}:
SCHEDULED: %^{Scheduled}t DEADLINE: %^{Deadline}t
:PROPERTIES:
:EFFORT: %^{Effort}
:END:
  ")
          ("E" "Extracurricular/College" entry
           (file+headline "~/Documents/personal.org" "Extracurricular/College")
           "* TODO %^{Headline} :extracurricular:%^{Tags}:
SCHEDULED: %^{Scheduled}t DEADLINE: %^{Deadline}t
:PROPERTIES:
:EFFORT: %^{Effort}
:END:
  ")

          ("H" "Habit" entry
           (file+headline "~/Documents/personal.org" "Personal TODO list")
           "* TODO %^{Headline} :personal:habit:%^{Tags}:
SCHEDULED: %^{Scheduled}t
:PROPERTIES:
:EFFORT: %^{Effort}
:STYLE: habit
:END:
  ")
          ("n" "Quick note" entry
           (file+headline "~/Documents/personal.org" "Quick Notes")
           "* %^{Headline}
      ENTERED: %U
    " :prepend t)
          ("a" "Test/Assessment/Quiz " entry
           (file "~/org/todo.org")
           "* %^{Test Name} :school:%^{Tags}:
DEADLINE: %^{Deadline}t ENTERED: %U" :prepend t :time-prompt t)
        ("P" "Project TODO" entry
         (file "~/org/todo.org")
         "* TODO %^{Project name} [/] :project:%^{Tags}:
SCHEDULED: %^{Scheduled}t DEADLINE: %^{Deadline}t ENTERED: %U" :prepend t :time-prompt t)
        ("e" "Email TODO" entry
         (file "~/org/todo.org")
         "* TODO %^{Task} :email:%^{Tags}:
DEADLINE: %^{Deadline}t ENTERED: %U" :prepend t :time-prompt t)
        ("m" "Meeting entry" entry
         (file "~/org/todo.org")
         "* %^{prompt} :meeting:%^{tags}:
    DEADLINE: %^{Deadline}T ENTERED: %U" :prepend t :time-prompt t)
        ("h" "Homework entry" entry
         (file "~/org/todo.org")
         "* TODO %^{prompt}    :school:homework:
DEADLINE: %^{Deadline}t ENTERED %U
:PROPERTIES:
:EFFORT: %^{Effort}
:END:
  " :prepend t :time-prompt t)))

  (use-package! org-autolist
    :after org
    :hook (org-mode. org-autolist-mode))

(after! org (setq org-list-demote-modify-bullet '(("-" . "+") ("+" . "*") ("*" . "*"))))

(setq pdf-view-bounding-box-margin 1)

(use-package! ivy
  :demand t
  :config
  (ivy-mode t))

(use-package! undo-tree
  :demand t
  :config
  (global-undo-tree-mode t)
  (setq undo-tree-auto-save-history nil)
  (setq evil-undo-system "undo-tree"))

(add-hook! evil-org-mode
  (map! :map evil-org-mode-map
        :desc "j"
        :nv "j" #'evil-next-visual-line)
  (map! :map evil-org-mode-map
        :desc "k"
        :nv "k" #'evil-previous-visual-line))

(use-package! lsp-ui :demand t)
(setq lsp-ui-imenu-enable t)
;;(add-hook 'prog-mode-hook #'lsp)
(add-hook 'lsp-after-open-hook #'lsp-ui-mode)
(add-hook 'lsp-after-open-hook #'lsp-ui-peek-mode)
(add-hook 'lsp-after-open-hook #'lsp-ui-sideline-mode)
(add-hook 'lsp-after-open-hook #'lsp-ui-doc-mode)
;(add-hook 'lsp-after-open-hook #'lsp-ui-imenu)
;(add-hook 'lsp-after-open-hook #'lsp-ui-imenu-buffer-mode)
(setq lsp-json-use-lists t)


(setq lsp-ui-doc-show-with-cursor t
      lsp-ui-doc-position "top")

(map! :map prog-mode-map
      :desc "SPC c p"
      :nv "SPC c p" #'lsp-ui-peek-find-references)
(map! :map prog-mode-map
      :desc "SPC c P"
      :nv "SPC c P" #'lsp-ui-peek-find-definitions)
(map! :map prog-mode-map
      :desc "SPC c d"
      :nv "SPC c d" #'lsp-ui-doc-show)
