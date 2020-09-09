
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(windmove-default-keybindings)

;; CUA OS copypasta even in ncurses mode

(setq x-select-enable-clipboard t)
(defun xsel-cut-function (text &optional push)
(with-temp-buffer
	(insert text)
        (call-process-region (point-min) (point-max) "xsel" nil 0 nil "--clipboard" "--input")))
                (defun xsel-paste-function()
                  (let ((xsel-output (shell-command-to-string "xsel --clipboard --output")))
                    (unless (string= (car kill-ring) xsel-output)
                      xsel-output )))
                (setq interprogram-cut-function 'xsel-cut-function)
                (setq interprogram-paste-function 'xsel-paste-function)


(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/org/ss.org"
                             "~/org/phd.org" 
                             "~/org/research.org"
                             "~/org/readings.org"
                             "~/org/ideas.org"
                             "~/org/notes.org"))
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

;; Reload buffers if the files are changed on disk
(global-auto-revert-mode t)
(auto-revert-use-notify nil)
