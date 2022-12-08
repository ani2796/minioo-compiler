open Stat_sem;;
open Small_steps;;
open Ast;;
open List;;
open Random;;

let rec eval_proc_call (ProcCall (e1, e2)) (stack: stack_sd) (heap: heap_sd) (decls: ((string * (stack_frame_sd)) ref) list) = (
  let v1 = (eval_expr e1 stack heap decls) in match v1 with
  | Closure_Value (prev_stack, arg, cs, prev_decls) -> (
    let (frame, new_heap) = (new_var_stack_frame arg false heap) in
    let new_prev_stack = (push prev_stack frame) in
    let _ = (update_decls prev_decls arg frame) in
    let arg_val = (eval_expr e2 stack heap decls) in
    let new_obj = (get_heap_loc_from_frame frame new_heap) in
    let _ = (set_object_field_on_heap new_obj.obj_id "val" arg_val new_heap) in
    let result_cmds = (eval_ast cs new_prev_stack new_heap) in
    let (final_cmd, result_val, result_stack, result_heap) = (get_final_cmd_state result_cmds) in
    (final_cmd, result_val, stack, result_heap)
  )
  | _ -> (raise (Unexpected "eval_proc_call"))
)

and eval_cmd (c: en_cmd) (stack: stack_sd) (heap: heap_sd) = 
  match c with
  | (En_Cmd (c, decls)) -> (match c with
    | (Decl d) -> ( let (new_cmd, new_stack, new_heap) = (eval_decl c stack heap decls) in 
      (new_cmd, Location_Value Null_Loc, new_stack, new_heap))
    | (Asmt (e1, e2)) -> 
      (* (print_string "Matched assignment"); *)
      (eval_asmt c stack heap decls)
    | (Malloc (e)) ->  
      (eval_malloc c stack heap decls)
    | (FieldAsmt (e1, e2, e3)) -> 
      (eval_field_asmt c stack heap decls)
    | (ProcCall (e1, e2)) -> 
      (eval_proc_call c stack heap decls)
    | _ -> raise (Unexpected ("eval_cmd decl")) )
  | _ -> raise (Unexpected ("eval_cmd decl outer"))


and eval_block (cs: en_cmd list) (stack: stack_sd) (heap: heap_sd) =
  (* Note that stack is the old stack before the block is called - equivalent to block(C) *)
  (* At the top level, we can therefore see the state of the stack, and pass it on *)
  let result_cmds = (eval_ast cs stack heap) in
  (get_final_cmd_state result_cmds)
  

(* Evaluating an enhanced AST *)

(* let _ = (print_state (stack, stack) (heap, heap)) in *)
and eval_ast (ast: en_cmd list) (stack: stack_sd) (heap: heap_sd) = match ast with
| [] -> []
| (c::rem) -> (
  match c with
  | En_Cmd _ -> (
      let result_cmd = (eval_cmd c stack heap) in
      let (new_cmd, new_val, new_stack, new_heap) = result_cmd in
      (* let _ = (print_line ()) in *)
      (* let _ = (print_state (stack, new_stack) (heap, new_heap)) in *)
      result_cmd::(eval_ast rem new_stack new_heap) 
    )
  | En_Block cs -> (
      let result_block = (eval_block cs stack heap) in
      let (new_cmd, new_val, new_stack, new_heap) = result_block in
      result_block::(eval_ast rem stack new_heap) 
    )
  | En_Atom cs -> (
      let result_block = (eval_block cs stack heap) in
      let (new_cmd, new_val, new_stack, new_heap) = result_block in
      result_block::(eval_ast rem stack new_heap) 
    )
  | En_IfElse (b, cs1, cs2, decls) -> (
    let b_val = (eval_bool b stack heap decls) in match b_val with
    | (Bool_Value true) -> (
        let result_true = (eval_block cs1 stack heap) in
        let (new_cmd, new_val, new_stack, new_heap) = result_true in
        result_true::(eval_ast rem stack new_heap)
      )
    | (Bool_Value false) -> (
        let result_false = (eval_block cs1 stack heap) in
        let (new_cmd, new_val, new_stack, new_heap) = result_false in
        result_false::(eval_ast rem stack new_heap)
      )
    | (Bool_Error_Value) -> ([(En_Cmd (Skip, []), Error_Value, stack, heap)])
    )
  | En_Loop (b, cs, decls) -> (
    let b_val = (eval_bool b stack heap decls) in match b_val with
    | (Bool_Value true) -> (
        let (new_cmd, new_val, new_stack, new_heap) = (eval_block cs stack heap) in
        (new_cmd, new_val, new_stack, new_heap)::(eval_ast ast new_stack new_heap)
      )
    | (Bool_Value false) -> (
        (eval_ast rem stack heap)
      )
    | (Bool_Error_Value) -> ([(En_Cmd (Skip, []), Error_Value, stack, heap)])
  )
  | En_Parallel (cs1, cs2) -> (match (cs1, cs2) with
    | ([], c2) ->  (
      let (new_cmd, new_val, new_stack, new_heap) = (eval_block c2 stack heap) in
      (new_cmd, new_val, stack, new_heap)::(eval_ast rem stack new_heap)
    )
    | (c1, []) ->  (
      let (new_cmd, new_val, new_stack, new_heap) = (eval_block c1 stack heap) in
      (new_cmd, new_val, stack, new_heap)::(eval_ast rem stack new_heap)
    )
    | (c1::rem1, c2::rem2) -> (
      let rand_val =  (Random.int 2) in
      if(rand_val = 0) then (      
        let (new_cmd, new_val, new_stack, new_heap) = (eval_cmd c1 stack heap) in
        let rem_parallel = [(En_Parallel (rem1, c2::rem2))] in
        let (final_cmd, result_val, result_stack, result_heap) = (get_final_cmd_state (eval_ast rem_parallel new_stack new_heap)) in
        (final_cmd, result_val, stack, result_heap)::(eval_ast rem stack result_heap)
      ) else (
        let (new_cmd, new_val, new_stack, new_heap) = (eval_cmd c2 stack heap) in
        let rem_parallel = [(En_Parallel (c1::rem1, rem2))] in
        let (final_cmd, result_val, result_stack, result_heap) = (get_final_cmd_state (eval_ast rem_parallel new_stack new_heap)) in
        (final_cmd, result_val, stack, result_heap)::(eval_ast rem stack result_heap)
      )
      )
    )
  )