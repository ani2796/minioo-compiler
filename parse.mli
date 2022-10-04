
(* The type of tokens. *)

type token = 
  | WHILE
  | VAR
  | TRUE
  | SEMICOLON
  | RIGHT_PAREN
  | RIGHT_CURLY
  | PROC
  | NULL
  | MINUS
  | LEFT_PAREN
  | LEFT_CURLY
  | INTEGER of (int)
  | IF
  | IDENTIFIER of (string)
  | GREATER
  | FALSE
  | EQUALS
  | EOL
  | ELSE
  | COLON
  | ASSIGN

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val program: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (unit)
