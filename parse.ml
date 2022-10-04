
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
    | LEFT_PAREN
    | LEFT_CURLY
    | INTEGER of (
# 10 "parse.mly"
       (int)
# 26 "parse.ml"
  )
    | IF
    | IDENTIFIER of (
# 9 "parse.mly"
       (string)
# 32 "parse.ml"
  )
    | GREATER
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

# 50 "parse.ml"

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

  | MenhirState09 : (('s, _menhir_box_program) _menhir_cell1_VAR _menhir_cell0_IDENTIFIER, _menhir_box_program) _menhir_state
    (** State 09.
        Stack shape : VAR IDENTIFIER.
        Start symbol: program. *)

  | MenhirState11 : (('s, _menhir_box_program) _menhir_cell1_LEFT_PAREN, _menhir_box_program) _menhir_state
    (** State 11.
        Stack shape : LEFT_PAREN.
        Start symbol: program. *)

  | MenhirState16 : (('s, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_state
    (** State 16.
        Stack shape : expression.
        Start symbol: program. *)

  | MenhirState19 : (('s, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_state
    (** State 19.
        Stack shape : IF.
        Start symbol: program. *)

  | MenhirState20 : (('s, _menhir_box_program) _menhir_cell1_LEFT_PAREN, _menhir_box_program) _menhir_state
    (** State 20.
        Stack shape : LEFT_PAREN.
        Start symbol: program. *)

  | MenhirState23 : (('s, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_state
    (** State 23.
        Stack shape : expression.
        Start symbol: program. *)

  | MenhirState25 : (('s, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_state
    (** State 25.
        Stack shape : expression.
        Start symbol: program. *)

  | MenhirState30 : ((('s, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_cell1_boolean, _menhir_box_program) _menhir_state
    (** State 30.
        Stack shape : IF boolean.
        Start symbol: program. *)

  | MenhirState32 : (((('s, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_cell1_boolean, _menhir_box_program) _menhir_cell1_block, _menhir_box_program) _menhir_state
    (** State 32.
        Stack shape : IF boolean block.
        Start symbol: program. *)

  | MenhirState35 : (('s, _menhir_box_program) _menhir_cell1_IDENTIFIER, _menhir_box_program) _menhir_state
    (** State 35.
        Stack shape : IDENTIFIER.
        Start symbol: program. *)

  | MenhirState42 : (('s, _menhir_box_program) _menhir_cell1_command, _menhir_box_program) _menhir_state
    (** State 42.
        Stack shape : command.
        Start symbol: program. *)

  | MenhirState46 : ((('s, _menhir_box_program) _menhir_cell1_WHILE, _menhir_box_program) _menhir_cell1_boolean, _menhir_box_program) _menhir_state
    (** State 46.
        Stack shape : WHILE boolean.
        Start symbol: program. *)


and ('s, 'r) _menhir_cell1_block = 
  | MenhirCell1_block of 's * ('s, 'r) _menhir_state * (
# 12 "parse.mly"
      (unit)
# 138 "parse.ml"
)

and ('s, 'r) _menhir_cell1_boolean = 
  | MenhirCell1_boolean of 's * ('s, 'r) _menhir_state * (
# 13 "parse.mly"
      (int)
# 145 "parse.ml"
)

and ('s, 'r) _menhir_cell1_command = 
  | MenhirCell1_command of 's * ('s, 'r) _menhir_state * (
# 12 "parse.mly"
      (unit)
# 152 "parse.ml"
)

and ('s, 'r) _menhir_cell1_expression = 
  | MenhirCell1_expression of 's * ('s, 'r) _menhir_state * (
# 13 "parse.mly"
      (int)
# 159 "parse.ml"
)

and ('s, 'r) _menhir_cell1_IDENTIFIER = 
  | MenhirCell1_IDENTIFIER of 's * ('s, 'r) _menhir_state * (
# 9 "parse.mly"
       (string)
# 166 "parse.ml"
)

and 's _menhir_cell0_IDENTIFIER = 
  | MenhirCell0_IDENTIFIER of 's * (
# 9 "parse.mly"
       (string)
# 173 "parse.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LEFT_CURLY = 
  | MenhirCell1_LEFT_CURLY of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LEFT_PAREN = 
  | MenhirCell1_LEFT_PAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PROC = 
  | MenhirCell1_PROC of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_VAR = 
  | MenhirCell1_VAR of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_WHILE = 
  | MenhirCell1_WHILE of 's * ('s, 'r) _menhir_state

and _menhir_box_program = 
  | MenhirBox_program of (
# 12 "parse.mly"
      (unit)
# 198 "parse.ml"
) [@@unboxed]

let _menhir_action_01 =
  fun () ->
    (
# 56 "parse.mly"
                                        ( print_string ("\nBlock"); () )
# 206 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 210 "parse.ml"
    ))

let _menhir_action_02 =
  fun () ->
    (
# 49 "parse.mly"
                                        ( print_string ("\nBoolean expr: true"); (1) )
# 218 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 222 "parse.ml"
    ))

let _menhir_action_03 =
  fun () ->
    (
# 50 "parse.mly"
                                        ( print_string ("\nBoolean expr: false"); (0) )
# 230 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 234 "parse.ml"
    ))

let _menhir_action_04 =
  fun _1 _3 ->
    (
# 51 "parse.mly"
                                        ( print_string ("\nBoolean expr: " ^ string_of_int(_1) ^ " == " ^ string_of_int(_3)); (_3) )
# 242 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 246 "parse.ml"
    ))

let _menhir_action_05 =
  fun _1 _3 ->
    (
# 52 "parse.mly"
                                        ( print_string ("\nBoolean expr: " ^ string_of_int(_1) ^ " > " ^ string_of_int(_3)); (_3) )
# 254 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 258 "parse.ml"
    ))

let _menhir_action_06 =
  fun _2 ->
    (
# 53 "parse.mly"
                                        ( print_string ("\nBoolean expr: " ^ string_of_int(_2)); (_2) )
# 266 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 270 "parse.ml"
    ))

let _menhir_action_07 =
  fun _2 ->
    (
# 33 "parse.mly"
                                        ( print_string ("\nCommand: var " ^ (_2)); () )
# 278 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 282 "parse.ml"
    ))

let _menhir_action_08 =
  fun _2 _4 ->
    (
# 34 "parse.mly"
                                        ( print_string ("\nCommand: var " ^ (_2) ^ " = " ^ string_of_int(_4)); () )
# 290 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 294 "parse.ml"
    ))

let _menhir_action_09 =
  fun _1 _3 ->
    (
# 35 "parse.mly"
                                        ( print_string ("\nCommand: " ^ (_1) ^ " = " ^ string_of_int(_3)); () )
# 302 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 306 "parse.ml"
    ))

let _menhir_action_10 =
  fun () ->
    (
# 36 "parse.mly"
                                        ( () )
# 314 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 318 "parse.ml"
    ))

let _menhir_action_11 =
  fun () ->
    (
# 37 "parse.mly"
                                        ( () )
# 326 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 330 "parse.ml"
    ))

let _menhir_action_12 =
  fun () ->
    (
# 38 "parse.mly"
                                        ( () )
# 338 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 342 "parse.ml"
    ))

let _menhir_action_13 =
  fun () ->
    (
# 28 "parse.mly"
                                        ( () )
# 350 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 354 "parse.ml"
    ))

let _menhir_action_14 =
  fun () ->
    (
# 29 "parse.mly"
                                        ( () )
# 362 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 366 "parse.ml"
    ))

let _menhir_action_15 =
  fun () ->
    (
# 30 "parse.mly"
                                        ( () )
# 374 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 378 "parse.ml"
    ))

let _menhir_action_16 =
  fun () ->
    (
# 41 "parse.mly"
                                        ( print_string ("\nnull"); (0) )
# 386 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 390 "parse.ml"
    ))

let _menhir_action_17 =
  fun _2 ->
    (
# 42 "parse.mly"
                                        ( print_string ("\nProcedure: " ^ (_2)); (-1) )
# 398 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 402 "parse.ml"
    ))

let _menhir_action_18 =
  fun _1 ->
    (
# 43 "parse.mly"
                                        ( print_string ("\nIdentifier: " ^ (_1)); (1) )
# 410 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 414 "parse.ml"
    ))

let _menhir_action_19 =
  fun _1 ->
    (
# 44 "parse.mly"
                                        ( print_string ("\nInteger: " ^ string_of_int(_1)); (_1) )
# 422 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 426 "parse.ml"
    ))

let _menhir_action_20 =
  fun _2 ->
    (
# 45 "parse.mly"
                                        ( print_string ("\nExpression: " ^ string_of_int(_2)); (_2) )
# 434 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 438 "parse.ml"
    ))

let _menhir_action_21 =
  fun _1 _3 ->
    (
# 46 "parse.mly"
                                        ( print_string ("\nExpression: " ^ string_of_int(_1) ^ " - " ^ string_of_int(_3)); (_3) )
# 446 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 450 "parse.ml"
    ))

let _menhir_action_22 =
  fun () ->
    (
# 59 "parse.mly"
                                        ( print_string ("\nIf else command"); () )
# 458 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 462 "parse.ml"
    ))

let _menhir_action_23 =
  fun () ->
    (
# 62 "parse.mly"
                                        ( print_string ("\nWhile command"); () )
# 470 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 474 "parse.ml"
    ))

