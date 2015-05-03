(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-bright)))
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ================
;; Require packages
;; ================

(prelude-require-packages '(color-theme-sanityinc-tomorrow powerline smart-mode-line smart-mode-line-powerline-theme))

;; =============
;; Load packages
;; =============

(require 'color-theme-sanityinc-tomorrow)
(require 'powerline)
(require 'ido)

(powerline-default-theme)
(sml/setup)
(ido-mode t)

;; =============
;; Customization
;; =============

(setq show-trailing-whitespace t)

(scroll-bar-mode 0)

(global-undo-tree-mode -1) ; turn off undo-tree-mode by default
(global-set-key (kbd "C-x C-u") 'undo-tree-visualize) ; bind to undo-tree
(global-set-key (kbd "C-x u") 'undo) ; bind back to regular undo

(defun nuke-all-buffers ()
  (interactive)
  (mapcar 'kill-buffer (buffer-list))
  (delete-other-windows))
(global-set-key (kbd "C-x K") 'nuke-all-buffers)
