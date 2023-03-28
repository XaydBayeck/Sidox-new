;;; emacs.el --- emacs config file -*- lexical-binding: t; -*-

(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Loaded Emacs in %.03fs"
                     (float-time (time-subtract after-init-time before-init-time)))))

(let ((normal-gc-cons-threshold gc-cons-threshold)
      (normal-gc-cons-percentage gc-cons-percentage)
      (normal-file-name-handler-alist file-name-handler-alist)
      (init-gc-cons-threshold most-positive-fixnum)
      (init-gc-cons-percentage 0.6))
  (setq gc-cons-threshold init-gc-cons-threshold
        gc-cons-percentage init-gc-cons-percentage
        file-name-handler-alist nil)
  (add-hook 'after-init-hook
            `(lambda ()
               (setq gc-cons-threshold ,normal-gc-cons-threshold
                     gc-cons-percentage ,normal-gc-cons-percentage
                     file-name-handler-alist ',normal-file-name-handler-alist))))

(setq inhibit-startup-echo-area-message t)
;; (setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

(setq inhibit-default-init t)
(setq initial-major-mode 'fundamental-mode)

(setq use-dialog-box nil)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

(setq frame-inhibit-implied-resize t)

(advice-add #'x-apply-session-resources :override #'ignore)

(eval-and-compile
  (when (getenv "DEBUG") (setq init-file-debug t))
  (setq debug-on-error (and (not noninteractive) init-file-debug)))

(eval-and-compile
  (defvar data-dir
    (if (getenv "XDG_DATA_HOME")
        (concat (getenv "XDG_DATA_HOME") "/emacs/")
      (expand-file-name "~/.local/share/emacs/"))
    "Directory for data.")

  (defvar cache-dir
    (if (getenv "XDG_CACHE_HOME")
        (concat (getenv "XDG_CACHE_HOME") "/emacs/")
      (expand-file-name "~/.cache/emacs/"))
    "Directory for cache.")

  (defvar pictures-dir
    (or (getenv "XDG_PICTURES_DIR")
        (expand-file-name "~/Pictures/"))
    "Directory for pictures."))

(eval-when-compile
  (require 'use-package))

(eval-and-compile
  (defun use-package-ensure-ignore (&rest _args) t)
  (setq use-package-ensure-function #'use-package-ensure-ignore)

  (setq use-package-always-defer t)
  (setq use-package-hook-name-suffix nil))

(if init-file-debug
    (setq use-package-verbose t
          use-package-expand-minimally nil
          use-package-compute-statistics t)
  (setq use-package-verbose nil
        use-package-expand-minimally t))

(use-package auto-minor-mode
  :ensure t
  :init
  (eval-when-compile
    (require 'auto-minor-mode)))

(use-package no-littering
  :ensure t
  :demand t
  :init
  (setq no-littering-etc-directory data-dir)
  (setq no-littering-var-directory cache-dir))

(setq auto-mode-case-fold nil)

(setq bidi-inhibit-bpa t)
(setq-default bidi-display-reordering 'left-to-right
              bidi-paragraph-direction 'left-to-right)

(setq idle-update-delay 1.0
      jit-lock-defer-time 0)

(setq fast-but-imprecise-scrolling t)

(use-package gcmh
  :ensure t
  :hook
  (after-init-hook . gcmh-mode)
  :init
  (setq gcmh-idle-delay 5)
  (setq gcmh-high-cons-threshold (* 16 1024 1024)) ; 16MB
  (setq gcmh-verbose init-file-debug))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-tokyo-night)
  (doom-themes-visual-bell-config)
  ;; (setq doom-themes-treemacs-theme "doom-atom")
  (doom-themes-org-config))
