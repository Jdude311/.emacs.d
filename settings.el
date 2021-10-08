(require 'use-package)
(setq use-package-always-ensure t)

(use-package helm
  :demand t
  :bind ("M-x" . helm-M-x)
  ("C-x C-f" . helm-find-files)
  ;; ("<tab>" . helm-execute-persistent-action)
  :config
  (setq 
   helm-completion-style 'emacs)
  :init
  (helm-mode 1))

(use-package visual-line-mode
  :ensure nil
  :init
  (global-visual-line-mode t)
  :hook ((org-mode . visual-line-mode)
         (prog-mode . visual-line-mode)))

(use-package evil
  :demand t
  :init
  (setq 
   evil-cross-lines t
   evil-mode-line-format 'before
   evil-respect-visual-line-mode t
   evil-undo-system 'undo-tree
   evil-want-Y-yank-to-eol t)
  (evil-mode t))

(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . evil-org-mode)
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys)
  (evil-define-key nil evil-normal-state-map
    "j" 'evil-next-visual-line
    "k" 'evil-previous-visual-line))

(use-package undo-tree
  :demand t
  :config
  (setq undo-tree-auto-save-history t)
  (global-undo-tree-mode t))

(setq electric-indent-mode t)

(use-package page-break-lines
  :ensure t)

(use-package doom-modeline
  :ensure t
  :demand t
  :config
  (setq
   doom-modeline-buffer-modification-icon nil
   doom-modeline-hud nil
   doom-modeline-mode t)
  (doom-modeline-mode t))

(use-package doom-themes :ensure t :demand t :config (doom-themes-org-config))
(load-theme 'doom-one t)

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title "Welcome back, Jaden"
        dashboard-items '((recents . 10) (bookmarks . 5))
        dashboard-startup-banner 'logo
        dashboard-center-content t
        dashboard-set-init-info t
        dashboard-set-file-icons t
        dashboard-set-heading-icons t
        dashboard-set-navigator t
        )
  (dashboard-setup-startup-hook))
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

(use-package highlight-indent-guides
  :hook
  (prog-mode . highlight-indent-guides-mode))

(setq-default indicate-empty-lines t)
(define-fringe-bitmap 'tilde [0 0 0 113 219 142 0 0] nil nil 'center)
(setcdr (assq 'empty-line fringe-indicator-alist) 'tilde)
(set-fringe-bitmap-face 'tilde 'font-lock-function-name-face)

(use-package highlight-numbers
  :hook (prog-mode . highlight-numbers-mode))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :commands lsp lsp-deferred
  :hook ((lsp-after-open . lsp-enable-imenu)
         (lsp-after-open . lsp-toggle-symbol-highlight)
         (lsp-mode . lsp-enable-which-key-integration)
         (lsp-after-open . (lambda ()
                             (setq-local company-minimum-prefix-length 1
                                         company-idle-delay 0.0) ;; default is 0.2
                             )))
  :bind (:map lsp-mode-map
              ("C-c l t" . lsp-describe-thing-at-point)
              ("C-c l d" . lsp-ui-doc-show))
  :config
  (setq lsp-prefer-flymake nil)
  (setq lsp-auto-guess-root t ; Detect project root
        lsp-keep-workspace-alive nil ; Auto-kill LSP server
        lsp-prefer-capf t
        lsp-enable-indentation t
        lsp-enable-symbol-highlighting nil
        lsp-enable-on-type-formatting nil)
  :hook ((c-mode . lsp)
         (python-mode . lsp)))

;; lsp-ui: This contains all the higher level UI modules of lsp-mode, like flycheck support and code lenses.
;; https://github.com/emacs-lsp/lsp-ui
(use-package lsp-ui
  :ensure t
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  (setq lsp-ui-sideline-enable nil
        lsp-ui-sideline-update-mode 'line
        lsp-ui-sideline-show-code-actions t
        lsp-ui-sideline-show-hover t
        lsp-ui-doc-enable t
        lsp-ui-doc-delay 1.0
        lsp-ui-doc-position 'bottom
        lsp-ui-doc-alignment 'frame
        lsp-ui-doc-include-signature t
        lsp-ui-doc-use-childframe t
        lsp-ui-doc-include-signature t
        lsp-eldoc-enable-hover nil ; Disable eldoc displays in minibuffer
        lsp-ui-doc-position 'at-point
        lsp-ui-imenu-enable t
        lsp-ui-sideline-ignore-duplicate t)
  :hook ((python-mode . lsp-ui-mode)
         (c-mode . lsp-ui-mode)))

;; debugger adapter protocol support for emacs
;; https://github.com/emacs-lsp/dap-mode/
(use-package dap-mode
  :ensure t
  :defer 4
  :config
  ;; call dap-hydra when going to the next breakpoint
  (add-hook 'dap-stopped-hook
            (lambda (arg) (call-interactively #'dap-hydra)))
  (add-hook 'dap-mode-hook #'dap-ui-mode) ; use a hook so users can remove it
  (dap-mode 1))

(use-package flycheck :ensure t :config (setq flycheck-color-mode-line-face-to-color 'mode-line-buffer-id))

(use-package company
  :ensure t
  :hook
  (prog-mode . company-mode))

(use-package linum-mode
  :ensure nil
  :hook
  (prog-mode . linum-mode))

(add-hook 'prog-mode-hook 'hl-line-mode)

(setq highlight-indent-guides-method 'column)

(setq
 org-enforce-todo-dependencies t
 org-export-with-broken-links 'mark
 org-file-apps
 '((auto-mode . "setsid -w xdg-open %s")
   (default . "sleep 1")
   ("\\.mm\\'" . default)
   ("\\.x?html?\\'" . default)
   ("\\.pdf\\'" . "chromium %s")
   ("\\.docx\\'" . "lowriter %s")
   ("\\.odt\\'" . system))
 org-fontify-emphasized-text t
 org-fontify-quote-and-verse-blocks t
 org-format-latex-options
 '(:foreground default :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
               ("begin" "$1" "$" "$$" "\\[")))

(set-face-attribute 'org-level-1 nil :extend nil :weight 'bold :height 1.5 :foreground "LightCoral")
(set-face-attribute 'org-level-2 nil :extend nil :weight 'bold :height 1.5 :foreground "LightSalmon")
(set-face-attribute 'org-level-3 nil :extend nil :weight 'bold :height 1.5 :foreground "LightGoldenrod")
(set-face-attribute 'org-level-4 nil :extend nil :weight 'bold :height 1.5 :foreground "LightGreen")
(set-face-attribute 'org-level-5 nil :extend nil :weight 'bold :height 1.5 :foreground "LightSeaGreen")
(set-face-attribute 'org-level-6 nil :extend nil :weight 'bold :height 1.5 :foreground "LightSlateBlue")
(set-face-attribute 'org-level-7 nil :extend nil :weight 'bold :height 1.5 :foreground "LightCoral")
(set-face-attribute 'org-level-8 nil :extend nil :weight 'bold :height 1.5 :foreground "LightSalmon")

(use-package writeroom-mode
    :ensure t
    :defer t
    :bind ("C-x w" . writeroom-mode)
                                          ;:hook (org-mode . writeroom-mode)
    :config
    (setq writeroom-width 120
          writeroom-mode-line t 
          writeroom-global-effects '(writeroom-set-alpha writeroom-set-menu-bar-lines writeroom-set-tool-bar-lines writeroom-set-vertical-scroll-bars writeroom-set-bottom-divider-width)
                                          ;writeroom-global-effects '(writeroom-set-bottom-divider-width
                                          ;writeroom-set-internal-border-width)
          )
:hook (org-mode . writeroom-mode))



(use-package org-roam
      :ensure t
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
      (setq org-roam-v2-ack t)
      (org-roam-setup)
      (setq org-roam-directory "~/notes/")
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

(use-package websocket :ensure t)
(use-package simple-httpd :ensure t)
(add-to-list 'load-path "~/.emacs.d/lisp/org-roam-ui")
;(load-library "org-roam-ui/")

(use-package org-autolist
  :ensure t
  :demand t
  :config
  (add-hook 'org-mode-hook 'org-autolist-mode))

(use-package org-drill
  :ensure t
  :config
  (setq 
   org-drill-cram-hours 0
   org-drill-hide-item-headings-p t
   org-drill-scope 'tree))

(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "ET(e!)" "POSTPONED(p@!/@!)" "SOMEDAY" "|" "CANCELLED(c@!/@!)" "DONE(d!)")))

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

(add-hook 'org-mode-hook 'flyspell-mode)

(use-package powerthesaurus)
;; Keybinds for powerthesaurus are in the (use-package org) block (under the first org-mode settings header, org-mode)

(use-package org-agenda
  :ensure nil
  :bind ("C-c a" . org-agenda)
  :config
  (setq org-agenda-columns-add-appointments-to-effort-sum t
        org-agenda-skip-deadline-if-done nil
        org-agenda-skip-scheduled-if-deadline-is-shown t
        org-agenda-skip-timestamp-if-deadline-is-shown t
        org-agenda-entry-text-maxlines 20
        org-agenda-include-diary t
        org-agenda-prefix-format
        '((agenda . " %i%?5t%s%4e  ")
          (todo . " %i%?4e  ")
          (tags . " %i%?4e  "))
        org-agenda-sorting-strategy '((agenda deadline-down todo-state-up priority-down category-keep)
                                      (todo priority-down category-keep)
                                      (tags priority-down category-keep)
                                      (search category-keep))
        org-agenda-skip-scheduled-if-deadline-is-shown t
        org-agenda-skip-scheduled-if-done t
        org-agenda-span 'day))
(setq org-agenda-custom-commands
      '(("g" "Good agenda"
         ((agenda ""
                  ((org-agenda-overriding-header "Agenda and Tonight's Homework")
                   (org-agenda-sorting-strategy '(time-up deadline-up todo-state-down priority-down effort-down scheduled-down))
                   (org-super-agenda-groups
                    `((:time-grid t)
                      (:name "Meetings" :tag "meeting" :tag "clubs" :tag "club" :order 2)
                      (:name "OVERDUE" :discard
                             (:todo "SOMEDAY")
                             :deadline past :order 1)
                      (:name "School Habits" :and (:tag "school" :tag "habit") :order 4)
                      (:name "Today's Schedule" :time-grid t :order 2)
                      (:name "Tests and Quizzes" :tag
                             ("test" "quiz" "assessment" "conference")
                             :order 3)
                      (:name "Homework"
                             :and (:tag "school" :tag "homework" :deadline (before ,(org-read-date nil nil "+8d")))
                             :order 5 )
                      (:name "Upcoming Schoolwork/Homework" 
                             :and (:tag ("school" "homework") :deadline future)
                             :order 6)
                      (:name "Personal Habits"
                             :and (:tag "personal" :habit t)
                             :order 8)
                      (:name "Personal TODO list"
                             :tag ("personal")
                             :order 7)
                      (:name "Emails" :tag "email" :order 8)
                      (:name "Scheduled work"
                             :scheduled t 
                             :order 10)
                      (:discard (:tag "drill"))))))
          (alltodo ""
                   ((org-agenda-overriding-header "PROJECTS")
                    (org-super-agenda-groups
                     '((:discard (:todo "SOMEDAY" :not (:tag "PROJECT")))
                       (:auto-outline-path t)
                       (:discard
                        (:anything))))))
          (alltodo ""
                   ((org-agenda-overriding-header "Other")
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
         nil)))

(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

(use-package org-ql
:ensure t)

(require 'org-noter-pdftools)
(require 'org-pdftools)
(require 'pdf-history)
(require 'pdf-links)
(require 'pdf-sync)
(require 'pdf-outline)

(add-hook 'org-mode-hook 'org-indent-mode)

(use-package org-variable-pitch
  :config
  (setq org-variable-pitch-fixed-faces '(org-block
                                         org-block-begin-line
                                         org-block-end-line
                                         org-code
                                         org-document-info-keyword
                                         ;; org-done
                                         org-formula
                                         org-indent
                                         org-meta-line
                                         org-special-keyword
                                         org-table
                                        ;org-todo
                                         org-verbatim
                                         org-date
                                         org-drawer
                                        ;org-link
                                        ;link
                                         centaur-tabs-default
                                         org-property-value
                                         org-priority
                                         ;; org-level-1
                                         ;; org-level-2
                                         ;; org-level-3
                                         ;; org-level-4
                                         ;; org-level-5
                                         ;; org-level-6
                                         ;; org-level-7
                                         ;; org-level-8
                                         org-hide
                                         org-superstar-leading
                                         ;; org-superstar-bullet
                                         org-target))
  :hook ((org-mode) . org-variable-pitch-minor-mode))

(require 'calendar)
(setq appt-display-interval 3
      appt-message-warning-time 15
      org-show-notification-handler "notify-send")

(require 'notifications)

(defcustom appt-notification-bus :session
  "D-bus bus to use for notification."
  :group 'appt-notification
  :type '(choice (const :tag "Session bus" :session) string))
(defun appt-display (min-to-appt new-time msg)
  "Send notification."
  (notifications-notify :bus appt-notification-bus
                        :title (format "Appointment in %s minutes" min-to-appt)
                        :body (format "%s" msg)
                        :replaces-id nil
                        :app-icon nil
                        :timeout 5000
                        :desktop-entry "emacs"))
(setq appt-disp-window-function 'appt-display)
(add-hook 'org-agenda-finalize-hook 'org-agenda-to-appt)
(appt-activate)

(use-package ox-pandoc)

(use-package org-notebook
  :config
  (setq org-notebook-drawing-program "kolourpaint"))

(use-package org-superstar
  :hook
  (org-mode . org-superstar-mode))

(use-package org-download)

(use-package org-ref)

(use-package calfw)
(use-package calfw-org)

(use-package diminish
  :demand t
  :init
  (diminish 'evil-org-mode)
  (diminish 'buffer-face-mode)
  (diminish 'org-indent-mode)
  (diminish 'helm-mode)
  (diminish 'org-autolist-mode)
  (diminish 'undo-tree-mode)
  (diminish 'visual-line-mode "VL")
  (diminish 'flyspell-mode "SPL")
  (diminish 'org-roam-ui-mode "RUI")
  (diminish 'org-roam-ui-follow-mode)
  (diminish 'undo-tree-mode))

(use-package org
  :config
  (setq org-columns-default-format "%50ITEM %TODO %3PRIORITY %6Effort{:} %6CLOCKSUM(Clock) %TAGS ")
  :bind (("C-c w" . powerthesaurus-lookup-word-at-point)))

(use-package org-super-agenda
  :ensure t
  :config
  (setq org-super-agenda-header-map (make-sparse-keymap))
  (setq org-super-agenda-groups
        '((:time-grid t)
          (:name "OVERDUE" :discard
                 (:todo "SOMEDAY")
                 :deadline past :order 1)
          (:name "Today's Schedule" :time-grid t :order 2)
          (:name "Meetings" :tag "meeting" :order 2)
          (:name "Tests and Quizzes" :tag
                 ("test" "quiz" "assessment" "conference")
                 :order 3)
          (:name "Ongoing Futuredue Homework" 
                 :and
                 (:tag "school" :tag "homework" :deadline future :scheduled today :not (:tag "project"))
                 :and
                 (:tag "school" :tag "homework" :deadline future :scheduled past :not (:tag "project"))
                 :order 4)
          (:name "Tonight's Homework"
                 :and
                 (:tag "school" :tag "homework" :deadline today)
                 :and
                 (:tag "school" :tag "project" :deadline today)
                 :and
                 (:tag "school" :tag "homework" :scheduled (today past) :not (:tag "project"))
                 :order 5)
          (:name "Upcoming Homework" 
                 :and (:not (:tag "project") :tag "school" :tag "homework" :deadline future)
                 :order 6)
          (:name "Emails" :tag "email" :order 7)
          (:discard (:tag "drill"))))
  :hook
  (org-agenda-before-finalize . org-super-agenda-mode))

(use-package pdf-tools
  :ensure t
  :pin manual
  :config
  ;;initialize
  (pdf-tools-install)
  ;; use normal isearch
  (define-key pdf-view-mode-map (kbd "h") 'pdf-annot-add-highlight-markup-annotation)
  (define-key pdf-view-mode-map (kbd "d") 'pdf-annot-delete)
  (define-key pdf-view-mode-map (kbd "s") 'save-buffer)
  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward))

(use-package org-noter-pdftools :ensure t)
(use-package org-noter
  :ensure t
  :config
  (require 'org-noter-pdftools))
