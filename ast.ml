type cmd = 
| Decl of Type.decl
| Asmt of Type.asmt
| FuncCall of string
| Block of cmd list
| FieldAsmt of Type.field_asmt
| Malloc of Type.malloc
| Skip
| Parallel of cmd list * cmd list
| Atom of cmd list

type expr = 
| Null of string
| Proc of string

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