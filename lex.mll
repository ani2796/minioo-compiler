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
|   "malloc"                    { MALLOC }
|   '\n'                        { EOL }
|   '='                         { ASSIGN }
|   "=="                        { EQUALS }
|   '>'                         { GREATER }
|   ';'+                        { SEMICOLON }
|   ':'                         { COLON }
|   '.'                         { DOT }
|   '-'                         { MINUS }
|   '{'                         { LEFT_CURLY }
|   '}'                         { RIGHT_CURLY }
|   '('                         { LEFT_PAREN }
|   ')'                         { RIGHT_PAREN }
|   upper (char|digit)* as field    { FIELD field} (* Fields can only start with upper-case *)
|   lower (char|digit)* as id   { IDENTIFIER id } (* Identifiers can only start with lower-case *)
|   digit+ as integer           { INTEGER (int_of_string(integer)) }
|   eof                         { raise Eof }