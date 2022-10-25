(*let ast = *)
open Ast;;

let ast = 
  let lexbuf = Lexing.from_channel stdin in
    Parse.program Lex.token lexbuf;;

(*let print_ast ast = match ast with
| Ast.cmd c1::cs -> print


let rec indent_string count = match count with
| 0 -> ""
| num -> "\t" ^ (indent_string (num-1))

let rec print_cmd c indent = match c with
| Block b -> 
| 
*)

let rec map f l = match l with 
| [] -> []
| el::rem -> (f el)::(map f rem)

let rec print_indent count = match count with
| 0 -> (print_string "")
| num -> (print_string " "); (print_indent (num-1))

let rec print_indent_string indent str = 
  print_indent(indent);
  print_string(str)
;; 

let rec print_cmd c indent = match c with
| Decl d -> (print_indent_string indent ("Decl of " ^ d.id ^ "\n"));
| Asmt a -> (print_indent_string indent ("Asmt of " ^ a.value ^ " to " ^ a.id ^ "\n"));
| ProcCall pc -> (print_indent_string indent ("Proc call " ^ pc.id ^ "(" ^ pc.arg ^ ")\n"));
| Block b -> (print_block b (indent+1));
| FieldAsmt fa -> (print_indent_string indent ("Field assigment: " ^ fa.obj ^ "." ^ fa.field ^ " = " ^ fa.value));
| Malloc m -> (print_indent_string indent ("Malloc " ^ m.id));
| Skip -> (print_indent_string indent ("Skip"));
| Parallel (c1s, c2s) -> (print_block c1s (indent+1)); (print_indent_string indent ("|||\n")); (print_block c2s (indent+1));
| Atom a -> (print_indent_string indent ("Atom: ")); (print_block a (indent+1));
| IfElse (b, b1, b2) -> (print_indent_string indent ("If " ^ str_of_bool(b) ^ "\n")); (print_block b1 (indent+1)); (print_indent_string indent ("Else \n")); (print_block b2 (indent+1));
| Loop (b, b1) -> (print_indent_string indent ("Loop " ^ str_of_bool(b))); (print_block b1 (indent+1));
and print_block cs indent = match cs with
| [] -> ()
| c1::c2s -> (print_cmd  c1 indent); (print_block c2s indent);

;;

let rec print_ast ast = match ast with
| [] -> ()
| c1::cs -> (print_cmd c1 0); (print_ast cs)
;;

print_ast ast
;;

(*
print_string "\n\n";;
(Ast.num_cmds ast 1);;
*)