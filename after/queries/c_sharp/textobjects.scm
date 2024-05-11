;; extends

;; match empty methods/ctors for @function.outer
(method_declaration) @function.outer
(constructor_declaration) @function.outer

;; match empty classes/structs for @class.outer
(class_declaration) @class.outer
(struct_declaration) @class.outer

;; also match interfaces/enums for @class
(interface_declaration
  body: (declaration_list . "{" . (_) @_start @_end (_)? @_end . "}"
  (#make-range! "class.inner" @_start @_end)))
(interface_declaration) @class.outer

(enum_declaration
  body: (enum_member_declaration_list . "{" . (_) @_start @_end (_)? @_end . "}"
  (#make-range! "class.inner" @_start @_end)))
(enum_declaration) @class.outer

