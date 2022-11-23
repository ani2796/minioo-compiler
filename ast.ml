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
| Proc of expr * cmd list
| En_Proc of expr * en_cmd list
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
| En_Cmd of cmd * ((string * int) list)
| En_Block of en_cmd list
| En_Parallel of (en_cmd list) * (en_cmd list)
| En_IfElse of bln * (en_cmd list) * (en_cmd list)
| En_Atom of (en_cmd list)
| En_Loop of bln * (en_cmd list)
;;

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