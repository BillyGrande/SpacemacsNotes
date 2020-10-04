;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Billy Grande"
      user-mail-address "billxs@hotmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Hack" :size 18 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fira Sans") ; inherits `doom-font''s :size
      doom-unicode-font (font-spec :family "Hack" :size 18)
      doom-big-font (font-spec :family "Fira Mono" :size 19))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "C:/notes/org-notes")

;;org-roam
(setq org-roam-directory "C:/notes/org-roam")

(setq org-roam-graph-viewer "C:/Program Files/Graphviz 2.44.1/bin/dot.exe")

;;(setq org-roam-graph-viewer '(lambda (file) (let ((file-file (concat "file://" file)))
    ;;(call-process "C:/Program Files/Mozilla Firefox/firefox.exe" nil 0 nil file-file))))
(setq org-roam-graph-viewer "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe")
(set-language-environment "UTF-8")
;;(require 'org-protocol)
;;(require 'org-roam-protocol)

;;(executable-find "sqlite3")
;;(add-to-list 'exec-path "C:/Users/xykei/.emacs.d/sql")

;;org-roam -server
;;(require 'simple-httpd)
;;(setq httpd-root "/var/www")
;;(httpd-start)

(setq org-roam-server-host "127.0.0.1"
      org-roam-server-port 8080
      org-roam-server-authenticate nil
      org-roam-server-export-inline-images t
      org-roam-server-serve-files nil
      org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
      org-roam-server-network-poll t
      org-roam-server-network-arrows nil
      org-roam-server-network-label-truncate t
      org-roam-server-network-label-truncate-length 60
      org-roam-server-network-label-wrap-length 20)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(add-hook 'window-setup-hook #'toggle-frame-maximized)


;;HUNSPELL
(add-to-list 'exec-path "C:/msys64/mingw64/bin")

(setq ispell-program-name (locate-file "hunspell" exec-path exec-suffixes 'file-executable-p))

(setq ispell-local-dictionary-alist '(

       (nil
           "[[:alpha:]]"
           "[^[:alpha:]]"
           "[']"
           t
           ("-d" "en_US" "-p" "C:\\msys64\\mingw64\\share\\hunspell\\personal.en")
           nil
           iso-8859-1)

       ("american"
           "[[:alpha:]]"
           "[^[:alpha:]]"
           "[']"
           t
           ("-d" "en_US" "-p" "C:\\msys64\\mingw64\\share\\hunspell\\personal.en")
           nil
           iso-8859-1)

       ("greek"
           "[[:alpha:]]"
           "[^[:alpha:]]"
           "[']"
           t
           ("-d" "el_GR" "-p" "C:\\msys64\\mingw64\\share\\hunspell\\personal.el")
           nil
           iso-8859-7)

       ))

;;Ivy bibtex and org biblography

(setq ivy-re-builders-alist
      '((ivy-bibtex . ivy--regex-ignore-order)
        (t . ivy--regex-plus)))

;;minimal ivy-bibtex config
(setq bibtex-completion-bibliography
      '("C:/notes/biblography/genesis.bib"
        "C:/notes/bibliography/genesis.org"
        ("C:/notes/bibliography/orgtex2.org" . "C:/notes/bibtex-file.bib")))

;;where are the pdfs
(setq bibtex-completion-library-path '("C:/notes/bibliography/pdfs" "C:/notes/bibliography/extras"))

(setq bibtex-completion-notes-path "C:/notes/bibliography/notes.org")

;;org-ref
(setq reftex-default-bibliography '("C:/notes/genesis.bib"))

;; see org-ref for use of these variables
(setq org-ref-bibliography-notes "C:/notes/bibliography/notes.org"
      org-ref-default-bibliography '("C:/notes/bibliography/genesis.bib")
      org-ref-pdf-directory "C:/notes/bibliography/pdfs/")

;;ORB
(use-package org-roam-bibtex
  :after org-roam
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :bind (:map org-mode-map
         (("C-c n a" . orb-note-actions))))
