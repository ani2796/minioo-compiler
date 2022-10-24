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
let rec print_ast ast = match ast with
| [] -> " "
| c::cs -> (Ast.str_of_cmd c) ^ "\n " ^ (print_ast(cs));;

print_string (print_ast ast);;


(*
print_string "\n\n";;
(Ast.num_cmds ast 1);;
*)