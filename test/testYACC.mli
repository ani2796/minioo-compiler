
(* The type of tokens. *)

type token = 
  | OTHER of (string)
  | NEWLINE
  | FOO

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (unit)
