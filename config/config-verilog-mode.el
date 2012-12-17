;;; verilog-mode
(defun my-verilog-mode-setup ()
  (setq verilog-indent-level             4
        verilog-indent-level-module      4
        verilog-indent-level-declaration 4
        verilog-indent-level-behavioral  4
        verilog-indent-level-directive   4
        verilog-case-indent              4
        verilog-auto-newline             nil
        verilog-auto-indent-on-newline   nil
        verilog-tab-always-indent        t
        verilog-auto-endcomments         t
        verilog-minimum-comment-distance 40
        verilog-indent-begin-after-if    t
        verilog-auto-lineup              '(all)))

(add-hook 'verilog-mode-hook 'my-verilog-mode-setup)
