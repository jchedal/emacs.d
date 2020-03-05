;;; core-custom.el --- Core module that initializes variables -*- lexical-binding: t -*-
;;; Commentary:
;; Defines variables and constants used throughout the configuration
;;; Code:

(defvar igneous--modules nil
  "List containing the loaded modules, filled by `igneous//load!'.
Contains atom or cons where the head is the module and the rest are the features to enable for that module.")

(provide 'core-custom)
;;; core-custom.el ends here
