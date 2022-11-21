{
    (* Preamble *)
    open Parse;;
    open Ast;;
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
|   "skip"                      { SKIP }
|   "atom"                      { ATOM }

|   '\n'                        { EOL }

|   '='                         { ASSIGN }

|   ("=="|">"|"<"|">="|"<=") as op { COMP_OP(op) }

|   '*'|'/' as op               { TIMES_BY(op) }
|   '-'|'+' as op               { PLUS_MINUS(op) }


|   ';'+                        { SEMICOLON }
|   ':'                         { COLON }
|   '.'                         { DOT }
|   "|||"                       { PARALLEL }
|   '{'                         { LEFT_CURLY }
|   '}'                         { RIGHT_CURLY }
|   '('                         { LEFT_PAREN }
|   ')'                         { RIGHT_PAREN }
|   upper (char|digit)* as field    { FIELD field} (* Fields can only start with upper-case *)
|   lower (char|digit)* as id   { IDENTIFIER id } (* Identifiers can only start with lower-case *)
|   digit+ as integer           { INTEGER (int_of_string(integer)) }
|   eof                         { raise Eof }