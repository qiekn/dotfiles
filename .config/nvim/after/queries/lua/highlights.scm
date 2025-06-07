;; extends 

(("end" @punctuation.bracket) (#set! conceal "}"))
(("do" @punctuation.bracket) (#set! conceal "{"))
(("and" @keyword.function) (#set! conceal "&"))
(("return" @keyword.function) (#set! conceal "R"))
(("then" @punctuation.bracket) (#set! conceal "{"))
