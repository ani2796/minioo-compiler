
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | ID of (
# 5 "easyYACC.mly"
       ( string )
# 15 "easyYACC.ml"
  )
  
end

include MenhirBasics

# 1 "easyYACC.mly"
  
    open Printf;;

# 26 "easyYACC.ml"

type ('s, 'r) _menhir_state

and _menhir_box_id_start = 
  | MenhirBox_id_start of (
# 7 "easyYACC.mly"
      ( string )
# 34 "easyYACC.ml"
) [@@unboxed]

let _menhir_action_1 =
  fun _1 ->
    (
# 12 "easyYACC.mly"
       ( printf "ID string: %s" _1; _1)
# 42 "easyYACC.ml"
     : (
# 7 "easyYACC.mly"
      ( string )
# 46 "easyYACC.ml"
    ))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ID _ ->
        "ID"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_0 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_id_start =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _1 = _v in
          let _v = _menhir_action_1 _1 in
          MenhirBox_id_start _v
  
end

let id_start =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_id_start v = _menhir_run_0 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 14 "easyYACC.mly"
  
# 83 "easyYACC.ml"
