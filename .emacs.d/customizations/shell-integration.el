;; Sets up exec-path-from shell
;; https://github.com/purcell/exec-path-from-shell


;;Terminal ansi color.
;; (load "~/.emacs.d/elpa/xterm-color-20170102.1525/xterm-color.el")
;; (progn (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter)
;;        (setq comint-output-filter-functions (remove 'ansi-color-process-output comint-output-filter-functions)))
;; (require 'eshell)

;; (add-hook 'eshell-mode-hook
;;           (lambda ()
;;             (setq xterm-color-preserve-properties t)))

;; (add-to-list 'eshell-preoutput-filter-functions 'xterm-color-filter)
;; (setq eshell-output-filter-functions (remove 'eshell-handle-ansi-color eshell-output-filter-functions))


;; Lein PATH
;; (add-to-list 'exec-path "/usr/local/bin/")

