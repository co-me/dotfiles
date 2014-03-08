;; cf: http://d.hatena.ne.jp/sun-basix/20080117/1200528765
(require 'set-perl5lib)

(defalias 'perl-mode 'cperl-mode)
(add-to-list 'auto-mode-alist '("\\.t\\'" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.psgi\\'" . cperl-mode))
(add-to-list 'auto-mode-alist '("\cpanfile\\'" . cperl-mode))

(defun my-perl-common-mode ()
  (setq cperl-electric-lbrace-space nil)
  (setq cperl-electric-parens nil)
  (setq cperl-indent-parens-as-block t)
  (setq cperl-close-paren-offset -4)
  (setq cperl-indent-level 4)
  (setq cperl-label-offset -4)
  (setq cperl-continued-statement-offset 2)
  (setq cperl-highlight-variables-indiscriminately t)
  (setq cperl-indent-subs-specially nil))
(add-hook 'cperl-mode-hook 'my-perl-common-mode)

(add-hook 'cperl-mode-hook 'autopair-mode)
