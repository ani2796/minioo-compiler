
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
    | INPUT of (
# 7 "parse.mly"
       (string)
# 20 "parse.ml"
  )
    | IDENTIFIER of (
# 7 "parse.mly"
       (string)
# 25 "parse.ml"
  )
    | EOL
  
end

include MenhirBasics

# 1 "parse.mly"
  
    (* Preamble *)    

# 37 "parse.ml"

type ('s, 'r) _menhir_state

and _menhir_box_program = 
  | MenhirBox_program of (
# 9 "parse.mly"
      (unit)
# 45 "parse.ml"
) [@@unboxed]

let _menhir_action_1 =
  fun _1 ->
    (
# 15 "parse.mly"
                    ( print_string ("Unidentified: " ^ _1); () )
# 53 "parse.ml"
     : (
# 9 "parse.mly"
      (unit)
# 57 "parse.ml"
    ))

let _menhir_action_2 =
  fun _1 ->
    (
# 16 "parse.mly"
                    ( print_string ("Identifier: " ^ _1); () )
# 65 "parse.ml"
     : (
# 9 "parse.mly"
      (unit)
# 69 "parse.ml"
    ))

let _menhir_action_3 =
  fun _1 ->
    (
# 17 "parse.mly"
                    ( print_string ("Integer: " ^ string_of_int(_1)); () )
# 77 "parse.ml"
     : (
# 9 "parse.mly"
      (unit)
# 81 "parse.ml"
    ))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | EOL ->
        "EOL"
    | IDENTIFIER _ ->
        "IDENTIFIER"
    | INPUT _ ->
        "INPUT"
    | INTEGER _ ->
        "INTEGER"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_goto_program : type  ttv_stack. ttv_stack -> _ -> _menhir_box_program =
    fun _menhir_stack _v ->
      MenhirBox_program _v
  
  let rec _menhir_run_0 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INTEGER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EOL ->
              let _1 = _v in
              let _v = _menhir_action_3 _1 in
              _menhir_goto_program _menhir_stack _v
          | _ ->
              _eRR ())
      | INPUT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EOL ->
              let _1 = _v in
              let _v = _menhir_action_1 _1 in
              _menhir_goto_program _menhir_stack _v
          | _ ->
              _eRR ())
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EOL ->
              let _1 = _v in
              let _v = _menhir_action_2 _1 in
              _menhir_goto_program _menhir_stack _v
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
end

let program =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_program v = _menhir_run_0 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
