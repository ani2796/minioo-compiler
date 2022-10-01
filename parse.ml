
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | INPUT of (
# 6 "parse.mly"
       (char)
# 15 "parse.ml"
  )
  
end

include MenhirBasics

# 1 "parse.mly"
  
    (* Preamble *)    

# 26 "parse.ml"

type ('s, 'r) _menhir_state

and _menhir_box_program = 
  | MenhirBox_program of (
# 7 "parse.mly"
      (unit)
# 34 "parse.ml"
) [@@unboxed]

let _menhir_action_1 =
  fun () ->
    (
# 13 "parse.mly"
          ( () )
# 42 "parse.ml"
     : (
# 7 "parse.mly"
      (unit)
# 46 "parse.ml"
    ))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | INPUT _ ->
        "INPUT"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_0 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INPUT _ ->
          let _v = _menhir_action_1 () in
          MenhirBox_program _v
  
end

let program =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_program v = _menhir_run_0 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
