
try
  let lexbuf = Lexing.from_channel stdin in
    Parse.program Lex.token lexbuf
with Lex.Eof -> ()