;; These customizations change the way emacs looks and disable/enable
;; some user interface elements. Some useful customizations are
;; commented out, and begin with the line "CUSTOMIZE". These are more
;; a matter of preference and may require some fiddling to match your
;; preferences


;;Custom Dashboard Startup hook.
(require 'dashboard)
(dashboard-setup-startup-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom Banner Logo and Title ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set the title
(setq dashboard-banner-logo-title "Clojuremacs beats Cursive's ass!")
;; Set the banner
(setq dashboard-startup-banner 
      (concat user-emacs-directory "assets/" "clojure_logo.png"))


;;Hide scrollbar in gui mode.
(when (display-graphic-p)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (toggle-frame-maximized)
  (menu-bar-mode -1))

;; Show line numbers
(global-linum-mode)

;; Set Column Mode true
(setq column-number-mode t)

;; You can uncomment this to remove the graphical toolbar at the top. After
;; awhile, you won't need the toolbar.
;; (when (fboundp 'tool-bar-mode)
;;   (tool-bar-mode -1))

;; Don't show native OS scroll bars for buffers because they're redundant
;; (when (fboundp 'scroll-bar-mode)
  ;; (scroll-bar-mode -1))

;; Color Themes
;; Read http://batsov.com/articles/2012/02/19/color-theming-in-emacs-reloaded/
;; for a great explanation of emacs color themes.
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Custom-Themes.html
;; for a more technical explanation.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
(load-theme 'tomorrow-night-bright t)

;; increase font size for better readability
(set-face-attribute 'default nil :height 140)
(set-frame-font "Monaco 13" nil t)

;; Uncomment the lines below by removing semicolons and play with the
;; values in order to set the width (in characters wide) and height
;; (in lines high) Emacs will have whenever you start it
;; (setq initial-frame-alist '((top . 0) (left . 0) (width . 177) (height . 53)))

;; These settings relate to how emacs interacts with your operating system
(setq ;; makes killing/yanking interact with the clipboard
      x-select-enable-clipboard t

      ;; I'm actually not sure what this does but it's recommended?
      x-select-enable-primary t

      ;; Save clipboard strings into kill ring before replacing them.
      ;; When one selects something in another program to paste it into Emacs,
      ;; but kills something in Emacs before actually pasting it,
      ;; this selection is gone unless this variable is non-nil
      save-interprogram-paste-before-kill t

      ;; Shows all options when running apropos. For more info,
      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
      apropos-do-all t

      ;; Mouse yank commands yank at point instead of at click.
      mouse-yank-at-point t)

;; No cursor blinking, it's distracting
(blink-cursor-mode 0)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; don't pop up font menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

;; no bell
(setq ring-bell-function 'ignore)

;;Nyan Mode
(nyan-mode)
(nyan-start-animation)


;;Use the following thene
(load-theme 'darkokai t)
;; (load-theme 'twilight-anti-bright t)
;; (load-theme 'molokai t)
;; (load-theme 'dracula t)

;; Pretty Lambda
;; (require 'pretty-lambdada)
;; (pretty-lambda-for-modes)

;; Highlights matching parenthesis
;; (show-paren-mode 1)

;; Highlight current line
;; (global-hl-line-mode 1)

;;Rainbow Delimiters mode
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Beautifying Org Bullets
(setq org-bullets-bullet-list '("◉" "◎" "⚫" "○" "►" "◇"))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; Org Bullets Todo/Done symbols.
(setq org-todo-keywords '((sequence "☛ TODO(t)" "|" "✔ DONE(d)")
			  (sequence "⚑ WAITING(w)" "|")
			  (sequence "|" "✘ CANCELED(c)")))
