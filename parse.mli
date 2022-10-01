
(* The type of tokens. *)

type token = 
  | INTEGER of (int)
  | IDENTIFIER of (string)
  | EOL

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val program: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (unit)
