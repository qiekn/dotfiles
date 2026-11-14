;; Procedures

(declaration
  name: (identifier)
  value: (value_list
    (procedure
      body: (block) @function.inner))) @function.outer


;; Structs

(declaration
  name: (identifier)
  value: (value_list
    (struct_type
      body: (struct_body) @class.inner))) @class.outer
