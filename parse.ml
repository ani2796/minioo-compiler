
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
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
    | MALLOC
    | LEFT_PAREN
    | LEFT_CURLY
    | INTEGER of (
# 10 "parse.mly"
       (int)
# 27 "parse.ml"
  )
    | IF
    | IDENTIFIER of (
# 9 "parse.mly"
       (string)
# 33 "parse.ml"
  )
    | GREATER
    | FIELD of (
# 9 "parse.mly"
       (string)
# 39 "parse.ml"
  )
    | FALSE
    | EQUALS
    | EOL
    | ELSE
    | COLON
    | ASSIGN
  
end

include MenhirBasics

# 1 "parse.mly"
  
    (* Preamble *)    

# 56 "parse.ml"

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

  | MenhirState14 : (('s, _menhir_box_program) _menhir_cell1_LEFT_PAREN, _menhir_box_program) _menhir_state
    (** State 14.
        Stack shape : LEFT_PAREN.
        Start symbol: program. *)

  | MenhirState20 : (('s, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_state
    (** State 20.
        Stack shape : expression.
        Start symbol: program. *)

  | MenhirState22 : (('s, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_state
    (** State 22.
        Stack shape : IF.
        Start symbol: program. *)

  | MenhirState23 : (('s, _menhir_box_program) _menhir_cell1_LEFT_PAREN, _menhir_box_program) _menhir_state
    (** State 23.
        Stack shape : LEFT_PAREN.
        Start symbol: program. *)

  | MenhirState26 : (('s, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_state
    (** State 26.
        Stack shape : expression.
        Start symbol: program. *)

  | MenhirState28 : (('s, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_state
    (** State 28.
        Stack shape : expression.
        Start symbol: program. *)

  | MenhirState33 : ((('s, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_cell1_boolean, _menhir_box_program) _menhir_state
    (** State 33.
        Stack shape : IF boolean.
        Start symbol: program. *)

  | MenhirState35 : (((('s, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_cell1_boolean, _menhir_box_program) _menhir_cell1_block, _menhir_box_program) _menhir_state
    (** State 35.
        Stack shape : IF boolean block.
        Start symbol: program. *)

  | MenhirState38 : (('s, _menhir_box_program) _menhir_cell1_IDENTIFIER, _menhir_box_program) _menhir_state
    (** State 38.
        Stack shape : IDENTIFIER.
        Start symbol: program. *)

  | MenhirState43 : (('s, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_state
    (** State 43.
        Stack shape : expression.
        Start symbol: program. *)

  | MenhirState49 : (('s, _menhir_box_program) _menhir_cell1_command, _menhir_box_program) _menhir_state
    (** State 49.
        Stack shape : command.
        Start symbol: program. *)

  | MenhirState53 : ((('s, _menhir_box_program) _menhir_cell1_WHILE, _menhir_box_program) _menhir_cell1_boolean, _menhir_box_program) _menhir_state
    (** State 53.
        Stack shape : WHILE boolean.
        Start symbol: program. *)


and ('s, 'r) _menhir_cell1_block = 
  | MenhirCell1_block of 's * ('s, 'r) _menhir_state * (
# 12 "parse.mly"
      (unit)
# 144 "parse.ml"
)

and ('s, 'r) _menhir_cell1_boolean = 
  | MenhirCell1_boolean of 's * ('s, 'r) _menhir_state * (
# 13 "parse.mly"
      (int)
# 151 "parse.ml"
)

and ('s, 'r) _menhir_cell1_command = 
  | MenhirCell1_command of 's * ('s, 'r) _menhir_state * (
# 12 "parse.mly"
      (unit)
# 158 "parse.ml"
)

and ('s, 'r) _menhir_cell1_expression = 
  | MenhirCell1_expression of 's * ('s, 'r) _menhir_state * (
# 13 "parse.mly"
      (int)
# 165 "parse.ml"
)

and ('s, 'r) _menhir_cell1_IDENTIFIER = 
  | MenhirCell1_IDENTIFIER of 's * ('s, 'r) _menhir_state * (
# 9 "parse.mly"
       (string)
# 172 "parse.ml"
)

and 's _menhir_cell0_IDENTIFIER = 
  | MenhirCell0_IDENTIFIER of 's * (
# 9 "parse.mly"
       (string)
# 179 "parse.ml"
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
# 12 "parse.mly"
      (unit)
# 201 "parse.ml"
) [@@unboxed]

let _menhir_action_01 =
  fun () ->
    (
# 59 "parse.mly"
                                        ( print_string ("\nBlock"); () )
# 209 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 213 "parse.ml"
    ))

let _menhir_action_02 =
  fun () ->
    (
# 52 "parse.mly"
                                        ( print_string ("\nBoolean expr: true"); (1) )
# 221 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 225 "parse.ml"
    ))

let _menhir_action_03 =
  fun () ->
    (
# 53 "parse.mly"
                                        ( print_string ("\nBoolean expr: false"); (0) )
# 233 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 237 "parse.ml"
    ))

let _menhir_action_04 =
  fun _1 _3 ->
    (
# 54 "parse.mly"
                                        ( print_string ("\nBoolean expr: " ^ string_of_int(_1) ^ " == " ^ string_of_int(_3)); (_3) )
# 245 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 249 "parse.ml"
    ))

let _menhir_action_05 =
  fun _1 _3 ->
    (
# 55 "parse.mly"
                                        ( print_string ("\nBoolean expr: " ^ string_of_int(_1) ^ " > " ^ string_of_int(_3)); (_3) )
# 257 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 261 "parse.ml"
    ))

let _menhir_action_06 =
  fun _2 ->
    (
# 56 "parse.mly"
                                        ( print_string ("\nBoolean expr: " ^ string_of_int(_2)); (_2) )
# 269 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 273 "parse.ml"
    ))

let _menhir_action_07 =
  fun _2 ->
    (
# 34 "parse.mly"
                                        ( print_string ("\nCommand: var " ^ (_2)); () )
# 281 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 285 "parse.ml"
    ))

let _menhir_action_08 =
  fun _1 _3 ->
    (
# 35 "parse.mly"
                                        ( print_string ("\nCommand: " ^ (_1) ^ " = " ^ string_of_int(_3)); () )
# 293 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 297 "parse.ml"
    ))

let _menhir_action_09 =
  fun _1 _3 ->
    (
# 36 "parse.mly"
                                                    ( print_string ("\nCommand proc call: " ^ string_of_int(_1) ^ "(" ^ string_of_int(_3) ^ (")")); () )
# 305 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 309 "parse.ml"
    ))

let _menhir_action_10 =
  fun _3 ->
    (
# 37 "parse.mly"
                                                    ( print_string ("\nCommand malloc: " ^ (_3)); () )
# 317 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 321 "parse.ml"
    ))

let _menhir_action_11 =
  fun () ->
    (
# 38 "parse.mly"
                                        ( () )
# 329 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 333 "parse.ml"
    ))

let _menhir_action_12 =
  fun () ->
    (
# 39 "parse.mly"
                                        ( () )
# 341 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 345 "parse.ml"
    ))

let _menhir_action_13 =
  fun () ->
    (
# 40 "parse.mly"
                                        ( () )
# 353 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 357 "parse.ml"
    ))

let _menhir_action_14 =
  fun () ->
    (
# 28 "parse.mly"
                                        ( () )
# 365 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 369 "parse.ml"
    ))

let _menhir_action_15 =
  fun () ->
    (
# 29 "parse.mly"
                                        ( () )
# 377 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 381 "parse.ml"
    ))

let _menhir_action_16 =
  fun () ->
    (
# 30 "parse.mly"
                                        ( () )
# 389 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 393 "parse.ml"
    ))

let _menhir_action_17 =
  fun () ->
    (
# 43 "parse.mly"
                                        ( print_string ("\nnull"); (0) )
# 401 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 405 "parse.ml"
    ))

let _menhir_action_18 =
  fun _2 ->
    (
# 44 "parse.mly"
                                        ( print_string ("\nProcedure: " ^ (_2)); (-1) )
# 413 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 417 "parse.ml"
    ))

let _menhir_action_19 =
  fun _1 ->
    (
# 45 "parse.mly"
                                        ( print_string ("\nIdentifier: " ^ (_1)); (1) )
# 425 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 429 "parse.ml"
    ))

let _menhir_action_20 =
  fun _1 ->
    (
# 46 "parse.mly"
                                        ( print_string ("\nField: " ^ (_1)); (2) )
# 437 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 441 "parse.ml"
    ))

let _menhir_action_21 =
  fun _1 ->
    (
# 47 "parse.mly"
                                        ( print_string ("\nInteger: " ^ string_of_int(_1)); (_1) )
# 449 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 453 "parse.ml"
    ))

let _menhir_action_22 =
  fun _2 ->
    (
# 48 "parse.mly"
                                        ( print_string ("\nExpression: " ^ string_of_int(_2)); (_2) )
# 461 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 465 "parse.ml"
    ))

