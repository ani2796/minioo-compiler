open Stat_sem;;
open Ast;;
open List;;

(* Small step operational semantics *)

(* Stack and heap operations *)

(* Objects are created per variable declaration *)
(* Malloc simply turns the is_object field on *)



let object_counter = ref 0;;

let push (stack: stack_sd) (frame: stack_frame_sd) = ((frame::stack): stack_sd)
let pop (stack: stack_sd) = match stack with
| [] -> Init_Frame
| frame::rest -> frame

(* Incrementing object counter every time a new one is created *)

let incr_object_counter () = (
  (object_counter := !object_counter + 1);
  (print_string ("\nNew object counter:" ^ string_of_int(!object_counter) ^ "\n"));
  (!object_counter)
)
;;



(* Every time a new object is constructed, it has a new loc that doesn't exist *)

let get_new_object (counter: int) = {
  obj_id = "obj" ^ (string_of_int counter);
  is_object = false;
  fields = [("val", (Location_Value Null_Loc))];
}
;;

(* Getting stack frame for new variable declaration *)

let new_var_stack_frame var_id heap = 
  let counter = (incr_object_counter ()) in 
  let new_obj = (get_new_object counter) in 
  let new_heap = (new_obj::heap) in
    (print_string ("\nCreating new stack frame for var with counter: " ^ string_of_int(counter)));
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

(* Return second value in stack tuple, i.e. the loc *)
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
| (Closure_Value c) -> (print_string "Closure");
| (Error_Value) -> ()

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
  (print_string ("is_object: " ^ string_of_bool(obj.is_object)));
  (print_fields obj.fields);
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
  (print_string "\n\nState before command:\n");
  (print_string "Stack start\n");
  (print_stack stack); 
  (print_string "Stack end\n");
  (print_string "\nHeap start\n");
  (print_heap heap);
  (print_string "Heap end\n");
  (print_string "\n\nState after command:\n");
  (print_string "Stack start\n");
  (print_stack new_stack); 
  (print_string "Stack end\n");
  (print_string "\nHeap start\n");
  (print_heap new_heap);
  (print_string "Heap end\n");
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
let rec eval_arith_expr ( ArithExpr (arith, e1, e2)) (stack: stack_sd) (heap: heap_sd) (decls: (string * (stack_frame_sd)) list) = 
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
and eval_en_proc (En_Proc ((Id id), en_cs)) (stack: stack_sd) (heap: heap_sd) (decls: (string * (stack_frame_sd)) list) =
(Closure_Value (stack, id, en_cs))

(* Evaluating identifiers according to their stack ptr to heap and then heap location *)
and eval_id (id: string) (stack: stack_sd) (heap: heap_sd) (decls: (string * (stack_frame_sd)) list) =
  let frame = (List.assoc id decls) in
  let (_, o_id) = (match frame with 
  | (Object_Ref (stack_var, stack_obj)) -> (stack_var, stack_obj)
  | _ -> raise (Unexpected "eval_id")
  ) in
  (o_id, (get_heap_loc_from_frame frame heap))

(* 
Evaluating location expressions according to presence of object on stack (definitely there) and    
presence of field in the object (checked in the function) 
*)
and eval_loc_expr (e: expr) (stack: stack_sd) (heap: heap_sd) (decls: (string * (stack_frame_sd)) list) = match e with
| (LocExpr (e1, e2)) -> (
  let obj = (eval_expr e1 stack heap decls) in (* Evaluate first expression to get object *)
  let field = (eval_expr e2 stack heap decls) in (* Evaluate second expression to get  *)
  match (obj, field) with
  | (Location_Value (Object_Loc o), Field_Value f) -> (get_object_field o f)
  | _ -> Error_Value )
| _ -> raise (Unexpected ("eval_loc_expr " ^ (str_of_expr e)))

(* Evaluate any expression to return value in the semantic domain *)
and eval_expr (e: expr) (stack: stack_sd) (heap: heap_sd) (decls: (string * (stack_frame_sd)) list) = 
  match e with
  | Field f -> (Field_Value f)
  | Int i -> (Int_Value i)
  | ArithExpr (arith, e1, e2) -> (eval_arith_expr e stack heap decls)
  | Null -> (Location_Value Null_Loc)
  | Proc _ -> raise (Unexpected ("Proc at eval_expr " ^ (str_of_expr e)))
  | En_Proc ((Id id), en_cs) -> (eval_en_proc e stack heap decls)
  | Id id -> let (obj_id, obj) = (eval_id id stack heap decls) in 
      if(obj.is_object) then (Location_Value (Object_Loc obj)) (* If object, return a location value *)
      else (get_object_field obj "val") (* If not, return the "val" field *)
  | LocExpr (e1, e2) -> (eval_loc_expr e stack heap decls)
  | _ -> raise (Unexpected ("LocExpr at eval_expr " ^ (str_of_expr e)))
;;

(* Evaluating individual commands *)

(*
  For a new variable, create a new initialized object on the heap
  Push declaration onto stack, and update decls (symbol table) to reflect stack changes
  NOTE: Ignore OCaml warning since the only kind of expressions that can appear with `var` are declarations
 *)

 let rec update_decls (decls: (string * (stack_frame_sd)) list) (var: string) (new_frame: stack_frame_sd) = 
  match decls with
| [] -> raise (Unexpected ("update_decls " ^ var))
| (decls_var, old_frame)::rem -> 
    if(decls_var = var) then ((decls_var, new_frame)::rem)
    else ((decls_var, old_frame)::(update_decls rem var new_frame))
;;

let eval_decl (Decl (Id id)) (stack: stack_sd) (heap: heap_sd) (decls: (string * (stack_frame_sd)) list) = 
  let var_id = id in
  let (frame, new_heap) = (new_var_stack_frame id heap) in 
  let new_stack = (push stack frame) in
  let new_decls = (update_decls decls var_id frame) in
    (En_Cmd(Decl (Id id), new_decls), new_stack, new_heap)
;;


let eval_asmt (Asmt (e1, e2)) (stack: stack_sd) (heap: heap_sd) (decls: (string * (stack_frame_sd)) list) = 
  match (e1, e2) with
  | (Id id, _) -> (let value = (eval_expr e2 stack heap decls) in 
    match value with
    | Error_Value -> (En_Cmd ((Asmt (e1, e2)), decls), Error_Value, stack, heap)
    | _ -> (
      let frame = (List.assoc id decls) in
      let obj = (get_heap_loc_from_frame frame heap) in
      let _ = (set_object_field_on_heap obj.obj_id "val" value heap) in
      (En_Cmd ((Asmt (e1, e2)), decls), value, stack, heap)
    )
  )
  | (LocExpr (obj, field), _) -> (En_Cmd ((Asmt (e1, e2)), decls), Error_Value, stack, heap)
  | _ -> raise (Unexpected ("eval_asmt " ^ str_of_expr(e1) ^ " " ^ str_of_expr(e2)))
;;

let eval_cmd (c: en_cmd) (stack: stack_sd) (heap: heap_sd) = 
  match c with
  | (En_Cmd (c, decls)) -> (match c with
    | (Decl d) -> ( let (new_cmd, new_stack, new_heap) = eval_decl c stack heap decls in 
      (new_cmd, Location_Value Null_Loc, new_stack, new_heap))
    | (Asmt (e1, e2)) -> 
      (eval_asmt c stack heap decls)
    | _ -> raise (Unexpected ("eval_cmd decl ")) )
  | _ -> raise (Unexpected ("eval_cmd decl outer"))
;;

let rec eval_ast (ast: en_cmd list) (stack: stack_sd) (heap: heap_sd) = match ast with
| [] -> []
| (c::cs) -> let (new_cmd, new_val, new_stack, new_heap) = (eval_cmd c stack heap) in
    (print_state (stack, new_stack) (heap, new_heap));
    ((new_cmd, new_val)::(eval_ast cs new_stack new_heap))
;;