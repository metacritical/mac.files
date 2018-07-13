;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)

;;Store Packages in custom directory.
(setq package-user-dir "~/.emacs.d/packages")

;; (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
;; (add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/") t)
;; Org-mode's repository
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)


;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(
    ;; Use package macro
    use-package

    ;; Makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet.
    paredit

    ;; Key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; Integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider

    ;; Allow ido usage in as many contexts as possible. see
    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ido-ubiquitous

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    ;; smex

    ;; Project navigation
    projectile

    ;; Colorful parenthesis matching
    rainbow-delimiters

    ;; Edit html tags like sexps
    ;; tagedit

    ;; Git integration
    ;; magit

    ;; Evil Mode
    evil

    ;; Nyan Mode
    nyan-mode

    ;;Fille Column Indicator
    fill-column-indicator

    ;;Org Mode
    org

    ;;Org Bullets - Beautifying the org bullets.
    org-bullets

    ;;Pretty-lambda
    pretty-lambdada
    
    ;;Emacs Edit Server
    ;;edit-server

    ;;Typescript Support
    ;;tide

    ;;Darkokai Theme
    darkokai-theme

    ;;Gratuitous Theme
    ;; gratuitous-dark-theme

    ;;Molokai theme
    ;; molokai-theme

    ;;Twilight Anti bright theme
    ;; twilight-anti-bright-theme
    
    ;;Dracula Theme
    ;; dracula-theme

    ;;company mode
    company

    ;;Ycmd
    ;; ycmd

    ;;Ycmd Company
    ;; company-ycmd

    ;; Helm - Autocompletion and narrowing framework.
    helm

    ;; Helm Cider
    ;; helm-cider

    ;;Ascii Doc
    ;; adoc-mode

    ;;W3M Browser
    ;; w3m

    ;; Acejump - Quick jump shortcuts
    ace-jump-mode

    ;;Avy - Similar to ace jump mode to better
    avy

    ;;Ranger.el (Ranger like FileManager)
    ranger

    ;;Racket Mode
    ;; racket-mode

    ;;Purescript Mode
    ;; purescript-mode

    ;;Syntax highliting for org mode html export.
    htmlize

    ;;Custom Startup screen and Dashboard.
    dashboard

    ;;Ace-window - Switch window like an 'Ace', an ace-jump for Window.
    ace-window

    ;;nlinum instead of linum-mode because it is faster
    nlinum

    ;; EDN support
    edn

    ;;JSON support
    json-mode

    ;; Org 2 Jekyll
    org2jekyll 

    ;; Markdown preview Mode
    markdown-preview-eww

    ;;org-page Org mode to blog.
    org-page

    ;;Org Admin
    blog-admin
    ))


;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

;;Copy PATH Environment variable from shell.
(exec-path-from-shell-copy-envs (list "PATH"))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;;
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")
;;;;



;;;;;;;;;;;;;;;;;;;;
;; Customizations ;;
;;;;;;;;;;;;;;;;;;;;


;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; Org mode blogging using org-page
(load "blogging.el")

;; Markdown Mode

;;Require Elm mode
;; (require 'elm-mode)

;; You Complete Me Loader.
;; (add-to-list 'load-path "~/.emacs.d/vendor/ycmd/")
;; (load "load-ycmd.el")

;;Gnus
;; (setq gnus-select-method '(nntp "news://gnu.emacs.help"))
;; (setq gnus-read-active-file nil)

;;Edit With Emacs Server
;;(require 'edit-server)
;;(edit-server-start)

;;org-mode blogging functions.
;; (require 'org)
;; (require 'ob-clojure)
;; (setq org-babel-clojure-backend 'cider)
;; (require 'cider)
;; (load "org-mode-blog.el")

;;Gratuitous dark theme
;; (load "~/.emacs.d/elpa/gratuitous-dark-theme-1.3/gratuitous-dark-theme.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(op/theme (quote kactus)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
