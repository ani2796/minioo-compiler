
(* The type of tokens. *)

type token = 
  | ID of ( string )

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val id_start: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> ( string )
