(*let ast = *)

try
  let lexbuf = Lexing.from_channel stdin in
    Parse.program Lex.token lexbuf
with Lex.Eof -> ();;

(*
print_string "\n\n";;
(Ast.num_cmds ast 1);;
*)