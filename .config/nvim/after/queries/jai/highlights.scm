;; extends

;; built-in procedures
((identifier) @keyword
  (#any-of? @keyword
    "size_of"
    "type_of"
    "type_info"
    "is_constant"
    "initializer_of"))

;; Type instead of Keyword
(["struct" "union" "enum" "enum_flags"] @type
  (#set! priority 110)) ;; > @keyword 100

;; Invalid random inputs
((declaration
  name: (identifier) @jai.plain
  .
  (ERROR))
  (#set! priority 120))
