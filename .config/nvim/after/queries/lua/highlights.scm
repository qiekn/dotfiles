;; extends 

(("end" @punctuation.bracket) (#set! conceal "}"))
((identifier) @variable.builtin (#eq? @variable.builtin "self") (#set! conceal ""))
(("function" @keyword.function) (#set! conceal "󰊕"))
(("return" @keyword.function) (#set! conceal "R"))
(("then" @punctuation.bracket) (#set! conceal "{"))
(("do" @punctuation.bracket) (#set! conceal "{"))
(("local" @keyword) (#set! conceal ""))
