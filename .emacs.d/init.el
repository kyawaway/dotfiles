(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(add-to-list 'load-path "~/.emacs.d/elisp/")

(add-to-list 'load-path "~/.emacs.d/site-lisp/yatex")


;; menu-bar off on terminal
(if window-system (menu-bar-mode 1) (menu-bar-mode -1))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; ファイル自動更新
(global-auto-revert-mode 1)

;; yes or noをy or nにする
(fset 'yes-or-no-p 'y-or-n-p)

;; バックアップを残さない
(setq make-backup-files nil)

;; テーマ
(load-theme 'monokai t)


;; モードラインに列番号表示
(column-number-mode t)

;;行数表示
(global-linum-mode t)
(setq linum-format "%5d ")

;; 括弧ハイライト
(show-paren-mode t)

;; ソフトタブ
(setq-default tab-width 4 indent-tabs-mode nil)
;; C-kで行全体を削除
(setq kill-whole-line t)

;; 1行ずつスクロール
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)
(setq comint-scroll-show-maximum-output t)

;; anzu mode
(global-anzu-mode +1)
(setq anzu-mode-lighter "")
(setq anzu-deactivate-region t)
(setq anzu-search-threshold 1000)
(setq anzu-minimum-input-length 2)
(setq anzu--use-migemo-p nil)
(set-face-foreground 'anzu-mode-line nil)
(global-set-key (kbd "C-c r") 'anzu-query-replace)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "M-/") 'undo-tree-redo)

;; neotree
(require 'neotree)
(global-set-key (kbd "C-M-t") 'neotree)
(setq neo-show-hidden-files t)
(setq neo-create-file-auto-open t)
(setq neo-persist-show t)
(setq neo-keymap-style 'concise)
(setq neo-smart-open t)

;;nyan
(add-to-list 'load-path "~/.emacs.d/nyan-mode")
(require 'nyan-mode)
(setq nyan-mode 1)
(nyan-start-animation)


;;twitter
(setq twittering-account-authorization 'authorized)
(setq twittering-oauth-access-token-alist
      '(("oauth_token" . "769842941816807425-LyMatdlz7sUFoansvlq4NbZRrHnWRBm")
        ("oauth_token_secret" . "BFdKakf5Xl0LLwPcQAtY6nzVTSZsIzc8kJXENOZz24lpQ")
        ("user_id" . "769842941816807425")
        ("screen_name" . "Stockyawaway")))

(setq twittering-icon-mode t)      
(setq twittering-timer-interval 300)    
;;haskell
(autoload 'haskell-mode "haskell-mode" nil t)
(autoload 'haskell-cabal "haskell-cabal" nil t)

(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal$" . haskell-cabal-mode))




(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)




;; フックを設定
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)
(add-hook 'haskell-mode-hook 'haskell-doc-mode)
(add-hook 'haskell-mode-hook 'hindent-mode)

;; (add-hook 'haskell-mode-hook 'view-mode)

(setq haskell-process-type 'stack-ghci)
(setq haskell-process-path-ghci "stack")
(setq haskell-process-args-ghci "ghci")
(setq hindent-style "johan-tibell")

;;flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; tex
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)



;;
;; YaTeX
;;
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
                ("\\.ltx$" . yatex-mode)
                ("\\.cls$" . yatex-mode)
                ("\\.sty$" . yatex-mode)
                ("\\.clo$" . yatex-mode)
                ("\\.bbl$" . yatex-mode)) auto-mode-alist))
(setq YaTeX-inhibit-prefix-letter t)
(setq YaTeX-kanji-code nil)
(setq YaTeX-latex-message-code 'utf-8)
(setq YaTeX-use-LaTeX2e t)
(setq YaTeX-use-AMS-LaTeX t)
(setq YaTeX-dvi2-command-ext-alist
      '(("TeXworks\\|texworks\\|texstudio\\|mupdf\\|SumatraPDF\\|Preview\\|Skim\\|TeXShop\\|evince\\|atril\\|xreader\\|okular\\|zathura\\|qpdfview\\|Firefox\\|firefox\\|chrome\\|chromium\\|MicrosoftEdge\\|microsoft-edge\\|Adobe\\|Acrobat\\|AcroRd32\\|acroread\\|pdfopen\\|xdg-open\\|open\\|start" . ".pdf")))
(setq tex-command "ptex2pdf -u -l -ot '-synctex=1'")

(setq bibtex-command "latexmk -e '$latex=q/uplatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/upmendex %O -o %D %S/' -e '$dvipdf=q/dvipdfmx %O -o %D %S/' -norc -gg -pdfdvi")
(setq makeindex-command  "latexmk -e '$latex=q/uplatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/upmendex %O -o %D %S/' -e '$dvipdf=q/dvipdfmx %O -o %D %S/' -norc -gg -pdfdvi")

(setq dvi2-command "evince")

(setq tex-pdfview-command "evince")

(setq dviprint-command-format "wine cmd /c start AcroRd32.exe `echo %s | sed -e \"s/\\.[^.]*$/\\.pdf/\"`")

(require 'dbus)
(defun un-urlify (fname-or-url)
  "A trivial function that replaces a prefix of file:/// with just /."
  (if (string= (substring fname-or-url 0 8) "file:///")
      (substring fname-or-url 7)
    fname-or-url))
(defun evince-inverse-search (file linecol &rest ignored)
  (let* ((fname (decode-coding-string (url-unhex-string (un-urlify file)) 'utf-8))
         (buf (find-file fname))
         (line (car linecol))
         (col (cadr linecol)))
    (if (null buf)
        (message "[Synctex]: %s is not opened..." fname)
      (switch-to-buffer buf)
      (goto-line (car linecol))
      (unless (= col -1)
        (move-to-column col))
      (x-focus-frame (selected-frame)))))


;(dbus-register-signal
; :session nil "/org/gnome/evince/Window/0"
; "org.gnome.evince.Window" "SyncSource"
;  'evince-inverse-search)


(with-eval-after-load 'yatexprc
  (defun YaTeX-preview-jump-line ()
    "Call jump-line function of various previewer on current main file"
    (interactive)
    (save-excursion
      (save-restriction
        (widen)
        (let*((pf (or YaTeX-parent-file
                      (save-excursion (YaTeX-visit-main t) (buffer-file-name))))
              (pdir (file-name-directory pf))
              (bnr (substring pf 0 (string-match "\\....$" pf)))
                                        ;(cf (file-relative-name (buffer-file-name) pdir))
              (cf (buffer-file-name)) ;2016-01-08
              (buffer (get-buffer-create " *preview-jump-line*"))
              (line (count-lines (point-min) (point-end-of-line)))
              (previewer (YaTeX-preview-default-previewer))
              (cmd (cond
                    ((string-match "Skim" previewer)
                     (format "%s %d '%s.pdf' '%s'"
                             YaTeX-cmd-displayline line bnr cf))
                    ((string-match "evince" previewer)
                     (format "%s '%s.pdf' %d '%s'"
                             "fwdevince" bnr line cf))
                    ((string-match "sumatra" previewer)
                     (format "%s \"%s.pdf\" -forward-search \"%s\" %d"
                             previewer bnr cf line))
                    ((string-match "zathura" previewer)
                     (format "%s --synctex-forward '%d:0:%s' '%s.pdf'"
                             previewer line cf bnr))
                    ((string-match "qpdfview" previewer)
                     (format "%s '%s.pdf#src:%s:%d:0'"
                             previewer bnr cf line))
                    ((string-match "okular" previewer)
                     (format "%s '%s.pdf#src:%d %s'"
                             previewer bnr line (expand-file-name cf)))
                    )))
          (YaTeX-system cmd "jump-line" 'noask pdir))))))
(add-hook 'yatex-mode-hook
          '(lambda ()
             (auto-fill-mode -1)))




;;
;; RefTeX with YaTeX
;;
;(add-hook 'yatex-mode-hook 'turn-on-reftex)
(add-hook 'yatex-mode-hook
          '(lambda ()
             (reftex-mode 1)
             (define-key reftex-mode-map (concat YaTeX-prefix ">") 'YaTeX-comment-region)
             (define-key reftex-mode-map (concat YaTeX-prefix "<") 'YaTeX-uncomment-region)))


;;markdown
(autoload 'markdown-preview-mode "markdown-preview-mode.el" t)
(setq markdown-preview-stylesheets (list "github.css"))

(when (require 'exec-path-from-shell nil t)
    (exec-path-from-shell-initialize))

