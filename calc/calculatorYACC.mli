
(* The type of tokens. *)

type token = 
  | TIMES
  | SEMICOLON
  | RPAREN
  | PLUS
  | NUM of ( int )
  | MINUS
  | LPAREN
  | IDENT of ( string )
  | EOL
  | DIV
  | ASSIGN

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (unit)
