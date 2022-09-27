
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | TIMES
    | SEMICOLON
    | RPAREN
    | PLUS
    | NUM of (
# 26 "calculatorYACC.mly"
       ( int )
# 19 "calculatorYACC.ml"
  )
    | MINUS
    | LPAREN
    | IDENT of (
# 25 "calculatorYACC.mly"
       ( string )
# 26 "calculatorYACC.ml"
  )
    | EOL
    | DIV
    | ASSIGN
  
end

include MenhirBasics

# 1 "calculatorYACC.mly"
   (* header *)
    type symbTable = (string * int) list ;;

    let sb = ref([] : symbTable) ;;
    let getvalue x =
        if (List.mem_assoc x !sb) then
            (List.assoc x !sb)
        else
            0;;
    let rec except x l = match l with
        | [] -> []
        | h::t -> if (h = x) then t else h::(except x t)
    let setvalue x v =
        (   print_string (x ^ " = "); print_int (v);
            print_string ";\n"; flush stdout;
            if (List.mem_assoc x !sb) then
                sb := (x, v) :: (except (x, (List.assoc x !sb)) !sb)
            else
                sb := (x, v) :: !sb
        );;

# 58 "calculatorYACC.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_prog) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: prog. *)

  | MenhirState02 : (('s, _menhir_box_prog) _menhir_cell1_MINUS, _menhir_box_prog) _menhir_state
    (** State 02.
        Stack shape : MINUS.
        Start symbol: prog. *)

  | MenhirState03 : (('s, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_state
    (** State 03.
        Stack shape : LPAREN.
        Start symbol: prog. *)

  | MenhirState06 : (('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 06.
        Stack shape : expr.
        Start symbol: prog. *)

  | MenhirState09 : (('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 09.
        Stack shape : expr.
        Start symbol: prog. *)

  | MenhirState11 : (('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 11.
        Stack shape : expr.
        Start symbol: prog. *)

  | MenhirState13 : (('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 13.
        Stack shape : expr.
        Start symbol: prog. *)

  | MenhirState17 : (('s, _menhir_box_prog) _menhir_cell1_IDENT, _menhir_box_prog) _menhir_state
    (** State 17.
        Stack shape : IDENT.
        Start symbol: prog. *)

  | MenhirState24 : (('s, _menhir_box_prog) _menhir_cell1_cmd, _menhir_box_prog) _menhir_state
    (** State 24.
        Stack shape : cmd.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_cmd = 
  | MenhirCell1_cmd of 's * ('s, 'r) _menhir_state * (
# 30 "calculatorYACC.mly"
      (int)
# 111 "calculatorYACC.ml"
)

and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (
# 32 "calculatorYACC.mly"
      (int)
# 118 "calculatorYACC.ml"
)

and ('s, 'r) _menhir_cell1_IDENT = 
  | MenhirCell1_IDENT of 's * ('s, 'r) _menhir_state * (
# 25 "calculatorYACC.mly"
       ( string )
# 125 "calculatorYACC.ml"
)

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_MINUS = 
  | MenhirCell1_MINUS of 's * ('s, 'r) _menhir_state

and _menhir_box_prog = 
  | MenhirBox_prog of (
# 28 "calculatorYACC.mly"
      (unit)
# 138 "calculatorYACC.ml"
) [@@unboxed]

let _menhir_action_01 =
  fun _1 _3 ->
    (
# 51 "calculatorYACC.mly"
                      ( (setvalue _1 _3) ; _3 )
# 146 "calculatorYACC.ml"
     : (
# 31 "calculatorYACC.mly"
      (int)
# 150 "calculatorYACC.ml"
    ))

let _menhir_action_02 =
  fun _1 ->
    (
# 47 "calculatorYACC.mly"
           ( _1 )
# 158 "calculatorYACC.ml"
     : (
# 30 "calculatorYACC.mly"
      (int)
# 162 "calculatorYACC.ml"
    ))

let _menhir_action_03 =
  fun _1 ->
    (
# 48 "calculatorYACC.mly"
           ( _1 )
# 170 "calculatorYACC.ml"
     : (
# 30 "calculatorYACC.mly"
      (int)
# 174 "calculatorYACC.ml"
    ))

let _menhir_action_04 =
  fun _3 ->
    (
# 43 "calculatorYACC.mly"
                       ( _3 )
# 182 "calculatorYACC.ml"
     : (
# 29 "calculatorYACC.mly"
      (int)
# 186 "calculatorYACC.ml"
    ))

let _menhir_action_05 =
  fun _1 ->
    (
# 44 "calculatorYACC.mly"
          ( _1 )
# 194 "calculatorYACC.ml"
     : (
# 29 "calculatorYACC.mly"
      (int)
# 198 "calculatorYACC.ml"
    ))

let _menhir_action_06 =
  fun _1 _3 ->
    (
# 55 "calculatorYACC.mly"
                   ( _1 + _3 )
# 206 "calculatorYACC.ml"
     : (
# 32 "calculatorYACC.mly"
      (int)
# 210 "calculatorYACC.ml"
    ))

let _menhir_action_07 =
  fun _1 _3 ->
    (
# 56 "calculatorYACC.mly"
                      ( _1 - _3 )
# 218 "calculatorYACC.ml"
     : (
# 32 "calculatorYACC.mly"
      (int)
# 222 "calculatorYACC.ml"
    ))

let _menhir_action_08 =
  fun _1 _3 ->
    (
# 57 "calculatorYACC.mly"
                      ( _1 * _3 )
# 230 "calculatorYACC.ml"
     : (
# 32 "calculatorYACC.mly"
      (int)
# 234 "calculatorYACC.ml"
    ))

let _menhir_action_09 =
  fun _1 _3 ->
    (
# 58 "calculatorYACC.mly"
                    ( _1 / _3 )
# 242 "calculatorYACC.ml"
     : (
# 32 "calculatorYACC.mly"
      (int)
# 246 "calculatorYACC.ml"
    ))

let _menhir_action_10 =
  fun _2 ->
    (
# 59 "calculatorYACC.mly"
                              ( - _2 )
# 254 "calculatorYACC.ml"
     : (
# 32 "calculatorYACC.mly"
      (int)
# 258 "calculatorYACC.ml"
    ))

let _menhir_action_11 =
  fun _2 ->
    (
# 60 "calculatorYACC.mly"
                         ( _2 )
# 266 "calculatorYACC.ml"
     : (
# 32 "calculatorYACC.mly"
      (int)
# 270 "calculatorYACC.ml"
    ))

let _menhir_action_12 =
  fun _1 ->
    (
# 61 "calculatorYACC.mly"
            ( (getvalue _1) )
# 278 "calculatorYACC.ml"
     : (
# 32 "calculatorYACC.mly"
      (int)
# 282 "calculatorYACC.ml"
    ))

let _menhir_action_13 =
  fun _1 ->
    (
# 62 "calculatorYACC.mly"
          ( _1 )
# 290 "calculatorYACC.ml"
     : (
# 32 "calculatorYACC.mly"
      (int)
# 294 "calculatorYACC.ml"
    ))

let _menhir_action_14 =
  fun _1 ->
    (
# 40 "calculatorYACC.mly"
             ( print_int _1 ; print_newline(); flush stdout; () )
# 302 "calculatorYACC.ml"
     : (
# 28 "calculatorYACC.mly"
      (unit)
# 306 "calculatorYACC.ml"
    ))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ASSIGN ->
        "ASSIGN"
    | DIV ->
        "DIV"
    | EOL ->
        "EOL"
    | IDENT _ ->
        "IDENT"
    | LPAREN ->
        "LPAREN"
    | MINUS ->
        "MINUS"
    | NUM _ ->
        "NUM"
    | PLUS ->
        "PLUS"
    | RPAREN ->
        "RPAREN"
    | SEMICOLON ->
        "SEMICOLON"
    | TIMES ->
        "TIMES"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_21 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      let _1 = _v in
      let _v = _menhir_action_14 _1 in
      MenhirBox_prog _v
  
  let rec _menhir_goto_cmds : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState24 ->
          _menhir_run_25 _menhir_stack _v
      | MenhirState00 ->
          _menhir_run_21 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_25 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_cmd -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      let MenhirCell1_cmd (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_04 _3 in
      _menhir_goto_cmds _menhir_stack _v _menhir_s
  
  let rec _menhir_run_20 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOL | SEMICOLON ->
          let _1 = _v in
          let _v = _menhir_action_03 _1 in
          _menhir_goto_cmd _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_06 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUM _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_13 _1 in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MINUS ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | LPAREN ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_12 _1 in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_08 _1 _3 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState24 ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState17 ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState02 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState13 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState11 ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState09 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState06 ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState03 ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_18 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOL | SEMICOLON ->
          let MenhirCell1_IDENT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_01 _1 _3 in
          let _1 = _v in
          let _v = _menhir_action_02 _1 in
          _menhir_goto_cmd _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_09 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUM _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_13 _1 in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
      | MINUS ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | LPAREN ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_12 _1 in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOL | MINUS | PLUS | RPAREN | SEMICOLON ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_06 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_11 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUM _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_13 _1 in
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MINUS ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
      | LPAREN ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_12 _1 in
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_12 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_09 _1 _3 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUM _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_13 _1 in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MINUS ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | LPAREN ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_12 _1 in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_15 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_MINUS -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_MINUS (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_10 _2 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUM _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_13 _1 in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03 _tok
      | MINUS ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | LPAREN ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_12 _1 in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_05 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_11 _2 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_13 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUM _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_13 _1 in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13 _tok
      | MINUS ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | LPAREN ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_12 _1 in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_14 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOL | MINUS | PLUS | RPAREN | SEMICOLON ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_07 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_cmd : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_cmd (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NUM _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_0 in
              let _v = _menhir_action_13 _1 in
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState24 _tok
          | MINUS ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
          | LPAREN ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
          | IDENT _v_2 ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState24
          | _ ->
              _eRR ())
      | EOL ->
          let _1 = _v in
          let _v = _menhir_action_05 _1 in
          _menhir_goto_cmds _menhir_stack _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_16 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ASSIGN ->
          let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NUM _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_0 in
              let _v = _menhir_action_13 _1 in
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
          | MINUS ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
          | LPAREN ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
          | IDENT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_2 in
              let _v = _menhir_action_12 _1 in
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
          | _ ->
              _eRR ())
      | DIV | EOL | MINUS | PLUS | SEMICOLON | TIMES ->
          let _1 = _v in
          let _v = _menhir_action_12 _1 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUM _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_13 _1 in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | MINUS ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LPAREN ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | IDENT _v ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
