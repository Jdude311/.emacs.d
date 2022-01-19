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
  (evil-mode t)
  (evil-set-leader 'normal (kbd "SPC")))   
(defun my/send-C-x ()
  (interactive)
  (setq unread-command-events (listify-key-sequence (kbd "C-x"))))
(evil-define-key 'normal 'global (kbd "<leader> x") 'my/send-C-x)

(defun my/send-C-c ()
  (interactive)
  (setq unread-command-events (listify-key-sequence (kbd "C-c"))))
(evil-define-key 'normal 'global (kbd "<leader> c") 'my/send-C-c)

(defun my/send-C-x_C-f ()
  (interactive)
  (setq unread-command-events (listify-key-sequence (kbd "C-x C-f"))))
(evil-define-key 'normal 'global (kbd "C-x SPC f") 'my/send-C-x_C-f)

(defun my/send-C-s ()
  (interactive)
  (setq unread-command-events (listify-key-sequence (kbd "C-s"))))
(evil-define-key 'normal 'global (kbd "<leader> s") 'my/send-C-s)

(defun my/send-C-c_C-c ()
  (interactive)
  (setq unread-command-events (listify-key-sequence (kbd "C-c C-c"))))
(evil-define-key 'normal 'global (kbd "C-c SPC c") 'my/send-C-c_C-c)

(defun my/send-C-c_C-d ()
  (interactive)
  (setq unread-command-events (listify-key-sequence (kbd "C-c C-d"))))
(evil-define-key 'normal 'global (kbd "C-c SPC d") 'my/send-C-c_C-d)

(defun my/send-C-c_C-s ()
  (interactive)
  (setq unread-command-events (listify-key-sequence (kbd "C-c C-s"))))
(evil-define-key 'normal 'global (kbd "C-c SPC s") 'my/send-C-c_C-s)

    ;;; (define-key 'normal 'global (kbd "leader xf") 'find-file)
    ;;; (evil-define-key 'normal (kbd "<leader>-c") (kbd "C-c"))
(evil-define-key 'visual 'prog-mode (kbd "<tab>") 'indent-region)

(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . evil-org-mode)
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys)
  (evil-define-key 'motion org-agenda-mode-map
    "e" 'org-agenda-set-effort)
  (evil-define-key nil evil-normal-state-map
    "j" 'evil-next-visual-line
    "k" 'evil-previous-visual-line))

(use-package evil-collection
  :ensure t
  :config
  (evil-collection-init)
  (unbind-key "SPC" magit-mode-map))

(use-package undo-tree
  :demand t
  :config
  (setq undo-tree-auto-save-history t)
  (global-undo-tree-mode t))

(setq electric-indent-mode t)

(use-package magit
  :ensure t)

(use-package vterm
  :ensure t)

(use-package page-break-lines
  :ensure t)

(use-package doom-modeline
  :ensure t
  :demand t
  :config
  (setq
   doom-modeline-buffer-modification-icon t
   doom-modeline-hud t
   doom-modeline-mode t)
  (doom-modeline-mode t))

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

;(setq-default indicate-empty-lines t)
;(define-fringe-bitmap 'tilde [0 0 0 113 219 142 0 0] nil nil 'center)
;(setcdr (assq 'empty-line fringe-indicator-alist) 'tilde)
;(set-fringe-bitmap-face 'tilde 'font-lock-function-name-face)

(use-package highlight-numbers
  :hook (prog-mode . highlight-numbers-mode))

(setq-default header-line-format " ")
(setq internal-border-width 10)
(set-face-attribute 'header-line nil :inherit 'org-hide);'olivetti-fringe)
(set-face-attribute 'fringe nil :inherit 'org-hide);'olivetti-fringe)

(set-face-attribute 'scroll-bar nil :inherit 'olivetti-fringe)
(scroll-bar-mode 0)

(use-package good-scroll
  :config
  (good-scroll-mode t))

(use-package ligature
  :load-path "lisp"
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                       ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                       "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                       "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                       "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                       "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                       "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                       "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                       ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                       "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                       "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                       "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                       "\\\\" "://"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

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

(add-hook 'prog-mode-hook 'hs-minor-mode)
(defun mhtml-forward (arg)
  (interactive "P")
  (pcase (get-text-property (point) 'mhtml-submode)
    ('nil (sgml-skip-tag-forward 1))
    (submode (forward-sexp))))

;; Adds the tag and curly-brace detection to hs-minor-mode for mhtml.
(add-to-list 'hs-special-modes-alist
             '(mhtml-mode
               "{\\|<[^/>]+?"
               "}\\|</[^/>]*[^/]>"
               "<!--"
               mhtml-forward
               nil))

(add-hook 'prog-mode-hook 'electric-pair-mode)

(use-package tagedit
  :ensure t
  :config
  (tagedit-add-experimental-features)
  :hook (html . tagedit-mode))

(setq
 org-enforce-todo-dependencies t
 org-export-with-broken-links 'mark
 org-fontify-emphasized-text t
 org-fontify-quote-and-verse-blocks t
 org-format-latex-options 
 '(:foreground default :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
               ("begin" "$1" "$" "$$" "\\[")))
(set-face-attribute 'org-block-begin-line nil :background "#1c1f24")
(set-face-attribute 'org-level-1 nil :underline nil :extend t :height 1.5 :weight 'bold)
(set-face-attribute 'org-level-2 nil :underline nil :extend t :height 1.5 :weight 'bold)
(set-face-attribute 'org-level-3 nil :underline nil :extend t :height 1.5 :weight 'bold)
(set-face-attribute 'org-level-4 nil :underline nil :extend t :height 1.5 :weight 'bold)
(set-face-attribute 'org-level-5 nil :underline nil :extend t :height 1.5 :weight 'bold)
(set-face-attribute 'org-level-6 nil :underline nil :extend t :height 1.5 :weight 'bold)
(set-face-attribute 'org-level-7 nil :underline nil :extend t :height 1.5 :weight 'bold)
;; (set-face-attribute 'org-level-8 nil :extend t :height 1.5 :weight 'bold)
(set-face-attribute 'org-todo nil :background "#1c1f24" :weight 'extrabold :box '(:line-width -6 :color "#1c1f24" ))
(set-face-attribute 'org-done nil :background "#1c1f24" :weight 'extrabold :box '(:line-width -6 :color "#1c1f24"))
;(set-face-attribute 'org-link nil :foreground "#d3869b")

;; (set-face-attribute 'org-level-1 nil :extend nil :weight 'bold :height 1.5 :foreground "LightCoral")
;; (set-face-attribute 'org-level-2 nil :extend nil :weight 'bold :height 1.5 :foreground "LightSalmon")
;; (set-face-attribute 'org-level-3 nil :extend nil :weight 'bold :height 1.5 :foreground "LightGoldenrod")
;; (set-face-attribute 'org-level-4 nil :extend nil :weight 'bold :height 1.5 :foreground "LightGreen")
;; (set-face-attribute 'org-level-5 nil :extend nil :weight 'bold :height 1.5 :foreground "LightSeaGreen")
;; (set-face-attribute 'org-level-6 nil :extend nil :weight 'bold :height 1.5 :foreground "LightSlateBlue")
;; (set-face-attribute 'org-level-7 nil :extend nil :weight 'bold :height 1.5 :foreground "LightCoral")
;; (set-face-attribute 'org-level-8 nil :extend nil :weight 'bold :height 1.5 :foreground "LightSalmon")

(setq org-file-apps
      '((auto-mode . "setsid -w xdg-open %s")
        (default . "sleep 1")
        ("\\.mm\\'" . default)
        ("\\.x?html?\\'" . "chromium %s")
        ("\\.pdf\\'" . "chromium %s")
        ("\\.docx\\'" . "lowriter %s")
        ("\\.odt\\'" . system)))

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

(setq org-columns-default-format "%50ITEM %TODO %3PRIORITY %6Effort{:} %6CLOCKSUM(Clock) %TAGS ")

(use-package org-autolist
  :ensure t
  :demand t
  :config
  (add-hook 'org-mode-hook 'org-autolist-mode))

(use-package olivetti
  :ensure t
  :defer t
  :bind ("C-x w" . olivetti-mode)
  :config
  (setq olivetti-body-width 100)
  (setq olivetti-margin-width 20)
  (setq olivetti-style 't)
  :hook (org-mode . olivetti-mode))

(add-hook 'org-mode-hook 'flyspell-mode)

(use-package powerthesaurus
  :bind (("C-c w" . powerthesaurus-lookup-word-at-point)))

;(use-package websocket :ensure t)
                                        ;(use-package simple-httpd :ensure t)
(use-package org-roam-ui :ensure t :config (setq org-roam-ui-mode nil))
                                        ; (add-to-list 'load-path "~/.emacs.d/lisp/org-roam-ui")
                                        ; (load-library "org-roam-ui/org-roam-ui.el")

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

  (setq org-roam-capture-templates
        '(("d" "default" plain "%?" :target
           (file+head "pages/%<%Y%m%d%H%M%S>-${slug}.org" "
#+filetags: 
#+title: ${title}
- Links :: 


    ")
           :unnarrowed t)))
  (setq org-roam-v2-ack t)
  (org-roam-setup)
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

(require 'org-noter-pdftools)
(require 'org-pdftools)
(require 'pdf-history)
(require 'pdf-links)
(require 'pdf-sync)
(require 'pdf-outline)

(use-package org-ref
  :config (setq org-ref-default-bibliography "~/notes/pages/sources.bib")
  :init
  (setq bibtex-completion-bibliography "~/notes/pages/sources.bib")
  :bind ("C-c r i" . org-ref-insert-link))

(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "PROG(r)" "EXTD(e!)" "POST(p@!/@!)" "|" "CNCL(c@!/@!)" "DONE(d!)" "FAIL(f!)")))

(use-package org-drill
  :ensure t
  :config
  (setq 
   org-drill-cram-hours 0
   org-drill-hide-item-headings-p t
   org-drill-scope 'tree))

(use-package ox-pandoc)

(use-package org-download)

(use-package helm-bibtex)

(use-package calfw)
(use-package calfw-org)

(use-package org-gcal
  :config
  (load "~/.emacs.d/org-gcal-secret-stuff.el"))

(use-package org-agenda
  :ensure nil
  :bind ("C-c a" . org-agenda)
  :hook (org-agenda-mode . org-agenda-to-appt)
  :config
  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "PROG(r)" "EXTD(e!)" "POST(p@!/@!)" "|" "CNCL(c@!/@!)" "DONE(d!)" "FAIL(f!)")))
  (setq org-agenda-columns-add-appointments-to-effort-sum t
        org-agenda-skip-deadline-if-done nil
        org-agenda-skip-scheduled-if-deadline-is-shown 'not-today;'repeated-after-deadline
        org-agenda-skip-timestamp-if-deadline-is-shown nil
        org-agenda-entry-text-maxlines 20
        org-agenda-include-diary t

        org-agenda-prefix-format " %?-3t %-11s %3e "
        org-agenda-prefix-format " %?-3t %-11s %3e "
        org-agenda-keyword-format '("")
        org-agenda-remove-tags t

        ;; '((agenda . "%i%?5t%s%4e  ")
        ;;   (todo . "  %?-i%?4e  ")
        ;;   (tags . "  %?-i%?4e  "))

        org-agenda-sorting-strategy '((agenda deadline-down todo-state-up priority-down category-keep)
                                      (todo priority-down category-keep)
                                      (tags priority-down category-keep)
                                      (search category-keep))
        org-agenda-skip-scheduled-if-done t
        org-agenda-span 'day))
(setq org-agenda-custom-commands
      '(("g" "Good agenda"
         ((agenda ""
                  ((org-agenda-overriding-header "Agenda and Tonight's Homework")
                   (org-agenda-sorting-strategy '(time-up deadline-up todo-state-down priority-down effort-down scheduled-down))))
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
         nil)))

(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

(use-package org-ql
  :ensure t)

(add-hook 'org-mode-hook 'org-indent-mode)

(use-package org-variable-pitch
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
          ;org-link
          ;link
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
          org-ellipsis
          org-tag
          ;; org-superstar-bullet
          org-target))
  :hook ((org-mode) . org-variable-pitch-minor-mode))

(use-package org-superstar
  :hook
  (org-mode . org-superstar-mode))

(setq org-ellipsis " ▾")
(set-face-attribute 'org-ellipsis nil :foreground nil)

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

(use-package doom-themes :ensure t :demand t :config (doom-themes-org-config))
;(load-theme 'doom-gruvbox t)

(use-package org :ensure t)

(use-package pdf-tools
  :ensure t
  :pin manual
  :config
  ;;initialize
  ;; use normal isearch
  (define-key pdf-view-mode-map (kbd "h") 'pdf-annot-add-highlight-markup-annotation)
  (define-key pdf-view-mode-map (kbd "d") 'pdf-annot-delete)
  (define-key pdf-view-mode-map (kbd "s") 'save-buffer)
  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward))
(pdf-tools-install)

(use-package org-noter-pdftools :ensure t)
(use-package org-noter
  :ensure t
  :config
  (require 'org-noter-pdftools))

(use-package org-super-agenda
  :ensure t
  :config
  (setq org-super-agenda-header-map (make-sparse-keymap))
  (setq org-super-agenda-groups
        `(
          (:name "Today's Schedule" :time-grid t :order 2)
          (:name "Meetings" :tag "meeting" :tag "clubs" :tag "club" :order 2)
          (:name "OVERDUE" :discard
                 (:todo "SOMEDAY" :todo "DONE" :todo "CNCL" :todo "FAIL")
                 :deadline past :order 1)
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
          (:time-grid t)
          (:discard (:tag "drill"))))
  :hook
  (org-agenda-before-finalize . org-super-agenda-mode))
