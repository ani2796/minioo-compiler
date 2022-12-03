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

let get_object (counter: int) = (("obj" ^ (string_of_int counter)), {
  is_object = false;
  fields = [("val", (Location_Value Null_Loc))];
})
;;


(* Getting stack frame for new variable declaration *)

let new_var_stack_frame var_id heap = 
  let counter = incr_object_counter in 
  let (name, fields) = (get_object counter) in 
  let new_heap = ((name, fields)::heap) in
    ((Object_Ref (var_id, name)), new_heap)

;;

(* Find object in heap according to loc in stack *)
let rec get_object_from_heap (loc: string) (heap: heap_sd) = (List.assoc loc heap)
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
| (obj_id, obj)::rem -> (
  (print_string (obj_id ^ "\n"));
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
