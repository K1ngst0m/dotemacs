;; Define the init file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Define and initialise package repositories
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/") t)
(add-to-list 'package-archives '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)

(package-initialize)

;; use-package to simplify the config file
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure 't)

;; Keyboard-centric user interface
(setq inhibit-startup-message t)
(tool-bar-mode -1)            ; Disable the toolbar
(tooltip-mode -1)             ; Disable tooltips
(menu-bar-mode -1)            ; Disable the menu bar
(setq use-dialog-box nil)
(scroll-bar-mode -1)
;; (if (display-graphic-p)
;;     (progn
;;       (tool-bar-mode -1)            ; Disable the toolbar
;;       (tooltip-mode -1)             ; Disable tooltips
;;       (menu-bar-mode -1)            ; Disable the menu bar
;;       (setq use-dialog-box nil)
;;       (scroll-bar-mode -1)))
(defalias 'yes-or-no-p 'y-or-n-p)

;; basic setting
(global-linum-mode)

;; Fonts
(add-to-list 'default-frame-alist
	     '(font . "fantasquesansmono-13"))
;; Themes
(use-package doom-themes
  :config (load-theme 'doom-horizon t))

;; Modeline
(use-package doom-modeline
  :config
  (doom-modeline-mode))

;; which key
(use-package which-key
  :config
  (which-key-mode)
  )

;; counsel
(use-package counsel
  :config
  (counsel-mode)
  (setq counsel-find-file-ignore-regexp
          (concat
           ;; File names beginning with # or .
           "\\(?:\\`[#.]\\)"
           ;; File names ending with # or ~
           "\\|\\(?:\\`.+?[#~]\\'\\)"))
  (ivy-mode)
  (setq ivy-extra-directories nil)
  (global-set-key (kbd "C-s") 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  )

;; Projectile
(use-package projectile
  :config
  (projectile-mode)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  )

;; Org-mode
(add-hook 'org-mode 'org-indent-mode)
