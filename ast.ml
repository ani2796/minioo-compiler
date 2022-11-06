open Type;;

type expr = 
| Null
| Proc of proc_arg * cmd list
| Id of string
| Field of Type.field
| LocExpr of Type.loc_expr * expr * expr
| Int of int
| MinusExpr of Type.minus_expr * expr * expr

and compareOp = 
| Greater
| Equals

and  bln = 
| True
| False
| BoolExpr of compareOp * expr * expr

and cmd = 
| Decl of string
| Asmt of string * expr
| ProcCall of Type.proc_call
| Block of cmd list
| FieldAsmt of Type.field_asmt
| Malloc of Type.malloc
| Skip
| Parallel of cmd list * cmd list
| Atom of cmd list
| IfElse of bln * cmd list * cmd list
| Loop of bln * cmd list


let rec str_of_expr s = match s with
| Null -> "null"
| Proc (a, cs) -> a.arg
| Id i -> i
| Field f -> f.id
| LocExpr (l, e1, e2) ->  (l.obj ^ "." ^ l.field)
| Int i -> string_of_int(i)
| MinusExpr (m, e1, e2) ->(m.arg1 ^ "-" ^ m.arg2)

let str_of_compareop op = match op with
| Greater -> ">"
| Equals -> "="

let str_of_bool b = match b with
| True -> "true"
| False -> "false"
| BoolExpr (op, e1, e2) -> str_of_expr(e1) ^ str_of_compareop(op) ^ str_of_expr(e2)
