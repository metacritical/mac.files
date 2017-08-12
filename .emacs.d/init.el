;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)

(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; Org-mode's repository
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/") t)



;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))


;; Dont display menubar and scrollbar when in gui mode.
(menu-bar-mode -1)
(when (display-graphic-p)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

;;Global Company Mode
(add-hook 'after-init-hook 'global-company-mode)

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider

    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ido-ubiquitous

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; project navigation
    projectile

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    magit

    ;; Evil Mode
    evil

    ;; Nyan Mode
    nyan-mode

    ;;Org Blog
    ;;org-blog

    ;;Pretty-lambda
    pretty-lambdada

    ;;Emacs Edit Server
    ;;edit-server

    ;;Typescript Support
    ;;tide

    ;;Darkokai Theme
    ;;darkokai-theme 

    ;;Gratuitous Theme
    ;;gratuitous-dark-theme

    ;;Molakai theme
    ;;molokai-theme

    ;;company mode
    company

    ;;Ycmd
    ;; ycmd

    ;;Ycmd Company
    ;; company-ycmd

    ;; Autocomplete Cider
    ac-cider

    ;;Ascii Doc
    adoc-mode
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
;; Original Elpa
;;

;; Add a directory to pur load paths
;;(add-to-list 'load-path "~/.emacs.d/elpa")


;;;;
;; Customization
;;;;

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

;; Langauage-specific
(load "setup-clojure.el")
;;(load "setup-js.el")

;;Require Elm mode
;;(require 'elm-mode)

;; You Complete Me Loader.
;; (add-to-list 'load-path "~/.emacs.d/vendor/ycmd/")
;; (load "load-ycmd.el")

;;Gnus 
(setq gnus-select-method '(nntp "news://gnu.emacs.help"))
(setq gnus-read-active-file nil)

;;Edit With Emacs Server
;;(require 'edit-server)
;;(edit-server-start)

;;org-mode blogging functions.
(load "org-mode-blog.el")

;;Gratuitous dark theme
;; (load "~/.emacs.d/elpa/gratuitous-dark-theme-1.3/gratuitous-dark-theme.el")

;;Terminal ansi color.
(load "~/.emacs.d/elpa/xterm-color-20170102.1525/xterm-color.el")
(progn (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter)
       (setq comint-output-filter-functions (remove 'ansi-color-process-output comint-output-filter-functions)))
(require 'eshell)

(add-hook 'eshell-mode-hook
          (lambda ()
            (setq xterm-color-preserve-properties t)))

(add-to-list 'eshell-preoutput-filter-functions 'xterm-color-filter)
(setq eshell-output-filter-functions (remove 'eshell-handle-ansi-color eshell-output-filter-functions))


;; Lein PATH
(add-to-list 'exec-path "/usr/local/bin/")


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elfeed-feeds
   (quote
    ("https://whilo.github.io/feed.xml" "https://charsequence.blogspot.com/feeds/posts/default" "http://feeds.soundcloud.com/users/soundcloud:users:220484243/sounds.rss" "http://www.lispcast.com/feed" "http://mitchellh.com/feed" "http://blog.oleganza.com/rss" "http://thinkrelevance.com/blog/atom.xml" "http://feeds.feedburner.com/RuminationsOfAProgrammer" "http://gigasquidsoftware.com/atom.xml" "https://rails-weekly.ongoodbits.com/feed" "https://this-week-in-rust.org/atom.xml" "https://yogthos.net/feed.xml" "https://lambdaisland.com/feeds/episodes.atom" "https://lambdaisland.com/feeds/blog.atom" "http://feeds.cognitect.com/cognicast/feed.rss"))))
