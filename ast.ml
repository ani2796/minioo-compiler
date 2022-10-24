open Type;;

type cmd = 
| Decl of Type.decl
| Asmt of Type.asmt
| ProcCall of string
| Block of cmd list
| FieldAsmt of Type.field_asmt
| Malloc of Type.malloc
| Skip
| Parallel of cmd list * cmd list
| Atom of cmd list

type expr = 
| Null
| Proc of Type.proc * cmd list
| Id of Type.iden
| Field of Type.field
| LocExpr of Type.loc_expr * expr * expr
| Int of int
| MinusExpr of Type.minus_expr * expr * expr

type compareOp = 
| Greater
| Equals

type bln = 
| True
| False
| BoolExpr of expr * compareOp * expr

let rec str_of_expr s = match s with
| Null -> "null"
| Proc (a, cs) -> a.arg
| Id i -> i.id
| Field f -> f.id
| LocExpr (l, e1, e2) ->  (l.obj ^ "." ^ l.field)
| Int i -> string_of_int(i)
| MinusExpr (m, e1, e2) ->(m.arg1 ^ "." ^ m.arg2)

let str_of_compareop op = match op with
| Greater -> ">"
| Equals -> "="

let str_of_bool b = match b with
| True -> "true"
| False -> "false"
| BoolExpr (e1, op, e2) -> str_of_expr(e1) ^ str_of_compareop(op) ^ str_of_expr(e2)

let rec map f l = match l with
| [] -> []
| el::rem -> (f el)::(map f rem)

let rec str_of_str_list l = match l with
| [] -> "\n"
| el::rem -> (el ^ "\n" ^ (str_of_str_list rem))

let rec str_of_cmd c = match c with
| Decl d -> "New var " ^ d.id
| Asmt a -> a.id ^ " = " ^ a.value
| ProcCall pc -> pc
| Block b -> (str_of_str_list (map str_of_cmd b))
| FieldAsmt fa -> (fa.field ^ ": " ^ fa.value)
| Malloc m -> m.id
| Skip -> "skip"
| Parallel (cs1, cs2) -> (str_of_str_list (map str_of_cmd cs1)) ^ 
                          "\n||\n" ^ (str_of_str_list (map str_of_cmd cs2))
| Atom a -> (str_of_str_list (map str_of_cmd a))

(*
type cmd = 
| Cmds of string * cmd
| Cmd of string

let rec indent num = match num with
| 0 -> ()
| n -> print_string " "; (indent (num - 1))

let rec num_cmds c i = match c with 
| Cmds (c1, c2) -> (indent i); (print_string ((c1) ^ "\n")); (1 + (num_cmds c2 (i)))
| Cmd c -> (indent i); (print_string ((c) ^ "\n")); (1)
;;

*)