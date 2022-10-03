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
|   '\n'                        { EOL }
|   '='                         { ASSIGN }
|   ';'+                        { SEMICOLON }
|   '-'                         { MINUS }
|   char (char|digit)* as id    { IDENTIFIER id }
|   digit+ as integer           { INTEGER (int_of_string(integer)) }
|   eof                         { raise Eof }