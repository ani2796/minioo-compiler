
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | INTEGER of (
# 8 "parse.mly"
       (int)
# 15 "parse.ml"
  )
    | IDENTIFIER of (
# 7 "parse.mly"
       (string)
# 20 "parse.ml"
  )
    | EOL
  
end

include MenhirBasics

# 1 "parse.mly"
  
    (* Preamble *)    

# 32 "parse.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState0 : ('s, _menhir_box_program) _menhir_state
    (** State 0.
        Stack shape : .
        Start symbol: program. *)

  | MenhirState4 : (('s, _menhir_box_program) _menhir_cell1_ids_or_ints, _menhir_box_program) _menhir_state
    (** State 4.
        Stack shape : ids_or_ints.
        Start symbol: program. *)

  | MenhirState6 : ((('s, _menhir_box_program) _menhir_cell1_ids_or_ints, _menhir_box_program) _menhir_cell1_ids_or_ints, _menhir_box_program) _menhir_state
    (** State 6.
        Stack shape : ids_or_ints ids_or_ints.
        Start symbol: program. *)


and ('s, 'r) _menhir_cell1_ids_or_ints = 
  | MenhirCell1_ids_or_ints of 's * ('s, 'r) _menhir_state * (
# 9 "parse.mly"
      (unit)
# 55 "parse.ml"
)

and _menhir_box_program = 
  | MenhirBox_program of (
# 9 "parse.mly"
      (unit)
# 62 "parse.ml"
) [@@unboxed]

let _menhir_action_1 =
  fun _1 ->
    (
# 18 "parse.mly"
                                ( print_string ("\nIdentifier: " ^ _1); () )
# 70 "parse.ml"
     : (
# 9 "parse.mly"
      (unit)
# 74 "parse.ml"
    ))

let _menhir_action_2 =
  fun _1 ->
    (
# 19 "parse.mly"
                                ( print_string ("\nInteger: " ^ string_of_int(_1)); () )
# 82 "parse.ml"
     : (
# 9 "parse.mly"
      (unit)
# 86 "parse.ml"
    ))

let _menhir_action_3 =
  fun () ->
    (
# 20 "parse.mly"
                                ( () )
# 94 "parse.ml"
     : (
# 9 "parse.mly"
      (unit)
# 98 "parse.ml"
    ))

let _menhir_action_4 =
  fun () ->
    (
# 15 "parse.mly"
                                ( () )
# 106 "parse.ml"
     : (
# 9 "parse.mly"
      (unit)
# 110 "parse.ml"
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

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_4 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | INTEGER _v_0 ->
          let _menhir_stack = MenhirCell1_ids_or_ints (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v_0 in
          let _v = _menhir_action_2 _1 in
          _menhir_run_6 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState4 _tok
      | IDENTIFIER _v_2 ->
          let _menhir_stack = MenhirCell1_ids_or_ints (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v_2 in
          let _v = _menhir_action_1 _1 in
          _menhir_run_6 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState4 _tok
      | EOL ->
          let _v = _menhir_action_4 () in
          MenhirBox_program _v
  
  and _menhir_run_6 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_ids_or_ints as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | INTEGER _v_0 ->
          let _menhir_stack = MenhirCell1_ids_or_ints (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v_0 in
          let _v = _menhir_action_2 _1 in
          _menhir_run_6 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState6 _tok
      | IDENTIFIER _v_2 ->
          let _menhir_stack = MenhirCell1_ids_or_ints (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v_2 in
          let _v = _menhir_action_1 _1 in
          _menhir_run_6 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState6 _tok
      | EOL ->
          let MenhirCell1_ids_or_ints (_menhir_stack, _menhir_s, _) = _menhir_stack in
          let _v = _menhir_action_3 () in
          _menhir_goto_ids_or_ints _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_ids_or_ints : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState6 ->
          _menhir_run_6 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState4 ->
          _menhir_run_6 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState0 ->
          _menhir_run_4 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let rec _menhir_run_0 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_2 _1 in
          _menhir_run_4 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState0 _tok
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_1 _1 in
          _menhir_run_4 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState0 _tok
      | _ ->
          _eRR ()
  
end

let program =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_program v = _menhir_run_0 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
