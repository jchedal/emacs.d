(use-package python
  :ensure nil
  :custom
  (python-indent 4)
  (py-split-window-on-execute t))

;; Required for MacOS, prevents newlines from being displayed as ^G
(setq python-shell-interpreter-args (if (equal system-type 'darwin)
					"-c \"exec('__import__(\\'readline\\')')\" -i"
				      "-i"))

(use-package pyvenv
  :after python
  :hook
  (python-mode . pyvenv-mode))

(with-feature! +lsp
  (if (module-p! :tools lsp)
      (add-hook 'python-mode-hook #'lsp)
    (warn "Module language/python requires module tools/lsp for feature +lsp to work.")))

(with-eval-after-load 'lsp-mode
  (setq lsp-pyls-plugins-autopep8-enabled nil
        lsp-pyls-plugins-flake8-enabled t
        lsp-pyls-plugins-mccabe-enabled nil
        lsp-pyls-plugins-pycodestyle-enabled nil
        lsp-pyls-plugins-pyflakes-enabled nil
        lsp-pyls-plugins-yapf-enabled nil))

(dependencies! python)
