
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | WHILE
    | VAR
    | TRUE
    | TIMES_BY of (
# 9 "parse.mly"
      (char)
# 18 "parse.ml"
  )
    | SKIP
    | SEMICOLON
    | RIGHT_PAREN
    | RIGHT_CURLY
    | PROC
    | PLUS_MINUS of (
# 9 "parse.mly"
      (char)
# 28 "parse.ml"
  )
    | PARALLEL
    | NULL
    | MALLOC
    | LEFT_PAREN
    | LEFT_CURLY
    | INTEGER of (
# 13 "parse.mly"
       (int)
# 38 "parse.ml"
  )
    | IF
    | IDENTIFIER of (
# 12 "parse.mly"
       (string)
# 44 "parse.ml"
  )
    | FIELD of (
# 12 "parse.mly"
       (string)
# 49 "parse.ml"
  )
    | FALSE
    | EOL
    | ELSE
    | DOT
    | COMP_OP of (
# 8 "parse.mly"
      (string)
# 58 "parse.ml"
  )
    | COLON
    | ATOM
    | ASSIGN
  
end

include MenhirBasics

# 1 "parse.mly"
  
    (* Preamble *)
    open Ast;;

# 73 "parse.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_program) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: program. *)

  | MenhirState01 : (('s, _menhir_box_program) _menhir_cell1_WHILE, _menhir_box_program) _menhir_state
    (** State 01.
        Stack shape : WHILE.
        Start symbol: program. *)

  | MenhirState05 : (('s, _menhir_box_program) _menhir_cell1_PROC _menhir_cell0_IDENTIFIER, _menhir_box_program) _menhir_state
    (** State 05.
        Stack shape : PROC IDENTIFIER.
        Start symbol: program. *)

  | MenhirState06 : (('s, _menhir_box_program) _menhir_cell1_LEFT_CURLY, _menhir_box_program) _menhir_state
    (** State 06.
        Stack shape : LEFT_CURLY.
        Start symbol: program. *)

  | MenhirState15 : (('s, _menhir_box_program) _menhir_cell1_LEFT_PAREN, _menhir_box_program) _menhir_state
    (** State 15.
        Stack shape : LEFT_PAREN.
        Start symbol: program. *)

  | MenhirState20 : (('s, _menhir_box_program) _menhir_cell1_expression _menhir_cell0_TIMES_BY, _menhir_box_program) _menhir_state
    (** State 20.
        Stack shape : expression TIMES_BY.
        Start symbol: program. *)

  | MenhirState22 : (('s, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_state
    (** State 22.
        Stack shape : expression.
        Start symbol: program. *)

  | MenhirState25 : (('s, _menhir_box_program) _menhir_cell1_expression _menhir_cell0_PLUS_MINUS, _menhir_box_program) _menhir_state
    (** State 25.
        Stack shape : expression PLUS_MINUS.
        Start symbol: program. *)

  | MenhirState27 : (('s, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_state
    (** State 27.
        Stack shape : IF.
        Start symbol: program. *)

  | MenhirState28 : (('s, _menhir_box_program) _menhir_cell1_LEFT_PAREN, _menhir_box_program) _menhir_state
    (** State 28.
        Stack shape : LEFT_PAREN.
        Start symbol: program. *)

  | MenhirState31 : (('s, _menhir_box_program) _menhir_cell1_expression _menhir_cell0_COMP_OP, _menhir_box_program) _menhir_state
    (** State 31.
        Stack shape : expression COMP_OP.
        Start symbol: program. *)

  | MenhirState36 : ((('s, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_cell1_boolean, _menhir_box_program) _menhir_state
    (** State 36.
        Stack shape : IF boolean.
        Start symbol: program. *)

  | MenhirState38 : (((('s, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_cell1_boolean, _menhir_box_program) _menhir_cell1_block, _menhir_box_program) _menhir_state
    (** State 38.
        Stack shape : IF boolean block.
        Start symbol: program. *)

  | MenhirState41 : (('s, _menhir_box_program) _menhir_cell1_IDENTIFIER, _menhir_box_program) _menhir_state
    (** State 41.
        Stack shape : IDENTIFIER.
        Start symbol: program. *)

  | MenhirState43 : (('s, _menhir_box_program) _menhir_cell1_ATOM, _menhir_box_program) _menhir_state
    (** State 43.
        Stack shape : ATOM.
        Start symbol: program. *)

  | MenhirState49 : (('s, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_state
    (** State 49.
        Stack shape : expression.
        Start symbol: program. *)

  | MenhirState52 : (('s, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_state
    (** State 52.
        Stack shape : expression.
        Start symbol: program. *)

  | MenhirState54 : ((('s, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_state
    (** State 54.
        Stack shape : expression expression.
        Start symbol: program. *)

  | MenhirState59 : (('s, _menhir_box_program) _menhir_cell1_command, _menhir_box_program) _menhir_state
    (** State 59.
        Stack shape : command.
        Start symbol: program. *)

  | MenhirState62 : (('s, _menhir_box_program) _menhir_cell1_block, _menhir_box_program) _menhir_state
    (** State 62.
        Stack shape : block.
        Start symbol: program. *)

  | MenhirState65 : ((('s, _menhir_box_program) _menhir_cell1_WHILE, _menhir_box_program) _menhir_cell1_boolean, _menhir_box_program) _menhir_state
    (** State 65.
        Stack shape : WHILE boolean.
        Start symbol: program. *)


and ('s, 'r) _menhir_cell1_block = 
  | MenhirCell1_block of 's * ('s, 'r) _menhir_state * (
# 18 "parse.mly"
      (Ast.cmd list)
# 186 "parse.ml"
)

and ('s, 'r) _menhir_cell1_boolean = 
  | MenhirCell1_boolean of 's * ('s, 'r) _menhir_state * (
# 17 "parse.mly"
      (bln)
# 193 "parse.ml"
)

and ('s, 'r) _menhir_cell1_command = 
  | MenhirCell1_command of 's * ('s, 'r) _menhir_state * (
# 19 "parse.mly"
      (Ast.cmd list)
# 200 "parse.ml"
)

and ('s, 'r) _menhir_cell1_expression = 
  | MenhirCell1_expression of 's * ('s, 'r) _menhir_state * (
# 20 "parse.mly"
      (Ast.expr)
# 207 "parse.ml"
)

and ('s, 'r) _menhir_cell1_ATOM = 
  | MenhirCell1_ATOM of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_COMP_OP = 
  | MenhirCell0_COMP_OP of 's * (
# 8 "parse.mly"
      (string)
# 217 "parse.ml"
)

and ('s, 'r) _menhir_cell1_IDENTIFIER = 
  | MenhirCell1_IDENTIFIER of 's * ('s, 'r) _menhir_state * (
# 12 "parse.mly"
       (string)
# 224 "parse.ml"
)

and 's _menhir_cell0_IDENTIFIER = 
  | MenhirCell0_IDENTIFIER of 's * (
# 12 "parse.mly"
       (string)
# 231 "parse.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LEFT_CURLY = 
  | MenhirCell1_LEFT_CURLY of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LEFT_PAREN = 
  | MenhirCell1_LEFT_PAREN of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_PLUS_MINUS = 
  | MenhirCell0_PLUS_MINUS of 's * (
# 9 "parse.mly"
      (char)
# 247 "parse.ml"
)

and ('s, 'r) _menhir_cell1_PROC = 
  | MenhirCell1_PROC of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_TIMES_BY = 
  | MenhirCell0_TIMES_BY of 's * (
# 9 "parse.mly"
      (char)
# 257 "parse.ml"
)

and ('s, 'r) _menhir_cell1_WHILE = 
  | MenhirCell1_WHILE of 's * ('s, 'r) _menhir_state

and _menhir_box_program = 
  | MenhirBox_program of (
# 15 "parse.mly"
      (Ast.cmd list)
# 267 "parse.ml"
) [@@unboxed]

let _menhir_action_01 =
  fun cs ->
    (
# 74 "parse.mly"
                                                                    ( cs )
# 275 "parse.ml"
     : (
# 18 "parse.mly"
      (Ast.cmd list)
# 279 "parse.ml"
    ))

let _menhir_action_02 =
  fun () ->
    (
# 67 "parse.mly"
                                                                    ( True )
# 287 "parse.ml"
     : (
# 17 "parse.mly"
      (bln)
# 291 "parse.ml"
    ))

let _menhir_action_03 =
  fun () ->
    (
# 68 "parse.mly"
                                                                    ( False )
# 299 "parse.ml"
     : (
# 17 "parse.mly"
      (bln)
# 303 "parse.ml"
    ))

let _menhir_action_04 =
  fun e1 e2 op ->
    (
# 69 "parse.mly"
                                                                    ( BoolExpr (op, e1, e2) )
# 311 "parse.ml"
     : (
# 17 "parse.mly"
      (bln)
# 315 "parse.ml"
    ))

let _menhir_action_05 =
  fun b ->
    (
# 70 "parse.mly"
                                                                    ( b )
# 323 "parse.ml"
     : (
# 17 "parse.mly"
      (bln)
# 327 "parse.ml"
    ))

let _menhir_action_06 =
  fun id ->
    (
# 43 "parse.mly"
                                                                    ( [Decl (Id id)] )
# 335 "parse.ml"
     : (
# 19 "parse.mly"
      (Ast.cmd list)
# 339 "parse.ml"
    ))

let _menhir_action_07 =
  fun expr id ->
    (
# 44 "parse.mly"
                                                                    ( [Asmt (Id id, expr)] )
# 347 "parse.ml"
     : (
# 19 "parse.mly"
      (Ast.cmd list)
# 351 "parse.ml"
    ))

let _menhir_action_08 =
  fun e1 e2 ->
    (
# 45 "parse.mly"
                                                                    ( [ProcCall (e1, e2)] )
# 359 "parse.ml"
     : (
# 19 "parse.mly"
      (Ast.cmd list)
# 363 "parse.ml"
    ))

let _menhir_action_09 =
  fun e1 e2 e3 ->
    (
# 46 "parse.mly"
                                                                    ( [FieldAsmt (e1, e2, e3)] )
# 371 "parse.ml"
     : (
# 19 "parse.mly"
      (Ast.cmd list)
# 375 "parse.ml"
    ))

let _menhir_action_10 =
  fun id ->
    (
# 47 "parse.mly"
                                                                    ( [Malloc (Id id)] )
# 383 "parse.ml"
     : (
# 19 "parse.mly"
      (Ast.cmd list)
# 387 "parse.ml"
    ))

let _menhir_action_11 =
  fun () ->
    (
# 48 "parse.mly"
                                                                    ( [Skip] )
# 395 "parse.ml"
     : (
# 19 "parse.mly"
      (Ast.cmd list)
# 399 "parse.ml"
    ))

let _menhir_action_12 =
  fun b ->
    (
# 49 "parse.mly"
                                                                    ( [Block b] )
# 407 "parse.ml"
     : (
# 19 "parse.mly"
      (Ast.cmd list)
# 411 "parse.ml"
    ))

let _menhir_action_13 =
  fun c1 c2 ->
    (
# 50 "parse.mly"
                                                                    ( [Parallel (c1, c2)] )
# 419 "parse.ml"
     : (
# 19 "parse.mly"
      (Ast.cmd list)
# 423 "parse.ml"
    ))

let _menhir_action_14 =
  fun c ->
    (
# 51 "parse.mly"
                                                                    ( [Atom (c)] )
# 431 "parse.ml"
     : (
# 19 "parse.mly"
      (Ast.cmd list)
# 435 "parse.ml"
    ))

let _menhir_action_15 =
  fun ie ->
    (
# 52 "parse.mly"
                                                                    ( [ie] )
# 443 "parse.ml"
     : (
# 19 "parse.mly"
      (Ast.cmd list)
# 447 "parse.ml"
    ))

let _menhir_action_16 =
  fun l ->
    (
# 53 "parse.mly"
                                                                    ( [l] )
# 455 "parse.ml"
     : (
# 19 "parse.mly"
      (Ast.cmd list)
# 459 "parse.ml"
    ))

let _menhir_action_17 =
  fun c1s c2s ->
    (
# 37 "parse.mly"
                                                                    ( (c1s@c2s) )
# 467 "parse.ml"
     : (
# 18 "parse.mly"
      (Ast.cmd list)
# 471 "parse.ml"
    ))

let _menhir_action_18 =
  fun c ->
    (
# 38 "parse.mly"
                                                                    ( c )
# 479 "parse.ml"
     : (
# 18 "parse.mly"
      (Ast.cmd list)
# 483 "parse.ml"
    ))

let _menhir_action_19 =
  fun c ->
    (
# 39 "parse.mly"
                                                                    ( c )
# 491 "parse.ml"
     : (
# 18 "parse.mly"
      (Ast.cmd list)
# 495 "parse.ml"
    ))

let _menhir_action_20 =
  fun () ->
    (
# 56 "parse.mly"
                                                                    ( Null )
# 503 "parse.ml"
     : (
# 20 "parse.mly"
      (Ast.expr)
# 507 "parse.ml"
    ))

let _menhir_action_21 =
  fun arg b ->
    (
# 57 "parse.mly"
                                                                    ( Proc (Id arg, b) )
# 515 "parse.ml"
     : (
# 20 "parse.mly"
      (Ast.expr)
# 519 "parse.ml"
    ))

let _menhir_action_22 =
  fun id ->
    (
# 58 "parse.mly"
                                                                    ( Id id )
# 527 "parse.ml"
     : (
# 20 "parse.mly"
      (Ast.expr)
# 531 "parse.ml"
    ))

let _menhir_action_23 =
  fun f ->
    (
# 59 "parse.mly"
                                                                    ( Field f )
# 539 "parse.ml"
     : (
# 20 "parse.mly"
      (Ast.expr)
# 543 "parse.ml"
    ))

let _menhir_action_24 =
  fun e1 e2 ->
    (
# 60 "parse.mly"
                                                                    ( LocExpr (e1, e2) )
# 551 "parse.ml"
     : (
# 20 "parse.mly"
      (Ast.expr)
# 555 "parse.ml"
    ))

let _menhir_action_25 =
  fun i ->
    (
# 61 "parse.mly"
                                                                    ( Int i )
# 563 "parse.ml"
     : (
# 20 "parse.mly"
      (Ast.expr)
# 567 "parse.ml"
    ))

let _menhir_action_26 =
  fun e ->
    (
# 62 "parse.mly"
                                                                    ( e )
# 575 "parse.ml"
     : (
# 20 "parse.mly"
      (Ast.expr)
# 579 "parse.ml"
    ))

let _menhir_action_27 =
  fun e1 e2 op ->
    (
# 63 "parse.mly"
                                                                    ( ArithExpr (op, e1, e2) )
# 587 "parse.ml"
     : (
# 20 "parse.mly"
      (Ast.expr)
# 591 "parse.ml"
    ))

let _menhir_action_28 =
  fun e1 e2 op ->
    (
# 64 "parse.mly"
                                                                    ( ArithExpr (op, e1, e2) )
# 599 "parse.ml"
     : (
# 20 "parse.mly"
      (Ast.expr)
# 603 "parse.ml"
    ))

let _menhir_action_29 =
  fun b b1 b2 ->
    (
# 77 "parse.mly"
                                                                    ( IfElse (b, b1, b2) )
# 611 "parse.ml"
     : (
# 16 "parse.mly"
      (Ast.cmd)
# 615 "parse.ml"
    ))

let _menhir_action_30 =
  fun b b1 ->
    (
# 80 "parse.mly"
                                                                    ( Loop (b, b1) )
# 623 "parse.ml"
     : (
# 16 "parse.mly"
      (Ast.cmd)
# 627 "parse.ml"
    ))

let _menhir_action_31 =
  fun cs ->
    (
# 34 "parse.mly"
                                                                    ( cs )
# 635 "parse.ml"
     : (
# 15 "parse.mly"
      (Ast.cmd list)
# 639 "parse.ml"
    ))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ASSIGN ->
        "ASSIGN"
    | ATOM ->
        "ATOM"
    | COLON ->
        "COLON"
    | COMP_OP _ ->
        "COMP_OP"
    | DOT ->
        "DOT"
    | ELSE ->
        "ELSE"
    | EOL ->
        "EOL"
    | FALSE ->
        "FALSE"
    | FIELD _ ->
        "FIELD"
    | IDENTIFIER _ ->
        "IDENTIFIER"
    | IF ->
        "IF"
    | INTEGER _ ->
        "INTEGER"
    | LEFT_CURLY ->
        "LEFT_CURLY"
    | LEFT_PAREN ->
        "LEFT_PAREN"
    | MALLOC ->
        "MALLOC"
    | NULL ->
        "NULL"
    | PARALLEL ->
        "PARALLEL"
    | PLUS_MINUS _ ->
        "PLUS_MINUS"
    | PROC ->
        "PROC"
    | RIGHT_CURLY ->
        "RIGHT_CURLY"
    | RIGHT_PAREN ->
        "RIGHT_PAREN"
    | SEMICOLON ->
        "SEMICOLON"
    | SKIP ->
        "SKIP"
    | TIMES_BY _ ->
        "TIMES_BY"
    | TRUE ->
        "TRUE"
    | VAR ->
        "VAR"
    | WHILE ->
        "WHILE"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_68 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOL ->
          let cs = _v in
          let _v = _menhir_action_31 cs in
          MenhirBox_program _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_WHILE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_65 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_20 () in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | LEFT_PAREN ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_25 i in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let id = _v in
          let _v = _menhir_action_22 id in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let f = _v in
          let _v = _menhir_action_23 f in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_65 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_65 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_WHILE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_boolean (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LEFT_CURLY ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState65
      | _ ->
          _eRR ()
  
  and _menhir_run_06 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LEFT_CURLY (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | VAR ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | SKIP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_11 () in
          _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06 _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_20 () in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06 _tok
      | MALLOC ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | LEFT_PAREN ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | LEFT_CURLY ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_25 i in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06 _tok
      | IF ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | IDENTIFIER _v ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let f = _v in
          let _v = _menhir_action_23 f in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06 _tok
      | ATOM ->
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let id = _v in
          let _v = _menhir_action_06 id in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_command : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_58 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | VAR ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | SKIP ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_11 () in
              _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState59 _tok
          | PROC ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | NULL ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_20 () in
              _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState59 _tok
          | MALLOC ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | LEFT_PAREN ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | LEFT_CURLY ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | INTEGER _v_2 ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_2 in
              let _v = _menhir_action_25 i in
              _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState59 _tok
          | IF ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | IDENTIFIER _v_4 ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState59
          | FIELD _v_5 ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let f = _v_5 in
              let _v = _menhir_action_23 f in
              _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState59 _tok
          | ATOM ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | EOL | RIGHT_CURLY ->
              let c = _v in
              let _v = _menhir_action_19 c in
              _menhir_goto_commands _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | EOL | RIGHT_CURLY ->
          let c = _v in
          let _v = _menhir_action_18 c in
          _menhir_goto_commands _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PROC (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENTIFIER _v ->
          let _menhir_stack = MenhirCell0_IDENTIFIER (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LEFT_CURLY ->
                  _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_48 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES_BY _v_0 ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | PLUS_MINUS _v_1 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
      | LEFT_PAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PROC ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_20 () in
              _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState49 _tok
          | LEFT_PAREN ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | INTEGER _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_3 in
              let _v = _menhir_action_25 i in
              _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState49 _tok
          | IDENTIFIER _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let id = _v_5 in
              let _v = _menhir_action_22 id in
              _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState49 _tok
          | FIELD _v_7 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let f = _v_7 in
              let _v = _menhir_action_23 f in
              _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState49 _tok
          | _ ->
              _eRR ())
      | DOT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PROC ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState52
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_20 () in
              _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState52 _tok
          | LEFT_PAREN ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState52
          | INTEGER _v_10 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_10 in
              let _v = _menhir_action_25 i in
              _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState52 _tok
          | IDENTIFIER _v_12 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let id = _v_12 in
              let _v = _menhir_action_22 id in
              _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState52 _tok
          | FIELD _v_14 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let f = _v_14 in
              let _v = _menhir_action_23 f in
              _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState52 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_20 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _menhir_stack = MenhirCell0_TIMES_BY (_menhir_stack, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_20 () in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState20 _tok
      | LEFT_PAREN ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
      | INTEGER _v_1 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v_1 in
          let _v = _menhir_action_25 i in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState20 _tok
      | IDENTIFIER _v_3 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let id = _v_3 in
          let _v = _menhir_action_22 id in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState20 _tok
      | FIELD _v_5 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let f = _v_5 in
          let _v = _menhir_action_23 f in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState20 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_21 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expression _menhir_cell0_TIMES_BY as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ASSIGN | COMP_OP _ | EOL | LEFT_CURLY | LEFT_PAREN | PLUS_MINUS _ | RIGHT_CURLY | RIGHT_PAREN | SEMICOLON | TIMES_BY _ ->
          let MenhirCell0_TIMES_BY (_menhir_stack, op) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_28 e1 e2 op in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_22 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_20 () in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LEFT_PAREN ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_25 i in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let id = _v in
          let _v = _menhir_action_22 id in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let f = _v in
          let _v = _menhir_action_23 f in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_23 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
      let e2 = _v in
      let _v = _menhir_action_24 e1 e2 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState54 ->
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState52 ->
          _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState49 ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState59 ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState06 ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState41 ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState01 ->
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState27 ->
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState31 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState28 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState25 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState20 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState15 ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_55 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_cell1_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES_BY _v_0 ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | PLUS_MINUS _v_1 ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOL | RIGHT_CURLY | SEMICOLON ->
          let MenhirCell1_expression (_menhir_stack, _, e2) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e3 = _v in
          let _v = _menhir_action_09 e1 e2 e3 in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_25 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _menhir_stack = MenhirCell0_PLUS_MINUS (_menhir_stack, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_20 () in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
      | LEFT_PAREN ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
      | INTEGER _v_1 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v_1 in
          let _v = _menhir_action_25 i in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
      | IDENTIFIER _v_3 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let id = _v_3 in
          let _v = _menhir_action_22 id in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
      | FIELD _v_5 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let f = _v_5 in
          let _v = _menhir_action_23 f in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_26 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expression _menhir_cell0_PLUS_MINUS as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES_BY _v_0 ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ASSIGN | COMP_OP _ | EOL | LEFT_CURLY | LEFT_PAREN | PLUS_MINUS _ | RIGHT_CURLY | RIGHT_PAREN | SEMICOLON ->
          let MenhirCell0_PLUS_MINUS (_menhir_stack, op) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_27 e1 e2 op in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_15 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_20 () in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState15 _tok
      | LEFT_PAREN ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_25 i in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState15 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let id = _v in
          let _v = _menhir_action_22 id in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState15 _tok
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let f = _v in
          let _v = _menhir_action_23 f in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState15 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_19 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES_BY _v_0 ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | RIGHT_PAREN ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS_MINUS _v_1 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
      | DOT ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_24 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_PAREN, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_expression (_menhir_stack, _, e) = _menhir_stack in
      let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_26 e in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_53 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ASSIGN ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PROC ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState54
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_20 () in
              _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState54 _tok
          | LEFT_PAREN ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState54
          | INTEGER _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_1 in
              let _v = _menhir_action_25 i in
              _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState54 _tok
          | IDENTIFIER _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let id = _v_3 in
              let _v = _menhir_action_22 id in
              _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState54 _tok
          | FIELD _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let f = _v_5 in
              let _v = _menhir_action_23 f in
              _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState54 _tok
          | _ ->
              _eRR ())
      | DOT | LEFT_PAREN | PLUS_MINUS _ | TIMES_BY _ ->
          let MenhirCell1_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_24 e1 e2 in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_50 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES_BY _v_0 ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | RIGHT_PAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_08 e1 e2 in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PLUS_MINUS _v_1 ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_42 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_IDENTIFIER as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES_BY _v_0 ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | PLUS_MINUS _v_1 ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOL | RIGHT_CURLY | SEMICOLON ->
          let MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, id) = _menhir_stack in
          let expr = _v in
          let _v = _menhir_action_07 expr id in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_35 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES_BY _v_0 ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | PLUS_MINUS _v_1 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
      | DOT ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMP_OP _v_2 ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2
      | _ ->
          _eRR ()
  
  and _menhir_run_31 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _menhir_stack = MenhirCell0_COMP_OP (_menhir_stack, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState31
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_20 () in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState31 _tok
      | LEFT_PAREN ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState31
      | INTEGER _v_1 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v_1 in
          let _v = _menhir_action_25 i in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState31 _tok
      | IDENTIFIER _v_3 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let id = _v_3 in
          let _v = _menhir_action_22 id in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState31 _tok
      | FIELD _v_5 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let f = _v_5 in
          let _v = _menhir_action_23 f in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState31 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_32 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expression _menhir_cell0_COMP_OP as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES_BY _v_0 ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | PLUS_MINUS _v_1 ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEFT_CURLY | RIGHT_PAREN ->
          let MenhirCell0_COMP_OP (_menhir_stack, op) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_04 e1 e2 op in
          _menhir_goto_boolean _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_boolean : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState01 ->
          _menhir_run_65 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState27 ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState28 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_36 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_boolean (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LEFT_CURLY ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | _ ->
          _eRR ()
  
  and _menhir_run_33 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_PAREN -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RIGHT_PAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let b = _v in
          let _v = _menhir_action_05 b in
          _menhir_goto_boolean _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_30 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES_BY _v_0 ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | RIGHT_PAREN ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS_MINUS _v_1 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
      | DOT ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMP_OP _v_2 ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2
      | _ ->
          _eRR ()
  
  and _menhir_run_11 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LEFT_PAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENTIFIER _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RIGHT_PAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let id = _v in
                  let _v = _menhir_action_10 id in
                  _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_27 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState27 _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_20 () in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState27 _tok
      | LEFT_PAREN ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_25 i in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState27 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let id = _v in
          let _v = _menhir_action_22 id in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState27 _tok
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let f = _v in
          let _v = _menhir_action_23 f in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState27 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState27 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_28 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_20 () in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState28 _tok
      | LEFT_PAREN ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_25 i in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState28 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let id = _v in
          let _v = _menhir_action_22 id in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState28 _tok
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let f = _v in
          let _v = _menhir_action_23 f in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState28 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_40 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ASSIGN ->
          let _menhir_stack = MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PROC ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState41
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_20 () in
              _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState41 _tok
          | LEFT_PAREN ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState41
          | INTEGER _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_1 in
              let _v = _menhir_action_25 i in
              _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState41 _tok
          | IDENTIFIER _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let id = _v_3 in
              let _v = _menhir_action_22 id in
              _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState41 _tok
          | FIELD _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let f = _v_5 in
              let _v = _menhir_action_23 f in
              _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState41 _tok
          | _ ->
              _eRR ())
      | DOT | LEFT_PAREN | PLUS_MINUS _ | TIMES_BY _ ->
          let id = _v in
          let _v = _menhir_action_22 id in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_43 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_ATOM (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LEFT_CURLY ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState43
      | _ ->
          _eRR ()
  
  and _menhir_goto_commands : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_68 _menhir_stack _v _tok
      | MenhirState59 ->
          _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState06 ->
          _menhir_run_56 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_60 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_command -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_command (_menhir_stack, _menhir_s, c1s) = _menhir_stack in
      let c2s = _v in
      let _v = _menhir_action_17 c1s c2s in
      _menhir_goto_commands _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_56 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_CURLY -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RIGHT_CURLY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LEFT_CURLY (_menhir_stack, _menhir_s) = _menhir_stack in
          let cs = _v in
          let _v = _menhir_action_01 cs in
          _menhir_goto_block _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_block : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState65 ->
          _menhir_run_66 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState05 ->
          _menhir_run_64 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState62 ->
          _menhir_run_63 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState00 ->
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState06 ->
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState59 ->
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState43 ->
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState38 ->
          _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState36 ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_66 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_WHILE, _menhir_box_program) _menhir_cell1_boolean -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_boolean (_menhir_stack, _, b) = _menhir_stack in
      let MenhirCell1_WHILE (_menhir_stack, _menhir_s) = _menhir_stack in
      let b1 = _v in
      let _v = _menhir_action_30 b b1 in
      let l = _v in
      let _v = _menhir_action_16 l in
      _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_64 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_PROC _menhir_cell0_IDENTIFIER -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_IDENTIFIER (_menhir_stack, arg) = _menhir_stack in
      let MenhirCell1_PROC (_menhir_stack, _menhir_s) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_21 arg b in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_63 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_block -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_block (_menhir_stack, _menhir_s, c1) = _menhir_stack in
      let c2 = _v in
      let _v = _menhir_action_13 c1 c2 in
      _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_61 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PARALLEL ->
          let _menhir_stack = MenhirCell1_block (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LEFT_CURLY ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState62
          | _ ->
              _eRR ())
      | EOL | RIGHT_CURLY | SEMICOLON ->
          let b = _v in
          let _v = _menhir_action_12 b in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_44 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_ATOM -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RIGHT_PAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_ATOM (_menhir_stack, _menhir_s) = _menhir_stack in
          let c = _v in
          let _v = _menhir_action_14 c in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_39 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_cell1_boolean, _menhir_box_program) _menhir_cell1_block -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_block (_menhir_stack, _, b1) = _menhir_stack in
      let MenhirCell1_boolean (_menhir_stack, _, b) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let b2 = _v in
      let _v = _menhir_action_29 b b1 b2 in
      let ie = _v in
      let _v = _menhir_action_15 ie in
      _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_37 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_cell1_boolean as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_block (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LEFT_CURLY ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | VAR ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | SKIP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_11 () in
          _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_20 () in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | MALLOC ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LEFT_PAREN ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LEFT_CURLY ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_25 i in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | IF ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | IDENTIFIER _v ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let f = _v in
          let _v = _menhir_action_23 f in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | ATOM ->
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | _ ->
          _eRR ()
  
end

let program =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_program v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
