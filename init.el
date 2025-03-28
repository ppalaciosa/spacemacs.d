;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation nil

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/private/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     better-defaults
     helm
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t
                      auto-completion-idle-delay 0.1
                      auto-completion-minimum-prefix-length 1
                      auto-completion-use-company-box t
                      )
     syntax-checking
     (spell-checking :variables
                     spell-checking-enable-by-default nil
                     enable-flyspell-auto-completion nil)
     (colors :variables
             colors-enable-rainbow-identifiers t)

     ;; Programming Languages
     (c-c++ :variables
            c-c++-backend 'rtags
            c-c++-default-mode-for-headers 'c++-mode )
     (javascript :variables
                 js2-basic-offset 2
                 js-indent-level 2
                 js-switch-indent-offset 2
                 js-expr-indent-offset 0
                 js-paren-indent-offset 0
                 js2-mode-assume-strict t
                 js2-mode-show-strict-warnings nil
                 js2-mode-show-parse-errors nil
                 javascript-import-tool 'import-js
                 javascript-backend 'tide
                 javascript-lsp-linter nil
                 javascript-fmt-tool 'prettier
                 node-add-modules-path t)
     (typescript :variables
                 typescript-backend 'tide
                 typescript-linter 'eslint
                 typescript-fmt-tool 'prettier)
     (elixir :variables elixir-backend 'alchemist)
     clojure
     emacs-lisp
     major-modes
     (python :variables
             python-backend 'lsp
             python-formatter 'black)
     ruby
     (rust :variables rust-backend 'lsp)
     (php :variables php-backend 'lsp)
     java
     (sql :variables sql-capitalize-keywords nil)

     ;; Non-programming languages
     (markdown :variables markdown-live-preview-engine 'vmd)
     (yaml :variables yaml-enable-lsp t)
     csv

     ;; Bring order to life
     (org :variables org-enable-reveal-js-support t)
     (wakatime :variables wakatime-cli-path "~/.wakatime/wakatime-cli")

     ;; Documents
     latex
     bibtex
     restructuredtext

     ;; Web
     html
     react
     (vue :variables vue-backend 'lsp)
     restclient
     nginx

     ;; Tools
     dap
     gtags
     (lsp :variables lsp-rust-server 'rust-analyzer)
     tide
     import-js
     floobits
     platformio
     ansible
     docker
     git
     systemd
     gnus
     graphviz
     (shell :variables shell-default-shell 'vterm)
     restclient

     ;; fun stuff
     xkcd
     )
   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages
   '(
     add-node-modules-path
     editorconfig
     graphql-mode
     ;; (yasnippet :location elpa)
     gnus-desktop-notify
     exec-path-from-shell
     polymode
     poly-markdown
     poly-ansible
     poly-org
     god-mode
     nvm
     pydoc
     ztree
     hcl-mode
     orgtbl-aggregate
     auto-virtualenv
     direnv
     lsp-tailwindcss
     (copilot :location (recipe
                         :fetcher github
                         :repo "copilot-emacs/copilot.el"
                         :files ("*.el" "dist")))
     lsp-grammarly
     )


   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(auto-complete-rst)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '((recents . 7)
                                (projects . 5))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `vim-powerline' and `vanilla'. The first three
   ;; are spaceline themes. `vanilla' is default Emacs mode-line. `custom' is a
   ;; user defined themes, refer to the DOCUMENTATION.org for more info on how
   ;; to create your own spaceline theme. Value can be a symbol or list with\
   ;; additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-Scale' Allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq
   custom-file "~/.spacemacs.d/.custom-settings"
   ;; Avoid using helm when completing at point
   ;; helm-mode-handle-completion-in-region nil
   gnus-init-file "~/.spacemacs.d/gnus.el"
   )
  (add-to-list 'default-frame-alist
               '(font . "-ADBE-Source Code Pro-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1"))
  (add-to-list 'default-frame-alist '(width . 80))  ; Width set to 80 characters
  (add-to-list 'default-frame-alist '(height . 24)) ; Height set to 24 lines
  )


(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place you code here."
  (setq
   user-full-name "Pablo Palacios Avila"
   user-mail-address "ppalacios_avila@hotmail.com")

  (spacemacs|diminish holy-mode "✝️" "h")

  ;; God-mode https://github.com/emacsorphanage/god-mode
  (use-package god-mode
    :bind ("<f28>" . god-mode-all)
    :config
    (progn
      (setq
       god-exempt-major-modes nil
       god-exempt-predicates nil)
      (defun god-mode-update-cursor ()
        (setq cursor-type
              (if (or god-local-mode buffer-read-only)
                  'box 'bar))
        (let* (
               (background-god '("red4" "white"))
               (background-godless '("base" "base"))
               (background
                (if god-local-mode background-god background-godless)))
          (set-face-background 'mode-line (car background))
          (set-face-foreground 'mode-line (cadr background))))
      (spacemacs|diminish god-local-mode "🗲" "g")
      (add-hook 'god-mode-enabled-hook 'god-mode-update-cursor)
      (add-hook 'god-mode-disabled-hook 'god-mode-update-cursor)))

  ;; Add lisp folder to load-path
  (add-to-list 'load-path (expand-file-name "lisp/" dotspacemacs-directory))

  (setq native-comp-async-report-warnings-errors nil)

  ;; Mac special keys stuff
  ;;
  ;; Combine this with swaping the option and command keys (at the OS level)
  ;; when using an external keyboard
  (when (eq system-type 'darwin)
    (setq mac-option-modifier 'alt)
    (setq mac-command-modifier 'meta)
    (global-set-key [kp-delete] 'delete-char)
    )


  (use-package transient
    ;; What magit uses to persist commands parameters
    :defer 10
    :init
    (setq-default
     transient-values-file "~/.spacemacs.d/transient/values.el"
     transient-levels-file "~/.spacemacs.d/transient/levels.el"
     transient-history-file "~/.spacemacs.d/transient/history.el"
     ))

  (use-package magit
    :defer t
    :init
    (setq
     vc-handled-backends (delq 'Git vc-handled-backends)
     ))

  ;; Exec-path-from-shell
  (use-package exec-path-from-shell
    :defer nil
    :config
    (progn
      (setq
       exec-path-from-shell-variables
       '(
         "PATH"
         "MANPATH"
         "SSH_AUTH_SOCK"
         "WORKON_HOME"
         "PYENV_ROOT"
         "PIPENV_DEFAULT_PYTHON_VERSION"
         ))
      (when (or (daemonp) (memq window-system '(mac ns x)))
        (exec-path-from-shell-initialize))
      ))

  (use-package direnv
    :config
    (direnv-mode))


  (spacemacs|define-custom-layout "@dotfiles"
    :binding "d"
    :body
    (progn
      ;; hook to add all ERC buffers to the layout
      (find-file (expand-file-name "~/dotfiles/Readme.org"))))

  ;; Mode line
  (setq
   spaceline-battery-p nil
   spaceline-org-clock-p t
   spaceline-hud-p nil)
  (spacemacs/toggle-mode-line-battery-on)

  ;; Dired
  ;; Load Dired X when Dired is loaded.
  (use-package dired-x
    :defer 2
    :after (dired)
    :config
    (progn
      (setq-default dired-omit-files-p t) ; Buffer-local variable
      (when (eq system-type 'darwin)
        (setq
         insert-directory-program "gls"
         dired-use-ls-dired t))
      (setq
       dired-omit-files (concat "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\.tern-port$")
       dired-omit-verbose nil
       dired-listing-switches "-alh --group-directories-first")))

  (add-hook 'gnus-article-mode-hook
            (lambda ()
              (face-remap-add-relative 'default :size 16)
              ))

  ;; Avoid calling autocompletion-in-region
  (with-eval-after-load "company"
    (define-key spacemacs-js2-mode-map-root-map
                (kbd "<tab>") 'company-indent-or-complete-common)
    (define-key spacemacs-rjsx-mode-map-root-map
                (kbd "<tab>") 'company-indent-or-complete-common)
    (delq 'company-preview-if-just-one-frontend company-frontends)
    )

  ;; Ispell config
  (when (eq system-type 'gnu/linux)
    (with-eval-after-load "ispell"
      (when (executable-find "hunspell")
        (setq ispell-program-name "hunspell"
              ispell-local-dictionary "en_US"
              ispell-local-dictionary-alist
              '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))
        (ispell-set-spellchecker-params)
        (ispell-hunspell-add-multi-dic "es_PE,en_US")
        (setq ispell-dictionary "es_PE,en_US"))
      )
    )

  (list-load-path-shadows)

  ;; File lookup
  (use-package helm
    :bind ("C-c o" . helm-overlord)
    :config
    (progn
      (require 'helm-projectile)
      (require 'helm-x-files)
      (defun helm-overlord ()
        (interactive)
        (helm :sources
              '(helm-source-buffers-list
                helm-source-projectile-buffers-list
                helm-source-projectile-files-list
                helm-source-projectile-projects
                helm-source-recentf
                helm-source-file-cache
                )
              :ff-transformer-show-only-basename nil
              :buffer "*helm-overlord*"
              :truncate-lines helm-buffers-truncate-lines
              ))))

  (with-eval-after-load 'projectile
    (add-to-list 'projectile-globally-ignored-directories "node_modules"))

  ;; Org config
  ;; Fontify org-mode code blocks
  (use-package org
    :defer t
    :init
    (setq-default
     org-src-fontify-natively t
     ;; org-mode: Don't ruin S-arrow to switch windows please (use M-+ and M--
     ;; instead to toggle)
     org-replace-disputed-keys t
     org-hide-leading-stars t
     org-odd-levels-only t
     org-ref-default-bibliography '("references.bib")
     reftex-default-bibliography '("references.bib")
     ;; TODO progress logging stuff
     org-log-done 'time
     org-export-with-sub-superscripts nil
     org-latex-listings 'minted
     TeX-engine 'xetex
     TeX-PDF-mode t
     org-latex-compiler "xelatex"
     org-latex-pdf-process'("latexmk -pdf -f -pdflatex='%latex --shell-escape -file-line-error -interaction=nonstopmode' -outdir=%o %f")
     org-latex-default-packages-alist '(
                                        ;; Not used with XeLaTeX
                                        ("AUTO" "inputenc" t ("pdflatex"))
                                        ("T1" "fontenc" t ("pdflatex"))
                                        ("" "fontspec" t ("xelatex"))
                                        ("" "polyglossia" t ("xelatex"))
                                        ("" "graphicx" t)
                                        ("" "grffile" t)
                                        ("" "longtable" nil)
                                        ("" "wrapfig" nil)
                                        ("" "rotating" nil)
                                        ("normalem" "ulem" t)
                                        ("" "amsmath" t)
                                        ("" "textcomp" t)
                                        ("" "amssymb" t)
                                        ("" "capt-of" nil)
                                        ("" "hyperref" nil)
                                        ("dvipsnames" "xcolor")
                                        ("" "minted")
                                        )

     ;; Agenda and clock
     org-clock-persist 'history)
    :config
    (progn
      (org-clock-persistence-insinuate)
      (defun refresh-org-agenda-files ()
        (interactive)
        (load-library "find-lisp")
        (setq org-agenda-files (find-lisp-find-files "~/org/agenda" "\.org$")))
      (refresh-org-agenda-files)

      (add-to-list 'org-latex-packages-alist '("" "minted"))

      (defun toggle-org-reveal-export-on-save ()
        (interactive)
        (if (memq 'org-reveal-export-to-html after-save-hook)
            (progn
              (remove-hook 'after-save-hook 'org-reveal-export-to-html t)
              (message "Disabled org reveal export on save for current buffer..."))
          (if (memq 'org-reveal-export-current-subtree after-save-hook)
              (remove-hook 'after-save-hook 'org-reveal-export-current-subtree t))
          (add-hook 'after-save-hook 'org-reveal-export-to-html nil t)
          (message "Enabled org reveal export on save for current buffer...")))
      (defun toggle-org-reveal-export-subtree-on-save ()
        (interactive)
        (if (memq 'org-reveal-export-current-subtree after-save-hook)
            (progn
              (remove-hook 'after-save-hook 'org-reveal-export-current-subtree t)
              (message "Disabled org reveal export current subtree on save for current buffer..."))
          (if (memq 'org-reveal-export-to-html after-save-hook)
              (remove-hook 'after-save-hook 'org-reveal-export-to-html t))
          (add-hook 'after-save-hook 'org-reveal-export-current-subtree nil t)
          (message "Enabled org reveal export current subtree save for current buffer...")))
      ))

  ;; Javascript

  (use-package js-mode
    :defer t
    :config
    (advice-add 'js--multi-line-declaration-indentation :around (lambda (orig-fun &rest args) nil)))

  ;; Add .mjs extension autoload
  (use-package js2-mode
    :mode "\\.\\(mjs\\|cjs\\)\\'")

  (use-package json-reformat
    :defer t
    :config
    (setq-default
     json-reformat:indent-width 2))

  (use-package tide
    :defer t
    :config
    (setq tide-disable-suggestions t))

  (use-package json-mode
    :mode "\\.tern-project\\'"
    :config
    ;; json-mode by default locally sets indent-level to 4
    (add-hook 'json-mode-hook
              (lambda ()
                (make-local-variable 'js-indent-level)
                (setq js-indent-level 2)))
    )

  ;; Workaround for eslint loading slow
  ;; A side effect is that eslint will always "detect" a config file
  ;; https://github.com/flycheck/flycheck/issues/1129
  (use-package flycheck
    :custom
    (flycheck-display-errors-delay 0.5)
    :config
    ;; eslint_d makes this optimization unnecessary
    (let ((has-eslint-d (locate-file "eslint_d" exec-path)))
      (if has-eslint-d
          (setq-default
           flycheck-javascript-eslint-executable "eslint_d")
        (advice-add 'flycheck-eslint-config-exists-p :override (lambda() t))))
    (flycheck-add-mode 'javascript-eslint 'typescript-tsx-mode)
    )

  (use-package graphql-mode
    :defer t
    :config
    (progn
      (unless (member "union" graphql-keywords)
        (add-to-list 'graphql-keywords "union"))
      (setq
       graphql-definition-regex
       (concat "\\(" (regexp-opt '("type" "input" "interface" "fragment" "query"
                                   "mutation" "subscription" "enum" "union")) "\\)"
                                   "[[:space:]]+\\(\\_<.+?\\_>\\)"))))

  (use-package scss-mode
    :config
    (add-hook 'scss-mode-hook
              (lambda ()
                (use-linter-from-node-modules
                 "sass/scss-sass-lint"
                 "sass-lint/bin/sass-lint.js")))
    )

  ;; web-mode
  (use-package web-mode
    :defer t
    :init
    (setq-default
     web-mode-markup-indent-offset 2
     web-mode-css-indent-offset 2
     web-mode-code-indent-offset 2
     web-mode-attr-indent-offset 2)
    (add-hook 'web-mode-hook #'turn-on-smartparens-mode t)
    :config

    )

  (use-package rainbow-mode
    :hook web-mode js2-mode)

  (use-package emmet-mode
    :defer t
    :config
    (progn
      (setq
       emmet-self-closing-tag-style " /"
       emmet-indentation 2)
      (unbind-key "<emacs-state> TAB" emmet-mode-keymap)
      (unbind-key "<emacs-state> <tab>" emmet-mode-keymap)))

  ;; Python
  (use-package python
    :defer t
    :init
    (progn
      (spacemacs|diminish anaconda-mode "🐍" "a")
      (setq-default
       python-shell-interpreter "ipython"
       python-shell-interpreter-args "--simple-prompt -i"
       )
      )
    )
  (use-package pipenv
    :after (python)
    :config
    (progn
      (setq
       pipenv-with-flycheck t
       pipenv-with-projectile t)
      (setq pipenv-projectile-after-switch-function
            #'pipenv-projectile-after-switch-extended)
      (spacemacs|diminish pipenv-mode "🎁" "p")
      (add-hook 'python-mode-hook
                #'(lambda ()
                    (setq flycheck-checker 'python-pylint)
                    (pipenv-mode)))))

  (use-package importmagic
    :defer t
    :config
    (setq-default importmagic-python-interpreter "python"))

  (use-package pythonic
    :defer t
    :config
    (setq-default pythonic-interpreter "python"))


  ;; Matlab
  (use-package matlab
    :defer t
    :config
    (setq
     matlab-shell-command-switches '("-nodesktop" "-nosplash")))

  ;; Latex
  (add-hook 'LaTeX-mode-hook 'visual-line-mode)

  ;; Expand Region
  (use-package expand-region
    :bind ("C-\\" . er/expand-region)
    :config
    (setq expand-region-fast-keys-enabled nil)
    )

  ;; Smart parens global mode
  (spacemacs/toggle-smartparens-globally-on)

  ;; ------Smart parens bindings------
  (use-package smartparens
    :bind (:map sp-keymap
                ("C-k" . sp-kill-hybrid-sexp)
                ("M-<backspace>" .  sp-backward-unwrap-sexp)
                ("C-M-<backspace>" . sp-splice-sexp-killing-backward)
                ("C-M-f" . sp-forward-sexp)
                ("C-M-b" . sp-backward-sexp)
                ("C-M-d" . sp-down-sexp)
                ("C-M-a" . sp-beginning-of-sexp)
                ("C-M-e" . sp-up-sexp)
                ("<C-right>" . sp-forward-slurp-sexp)
                ("<C-left>" . sp-backward-slurp-sexp)
                ))


  ;; Mark paragraph
  (global-set-key (kbd "M-h") 'mark-paragraph)
  ;; prevent madness
  (global-set-key (kbd "C-x 2")
                  (lambda ()
                    (interactive)
                    (split-window-vertically)
                    (other-window 1)))
  (global-set-key (kbd "C-x 3")
                  (lambda ()
                    (interactive)
                    (split-window-horizontally)
                    (other-window 1)))
  (delete-selection-mode t)


  ;; Yaml
  (use-package yaml-mode
    :config (setq-default yaml-indent-offset 2))


  (setq
   safe-local-variable-values
   '(
     (encoding . utf-8)
     (encoding . utf8)
     (org-latex-minted-options '(("bgcolor=MonokaiBg")))
     (org-latex-minted-options quote
                               (("bgcolor" "MonokaiBg")))
     (ispell-dictionary . "castellano,english")
     (ispell-dictionary . "castellano")
     (ispell-dictionary . "english")))
  )
