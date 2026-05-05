;; extends

;; Conceal className="..." -> 󰇥
((jsx_attribute
   (property_identifier) @tag.attribute
   (string) @attr-value
  ) @EveryoneLoveDuck
 (#match? @tag.attribute "className")
 (#set! @EveryoneLoveDuck conceal "󰇥")
)

; icons   λ 