let _menhir_action_24 =
  fun () ->
    (
# 25 "parse.mly"
                                        ( () )
# 482 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 486 "parse.ml"
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
  
  let rec _menhir_run_49 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_program =
    fun _menhir_stack _tok ->
      match (_tok : MenhirBasics.token) with
      | EOL ->
          let _v = _menhir_action_24 () in
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
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_16 () in
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | LEFT_PAREN ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_18 _1 in
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_46 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_WHILE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_boolean (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LEFT_CURLY ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
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
      | LEFT_CURLY ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | IF ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | IDENTIFIER _v ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ASSIGN ->
              let _menhir_stack = MenhirCell1_VAR (_menhir_stack, _menhir_s) in
              let _menhir_stack = MenhirCell0_IDENTIFIER (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | PROC ->
                  _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
              | NULL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_16 () in
                  _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
              | LEFT_PAREN ->
                  _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
              | INTEGER _v_1 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_1 in
                  let _v = _menhir_action_19 _1 in
                  _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
              | IDENTIFIER _v_3 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_3 in
                  let _v = _menhir_action_18 _1 in
                  _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
              | _ ->
                  _eRR ())
          | EOL | RIGHT_CURLY | SEMICOLON ->
              let _2 = _v in
              let _v = _menhir_action_07 _2 in
              _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
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
  
  and _menhir_run_18 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_VAR _menhir_cell0_IDENTIFIER as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOL | RIGHT_CURLY | SEMICOLON ->
          let MenhirCell0_IDENTIFIER (_menhir_stack, _2) = _menhir_stack in
          let MenhirCell1_VAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let _4 = _v in
          let _v = _menhir_action_08 _2 _4 in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_16 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_16 () in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LEFT_PAREN ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_18 _1 in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_21 _1 _3 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState35 ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState01 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState19 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState25 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState23 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState20 ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState09 ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState16 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState11 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_36 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_IDENTIFIER as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOL | RIGHT_CURLY | SEMICOLON ->
          let MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_09 _1 _3 in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_command : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_41 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
          | VAR ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
          | LEFT_CURLY ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
          | IF ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
          | IDENTIFIER _v_0 ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState42
          | EOL | RIGHT_CURLY ->
              let _ = _menhir_action_15 () in
              _menhir_goto_commands _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
          | _ ->
              _eRR ())
      | EOL | RIGHT_CURLY ->
          let _ = _menhir_action_14 () in
          _menhir_goto_commands _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_19 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19 _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_16 () in
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19 _tok
      | LEFT_PAREN ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_18 _1 in
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_30 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_boolean (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LEFT_CURLY ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | _ ->
          _eRR ()
  
  and _menhir_run_29 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GREATER ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUALS ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer
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
          let _v = _menhir_action_16 () in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState23 _tok
      | LEFT_PAREN ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState23 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_18 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState23 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_24 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer
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
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState19 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState20 ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_27 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_PAREN -> _ -> _ -> _ -> _ -> _menhir_box_program =
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
  
  and _menhir_run_11 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_16 () in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState11 _tok
      | LEFT_PAREN ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState11 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_18 _1 in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState11 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_14 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RIGHT_PAREN ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_15 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_PAREN, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_expression (_menhir_stack, _, _2) = _menhir_stack in
      let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_20 _2 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_25 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_16 () in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
      | LEFT_PAREN ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_18 _1 in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_26 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEFT_CURLY | RIGHT_PAREN ->
          let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_04 _1 _3 in
          _menhir_goto_boolean _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_20 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_16 () in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState20 _tok
      | LEFT_PAREN ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState20 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_18 _1 in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState20 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_22 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RIGHT_PAREN ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GREATER ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUALS ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_34 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ASSIGN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PROC ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState35
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_16 () in
              _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState35 _tok
          | LEFT_PAREN ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState35
          | INTEGER _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_1 in
              let _v = _menhir_action_19 _1 in
              _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState35 _tok
          | IDENTIFIER _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_3 in
              let _v = _menhir_action_18 _1 in
              _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState35 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_commands : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_49 _menhir_stack _tok
      | MenhirState42 ->
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState06 ->
          _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_43 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_command -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_command (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_13 () in
      _menhir_goto_commands _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
  
  and _menhir_run_39 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_CURLY -> _ -> _ -> _ -> _menhir_box_program =
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
      | MenhirState46 ->
          _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState05 ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState00 ->
          _menhir_run_44_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState06 ->
          _menhir_run_44_spec_06 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState42 ->
          _menhir_run_44_spec_42 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState32 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState30 ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_47 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_WHILE, _menhir_box_program) _menhir_cell1_boolean -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_boolean (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_WHILE (_menhir_stack, _menhir_s) = _menhir_stack in
      let _ = _menhir_action_23 () in
      let _v = _menhir_action_12 () in
      _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_45 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_PROC _menhir_cell0_IDENTIFIER -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell0_IDENTIFIER (_menhir_stack, _2) = _menhir_stack in
      let MenhirCell1_PROC (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_17 _2 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_44_spec_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _v = _menhir_action_10 () in
      _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
  
  and _menhir_run_44_spec_06 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_CURLY -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _v = _menhir_action_10 () in
      _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06 _tok
  
  and _menhir_run_44_spec_42 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_command -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _v = _menhir_action_10 () in
      _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState42 _tok
  
  and _menhir_run_33 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_cell1_boolean, _menhir_box_program) _menhir_cell1_block -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_block (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_boolean (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let _ = _menhir_action_22 () in
      let _v = _menhir_action_11 () in
      _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_31 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_cell1_boolean as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_block (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LEFT_CURLY ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
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
      | LEFT_CURLY ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | IF ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | IDENTIFIER _v ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | _ ->
          _eRR ()
  
end

let program =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_program v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
