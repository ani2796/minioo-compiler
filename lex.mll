{
    (* Preamble *)
    open Parse;;
    exception Eof;;
}

(* Some definitions *)
let digit = ['0'-'9']
let upper = ['A'-'Z']
let lower = ['a'-'z']
let char = (upper | lower)
let space = ('\t' | ' ')

(* Token lexing *)

rule token = parse
|   space+                      { token lexbuf }
|   "var"                       { VAR }
|   "null"                      { NULL }
|   "proc"                      { PROC }
|   "true"                      { TRUE }
|   "false"                     { FALSE }
|   "if"                        { IF }
|   "else"                      { ELSE }
|   "while"                     { WHILE }
|   '\n'                        { EOL }
|   '='                         { ASSIGN }
|   "=="                        { EQUALS }
|   '>'                         { GREATER }
|   ';'+                        { SEMICOLON }
|   ':'                         { COLON }
|   '-'                         { MINUS }
|   '{'                         { LEFT_CURLY }
|   '}'                         { RIGHT_CURLY }
|   '('                         { LEFT_PAREN }
|   ')'                         { RIGHT_PAREN }
|   char (char|digit)* as id    { IDENTIFIER id }
|   digit+ as integer           { INTEGER (int_of_string(integer)) }
|   eof                         { raise Eof }