;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; preventing auto-fill-mode!!!!
(setq comment-auto-fill-only-comments t)
;; (auto-fill-mode -1)
;; (set (make-local-variable 'comment-auto-fill-only-comments) t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; launch page change to scratch buff instead of welcome page
;; disabled because of not useful
;; (setq inhibit-splash-screen t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;set default language environment, font and size
(set-face-attribute 'default nil :font "monaco-10")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; full-screen (launch emacs with -fs is okay)
;;(add-to-list 'load-path "~/.emacs.d/darkroom")
;;(require 'darkroom-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(current-language-environment "Chinese-GB")
 '(display-battery-mode t)
 '(display-time-24hr-format t)
 '(display-time-mode t)
 '(fancy-splash-image nil)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60)))
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil))
;;(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
;; '(default ((t (:inherit nil :stipple nil :background "SystemWindow" :foreground "SystemWindowText" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "outline" :family "Consolas"))))
;; '(minibuffer-prompt ((t (:foreground "green yellow")))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;load color themes
(add-to-list 'load-path' ;;"D:/Emacs/site-lisp/color-theme-6.6.0/")
			 "~/.emacs.d/color-theme-6.6.0/")
(add-to-list 'load-path' ;;"D:/Emacs/site-lisp/color-theme-6.6.0/")
			 "~/.emacs.d/emacs-color-theme-solarized")
(require 'color-theme)
(require 'color-theme-solarized)
(color-theme-initialize)
;;(color-theme-tty-dark)
;;(color-theme-clarity)
;;(color-theme-matrix)
;;(color-theme-gnome2)
;;(color-theme-solarized-dark)
(color-theme-comidia)
;;(color-theme-bharadwaj-slate)
;;(color-theme-euphoria)
;;(color-theme-gray30) ;;gray background, bad transparent effects
;;(color-theme-green-kingsajz) ;;white background

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; full-screen
(defun w32-maximize-frame ()
  "Maximize the current frame"
  (interactive)
  (w32-send-sys-command 61488))
(add-hook 'window-setup-hook 'w32-maximize-frame t)
(global-hl-line-mode -1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<incactive>]))
(set-frame-parameter (selected-frame) 'alpha ' (70 70))
;;(add-to-list 'default-frame-alist '(alpha 95 95))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; change default major mode from fundamental to text
;; which enables undo-tree and linum and so on other options
(setq-default major-mode 'text-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Remove splash screen
;; (setq inhibit-splash-screen t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; For backup
  ;;(setq backup-directory-alist
  ;;`((".*" . ,temporary-file-directory)))
  ;;(setq auto-save-file-name-transforms
  ;;`((".*" ,temporary-file-directory t)))

  ;; For not backup files
(setq make-backup-files nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; For converting text in a region to upper or lower case are disabled by default
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ========== Line by line scrolling ========== 

;; This makes the buffer scroll by only a single line when the up or
;; down cursor keys push the cursor (tool-bar-mode) outside the
;; buffer. The standard emacs behaviour is to reposition the cursor in
;; the center of the screen, but this can make the scrolling confusing

(setq scroll-step 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ========== Set the fill column ==========

(setq-default fill-column 72)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ===== Turn on Auto Fill mode automatically in all modes =====

;; Auto-fill-mode the the automatic wrapping of lines and insertion of
;; newlines when the cursor goes over the column limit.

;; This should actually turn on auto-fill-mode by default in all major
;; modes. The other way to do this is to turn on the fill for specific modes
;; via hooks.

;;(setq auto-fill-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ========= Set colours ==========

;; Set cursor and mouse-pointer colours
;; (set-cursor-color "white")
;; (set-mouse-color "goldenrod")

;; Set region background colour
;; (set-face-background 'region "black")
;; Set emacs background colour
;; (set-background-color "black")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;set file encoding
;;priority: low -> high
;;putting utf-8 to the first place would make eshell encode
;;Chinese characters inproperly
(prefer-coding-system 'latin-1)
(prefer-coding-system 'chinese-big5)
(prefer-coding-system 'compound-text)
(prefer-coding-system 'utf-8)
(prefer-coding-system 'chinese-iso-8bit)
(prefer-coding-system 'cp936)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ido mode, better minibuffer completion
;;(ido-mode 1)
(require 'ido)
(ido-mode t)
;; evil for ido mode
;;(define-key evil-ex-map "e " 'ido-find-file)
;;(define-key evil-ex-map "w " 'ido-write-file)
;;(define-key evil-ex-map "b " 'ido-switch-buffer)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;autocomplete

;;get auto-complete-mode
(add-to-list 'load-path "~/.emacs.d/popup-el")
(require 'popup)

(add-to-list 'load-path ;;"D:/Emacs/site-lisp/auto-complete-1.3.1")
			 "~/.emacs.d/auto-complete")
(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories ;;"D:/Emacs/site-lisp/auto-complete-1.3.1/dict")
			 "~/.emacs.d/auto-complete/dict")
(ac-config-default)

(global-auto-complete-mode t)

(defun auto-complete-mode-maybe ()
  "No maybe for you. Only AC!"
  (unless (minibufferp (current-buffer))
    (auto-complete-mode 1)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;undo-tree
(add-to-list 'load-path ;;"D:/Emacs/site-lisp/undo-tree")
			 "~/.emacs.d/undo-tree")
(require 'undo-tree)
(global-undo-tree-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;tab width
(setq-default indent-tabs-mode nil)  ;; use space only
(setq-default ;; c-basic-offset 4
              tab-width 4)
(setq-default c-basic-offset 4)
(setq-default c-indent-level 4)
(setq-default ruby-indent-tabs-mode nil)
(setq-default ruby-indent-level 4)
(setq-default python-indent 4)
(setq-default latex-indent-level 4)
(setq-default matlab-indent-level 4)
(setq-default netlogo-indent-level 4)
;; (global-set-key (kbd "TAB") 'tab-to-tab-stop)

;; smart tab from wiki
;; not working? or something else

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;line number enable
(require 'linum)
(global-linum-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;w3m -- not supported for Emacs 23??
;;(add-to-list 'load-path "D:/Emacs/site-lisp/emacs-w3m-1.4.4")
;;(setq browse-url-browser-function 'w3m-browse-url)
;;(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;;optional keyboard short-cut
;;(global-set-key "\C-xm" 'browser-url-at-point)
;;(setq w3m-use-cookies t)

;;w3
;;(add-to-list 'load-path "D:/Emacs/lisp")
;;(setq load-path (cons "D:/Emacs/lisp" load-path))
;;(require 'w3)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;for dictionary -- dictd server
;;from "http://user.in-berlin.de/~myrkr/dictionary/"
;(add-to-list 'load-path ;;"D:/Emacs/site-lisp/dictionary-1.10")
;			 "~/.emacs.d/dictionary-1.10")
;(load "dictionary-init")
;;key bindings
;(global-set-key "\C-cs" 'dictionary-search)
;(global-set-key "\C-cm" 'dictionary-match-words)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;key bind
;; (global-set-key "\C-xgo" 'goto-line)
;; (global-set-key "\C-xt" 'replace-string)
(global-set-key "\C-xre" 'rename-buffer)
(global-set-key "\C-x\C-b" 'buffer-menu)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;eshell-prompt customize
;(load "~/.emacs.d/eshell-customize.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;active windmove keybindings
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;matlab mode
;; (autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
;; (add-to-list 'load-path ;;"D:/Emacs/site-lisp/matlab-emacs")
;; 			 "~/.emacs.d/matlab-emacs")
;; (load-library "matlab-load")
;; (add-to-list 'auto-mode-alist
;; 			 '("\\.m$" . matlab-mode))
;; (add-hook 'matlab-mode
;; 		  (lambda ()
;; 			(auto-complete-mode 1)
;; 			))
;; (setq matlab-indent-function t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;git
(add-to-list 'load-path ;;"D:/Emacs/site-lisp/git-emacs-master")
			 "~/.emacs.d/git-emacs-master")
(require 'git-emacs)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;evil

;;(add-to-list 'load-path "~/.emacs.d/evil") ;;"D:/Emacs/site-lisp/evil")
;;(setq evil-want-C-u-scroll t)
;;(require 'evil)
;;(evil-mode 1)
;;(evil-mode nil)

;; evil mode shortcuts
;; get from file ~/.emacs.d/evil/evil-map.el

;;(define-key evil-insert-state-map "jk" 'evil-change-to-previous-state)
;;(define-key evil-motion-state-map ";" 'evil-ex)
;;(define-key evil-normal-state-map "ZZ" 'evil-scroll-line-to-center)
;;(define-key evil-normal-state-map ",w" 'evil-window-map)
;;(define-key evil-normal-state-map ",be" 'buffer-menu)
;;(define-key evil-normal-state-map ",r" 'redo)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;netlogo syntax
;;(load-file "~/.emacs.d/netlogo-mode.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;switch-frame quicklier
(global-set-key (kbd "C-.") 'other-window)
(global-set-key (kbd "C-,") 'prev-window)

(defun prev-window ()
  (interactive)
  (other-window -1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;start emacs server so that open file in the existing emacs frame
(server-start)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;prevent the error message for git commit, disable vc-git (don't know why)
(setq vc-handled-backends ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;ahk-mode
(load-file "~/.emacs.d/ahk-org-mode/ahk-org-mode.el")

(setq ahk-syntax-directory "~/.emacs.d/ahk-org-mode/syntax/")
;(add-to-list 'auto-mode-alist '("\\.ahk$" . ahk-org-mode))
;(autoload 'ahk-org-mode "ahk-org-mode")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;csv-mode
(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
(autoload 'csv-mode "~/.emacs.d/csv-mode.el"
  "Major mode for editing comma-separated value files." t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;bash in shell mode
(add-hook 'comint-output-filter-functions
    'shell-strip-ctrl-m nil t)
(add-hook 'comint-output-filter-functions
    'comint-watch-for-password-prompt nil t)
(setq explicit-shell-file-name "bash.exe")
;; For subprocesses invoked via the shell
;; (e.g., "shell -c command")
(setq shell-file-name explicit-shell-file-name)
