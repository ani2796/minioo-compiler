
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | OTHER of (
# 3 "testYACC.mly"
       (string)
# 15 "testYACC.ml"
  )
    | NEWLINE
    | FOO
  
end

include MenhirBasics

type ('s, 'r) _menhir_state = 
  | MenhirState0 : ('s, _menhir_box_prog) _menhir_state
    (** State 0.
        Stack shape : .
        Start symbol: prog. *)

  | MenhirState2 : (('s, _menhir_box_prog) _menhir_cell1_FOO, _menhir_box_prog) _menhir_state
    (** State 2.
        Stack shape : FOO.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_FOO = 
  | MenhirCell1_FOO of 's * ('s, 'r) _menhir_state

and _menhir_box_prog = 
  | MenhirBox_prog of (
# 4 "testYACC.mly"
      (unit)
# 43 "testYACC.ml"
) [@@unboxed]

let _menhir_action_1 =
  fun () ->
    (
# 14 "testYACC.mly"
                    ( print_string "recursing"; () )
# 51 "testYACC.ml"
     : (
# 5 "testYACC.mly"
      (unit)
# 55 "testYACC.ml"
    ))

let _menhir_action_2 =
  fun () ->
    (
# 15 "testYACC.mly"
                ( print_string "final foo"; () )
# 63 "testYACC.ml"
     : (
# 5 "testYACC.mly"
      (unit)
# 67 "testYACC.ml"
    ))

let _menhir_action_3 =
  fun () ->
    (
# 11 "testYACC.mly"
        ()
# 75 "testYACC.ml"
     : (
# 4 "testYACC.mly"
      (unit)
# 79 "testYACC.ml"
    ))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | FOO ->
        "FOO"
    | NEWLINE ->
        "NEWLINE"
    | OTHER _ ->
        "OTHER"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_1 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_FOO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NEWLINE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | FOO ->
              _menhir_run_1 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState2
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let rec _menhir_run_0 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | FOO ->
          _menhir_run_1 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState0
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_0 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 16 "testYACC.mly"
  
# 135 "testYACC.ml"
