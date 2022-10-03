
(* The type of tokens. *)

type token = 
  | VAR
  | SEMICOLON
  | MINUS
  | INTEGER of (int)
  | IDENTIFIER of (string)
  | EOL
  | ASSIGN

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val program: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (unit)
