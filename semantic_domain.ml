(*
  Semantic domains:
  1. Int = OCaml integers
  2. Bool = True, False, Error
  3. Objects = Records with multiple possible fields
  4. Locations = Objects + Null
  5. Closures = Fn param + List of commands + Stack
  6. Values = Fields + Ints + Locations + Closures
  7. Tainted values = Values + Errors
  8. Environment = Static scoped mapping to object
  9. Stack frame = Declaration + Procedure call
  10. Stack = (Stack frame)*
  11. Heap = Mapping (object, field) to tainted value
  12. Program state = (stack, heap)
  TO IMPLEMENT:
  13. Flow of control (Control) = Execution of commands with a block to clear the Stack
  14. Configuration = (control, state) + state + Error
*)

open Ast;;

(* Boolean in semantic domain *)
type bool_sd = 
| Bool_Value of bool
| Bool_Error_Value

(* Locations can be objects or null *)
and location_sd = 
| Object_Location of object_sd
| Null_Location

and closures_sd = string * (Ast.en_cmd list) * stack_sd

and stack_frame_sd = 
| Mapping_Frame of (string * (object_sd ref)) (* Maybe the type of "Var" is not string *)
| Closure_Frame of closures_sd

and stack_sd = 
| Stack of stack_frame_sd list

and value_sd = 
| Field_Value of string
| Int_Value of int
| Location_Value of location_sd
| Closure_Value of closures_sd
| Error_Value

and object_sd = 
| Value of value_sd
| Object_Value of ((string * value_sd) list)

type heap_sd = 
| Heap of ((string * object_sd) list)

type program_state_sd = 
| Program_State of (stack_sd * heap_sd)
;;


(* Operations on semantic domains *)

(* Basic stack operations inherently in OCaml assoc lists *)
(* Function: Getting value of variable given some program state *)