let _menhir_action_23 =
  fun _1 _3 ->
    (
# 49 "parse.mly"
                                        ( print_string ("\nExpression: " ^ string_of_int(_1) ^ " - " ^ string_of_int(_3)); (_3) )
# 473 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 477 "parse.ml"
    ))

let _menhir_action_24 =
  fun () ->
    (
# 64 "parse.mly"
                                        ( print_string ("\nIf else command"); () )
# 485 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 489 "parse.ml"
    ))

let _menhir_action_25 =
  fun () ->
    (
# 67 "parse.mly"
                                        ( print_string ("\nWhile command"); () )
# 497 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 501 "parse.ml"
    ))

let _menhir_action_26 =
  fun () ->
    (
# 25 "parse.mly"
                                        ( () )
# 509 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 513 "parse.ml"
    ))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ASSIGN ->
        "ASSIGN"
    | COLON ->
        "COLON"
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
    | PROC ->
        "PROC"
    | RIGHT_CURLY ->
        "RIGHT_CURLY"
    | RIGHT_PAREN ->
        "RIGHT_PAREN"
    | SEMICOLON ->
        "SEMICOLON"
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
  
  let rec _menhir_run_56 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_program =
    fun _menhir_stack _tok ->
      match (_tok : MenhirBasics.token) with
      | EOL ->
          let _v = _menhir_action_26 () in
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
          _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_17 () in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | LEFT_PAREN ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_21 _1 in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_20 _1 in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_53 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_WHILE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_boolean (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LEFT_CURLY ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState53
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
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_17 () in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06 _tok
      | MALLOC ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | LEFT_PAREN ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | LEFT_CURLY ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_21 _1 in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06 _tok
      | IF ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | IDENTIFIER _v ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_20 _1 in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _2 = _v in
          let _v = _menhir_action_07 _2 in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_command : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_48 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | VAR ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | PROC ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | NULL ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_17 () in
              _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState49 _tok
          | MALLOC ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | LEFT_PAREN ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | LEFT_CURLY ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | INTEGER _v_1 ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_1 in
              let _v = _menhir_action_21 _1 in
              _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState49 _tok
          | IF ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | IDENTIFIER _v_3 ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState49
          | FIELD _v_4 ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_4 in
              let _v = _menhir_action_20 _1 in
              _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState49 _tok
          | EOL | RIGHT_CURLY ->
              let _ = _menhir_action_16 () in
              _menhir_goto_commands _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
          | _ ->
              _eRR ())
      | EOL | RIGHT_CURLY ->
          let _ = _menhir_action_15 () in
          _menhir_goto_commands _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
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
  
  and _menhir_run_42 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEFT_PAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PROC ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState43
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_17 () in
              _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState43 _tok
          | LEFT_PAREN ->
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState43
          | INTEGER _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_1 in
              let _v = _menhir_action_21 _1 in
              _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState43 _tok
          | IDENTIFIER _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_3 in
              let _v = _menhir_action_19 _1 in
              _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState43 _tok
          | FIELD _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_5 in
              let _v = _menhir_action_20 _1 in
              _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState43 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_20 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_17 () in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LEFT_PAREN ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_21 _1 in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_20 _1 in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_21 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_23 _1 _3 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState43 ->
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState49 ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState06 ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState38 ->
          _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState01 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState28 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState26 ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState23 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState20 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState14 ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_44 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RIGHT_PAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_09 _1 _3 in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_39 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_IDENTIFIER as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOL | RIGHT_CURLY | SEMICOLON ->
          let MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_08 _1 _3 in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_32 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GREATER ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUALS ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_26 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_17 () in
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState26 _tok
      | LEFT_PAREN ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_21 _1 in
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState26 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState26 _tok
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_20 _1 in
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState26 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_27 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEFT_CURLY | RIGHT_PAREN ->
          let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_05 _1 _3 in
          _menhir_goto_boolean _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_boolean : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState01 ->
          _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState23 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_33 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_boolean (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LEFT_CURLY ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState33
      | _ ->
          _eRR ()
  
  and _menhir_run_30 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_PAREN -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RIGHT_PAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_06 _2 in
          _menhir_goto_boolean _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_14 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState14
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_17 () in
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState14 _tok
      | LEFT_PAREN ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState14
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_21 _1 in
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState14 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState14 _tok
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_20 _1 in
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState14 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_18 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RIGHT_PAREN ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_19 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_PAREN, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_expression (_menhir_stack, _, _2) = _menhir_stack in
      let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_22 _2 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_28 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_17 () in
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState28 _tok
      | LEFT_PAREN ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_21 _1 in
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState28 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState28 _tok
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_20 _1 in
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState28 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_29 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEFT_CURLY | RIGHT_PAREN ->
          let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_04 _1 _3 in
          _menhir_goto_boolean _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_25 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RIGHT_PAREN ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GREATER ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUALS ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
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
                  let _3 = _v in
                  let _v = _menhir_action_10 _3 in
                  _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_22 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_17 () in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
      | LEFT_PAREN ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_21 _1 in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_20 _1 in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_23 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_17 () in
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState23 _tok
      | LEFT_PAREN ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_21 _1 in
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState23 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState23 _tok
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_20 _1 in
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState23 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_37 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ASSIGN ->
          let _menhir_stack = MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PROC ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_17 () in
              _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState38 _tok
          | LEFT_PAREN ->
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
          | INTEGER _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_1 in
              let _v = _menhir_action_21 _1 in
              _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState38 _tok
          | IDENTIFIER _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_3 in
              let _v = _menhir_action_19 _1 in
              _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState38 _tok
          | FIELD _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_5 in
              let _v = _menhir_action_20 _1 in
              _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState38 _tok
          | _ ->
              _eRR ())
      | LEFT_PAREN | MINUS ->
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_commands : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_56 _menhir_stack _tok
      | MenhirState49 ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState06 ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_50 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_command -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_command (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_14 () in
      _menhir_goto_commands _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
  
  and _menhir_run_46 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_CURLY -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      match (_tok : MenhirBasics.token) with
      | RIGHT_CURLY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LEFT_CURLY (_menhir_stack, _menhir_s) = _menhir_stack in
          let _v = _menhir_action_01 () in
          _menhir_goto_block _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_block : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState53 ->
          _menhir_run_54 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState05 ->
          _menhir_run_52 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState00 ->
          _menhir_run_51_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState06 ->
          _menhir_run_51_spec_06 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState49 ->
          _menhir_run_51_spec_49 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState35 ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState33 ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_54 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_WHILE, _menhir_box_program) _menhir_cell1_boolean -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_boolean (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_WHILE (_menhir_stack, _menhir_s) = _menhir_stack in
      let _ = _menhir_action_25 () in
      let _v = _menhir_action_13 () in
      _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_52 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_PROC _menhir_cell0_IDENTIFIER -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell0_IDENTIFIER (_menhir_stack, _2) = _menhir_stack in
      let MenhirCell1_PROC (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_18 _2 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_51_spec_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _v = _menhir_action_11 () in
      _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
  
  and _menhir_run_51_spec_06 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_CURLY -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _v = _menhir_action_11 () in
      _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06 _tok
  
  and _menhir_run_51_spec_49 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_command -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _v = _menhir_action_11 () in
      _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState49 _tok
  
  and _menhir_run_36 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_cell1_boolean, _menhir_box_program) _menhir_cell1_block -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_block (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_boolean (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let _ = _menhir_action_24 () in
      let _v = _menhir_action_12 () in
      _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_34 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_cell1_boolean as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_block (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LEFT_CURLY ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState35
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
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_17 () in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | MALLOC ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LEFT_PAREN ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LEFT_CURLY ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_21 _1 in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | IF ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | IDENTIFIER _v ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | FIELD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_20 _1 in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | _ ->
          _eRR ()
  
end

let program =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_program v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
