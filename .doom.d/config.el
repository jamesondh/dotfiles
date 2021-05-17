;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq
 user-full-name "Jameson Hodge"
 user-mail-address "contact@jamesonhodge.com"
 doom-theme 'doom-one
 doom-font (font-spec :family "Iosevka" :size 14)
 doom-variable-pitch-font (font-spec :family "Iosevka Aile" :size 14)
 doom-big-font (font-spec :family "Iosevka Aile" :size 14)
 projectile-project-search-path '("~/Documents/")
 display-line-numbers-type t
 org-directory "~/.org-server/org/"
 org-roam-directory "~/.org-server/roam/")

;; enable terminal foreground and backgroud colors
(after! solaire-mode
  (solaire-global-mode -1))
(custom-set-faces
 '(default ((t (:background "#000000", :foreground "#ffffff"))))
 '(hl-line ((t (:background "#000000", :foreground "#ffffff")))))

;; duplicate lines
;; https://stackoverflow.com/a/998472
(defun duplicate-line (arg)
  "Duplicate current line, leaving point in lower line."
  (interactive "*p")
  ;; save the point for undo
  (setq buffer-undo-list (cons (point) buffer-undo-list))
  ;; local variables for start and end of line
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion
      ;; don't use forward-line for this, because you would have
      ;; to check whether you are at the end of the buffer
      (end-of-line)
      (setq eol (point))
      ;; store the line and disable the recording of undo information
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        ;; insert the line arg times
        (while (> count 0)
          (newline)         ;; because there is no newline in 'line'
          (insert line)
          (setq count (1- count)))
        )
      ;; create the undo information
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
    ) ; end-of-let
  ;; put the point in the lowest line and return
  (next-line arg))

;; avy
(setq avy-timeout-seconds 0.7)
(avy-setup-default)

;; turn off auto indent for web mode
(setq web-mode-enable-auto-indentation nil)

;; keep isearch result closer to center of window
;; https://emacs.stackexchange.com/a/10432
(defadvice isearch-update (before my-isearch-update activate)
  (sit-for 0)
  (if (and
       ;; not the scrolling command
       (not (eq this-command 'isearch-other-control-char))
       ;; not the empty string
       (> (length isearch-string) 0)
       ;; not the first key (to lazy highlight all matches w/o recenter)
       (> (length isearch-cmds) 2)
       ;; the point in within the given window boundaries
       (let ((line (count-screen-lines (point) (window-start))))
         (or (> line (* (/ (window-height) 4) 3))
             (< line (* (/ (window-height) 9) 1)))))
      (let ((recenter-position 0.3))
        (recenter '(4)))))

;; keybindings
(global-set-key (kbd "C-c d") 'duplicate-line)
(global-set-key (kbd "C-c 1") 'vterm)
(global-set-key (kbd "C-c 2") 'treemacs)
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-timer)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)
(global-set-key (kbd "C-c C-j") 'avy-resume)
(global-set-key (kbd "M-p") 'scroll-down-line)
(global-set-key (kbd "M-n") 'scroll-up-line)
