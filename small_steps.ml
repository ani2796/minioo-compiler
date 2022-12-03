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

let incr_object_counter = (
  (object_counter := !object_counter + 1);
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
  let counter = incr_object_counter in 
  let (new_obj) = (get_new_object counter) in 
  let new_heap = (new_obj::heap) in
    ((Object_Ref (var_id, new_obj.obj_id)), new_heap)

;;

(* Find var field of object *)
let get_object_field (obj: object_sd) (field: string) = (List.assoc field obj.fields)

(* Find object in heap according to loc in stack *)
let rec get_object_from_heap (loc: string) (heap: heap_sd) = match heap with
| [] -> raise Unexpected
| obj::rem -> (
    if(obj.obj_id = loc) then obj
    else (get_object_from_heap loc rem)
)
;;

(* Return second value in stack tuple, i.e. the loc *)
let get_heap_loc_from_frame (frame: stack_frame_sd) (heap: heap_sd) = match frame with
| Init_Frame -> raise Unexpected
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
| [] -> (print_string "\nBottom\n")
| el::rem -> (
  (print_stack_frame el);
  (print_stack rem);
)

and print_fields (fields: ((string * value_sd) list)) = match fields with
| [] -> ()
| (field, value)::rem -> (
  (print_string (" field: " ^ field ^ " value: " ^ "\t"));
  (print_value value);
  (print_string "\n");
  (print_fields rem);
)

and print_object (obj: object_sd) = (
  (print_string ("is_object: " ^ string_of_bool(obj.is_object)));
  (print_fields obj.fields);
  (print_string "\n");
)

let rec print_heap (heap: heap_sd) = match heap with
| [] -> (print_string "\nHeap end")
| obj::rem -> (
  (print_string (obj.obj_id ^ "\n"));
  (print_object obj);
  (print_string "\n");
  (print_heap rem);
)
;;

let rec update_decls (decls: (string * (stack_frame_sd ref)) list) (var: string) (new_frame: stack_frame_sd) = match decls with
| [] -> raise Unexpected
| (decls_var, old_frame)::rem -> 
    if(decls_var = var) then ((decls_var, ref new_frame)::rem)
    else ((decls_var, old_frame)::(update_decls rem var new_frame))


(*
  For a new variable, create a new initialized object on the heap
  Push declaration onto stack, and update decls (symbol table) to reflect stack changes
  NOTE: Ignore OCaml warning since the only kind of expressions that can appear with `var` are declarations
 *)

let eval_decl (Decl (Id id)) (stack: stack_sd) (heap: heap_sd) (decls: (string * (stack_frame_sd ref)) list) = 
  let var_id = id in
  let (frame, new_heap) = (new_var_stack_frame id heap) in 
  let new_stack = (push stack frame) in
  let new_decls = (update_decls decls var_id frame) in
    (new_stack, new_heap, new_decls)
;;

let stack = [];;
let heap = [];;

(* Testing above eval_decl *)
let (new_stack, new_heap, new_decls) = (eval_decl (Decl (Id "x")) stack heap [("x", (ref Init_Frame))]);;
(print_stack new_stack);;
(print_heap new_heap);;

(* Evaluating expressions *)


(* Arithmetic expressions *)
let rec eval_arith_expr ( ArithExpr (arith, e1, e2)) (stack: stack_sd) (heap: heap_sd) (decls: (string * (stack_frame_sd ref)) list) = 
  let v1 = (eval_expr e1 stack heap decls) in
  let v2 = (eval_expr e2 stack heap decls) in
  match (v1, v2) with
  | (Int_Value i1, Int_Value i2) -> ( match arith with 
    | '+' -> Int_Value (i1 + i2)
    | '-' -> Int_Value (i1 - i2)
    | '*' -> Int_Value (i1 * i2)
    | '/' -> Int_Value (i1 / i2)
    | _ -> raise Unexpected )
  | _ -> Error_Value

(* 
Evaluate procedure declaration to return closure (procedure with stack) 
NOTE: Ignore OCaml warning since only identifiers are possible as the first expr of En_Proc (procedures with symbol tables/decls)
*)
and eval_en_proc (En_Proc ((Id id), en_cs)) (stack: stack_sd) (heap: heap_sd) (decls: (string * (stack_frame_sd ref)) list) =
(Closure_Value (stack, id, en_cs))


and eval_id (id: string) (stack: stack_sd) (heap: heap_sd) (decls: (string * (stack_frame_sd ref)) list) =
  let frame = (List.assoc id decls) in
  let (_, o_id) = (match !frame with 
  | (Object_Ref (stack_var, stack_obj)) -> (stack_var, stack_obj)
  | _ -> raise Unexpected
  ) in
  (o_id, (get_heap_loc_from_frame !frame heap))


and eval_expr (e: expr) (stack: stack_sd) (heap: heap_sd) (decls: (string * (stack_frame_sd ref)) list) = 
  match e with
  | Field f -> (Field_Value f)
  | Int i -> (Int_Value i)
  | ArithExpr (arith, e1, e2) -> (eval_arith_expr e stack heap decls)
  | Null -> (Location_Value Null_Loc)
  | Proc _ -> raise Unexpected
  | En_Proc ((Id id), en_cs) -> (eval_en_proc e stack heap decls)
  | Id id -> let (obj_id, obj) = (eval_id id stack heap decls) in 
      if(obj.is_object) then (Location_Value (Object_Loc obj)) (* If object, return a location value *)
      else (get_object_field obj "val") (* If not, return the "val" field *)
  | LocExpr (e1, e2) -> (
      let obj = (eval_expr e1 stack heap decls) in (* Evaluate first expression to get object *)
      let field = (eval_expr e2 stack heap decls) in (* Evaluate second expression to get  *)
      match (obj, field) with
      | (Location_Value (Object_Loc o), Field_Value f) -> (get_object_field o f)
      | _ -> Error_Value )    
  | _ -> raise Unexpected
  ;;

  