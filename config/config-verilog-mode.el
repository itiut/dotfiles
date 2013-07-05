;;;; verilog-mode
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t)
(add-to-list 'auto-mode-alist '("\\.v\\'" . verilog-mode))

(eval-after-load "verilog-mode"
  '(progn
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
           verilog-auto-lineup              '(all))))
