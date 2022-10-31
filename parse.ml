
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | WHILE
    | VAR
    | TRUE
    | SKIP
    | SEMICOLON
    | RIGHT_PAREN
    | RIGHT_CURLY
    | PROC
    | PARALLEL
    | NULL
    | MINUS
    | MALLOC
    | LEFT_PAREN
    | LEFT_CURLY
    | INTEGER of (
# 12 "parse.mly"
       (int)
# 29 "parse.ml"
  )
    | IF
    | IDENTIFIER of (
# 11 "parse.mly"
       (string)
# 35 "parse.ml"
  )
    | GREATER
    | FIELD of (
# 11 "parse.mly"
       (string)
# 41 "parse.ml"
  )
    | FALSE
    | EQUALS
    | EOL
    | ELSE
    | DOT
    | COLON
    | ATOM
    | ASSIGN
  
end

include MenhirBasics

# 1 "parse.mly"
  
    (* Preamble *)
    open Type;;
    open Ast;;

# 62 "parse.ml"

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

  | MenhirState21 : (('s, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_state
    (** State 21.
        Stack shape : expression.
        Start symbol: program. *)

  | MenhirState23 : (('s, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_state
    (** State 23.
        Stack shape : expression.
        Start symbol: program. *)

  | MenhirState25 : (('s, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_state
    (** State 25.
        Stack shape : IF.
        Start symbol: program. *)

  | MenhirState26 : (('s, _menhir_box_program) _menhir_cell1_LEFT_PAREN, _menhir_box_program) _menhir_state
    (** State 26.
        Stack shape : LEFT_PAREN.
        Start symbol: program. *)

  | MenhirState29 : (('s, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_state
    (** State 29.
        Stack shape : expression.
        Start symbol: program. *)

  | MenhirState31 : (('s, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_state
    (** State 31.
        Stack shape : expression.
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
# 17 "parse.mly"
      (Ast.cmd list)
# 175 "parse.ml"
)

and ('s, 'r) _menhir_cell1_boolean = 
  | MenhirCell1_boolean of 's * ('s, 'r) _menhir_state * (
# 16 "parse.mly"
      (bln)
# 182 "parse.ml"
)

and ('s, 'r) _menhir_cell1_command = 
  | MenhirCell1_command of 's * ('s, 'r) _menhir_state * (
# 18 "parse.mly"
      (Ast.cmd list)
# 189 "parse.ml"
)

and ('s, 'r) _menhir_cell1_expression = 
  | MenhirCell1_expression of 's * ('s, 'r) _menhir_state * (
# 19 "parse.mly"
      (Ast.expr)
# 196 "parse.ml"
)

and ('s, 'r) _menhir_cell1_ATOM = 
  | MenhirCell1_ATOM of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IDENTIFIER = 
  | MenhirCell1_IDENTIFIER of 's * ('s, 'r) _menhir_state * (
# 11 "parse.mly"
       (string)
# 206 "parse.ml"
)

and 's _menhir_cell0_IDENTIFIER = 
  | MenhirCell0_IDENTIFIER of 's * (
# 11 "parse.mly"
       (string)
# 213 "parse.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LEFT_CURLY = 
  | MenhirCell1_LEFT_CURLY of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LEFT_PAREN = 
  | MenhirCell1_LEFT_PAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PROC = 
  | MenhirCell1_PROC of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_WHILE = 
  | MenhirCell1_WHILE of 's * ('s, 'r) _menhir_state

and _menhir_box_program = 
  | MenhirBox_program of (
# 14 "parse.mly"
      (Ast.cmd list)
# 235 "parse.ml"
) [@@unboxed]

let _menhir_action_01 =
  fun cs ->
    (
# 72 "parse.mly"
                                                                    ( cs )
# 243 "parse.ml"
     : (
# 17 "parse.mly"
      (Ast.cmd list)
# 247 "parse.ml"
    ))

let _menhir_action_02 =
  fun () ->
    (
# 64 "parse.mly"
                                                                    ( True )
# 255 "parse.ml"
     : (
# 16 "parse.mly"
      (bln)
# 259 "parse.ml"
    ))

let _menhir_action_03 =
  fun () ->
    (
# 65 "parse.mly"
                                                                    ( False )
# 267 "parse.ml"
     : (
# 16 "parse.mly"
      (bln)
# 271 "parse.ml"
    ))

let _menhir_action_04 =
  fun e1 e2 op ->
    (
# 66 "parse.mly"
                                                                    ( BoolExpr (Equals, e1, e2) )
# 279 "parse.ml"
     : (
# 16 "parse.mly"
      (bln)
# 283 "parse.ml"
    ))

let _menhir_action_05 =
  fun e1 e2 op ->
    (
# 67 "parse.mly"
                                                                    ( BoolExpr (Greater, e1, e2) )
# 291 "parse.ml"
     : (
# 16 "parse.mly"
      (bln)
# 295 "parse.ml"
    ))

let _menhir_action_06 =
  fun b ->
    (
# 68 "parse.mly"
                                                                    ( b )
# 303 "parse.ml"
     : (
# 16 "parse.mly"
      (bln)
# 307 "parse.ml"
    ))

let _menhir_action_07 =
  fun id ->
    (
# 41 "parse.mly"
                                                                    ( [Decl {id;}] )
# 315 "parse.ml"
     : (
# 18 "parse.mly"
      (Ast.cmd list)
# 319 "parse.ml"
    ))

let _menhir_action_08 =
  fun expr id ->
    (
# 42 "parse.mly"
                                                                    ( [Asmt {id=id; value=Ast.str_of_expr(expr);}] )
# 327 "parse.ml"
     : (
# 18 "parse.mly"
      (Ast.cmd list)
# 331 "parse.ml"
    ))

let _menhir_action_09 =
  fun e1 e2 ->
    (
# 43 "parse.mly"
                                                                    ( [ProcCall {id=Ast.str_of_expr(e1); arg=Ast.str_of_expr(e2)}] )
# 339 "parse.ml"
     : (
# 18 "parse.mly"
      (Ast.cmd list)
# 343 "parse.ml"
    ))

let _menhir_action_10 =
  fun e1 e2 e3 ->
    (
# 44 "parse.mly"
                                                                    ( [FieldAsmt {obj=Ast.str_of_expr(e1); field=Ast.str_of_expr(e2); value=Ast.str_of_expr(e3)}] )
# 351 "parse.ml"
     : (
# 18 "parse.mly"
      (Ast.cmd list)
# 355 "parse.ml"
    ))

let _menhir_action_11 =
  fun id ->
    (
# 45 "parse.mly"
                                                                    ( [Malloc {id;}] )
# 363 "parse.ml"
     : (
# 18 "parse.mly"
      (Ast.cmd list)
# 367 "parse.ml"
    ))

let _menhir_action_12 =
  fun () ->
    (
# 46 "parse.mly"
                                                                    ( [Skip] )
# 375 "parse.ml"
     : (
# 18 "parse.mly"
      (Ast.cmd list)
# 379 "parse.ml"
    ))

let _menhir_action_13 =
  fun b ->
    (
# 47 "parse.mly"
                                                                    ( [Block b] )
# 387 "parse.ml"
     : (
# 18 "parse.mly"
      (Ast.cmd list)
# 391 "parse.ml"
    ))

let _menhir_action_14 =
  fun c1 c2 ->
    (
# 48 "parse.mly"
                                                                    ( [Parallel (c1, c2)] )
# 399 "parse.ml"
     : (
# 18 "parse.mly"
      (Ast.cmd list)
# 403 "parse.ml"
    ))

let _menhir_action_15 =
  fun c ->
    (
# 49 "parse.mly"
                                                                    ( [Atom (c)] )
# 411 "parse.ml"
     : (
# 18 "parse.mly"
      (Ast.cmd list)
# 415 "parse.ml"
    ))

let _menhir_action_16 =
  fun ie ->
    (
# 50 "parse.mly"
                                                                    ( [ie] )
# 423 "parse.ml"
     : (
# 18 "parse.mly"
      (Ast.cmd list)
# 427 "parse.ml"
    ))

let _menhir_action_17 =
  fun l ->
    (
# 51 "parse.mly"
                                                                    ( [l] )
# 435 "parse.ml"
     : (
# 18 "parse.mly"
      (Ast.cmd list)
# 439 "parse.ml"
    ))

let _menhir_action_18 =
  fun c1s c2s ->
    (
# 35 "parse.mly"
                                                                    ( (c1s@c2s) )
# 447 "parse.ml"
     : (
# 17 "parse.mly"
      (Ast.cmd list)
# 451 "parse.ml"
    ))

let _menhir_action_19 =
  fun c ->
    (
# 36 "parse.mly"
                                                                    ( c )
# 459 "parse.ml"
     : (
# 17 "parse.mly"
      (Ast.cmd list)
# 463 "parse.ml"
    ))

let _menhir_action_20 =
  fun c ->
    (
# 37 "parse.mly"
                                                                    ( c )
# 471 "parse.ml"
     : (
# 17 "parse.mly"
      (Ast.cmd list)
# 475 "parse.ml"
    ))

let _menhir_action_21 =
  fun () ->
    (
# 54 "parse.mly"
                                                                    ( Null )
# 483 "parse.ml"
     : (
# 19 "parse.mly"
      (Ast.expr)
# 487 "parse.ml"
    ))

let _menhir_action_22 =
  fun arg b ->
    (
# 55 "parse.mly"
                                                                    ( Proc ({arg}, b) )
# 495 "parse.ml"
     : (
# 19 "parse.mly"
      (Ast.expr)
# 499 "parse.ml"
    ))

let _menhir_action_23 =
  fun id ->
    (
# 56 "parse.mly"
                                                                    ( Id {id; value="";} )
# 507 "parse.ml"
     : (
# 19 "parse.mly"
      (Ast.expr)
# 511 "parse.ml"
    ))

let _menhir_action_24 =
  fun f ->
    (
# 57 "parse.mly"
                                                                    ( Field {id=f;} )
# 519 "parse.ml"
     : (
# 19 "parse.mly"
      (Ast.expr)
# 523 "parse.ml"
    ))

let _menhir_action_25 =
  fun e1 e2 ->
    (
# 58 "parse.mly"
                                                                    ( LocExpr ({obj=str_of_expr(e1); field=str_of_expr(e2);}, e1, e2) )
# 531 "parse.ml"
     : (
# 19 "parse.mly"
      (Ast.expr)
# 535 "parse.ml"
    ))

let _menhir_action_26 =
  fun i ->
    (
# 59 "parse.mly"
                                                                    ( Int i )
# 543 "parse.ml"
     : (
# 19 "parse.mly"
      (Ast.expr)
# 547 "parse.ml"
    ))

let _menhir_action_27 =
  fun e ->
    (
# 60 "parse.mly"
                                                                    ( e )
# 555 "parse.ml"
     : (
# 19 "parse.mly"
      (Ast.expr)
# 559 "parse.ml"
    ))

let _menhir_action_28 =
  fun e1 e2 ->
    (
# 61 "parse.mly"
                                                                    ( MinusExpr ({arg1=str_of_expr(e1); arg2=str_of_expr(e2);}, e1, e2) )
# 567 "parse.ml"
     : (
# 19 "parse.mly"
      (Ast.expr)
# 571 "parse.ml"
    ))

let _menhir_action_29 =
  fun b b1 b2 ->
    (
# 75 "parse.mly"
                                                                    ( IfElse (b, b1, b2) )
# 579 "parse.ml"
     : (
# 15 "parse.mly"
      (Ast.cmd)
# 583 "parse.ml"
    ))

let _menhir_action_30 =
  fun b b1 ->
    (
# 78 "parse.mly"
                                                                    ( Loop (b, b1) )
# 591 "parse.ml"
     : (
# 15 "parse.mly"
      (Ast.cmd)
# 595 "parse.ml"
    ))

let _menhir_action_31 =
  fun cs ->
    (
# 32 "parse.mly"
                                                                    ( cs )
# 603 "parse.ml"
     : (
# 14 "parse.mly"
      (Ast.cmd list)
# 607 "parse.ml"
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
    | DOT ->
        "DOT"
    | ELSE ->
        "ELSE"
    | EOL ->
        "EOL"
    | EQUALS ->
        "EQUALS"
    | FALSE ->
        "FALSE"
    | FIELD _ ->
        "FIELD"
    | GREATER ->
        "GREATER"
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
    | MINUS ->
        "MINUS"
    | NULL ->
        "NULL"
    | PARALLEL ->
        "PARALLEL"
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
          let _v = _menhir_action_21 () in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | LEFT_PAREN ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_26 i in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let id = _v in
          let _v = _menhir_action_23 id in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let f = _v in
          let _v = _menhir_action_24 f in
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
          let _v = _menhir_action_12 () in
          _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06 _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_21 () in
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
          let _v = _menhir_action_26 i in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06 _tok
      | IF ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | IDENTIFIER _v ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let f = _v in
          let _v = _menhir_action_24 f in
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
          let _v = _menhir_action_07 id in
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
              let _v = _menhir_action_12 () in
              _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState59 _tok
          | PROC ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | NULL ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_21 () in
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
              let _v = _menhir_action_26 i in
              _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState59 _tok
          | IF ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | IDENTIFIER _v_4 ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState59
          | FIELD _v_5 ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let f = _v_5 in
              let _v = _menhir_action_24 f in
              _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState59 _tok
          | ATOM ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | EOL | RIGHT_CURLY ->
              let c = _v in
              let _v = _menhir_action_20 c in
              _menhir_goto_commands _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | EOL | RIGHT_CURLY ->
          let c = _v in
          let _v = _menhir_action_19 c in
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
      | MINUS ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEFT_PAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PROC ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_21 () in
              _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState49 _tok
          | LEFT_PAREN ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | INTEGER _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_1 in
              let _v = _menhir_action_26 i in
              _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState49 _tok
          | IDENTIFIER _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let id = _v_3 in
              let _v = _menhir_action_23 id in
              _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState49 _tok
          | FIELD _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let f = _v_5 in
              let _v = _menhir_action_24 f in
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
              let _v = _menhir_action_21 () in
              _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState52 _tok
          | LEFT_PAREN ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState52
          | INTEGER _v_8 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_8 in
              let _v = _menhir_action_26 i in
              _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState52 _tok
          | IDENTIFIER _v_10 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let id = _v_10 in
              let _v = _menhir_action_23 id in
              _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState52 _tok
          | FIELD _v_12 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let f = _v_12 in
              let _v = _menhir_action_24 f in
              _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState52 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_21 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_21 () in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState21 _tok
      | LEFT_PAREN ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_26 i in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState21 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let id = _v in
          let _v = _menhir_action_23 id in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState21 _tok
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let f = _v in
          let _v = _menhir_action_24 f in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState21 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_22 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ASSIGN | EOL | EQUALS | GREATER | LEFT_CURLY | LEFT_PAREN | MINUS | RIGHT_CURLY | RIGHT_PAREN | SEMICOLON ->
          let MenhirCell1_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_28 e1 e2 in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_23 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_21 () in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LEFT_PAREN ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_26 i in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let id = _v in
          let _v = _menhir_action_23 id in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let f = _v in
          let _v = _menhir_action_24 f in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_24 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
      let e2 = _v in
      let _v = _menhir_action_25 e1 e2 in
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
      | MenhirState25 ->
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState31 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState29 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState26 ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState23 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState21 ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState15 ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_55 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_cell1_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOL | RIGHT_CURLY | SEMICOLON ->
          let MenhirCell1_expression (_menhir_stack, _, e2) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e3 = _v in
          let _v = _menhir_action_10 e1 e2 e3 in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
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
              let _v = _menhir_action_21 () in
              _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState54 _tok
          | LEFT_PAREN ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState54
          | INTEGER _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_1 in
              let _v = _menhir_action_26 i in
              _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState54 _tok
          | IDENTIFIER _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let id = _v_3 in
              let _v = _menhir_action_23 id in
              _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState54 _tok
          | FIELD _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let f = _v_5 in
              let _v = _menhir_action_24 f in
              _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState54 _tok
          | _ ->
              _eRR ())
      | DOT | LEFT_PAREN | MINUS ->
          let MenhirCell1_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_25 e1 e2 in
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
          let _v = _menhir_action_21 () in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState15 _tok
      | LEFT_PAREN ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_26 i in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState15 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let id = _v in
          let _v = _menhir_action_23 id in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState15 _tok
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let f = _v in
          let _v = _menhir_action_24 f in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState15 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_19 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RIGHT_PAREN ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DOT ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_20 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_PAREN, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_expression (_menhir_stack, _, e) = _menhir_stack in
      let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_27 e in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_50 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RIGHT_PAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_09 e1 e2 in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_42 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_IDENTIFIER as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOL | RIGHT_CURLY | SEMICOLON ->
          let MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, id) = _menhir_stack in
          let expr = _v in
          let _v = _menhir_action_08 expr id in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_35 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GREATER ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUALS ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DOT ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_29 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_21 () in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState29 _tok
      | LEFT_PAREN ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_26 i in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState29 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let id = _v in
          let _v = _menhir_action_23 id in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState29 _tok
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let f = _v in
          let _v = _menhir_action_24 f in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState29 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_30 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEFT_CURLY | RIGHT_PAREN ->
          let MenhirCell1_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let (e2, op) = (_v, ()) in
          let _v = _menhir_action_05 e1 e2 op in
          _menhir_goto_boolean _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_boolean : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState01 ->
          _menhir_run_65 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState25 ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState26 ->
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
          let _v = _menhir_action_06 b in
          _menhir_goto_boolean _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_31 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState31
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_21 () in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState31 _tok
      | LEFT_PAREN ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState31
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_26 i in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState31 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let id = _v in
          let _v = _menhir_action_23 id in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState31 _tok
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let f = _v in
          let _v = _menhir_action_24 f in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState31 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_32 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DOT ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEFT_CURLY | RIGHT_PAREN ->
          let MenhirCell1_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let (e2, op) = (_v, ()) in
          let _v = _menhir_action_04 e1 e2 op in
          _menhir_goto_boolean _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_28 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RIGHT_PAREN ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GREATER ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUALS ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DOT ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer
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
                  let _v = _menhir_action_11 id in
                  _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_25 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_21 () in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
      | LEFT_PAREN ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_26 i in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let id = _v in
          let _v = _menhir_action_23 id in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let f = _v in
          let _v = _menhir_action_24 f in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_26 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_21 () in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState26 _tok
      | LEFT_PAREN ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_26 i in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState26 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let id = _v in
          let _v = _menhir_action_23 id in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState26 _tok
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let f = _v in
          let _v = _menhir_action_24 f in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState26 _tok
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
              let _v = _menhir_action_21 () in
              _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState41 _tok
          | LEFT_PAREN ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState41
          | INTEGER _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_1 in
              let _v = _menhir_action_26 i in
              _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState41 _tok
          | IDENTIFIER _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let id = _v_3 in
              let _v = _menhir_action_23 id in
              _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState41 _tok
          | FIELD _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let f = _v_5 in
              let _v = _menhir_action_24 f in
              _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState41 _tok
          | _ ->
              _eRR ())
      | DOT | LEFT_PAREN | MINUS ->
          let id = _v in
          let _v = _menhir_action_23 id in
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
      let _v = _menhir_action_18 c1s c2s in
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
      let _v = _menhir_action_17 l in
      _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_64 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_PROC _menhir_cell0_IDENTIFIER -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_IDENTIFIER (_menhir_stack, arg) = _menhir_stack in
      let MenhirCell1_PROC (_menhir_stack, _menhir_s) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_22 arg b in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_63 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_block -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_block (_menhir_stack, _menhir_s, c1) = _menhir_stack in
      let c2 = _v in
      let _v = _menhir_action_14 c1 c2 in
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
          let _v = _menhir_action_13 b in
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
          let _v = _menhir_action_15 c in
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
      let _v = _menhir_action_16 ie in
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
          let _v = _menhir_action_12 () in
          _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_21 () in
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
          let _v = _menhir_action_26 i in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | IF ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | IDENTIFIER _v ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let f = _v in
          let _v = _menhir_action_24 f in
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
