
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | VAR
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
# 24 "parse.ml"
  )
    | IDENTIFIER of (
# 9 "parse.mly"
       (string)
# 29 "parse.ml"
  )
    | EOL
    | COLON
    | ASSIGN
  
end

include MenhirBasics

# 1 "parse.mly"
  
    (* Preamble *)    

# 43 "parse.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_program) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: program. *)

  | MenhirState03 : (('s, _menhir_box_program) _menhir_cell1_VAR _menhir_cell0_IDENTIFIER, _menhir_box_program) _menhir_state
    (** State 03.
        Stack shape : VAR IDENTIFIER.
        Start symbol: program. *)

  | MenhirState06 : (('s, _menhir_box_program) _menhir_cell1_PROC _menhir_cell0_IDENTIFIER, _menhir_box_program) _menhir_state
    (** State 06.
        Stack shape : PROC IDENTIFIER.
        Start symbol: program. *)

  | MenhirState07 : (('s, _menhir_box_program) _menhir_cell1_LEFT_CURLY, _menhir_box_program) _menhir_state
    (** State 07.
        Stack shape : LEFT_CURLY.
        Start symbol: program. *)

  | MenhirState09 : (('s, _menhir_box_program) _menhir_cell1_IDENTIFIER, _menhir_box_program) _menhir_state
    (** State 09.
        Stack shape : IDENTIFIER.
        Start symbol: program. *)

  | MenhirState11 : (('s, _menhir_box_program) _menhir_cell1_LEFT_PAREN, _menhir_box_program) _menhir_state
    (** State 11.
        Stack shape : LEFT_PAREN.
        Start symbol: program. *)

  | MenhirState16 : (('s, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_state
    (** State 16.
        Stack shape : expression.
        Start symbol: program. *)

  | MenhirState22 : (('s, _menhir_box_program) _menhir_cell1_command, _menhir_box_program) _menhir_state
    (** State 22.
        Stack shape : command.
        Start symbol: program. *)


and ('s, 'r) _menhir_cell1_command = 
  | MenhirCell1_command of 's * ('s, 'r) _menhir_state * (
# 12 "parse.mly"
      (unit)
# 91 "parse.ml"
)

and ('s, 'r) _menhir_cell1_expression = 
  | MenhirCell1_expression of 's * ('s, 'r) _menhir_state * (
# 13 "parse.mly"
      (int)
# 98 "parse.ml"
)

and ('s, 'r) _menhir_cell1_IDENTIFIER = 
  | MenhirCell1_IDENTIFIER of 's * ('s, 'r) _menhir_state * (
# 9 "parse.mly"
       (string)
# 105 "parse.ml"
)

and 's _menhir_cell0_IDENTIFIER = 
  | MenhirCell0_IDENTIFIER of 's * (
# 9 "parse.mly"
       (string)
# 112 "parse.ml"
)

and ('s, 'r) _menhir_cell1_LEFT_CURLY = 
  | MenhirCell1_LEFT_CURLY of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LEFT_PAREN = 
  | MenhirCell1_LEFT_PAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PROC = 
  | MenhirCell1_PROC of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_VAR = 
  | MenhirCell1_VAR of 's * ('s, 'r) _menhir_state

and _menhir_box_program = 
  | MenhirBox_program of (
# 14 "parse.mly"
      (unit)
# 131 "parse.ml"
) [@@unboxed]

let _menhir_action_01 =
  fun () ->
    (
# 47 "parse.mly"
                                        ( print_string ("\nBlock"); () )
# 139 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 143 "parse.ml"
    ))

let _menhir_action_02 =
  fun _2 ->
    (
# 33 "parse.mly"
                                        ( print_string ("\nCommand: var " ^ (_2)); () )
# 151 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 155 "parse.ml"
    ))

let _menhir_action_03 =
  fun _2 _4 ->
    (
# 34 "parse.mly"
                                        ( print_string ("\nCommand: var " ^ (_2) ^ " = " ^ string_of_int(_4)); () )
# 163 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 167 "parse.ml"
    ))

let _menhir_action_04 =
  fun _1 _3 ->
    (
# 35 "parse.mly"
                                        ( print_string ("\nCommand: " ^ (_1) ^ " = " ^ string_of_int(_3)); () )
# 175 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 179 "parse.ml"
    ))

let _menhir_action_05 =
  fun () ->
    (
# 36 "parse.mly"
                                        ( () )
# 187 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 191 "parse.ml"
    ))

let _menhir_action_06 =
  fun () ->
    (
# 28 "parse.mly"
                                        ( () )
# 199 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 203 "parse.ml"
    ))

let _menhir_action_07 =
  fun () ->
    (
# 29 "parse.mly"
                                        ( () )
# 211 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 215 "parse.ml"
    ))

let _menhir_action_08 =
  fun () ->
    (
# 30 "parse.mly"
                                        ( () )
# 223 "parse.ml"
     : (
# 12 "parse.mly"
      (unit)
# 227 "parse.ml"
    ))

let _menhir_action_09 =
  fun () ->
    (
# 39 "parse.mly"
                                        ( print_string ("\nnull"); (0) )
# 235 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 239 "parse.ml"
    ))

let _menhir_action_10 =
  fun _2 ->
    (
# 40 "parse.mly"
                                        ( print_string ("\nProcedure: " ^ (_2)); (-1) )
# 247 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 251 "parse.ml"
    ))

let _menhir_action_11 =
  fun _1 ->
    (
# 41 "parse.mly"
                                        ( print_string ("\nIdentifier: " ^ (_1)); (1) )
# 259 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 263 "parse.ml"
    ))

