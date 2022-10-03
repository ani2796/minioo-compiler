
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | VAR
    | SEMICOLON
    | MINUS
    | INTEGER of (
# 8 "parse.mly"
       (int)
# 18 "parse.ml"
  )
    | IDENTIFIER of (
# 7 "parse.mly"
       (string)
# 23 "parse.ml"
  )
    | EOL
    | ASSIGN
  
end

include MenhirBasics

# 1 "parse.mly"
  
    (* Preamble *)    

# 36 "parse.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_program) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: program. *)

  | MenhirState03 : (('s, _menhir_box_program) _menhir_cell1_VAR _menhir_cell0_IDENTIFIER, _menhir_box_program) _menhir_state
    (** State 03.
        Stack shape : VAR IDENTIFIER.
        Start symbol: program. *)

  | MenhirState07 : (('s, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_state
    (** State 07.
        Stack shape : expression.
        Start symbol: program. *)

  | MenhirState10 : (('s, _menhir_box_program) _menhir_cell1_IDENTIFIER, _menhir_box_program) _menhir_state
    (** State 10.
        Stack shape : IDENTIFIER.
        Start symbol: program. *)

  | MenhirState16 : (('s, _menhir_box_program) _menhir_cell1_command, _menhir_box_program) _menhir_state
    (** State 16.
        Stack shape : command.
        Start symbol: program. *)


and ('s, 'r) _menhir_cell1_command = 
  | MenhirCell1_command of 's * ('s, 'r) _menhir_state * (
# 9 "parse.mly"
      (unit)
# 69 "parse.ml"
)

and ('s, 'r) _menhir_cell1_expression = 
  | MenhirCell1_expression of 's * ('s, 'r) _menhir_state * (
# 10 "parse.mly"
      (int)
# 76 "parse.ml"
)

and ('s, 'r) _menhir_cell1_IDENTIFIER = 
  | MenhirCell1_IDENTIFIER of 's * ('s, 'r) _menhir_state * (
# 7 "parse.mly"
       (string)
# 83 "parse.ml"
)

and 's _menhir_cell0_IDENTIFIER = 
  | MenhirCell0_IDENTIFIER of 's * (
# 7 "parse.mly"
       (string)
# 90 "parse.ml"
)

and ('s, 'r) _menhir_cell1_VAR = 
  | MenhirCell1_VAR of 's * ('s, 'r) _menhir_state

and _menhir_box_program = 
  | MenhirBox_program of (
# 11 "parse.mly"
      (unit)
# 100 "parse.ml"
) [@@unboxed]

let _menhir_action_01 =
  fun _2 ->
    (
# 26 "parse.mly"
                                        ( print_string ("\nCommand: var " ^ (_2)); () )
# 108 "parse.ml"
     : (
# 9 "parse.mly"
      (unit)
# 112 "parse.ml"
    ))

let _menhir_action_02 =
  fun _2 _4 ->
    (
# 27 "parse.mly"
                                        ( print_string ("\nCommand: var " ^ (_2) ^ " = " ^ string_of_int(_4)); () )
# 120 "parse.ml"
     : (
# 9 "parse.mly"
      (unit)
# 124 "parse.ml"
    ))

let _menhir_action_03 =
  fun _1 _3 ->
    (
# 28 "parse.mly"
                                        ( print_string ("\nCommand: " ^ (_1) ^ " = " ^ string_of_int(_3)); () )
# 132 "parse.ml"
     : (
# 9 "parse.mly"
      (unit)
# 136 "parse.ml"
    ))

let _menhir_action_04 =
  fun () ->
    (
# 21 "parse.mly"
                                        ( () )
# 144 "parse.ml"
     : (
# 9 "parse.mly"
      (unit)
# 148 "parse.ml"
    ))

let _menhir_action_05 =
  fun () ->
    (
# 22 "parse.mly"
                                        ( () )
# 156 "parse.ml"
     : (
# 9 "parse.mly"
      (unit)
# 160 "parse.ml"
    ))

let _menhir_action_06 =
  fun () ->
    (
# 23 "parse.mly"
                                        ( () )
# 168 "parse.ml"
     : (
# 9 "parse.mly"
      (unit)
# 172 "parse.ml"
    ))

let _menhir_action_07 =
  fun _1 ->
    (
# 31 "parse.mly"
                                        ( print_string ("\nIdentifier: " ^ (_1)); (1) )
# 180 "parse.ml"
     : (
# 10 "parse.mly"
      (int)
# 184 "parse.ml"
    ))

let _menhir_action_08 =
  fun _1 ->
    (
# 32 "parse.mly"
                                        ( print_string ("\nInteger: " ^ string_of_int(_1)); (_1) )
# 192 "parse.ml"
     : (
# 10 "parse.mly"
      (int)
# 196 "parse.ml"
    ))

let _menhir_action_09 =
  fun _1 _3 ->
    (
# 33 "parse.mly"
                                        ( print_string ("\nExpression: " ^ string_of_int(_1) ^ " - " ^ string_of_int(_3)); (_3) )
# 204 "parse.ml"
     : (
# 10 "parse.mly"
      (int)
# 208 "parse.ml"
    ))

let _menhir_action_10 =
  fun () ->
    (
# 18 "parse.mly"
                                        ( () )
# 216 "parse.ml"
     : (
# 11 "parse.mly"
      (unit)
# 220 "parse.ml"
    ))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ASSIGN ->
        "ASSIGN"
    | EOL ->
        "EOL"
    | IDENTIFIER _ ->
        "IDENTIFIER"
    | INTEGER _ ->
        "INTEGER"
    | MINUS ->
        "MINUS"
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
  
  let rec _menhir_run_13 : type  ttv_stack. ttv_stack -> _menhir_box_program =
    fun _menhir_stack ->
      let _v = _menhir_action_10 () in
      MenhirBox_program _v
  
  let rec _menhir_goto_commands : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_s ->
      match _menhir_s with
      | MenhirState16 ->
          _menhir_run_17 _menhir_stack
      | MenhirState00 ->
          _menhir_run_13 _menhir_stack
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_17 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_command -> _menhir_box_program =
    fun _menhir_stack ->
      let MenhirCell1_command (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_04 () in
      _menhir_goto_commands _menhir_stack _menhir_s
  
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
              | INTEGER _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_0 in
                  let _v = _menhir_action_08 _1 in
                  _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03 _tok
              | IDENTIFIER _v_2 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_2 in
                  let _v = _menhir_action_07 _1 in
                  _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03 _tok
              | _ ->
                  _eRR ())
          | EOL | SEMICOLON ->
              let _2 = _v in
              let _v = _menhir_action_01 _2 in
              _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_06 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_VAR _menhir_cell0_IDENTIFIER as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOL | SEMICOLON ->
          let MenhirCell0_IDENTIFIER (_menhir_stack, _2) = _menhir_stack in
          let MenhirCell1_VAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let _4 = _v in
          let _v = _menhir_action_02 _2 _4 in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_08 _1 in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_07 _1 in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_08 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_09 _1 _3 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState10 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState07 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState03 ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_11 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_IDENTIFIER as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOL | SEMICOLON ->
          let MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_03 _1 _3 in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_command : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAR ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
          | IDENTIFIER _v_0 ->
              let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState16
          | EOL ->
              let _ = _menhir_action_06 () in
              _menhir_goto_commands _menhir_stack _menhir_s
          | _ ->
              _eRR ())
      | EOL ->
          let _ = _menhir_action_05 () in
          _menhir_goto_commands _menhir_stack _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_09 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ASSIGN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INTEGER _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_0 in
              let _v = _menhir_action_08 _1 in
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState10 _tok
          | IDENTIFIER _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_2 in
              let _v = _menhir_action_07 _1 in
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState10 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | IDENTIFIER _v ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | _ ->
          _eRR ()
  
end

let program =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_program v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
