
(tool-bar-mode 0)
(menu-bar-mode 0)
(toggle-frame-fullscreen)
(scroll-bar-mode 0)
(fset `yes-or-no-p `y-or-n-p)
(load-theme 'deeper-blue)
(global-set-key (kbd "M-ä") 'next-buffer)
(global-set-key (kbd "M-$") 'previous-buffer)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "C-c C-m") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-+") 'zoom-frm-in)
(global-set-key (kbd "C-=") 'zoom-frm-out)
(global-set-key (kbd "C-q") 'ace-window)
(global-set-key (kbd "C-z") 'undo)
(cua-mode t)
(setq split-height-threshold 1)
(setq split-width-threshold nil)
(setq ensime-startup-notification nil)
;; global variables
(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; modes
(electric-indent-mode 0)

;; global keybindings
(global-unset-key (kbd "C-z"))

;; the package manager
(require 'package)
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))

(setq package-list '(json-mode markdown-mode auto-complete yaml-mode yasnippet-snippets helm ansible ace-window darkokai-theme ensime))

 
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(require 'helm-config)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (json-mode markdown-mode auto-complete yaml-mode yasnippet-snippets helm ansible ace-window darkokai-theme ensime use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 (use-package ensime
   :ensure t
   :pin melpa-stable)

;;Scalamode customizing

;;Adding lambda and alpha pretty symbols. will extend as needed
(defconst
  scala-mode-pretty-greek-alist
  '(("lambda" . ?λ)
    ("alpha" . ?α))
  "Prettify rules for greek characters related code pieces.")

;;reconfigure scala pretty print list to include custom entries
(defcustom
  mine-scala-prettify-symbols-alist
  (append
   scala-mode-pretty-bool-alist
   scala-mode-pretty-collection-alist
   scala-mode-pretty-greek-alist
   scala-mode-pretty-arrows-alist
   scala-mode-pretty-misc-alist
   scala-mode-pretty-categories-alist)
  "All prettify rules to be applied in scala code."
  :type 'alist
  :group 'scala)

;;add pretty print hook
(add-hook 'scala-mode-hook (lambda () (setq prettify-symbols-alist mine-scala-prettify-symbols-alist)(prettify-symbols-mode)))

;;add highlighint to FIXME: , TODO: , BUG: in scala mode 
(add-hook 'scala-mode-hook
               (lambda ()
                (font-lock-add-keywords nil
                 '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))