let _menhir_action_12 =
  fun _1 ->
    (
# 42 "parse.mly"
                                        ( print_string ("\nInteger: " ^ string_of_int(_1)); (_1) )
# 271 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 275 "parse.ml"
    ))

let _menhir_action_13 =
  fun _2 ->
    (
# 43 "parse.mly"
                                        ( print_string ("\nExpression: " ^ string_of_int(_2)); (_2) )
# 283 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 287 "parse.ml"
    ))

let _menhir_action_14 =
  fun _1 _3 ->
    (
# 44 "parse.mly"
                                        ( print_string ("\nExpression: " ^ string_of_int(_1) ^ " - " ^ string_of_int(_3)); (_3) )
# 295 "parse.ml"
     : (
# 13 "parse.mly"
      (int)
# 299 "parse.ml"
    ))

let _menhir_action_15 =
  fun () ->
    (
# 25 "parse.mly"
                                        ( () )
# 307 "parse.ml"
     : (
# 14 "parse.mly"
      (unit)
# 311 "parse.ml"
    ))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ASSIGN ->
        "ASSIGN"
    | COLON ->
        "COLON"
    | EOL ->
        "EOL"
    | IDENTIFIER _ ->
        "IDENTIFIER"
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
    | VAR ->
        "VAR"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_28 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_program =
    fun _menhir_stack _tok ->
      match (_tok : MenhirBasics.token) with
      | EOL ->
          let _v = _menhir_action_15 () in
          MenhirBox_program _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
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
                  _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
              | NULL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_09 () in
                  _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03 _tok
              | LEFT_PAREN ->
                  _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
              | INTEGER _v_1 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_1 in
                  let _v = _menhir_action_12 _1 in
                  _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03 _tok
              | IDENTIFIER _v_3 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_3 in
                  let _v = _menhir_action_11 _1 in
                  _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03 _tok
              | _ ->
                  _eRR ())
          | EOL | RIGHT_CURLY | SEMICOLON ->
              let _2 = _v in
              let _v = _menhir_action_02 _2 in
              _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
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
                  _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LEFT_CURLY (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | LEFT_CURLY ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | IDENTIFIER _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState07
      | _ ->
          _eRR ()
  
  and _menhir_run_08 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ASSIGN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PROC ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_09 () in
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
          | LEFT_PAREN ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
          | INTEGER _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_1 in
              let _v = _menhir_action_12 _1 in
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
          | IDENTIFIER _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_3 in
              let _v = _menhir_action_11 _1 in
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_18 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_IDENTIFIER as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOL | RIGHT_CURLY | SEMICOLON ->
          let MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_04 _1 _3 in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_16 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PROC ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_09 () in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LEFT_PAREN ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_12 _1 in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_11 _1 in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_14 _1 _3 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState03 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState09 ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState16 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState11 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_26 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_VAR _menhir_cell0_IDENTIFIER as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOL | RIGHT_CURLY | SEMICOLON ->
          let MenhirCell0_IDENTIFIER (_menhir_stack, _2) = _menhir_stack in
          let MenhirCell1_VAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let _4 = _v in
          let _v = _menhir_action_03 _2 _4 in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_command : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_21 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAR ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
          | LEFT_CURLY ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
          | IDENTIFIER _v_0 ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState22
          | EOL | RIGHT_CURLY ->
              let _ = _menhir_action_08 () in
              _menhir_goto_commands _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
          | _ ->
              _eRR ())
      | EOL | RIGHT_CURLY ->
          let _ = _menhir_action_07 () in
          _menhir_goto_commands _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_commands : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_28 _menhir_stack _tok
      | MenhirState22 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState07 ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_23 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_command -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_command (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_06 () in
      _menhir_goto_commands _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
  
  and _menhir_run_19 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_CURLY -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      match (_tok : MenhirBasics.token) with
      | RIGHT_CURLY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LEFT_CURLY (_menhir_stack, _menhir_s) = _menhir_stack in
          let _ = _menhir_action_01 () in
          _menhir_goto_block _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_block : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok ->
      match _menhir_s with
      | MenhirState06 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState00 ->
          _menhir_run_24_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState07 ->
          _menhir_run_24_spec_07 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState22 ->
          _menhir_run_24_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_25 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_PROC _menhir_cell0_IDENTIFIER -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell0_IDENTIFIER (_menhir_stack, _2) = _menhir_stack in
      let MenhirCell1_PROC (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_10 _2 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_24_spec_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _v = _menhir_action_05 () in
      _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
  
  and _menhir_run_24_spec_07 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_CURLY -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _v = _menhir_action_05 () in
      _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState07 _tok
  
  and _menhir_run_24_spec_22 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_command -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _v = _menhir_action_05 () in
      _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
  
  and _menhir_run_14 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RIGHT_PAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_13 _2 in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_11 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PROC ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_09 () in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState11 _tok
      | LEFT_PAREN ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_12 _1 in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState11 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_11 _1 in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState11 _tok
      | _ ->
          _eRR ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LEFT_CURLY ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | IDENTIFIER _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | _ ->
          _eRR ()
  
end

let program =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_program v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
