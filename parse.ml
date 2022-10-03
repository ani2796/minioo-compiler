
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | SEMICOLON
    | MINUS
    | INTEGER of (
# 8 "parse.mly"
       (int)
# 17 "parse.ml"
  )
    | IDENTIFIER of (
# 7 "parse.mly"
       (string)
# 22 "parse.ml"
  )
    | EOL
  
end

include MenhirBasics

# 1 "parse.mly"
  
    (* Preamble *)    

# 34 "parse.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_program) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: program. *)

  | MenhirState07 : (('s, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_state
    (** State 07.
        Stack shape : expression.
        Start symbol: program. *)

  | MenhirState09 : (('s, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_state
    (** State 09.
        Stack shape : expression.
        Start symbol: program. *)


and ('s, 'r) _menhir_cell1_expression = 
  | MenhirCell1_expression of 's * ('s, 'r) _menhir_state * (
# 10 "parse.mly"
      (int)
# 57 "parse.ml"
)

and _menhir_box_program = 
  | MenhirBox_program of (
# 11 "parse.mly"
      (unit)
# 64 "parse.ml"
) [@@unboxed]

let _menhir_action_1 =
  fun _1 ->
    (
# 24 "parse.mly"
                                    ( print_string ("\nIdentifier: " ^ (_1)); (1) )
# 72 "parse.ml"
     : (
# 10 "parse.mly"
      (int)
# 76 "parse.ml"
    ))

let _menhir_action_2 =
  fun _1 ->
    (
# 25 "parse.mly"
                                    ( print_string ("\nInteger: " ^ string_of_int(_1)); (_1) )
# 84 "parse.ml"
     : (
# 10 "parse.mly"
      (int)
# 88 "parse.ml"
    ))

let _menhir_action_3 =
  fun _1 _3 ->
    (
# 26 "parse.mly"
                                    ( print_string ("\nExpression: " ^ string_of_int(_1) ^ " - " ^ string_of_int(_3)); (_3) )
# 96 "parse.ml"
     : (
# 10 "parse.mly"
      (int)
# 100 "parse.ml"
    ))

let _menhir_action_4 =
  fun _3 ->
    (
# 20 "parse.mly"
                                    ( print_string ("\nExpressions ending in: " ^ string_of_int(_3)); (_3) )
# 108 "parse.ml"
     : (
# 9 "parse.mly"
      (int)
# 112 "parse.ml"
    ))

let _menhir_action_5 =
  fun _1 ->
    (
# 21 "parse.mly"
                                    ( print_string ("\nExpression: " ^ string_of_int(_1)); (_1) )
# 120 "parse.ml"
     : (
# 9 "parse.mly"
      (int)
# 124 "parse.ml"
    ))

let _menhir_action_6 =
  fun () ->
    (
# 17 "parse.mly"
                                    ( () )
# 132 "parse.ml"
     : (
# 11 "parse.mly"
      (unit)
# 136 "parse.ml"
    ))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
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

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_04 : type  ttv_stack. ttv_stack -> _menhir_box_program =
    fun _menhir_stack ->
      let _v = _menhir_action_6 () in
      MenhirBox_program _v
  
  let rec _menhir_goto_expressions : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState07 ->
          _menhir_run_08 _menhir_stack _v
      | MenhirState00 ->
          _menhir_run_04 _menhir_stack
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_08 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _menhir_box_program =
    fun _menhir_stack _v ->
      let MenhirCell1_expression (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_4 _3 in
      _menhir_goto_expressions _menhir_stack _v _menhir_s
  
  let rec _menhir_run_06 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INTEGER _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_0 in
              let _v = _menhir_action_2 _1 in
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState07 _tok
          | IDENTIFIER _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_2 in
              let _v = _menhir_action_1 _1 in
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState07 _tok
          | _ ->
              _eRR ())
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOL ->
          let _1 = _v in
          let _v = _menhir_action_5 _1 in
          _menhir_goto_expressions _menhir_stack _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_09 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_2 _1 in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_1 _1 in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOL | SEMICOLON ->
          let MenhirCell1_expression (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_3 _1 _3 in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState09 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState07 ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_2 _1 in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_1 _1 in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | _ ->
          _eRR ()
  
end

let program =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_program v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
