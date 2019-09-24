(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(defun require-package (package)
  (setq-default highlight-tabs t)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(load "~/.emacs.d/evil")
(load "~/.emacs.d/elisp")
(load "~/.emacs.d/virtualenvwrapper.el")
(load "~/.emacs.d/python")
(load "~/.emacs.d/javascript")
(load "~/.emacs.d/cmake")
(load "~/.emacs.d/themes")
(load "~/.emacs.d/cplusplus.el")
(load "~/.emacs.d/latex.el")
(load "~/.emacs.d/magit.el")
(load "~/.emacs.d/irc.el")

;; Appearance
(set-face-attribute 'default nil :height 80)
(scroll-bar-mode -1)
(menu-bar-mode -1) 
(tool-bar-mode -1)

(defun send-batch-job ()
  (interactive)
  (setq command (string-join `("aws s3 cp " ,(buffer-file-name) " s3://scape-devops/")))
  (message "Running command: %s" command)
  (shell-command command))

;; Text zooming
(require-package 'default-text-scale)
(global-set-key (kbd "C-+") 'default-text-scale-increase)
(global-set-key (kbd "C--") 'default-text-scale-decrease)
(global-set-key (kbd "C-<mouse-4>") 'default-text-scale-increase)
(global-set-key (kbd "C-<mouse-5>") 'default-text-scale-decrease)


(add-hook 'conf-unix-mode-hook '(lambda () (modify-syntax-entry ?_ "w")))


;;Groovy baby
(require-package 'groovy-mode)
(require 'groovy-mode)


;; Scala rocks
(require-package 'scala-mode)
(require 'scala-mode)


;;Set fill columns
(setq-default fill-column 120)



;; Don't show splash screen
(setq inhibit-startup-message t)

;;Smart-parens
(require-package 'evil-smartparens)
(require 'smartparens-config)
(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)


;; Stop alarm bell
(setq ring-bell-function 'ignore)

(require-package 'shackle)
(require 'shackle)
(shackle-mode)
(setq helm-display-function 'pop-to-buffer) ; make helm play nice
(setq shackle-rules '(("\\`\\*helm.*?\\*\\'" :regexp t :align t :size 0.4)))


;; Highlight the current line 
(global-hl-line-mode)


;; Moving between frames 
(load "~/.emacs.d/framemove")
(require 'framemove)
(setq framemove-hook-into-windmove t)

;; Autocompletion
(require-package 'helm-company)
(require 'helm-company)
(helm-mode 1)





;;Fill column stuff
(require-package 'fill-column-indicator)
(require 'fill-column-indicator)
(setq column-number-mode t)


;; Code highlighting 
(require-package 'cmake-font-lock)
(require 'cmake-font-lock)

;;Recent files
(require-package 'recentf)
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 50)

;; Make emacs see the start of a sentence as a full stop followed by a space
(setq sentence-end-double-space nil)

;; Change backup directory
(setq backup-directory-alist `(("." . "~/.saves")))

;; Ag, for searching
(require-package 'ag)


;;Helm 
(require-package 'helm)
(require-package 'helm-ag)
(require 'helm-config)
(require 'helm-ag)
(global-set-key (kbd "M-x") 'helm-M-x)
;; (helm-mode)

;;Helm projectile
(require-package 'helm-projectile)
(require 'helm-projectile)
(setq projectile-enable-caching t)
(projectile-mode)
;; (helm-projectile-on)
(add-to-list 'projectile-globally-ignored-directories "build")
(add-to-list 'projectile-globally-ignored-directories "Thirdparty")


;;Helm make
(require-package 'helm-make)
(require 'helm-make)


;; Helm swoop
(require-package 'helm-swoop)
(require 'helm-swoop)

;; Yaml mode
(require-package 'yaml-mode)
(require 'yaml-mode)


(setq helm-swoop-split-direction 'split-window-vertically)
(setq helm-swoop-split-with-multiple-windows t)
(setq helm-swoop-use-fuzzy-match t)


;;which-key
(require-package 'which-key)
(require 'which-key)
(which-key-mode)


;;Epa for file encryption
(require 'epa-file)
(epa-file-enable)
(setq epa-file-select-keys nil) 


;;Ranger
(require-package 'ranger)
(require 'ranger)
(eval-after-load 'ranger
  '(progn
     (define-key ranger-normal-mode-map (kbd "<ESC>") 'ranger-close)))
(setq ranger-deer-show-details nil)
(setq ranger-show-hidden nil)


(require-package 'lsp-mode)
(require-package 'company-lsp)
(require 'lsp-mode)



;; Associate .m files with octave mode
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

;; Set auto-fill columns
(setq-default fill-column 80)

;; XML folding
(require 'sgml-mode)

(add-to-list 'hs-special-modes-alist
              '(nxml-mode
                "<!--\\|<[^/>]*[^/]>"
                "-->\\|</[^/>]*[^/]>"
                "<!--"
                sgml-skip-tag-forward
                nil))
(add-hook 'nxml-mode-hook 'hs-minor-mode)

;;Install avy
(require-package 'avy)


;; Ediff setup
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Follow compilation
(setq compilation-scroll-output t)

;; Mouse speed
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;; Stop emacs from overriding stuff from system clipboard
(setq save-interprogram-paste-before-kill t)

;; Follow symlinks
(setq vc-follow-symlinks t)

;; Yasnippet
(require-package 'yasnippet)
(require 'yasnippet)
(yas-global-mode 1)

;; Set personal dictionary
(setq ispell-personal-dictionary "~/.dict")


;;Display line numbers mode
(setq display-line-numbers-type 'relative)

(require-package 'whitespace-cleanup-mode)

(require-package 'telephone-line)
(require 'telephone-line)
(setq telephone-line-lhs '((accent telephone-line-buffer-segment)
			   (nil telephone-line-vc-segment)))


(setq telephone-line-rhs '((nil telephone-line-misc-info-segment)
			   (accent telephone-line-major-mode-segment)
			   (nil telephone-line-airline-position-segment)))
(telephone-line-mode 1)

(show-paren-mode)
(setq show-paren-delay 0)

(require 'tramp)
(defun sudired ()
  (interactive)
  (dired "/sudo::/"))

(setq eww-search-prefix "https://www.google.com/search?q=")
(advice-add #'shr-colorize-region :around (defun shr-no-colourise-region (&rest ignore)))
(setq browse-url-browser-function 'eww-browse-url)
(setq shr-use-fonts nil)
(setq shr-blocked-images ".*")
(setq ansi-color-for-comint-mode t)

;; activate installed packages
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(completion-cycle-threshold t)
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("834cbeacb6837f3ddca4a1a7b19b1af3834f36a701e8b15b628cad3d85c970ff" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "73eacaf368e16cf41b125a1b6d3587308224d745fed432d641c54883ca3c55f0" "14a4bbd2207617728ea504ea9aa48416999a456db9f10e7d74baab896301d8a3" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" "24fc62afe2e5f0609e436aa2427b396adf9a958a8fa660edbaab5fb13c08aae6" "a7051d761a713aaf5b893c90eaba27463c791cd75d7257d3a8e66b0c8c346e77" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "c3d4af771cbe0501d5a865656802788a9a0ff9cf10a7df704ec8b8ef69017c68" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9")))
 '(package-selected-packages
   (quote
    (hc-zenburn-theme elpygen restclient jinja2-mode evil-collection w3m eyebrowse lsp-ui cquery company-lsp lsp-mode elf-mode ag yasnippet cuda-mode cl-lib evil-escape helm powerline cmake-font-lock fill-column-indicator evil-magit linum-relative evil monokai-theme)))
 '(projectile-other-file-alist
   (quote
    (("cpp" "h" "hpp" "ipp")
     ("ipp" "h" "hpp" "cpp")
     ("hpp" "h" "ipp" "cpp" "cc")
     ("cxx" "h" "hxx" "ixx")
     ("ixx" "h" "hxx" "cxx")
     ("hxx" "h" "ixx" "cxx")
     ("c" "h")
     ("m" "h")
     ("mm" "h")
     ("cu" "h")
     ("h" "c" "cc" "cpp" "ipp" "hpp" "cxx" "ixx" "hxx" "m" "mm" "cu")
     ("cc" "h" "hh" "hpp")
     ("hh" "cc")
     ("vert" "frag")
     ("frag" "vert")
     (nil "lock" "gpg")
     ("lock" "")
     ("gpg" "")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
