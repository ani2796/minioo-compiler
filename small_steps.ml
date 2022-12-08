open Stat_sem;;
open Ast;;
open List;;
open Random;;

(* Small step operational semantics *)

(* Stack and heap operations *)

(* Objects are created per variable declaration *)
(* Malloc simply turns the is_object field on *)

let object_counter = ref 0;;

let refresh_object_counter () = 
  (object_counter := 0)

let push (stack: stack_sd) (frame: stack_frame_sd) = ((frame::stack): stack_sd)
let pop (stack: stack_sd) = match stack with
| [] -> Init_Frame
| frame::rest -> frame

(* Incrementing object counter every time a new one is created *)

let incr_object_counter () = (
  (object_counter := !object_counter + 1);
  (* (print_string ("\nNew object counter:" ^ string_of_int(!object_counter) ^ "\n")); *)
  (!object_counter)
)
;;

(* Every time a new object is constructed, it has a new loc that doesn't exist *)

let get_new_object (counter: int) (is_object_val: bool) = {
  obj_id = "obj" ^ (string_of_int counter);
  is_object = is_object_val;
  fields = [("val", (Location_Value Null_Loc))];
}
;;

let new_malloc heap = 
  let counter = (incr_object_counter ()) in 
  let new_obj = (get_new_object counter true) in 
  let new_heap = (new_obj::heap) in
  (new_obj, new_heap)
;;

(* Getting stack frame for new variable declaration *)
let new_var_stack_frame var_id is_object heap = 
  let counter = (incr_object_counter ()) in 
  let new_obj = (get_new_object counter is_object) in 
  let new_heap = (new_obj::heap) in
    (* (print_string ("\nCreating new stack frame for " ^ var_id ^ " with counter: " ^ string_of_int(counter))); *)
    ((Object_Ref (var_id, new_obj.obj_id)), new_heap)

;;

(* Find var field of object *)
let get_object_field (obj: object_sd) (field: string) = 
  let result = (List.assoc_opt field obj.fields) in match result with
  | None -> Error_Value
  | Some value -> value
;;


(* Find object in heap according to loc in stack *)
let rec get_object_from_heap (loc: string) (heap: heap_sd) = match heap with
| [] -> raise (Unexpected ("get_object_from_heap " ^ loc))
| obj::rem -> (
    if(obj.obj_id = loc) then obj
    else (get_object_from_heap loc rem)
)
;;

(* Procedure to set new value for a field *)
let rec set_object_field (fields: ((string * value_sd) list)) (field: string) (new_value: value_sd) = 
  match fields with
  | [] -> [(field, new_value)]
  | ((name, old_value)::rem) -> (
      if(name = field) then ((name, new_value)::rem)
      else ((name, old_value)::(set_object_field rem field new_value))
  )
;;

let rec set_object_field_on_heap (loc: string) (field: string) (value: value_sd) (heap: heap_sd) = match heap with
| [] -> raise (Unexpected ("set_object_on_heap " ^ loc))
| obj::rem -> (
    if(obj.obj_id = loc) then (obj.fields <- (set_object_field obj.fields field value)) 
    else (set_object_field_on_heap loc field value rem)
)
;;

(* Return second value in stack tuple, and subsequently, the object from the heap *)
let get_heap_loc_from_frame (frame: stack_frame_sd) (heap: heap_sd) = 
  match frame with
| Init_Frame -> raise (Unexpected "get_heap_loc_from_frame")
| Object_Ref (id, loc) -> (get_object_from_heap loc heap)
;;

(* Evaluations *)

(* Helper functions to print stack, heap and semantic values *)


let rec print_value (value: value_sd) = match value with
| (Int_Value i) -> (print_string (string_of_int i));
| (Field_Value f) -> (print_string f);
| (Location_Value l) -> (match l with
  | Null_Loc -> (print_string "Null location")
  | (Object_Loc ol) -> (print_object ol));
| (Closure_Value c) -> (
  (print_string "Closure (");
  (print_closure value)
  )

| (Error_Value) -> ()

and print_closure (Closure_Value (stack, arg, cs, decls)) = (
  (print_decls decls 0);
  (print_string "Old stack: ");
  (print_stack stack);
)
and print_decls decls ind = match decls with
| [] -> ()
| (decl)::rem_decls -> match !decl with
  (id, frame) -> (
    (print_string ("decl: " ^ id ^ " "));  
    (print_stack_frame frame);
    (print_decls rem_decls ind);
  )

and print_stack_frame (frame: stack_frame_sd) = match frame with  
| Init_Frame -> (print_string "Uninitialized frame\n")
| Object_Ref (var_id, obj_id) -> (print_string ("id: " ^ var_id ^ " obj: " ^ obj_id ^ "\n"))

and print_stack (stack: stack_sd) = match stack with
| [] -> ()
| el::rem -> (
  (print_stack_frame el);
  (print_stack rem);
)

and print_fields (fields: ((string * value_sd) list)) = match fields with
| [] -> ()
| (field, value)::rem -> (
  (print_string (" (field: " ^ field ^ " value: "));
  (print_value value);
  (print_string " )");
  (print_fields rem);
)

and print_object (obj: object_sd) = (
  (print_string ("( obj_id: " ^ obj.obj_id));
  (print_string (" is_object: " ^ string_of_bool(obj.is_object)));
  (print_fields obj.fields);
  (print_string " )")
)

let rec print_heap (heap: heap_sd) = match heap with
| [] -> ()
| obj::rem -> (
  (print_string (obj.obj_id ^ "\n"));
  (print_object obj);
  (print_string "\n");
  (print_heap rem);
)
;;

let print_state (stack, new_stack) (heap, new_heap) = 
  (* (print_string "\n\nState before command:\n");
  (print_string "Stack start\n");
  (print_stack stack); 
  (print_string "Stack end\n");
  (print_string "\nHeap start\n");
  (print_heap heap);
  (print_string "Heap end\n"); *)
  (print_string "\n\nState after command:\n");
  (print_string "Stack start\n");
  (print_stack new_stack); 
  (print_string "Stack end\n");
  (print_string "\nHeap start\n");
  (print_heap new_heap);
  (print_string "Heap end\n");
;;


let line = ref 1;;

let incr_line () = (line := (!line + 1))
;;

let print_line () = (
  (print_string ("\nprogram line " ^ string_of_int(!line) ^ ":\n"));
  (incr_line ())
)
;;

(* Testing below eval_decl *)
(* 

let stack = [];;
let heap = [];;
let (new_cmd, new_stack, new_heap) = (eval_decl (Decl (Id "x")) stack heap [("x", (ref Init_Frame))]);;
(print_stack new_stack);;
(print_heap new_heap);;
match new_cmd with (cmd, decls) -> (print_decls decls) 

*)


(* Evaluating expressions *)


(* Arithmetic expressions *)
let rec eval_arith_expr ( ArithExpr (arith, e1, e2)) (stack: stack_sd) (heap: heap_sd) (decls: ((string * (stack_frame_sd)) ref) list) = 
  let v1 = (eval_expr e1 stack heap decls) in
  let v2 = (eval_expr e2 stack heap decls) in
  match (v1, v2) with
  | (Int_Value i1, Int_Value i2) -> ( match arith with 
    | '+' -> Int_Value (i1 + i2)
    | '-' -> Int_Value (i1 - i2)
    | '*' -> Int_Value (i1 * i2)
    | '/' -> Int_Value (i1 / i2)
    | _ -> raise (Unexpected "eval_arith_expr") )
  | _ -> Error_Value

(* 
Evaluate procedure declaration to return closure (procedure with stack) 
NOTE: Ignore OCaml warning since only identifiers are possible as the first expr of En_Proc (procedures with symbol tables/decls)
*)
and eval_en_proc (En_Proc ((Id id), en_cs, old_decls)) (stack: stack_sd) (heap: heap_sd) (decls: ((string * (stack_frame_sd)) ref) list) =
(Closure_Value (stack, id, en_cs, old_decls))

and get_stack_frame (id: string) (decls: ((string * (stack_frame_sd)) ref) list) = match decls with
| [] -> raise (Unexpected ("get_stack_frame " ^ id))
| el::rem -> match !el with
  | (decls_id, frame) -> (
    if(decls_id = id) then frame 
    else (get_stack_frame id rem))

(* Evaluating identifiers according to their stack ptr to heap and then heap location *)
and eval_id (id: string) (stack: stack_sd) (heap: heap_sd) (decls: ((string * (stack_frame_sd)) ref) list) =
  (* let _ = (print_state (stack, stack), (heap, heap)) in *)
  (* let _ = (print_decls decls 0) in *)
  let frame = (get_stack_frame id decls) in
  let (_, o_id) = (match frame with
  | (Object_Ref (stack_var, stack_obj)) -> (stack_var, stack_obj)
  | Init_Frame -> raise (Unexpected "eval_id: init frame")
  | _ -> raise (Unexpected "eval_id")
  ) in
  (o_id, (get_heap_loc_from_frame frame heap))

(* 
Evaluating location expressions according to presence of object on stack (definitely there) and    
presence of field in the object (checked in the function) 
*)
and eval_loc_expr (e: expr) (stack: stack_sd) (heap: heap_sd) (decls: ((string * (stack_frame_sd)) ref) list) = match e with
| (LocExpr (e1, e2)) -> (
  let field = (eval_expr e2 stack heap decls) in (* Evaluate second expression to get  *)
  let obj = (eval_expr e1 stack heap decls) in (* Evaluate first expression to get object *)
  (* Note that we get the second expression first because the operator is right associative *)
  match (obj, field) with
  | (Location_Value (Object_Loc o), Field_Value f) -> (get_object_field o f)
  | _ -> Error_Value )
| _ -> raise (Unexpected ("eval_loc_expr " ^ (str_of_expr e)))

(* 
Evaluate any expression to return value in the semantic domain.
Note that identifiers are always returned as objects. It is up to
the discretion of the calling function about what to do with the object value.
*)
and eval_expr (e: expr) (stack: stack_sd) (heap: heap_sd) (decls: ((string * (stack_frame_sd)) ref) list) = 
  let _ = (print_state (stack, stack), (heap, heap)) in
  match e with
  | Field f -> (Field_Value f)
  | Int i -> (Int_Value i)
  | ArithExpr (arith, e1, e2) -> (eval_arith_expr e stack heap decls)
  | Null -> (Location_Value Null_Loc)
  | Proc _ -> raise (Unexpected ("Proc at eval_expr " ^ (str_of_expr e)))
  | En_Proc ((Id id), en_cs, proc_decls) -> (eval_en_proc e stack heap decls)
  | Id id -> let (obj_id, obj) = (eval_id id stack heap decls) in 
      (* if(obj.is_object) then (Location_Value (Object_Loc obj)) else :: If the id is just a plain identifier, always return its "val" *)
      (get_object_field obj "val")
  | LocExpr (e1, e2) -> (eval_loc_expr e stack heap decls)
  | _ -> raise (Unexpected ("LocExpr at eval_expr " ^ (str_of_expr e)))
;;

let rec compare_stacks (s1: stack_sd) (s2: stack_sd) = match (s1, s2) with
| ([], []) -> (Bool_Value true)
| ([], _) -> (Bool_Value false)
| (_, []) -> (Bool_Value false)
| (Object_Ref (id1, obj_id1)::rem1, Object_Ref (id2, obj_id2)::rem2) -> 
    (if((obj_id1 = obj_id2 && id1 = id2)) then (compare_stacks s1 s2)
    else (Bool_Value false))
| _ -> raise (Unexpected (""))

and compare_closures (c1: value_sd) (c2: value_sd) = match (c1, c2) with
| (Closure_Value (s1, arg1, cs1, decls1), Closure_Value (s2, arg2, cs2, decls2)) -> (
    (compare_stacks s1 s2)
)
| _ -> raise (Unexpected ("compare_closures"))
;;

(* Comparing integers *)
let eval_bool_int (op: string) (i1: int) (i2: int) = match op with
| ">" -> (i1 > i2)
| ">=" -> (i1 >= i2)
| "<" -> (i1 < i2)
| "<=" -> (i1 <= i2)
| "==" -> (i1 = i2)
| _ -> raise (Unexpected "eval_bool_int")
;;

(* Evaluating Boolean commands *)
let eval_bool (b: bln) (stack: stack_sd) (heap: heap_sd) (decls: ((string * (stack_frame_sd)) ref) list) = 
match b with
| True -> (Bool_Value true)
| False -> (Bool_Value false)
| BoolExpr (op, e1, e2) -> (
  let b1 = (eval_expr e1 stack heap decls) in
  let b2 = (eval_expr e2 stack heap decls) in
  match (b1, b2) with
  | (Error_Value, _) -> Bool_Error_Value
  | (_, Error_Value) -> Bool_Error_Value
  | (Int_Value i1, Int_Value i2) -> Bool_Value (eval_bool_int op i1 i2)
  (* Trivially, all object comparisons will return false since locations cannot be assigned *)
  | (Location_Value (Object_Loc o1), Location_Value (Object_Loc o2)) -> Bool_Value (o1.obj_id = o2.obj_id)
  (* 
  Closures are equal if their respective stacks are the same, i.e. each stack entry has the 
  same id => the same object reference.
  *)
  | (Closure_Value c1, Closure_Value c2) -> (compare_closures b1 b2)
  | _ -> Bool_Error_Value 
)
;;

(* Evaluating individual commands *)

(*
For a new variable, create a new initialized object on the heap
Push declaration onto stack, and update decls (symbol table) to reflect stack changes
NOTE: Ignore OCaml warning since the only kind of expressions that can appear with `var` are declarations
 *)
let rec update_decls (decls: ((string * (stack_frame_sd)) ref) list) (var: string) (new_frame: stack_frame_sd) = 
  match decls with
| [] -> raise (Unexpected ("update_decls " ^ var))
| el::rem -> match ! el with (decls_var, old_frame) ->
    (if(decls_var = var) then (el := (decls_var, new_frame)) 
    else ((update_decls rem var new_frame)))
;;

(* Evaluating variable declaration - change symbol table reference to newly created object *)
let eval_decl (Decl (Id id)) (stack: stack_sd) (heap: heap_sd) (decls: ((string * (stack_frame_sd)) ref) list) = 
  let var_id = id in
  let (frame, new_heap) = (new_var_stack_frame id false heap) in 
  let new_stack = (push stack frame) in
  let _ = (update_decls decls var_id frame) in
    (En_Cmd(Decl (Id id), decls), new_stack, new_heap)
;;

let eval_field_asmt (FieldAsmt (obj_expr, field_expr, val_expr)) (stack: stack_sd) (heap: heap_sd) (decls: ((string * (stack_frame_sd)) ref) list) = 
  let obj_val = (eval_expr obj_expr stack heap decls) in
  let field_val = (eval_expr field_expr stack heap decls) in 
  let result_val = (
    match (obj_val, field_val) with
    | (Location_Value (Object_Loc o), Field_Value f) -> (
      let val_val = (eval_expr val_expr stack heap decls) in
      (* Set field to appropriate value, return this value as the return value of the command *)
      (set_object_field_on_heap o.obj_id f val_val heap);
      val_val
    )
    | _ -> Error_Value
  ) in
  (En_Cmd (FieldAsmt (obj_expr, field_expr, val_expr), decls), result_val, stack, heap)

(* Evaluating assignment statements of the form: [ x = e ] *)
let eval_asmt (Asmt (e1, e2)) (stack: stack_sd) (heap: heap_sd) (decls: ((string * (stack_frame_sd)) ref) list) = 
  match (e1, e2) with
  | (Id id, _) -> (
    let value = (eval_expr e2 stack heap decls) in 
    match value with
    | Error_Value -> (En_Cmd ((Asmt (e1, e2)), decls), Error_Value, stack, heap)
    | _ -> (
      let frame = (get_stack_frame id decls) in
      let obj = (get_heap_loc_from_frame frame heap) in
      let _ = (set_object_field_on_heap obj.obj_id "val" value heap) in
      (En_Cmd ((Asmt (e1, e2)), decls), value, stack, heap)
))  
  (* Error value returned in case the first expression is not an identifier *)
  | _ -> (En_Cmd ((Asmt (e1, e2)), decls), Error_Value, stack, heap)
;;

let eval_malloc (Malloc (e)) (stack: stack_sd) (heap: heap_sd) (decls: ((string * (stack_frame_sd)) ref) list) = (
  match e with
  | (Id id) ->(
    let (new_obj, new_heap) = (new_malloc heap) in 
    let frame = (get_stack_frame id decls) in 
    let obj = (get_heap_loc_from_frame frame new_heap) in
    let _ = (set_object_field_on_heap obj.obj_id "val" (Location_Value (Object_Loc new_obj)) new_heap) in
    ((En_Cmd (Malloc (e), decls)), (Location_Value (Object_Loc new_obj)), stack, new_heap)
  )
  | _ -> raise (Unexpected ("eval_malloc " ^ str_of_expr(e)))
)
;;


let rec get_final_cmd_state (result_cmds: (en_cmd * value_sd * stack_sd * heap_sd) list) = match result_cmds with 
| [] -> (En_Cmd (Skip, []), (Location_Value Null_Loc), [], [])
| (el::rem) -> ( match rem with
  | [] -> (match el with (final_cmd, result_val, result_stack, result_heap) -> (final_cmd, result_val, (result_stack: stack_sd), (result_heap: heap_sd)))
  | _ -> (get_final_cmd_state rem) )
;;

(* 
Evaluating commands: (done)
1. Declarations
2. Assignments
3. Malloc (dynamic allocation)
4. Procedure call
*)

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