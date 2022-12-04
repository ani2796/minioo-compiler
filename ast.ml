type cmd = 
| Decl of expr
| Asmt of expr * expr
| ProcCall of expr * expr
| Block of cmd list
| FieldAsmt of expr * expr * expr
| Malloc of expr
| Skip
| Parallel of cmd list * cmd list
| Atom of cmd list
| IfElse of bln * cmd list * cmd list
| Loop of bln * cmd list

and expr = 
| Null
| Proc of expr * (cmd list)
| En_Proc of expr * (en_cmd list)
| Id of string
| Field of string
| LocExpr of expr * expr
| Int of int
| ArithExpr of char * expr * expr

and  bln = 
| True
| False
| BoolExpr of string * expr * expr

and en_cmd = 
| En_Cmd of cmd * ((string * (stack_frame_sd)) list)
| En_Block of en_cmd list
| En_Parallel of (en_cmd list) * (en_cmd list)
| En_IfElse of bln * (en_cmd list) * (en_cmd list)
| En_Atom of (en_cmd list)
| En_Loop of bln * (en_cmd list)

(* Stack is init to Init_Frame while declaring the symbol table *)
(* Stack is changed during execution to point to an actual stack frame *)
(* An actual stack frame is either a reference to an object or a closure *)
(* 
An object reference maps the identifier to an object name on the stack, 
which is dynamically created during program execution.
*)

and stack_frame_sd = 
| Init_Frame
| Object_Ref of (string * string)

and stack_sd = stack_frame_sd list

(* Objects are non-null values *)
(* Locations are either objects or null *)
(* 
The "is_object" field makes sure that fields cannot
be accessed before allocation using "malloc". This is a
run-time check, but could have been done during static checking.
Fields mapped to values are mutable, as per the spec.
Possible to functionally update fields of records.
*)

and object_sd = {
  obj_id: string;
  is_object: bool;
  mutable fields: ((string * value_sd) list);
}

and heap_sd = object_sd list

and location_sd = 
| Object_Loc of object_sd
| Null_Loc

(* A value is stored in object fields *)
(* For ints, values are stored in the val field *)

and value_sd = 
| Int_Value of int
| Field_Value of string
| Location_Value of location_sd
| Closure_Value of (stack_sd * string * (en_cmd list))
| Error_Value
;;

(* Conversion to strings for printing *)

let rec str_of_expr s = match s with
| Null -> "null"
| Proc (a, cs) -> str_of_expr(a)
| Id i -> i
| Field f -> f
| LocExpr (e1, e2) ->  (str_of_expr(e1) ^ "." ^ str_of_expr(e2))
| Int i -> string_of_int(i)
| ArithExpr (arith, e1, e2) -> (str_of_expr(e1) ^ "-" ^ str_of_expr(e2))
| En_Proc (a, en_cs) -> str_of_expr(a)
;;

let str_of_bool b = match b with
| True -> "true"
| False -> "false"
| BoolExpr (op, e1, e2) -> str_of_expr(e1) ^ op ^ str_of_expr(e2)
;;