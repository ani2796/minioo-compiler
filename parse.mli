
(* The type of tokens. *)

type token = 
  | WHILE
  | VAR
  | TRUE
  | TIMES_BY of (char)
  | SKIP
  | SEMICOLON
  | RIGHT_PAREN
  | RIGHT_CURLY
  | PROC
  | PLUS_MINUS of (char)
  | PARALLEL
  | NULL
  | MALLOC
  | LEFT_PAREN
  | LEFT_CURLY
  | INTEGER of (int)
  | IF
  | IDENTIFIER of (string)
  | FIELD of (string)
  | FALSE
  | EOL
  | ELSE
  | DOT
  | COMP_OP of (string)
  | COLON
  | ATOM
  | ASSIGN

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val program: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.cmd list)
