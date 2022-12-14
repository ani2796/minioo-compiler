open Ast;;
open List;;

exception NotDeclared of string;;
exception NotIdentifier;;
exception Unexpected of string;;


(* Pretty-printing the AST *)


let rec pr_ind count = match count with
| 0 -> (print_string "")
| num -> (print_string " "); (pr_ind (num-1))
;;

let rec pr_ind_str indent str = 
  pr_ind(indent);
  print_string(str)
;; 

let rec print_cmd c ind = match c with
| Decl id -> (pr_ind_str ind ("Decl of " ^ Ast.str_of_expr(id) ^ " "));
| Asmt (id, expr) -> (pr_ind_str ind ("Asmt " ^ " to " ^ Ast.str_of_expr(id) ^ " "));
| ProcCall (e1, e2) -> (pr_ind_str ind ("Proc call " ^ Ast.str_of_expr(e1) ^ "(" ^ Ast.str_of_expr(e2) ^ ") "));
| Block b -> (print_block b (ind+1));
| FieldAsmt (e1, e2, e3) -> (pr_ind_str ind ("Field assigment: " ^ Ast.str_of_expr(e1) ^ "." ^ Ast.str_of_expr(e2) ^ " = " ^ Ast.str_of_expr(e3)));
| Malloc e -> (pr_ind_str ind ("Malloc " ^ Ast.str_of_expr(e)));
| Skip -> (pr_ind_str ind ("Skip\n"));
| Parallel (c1s, c2s) -> (print_block c1s (ind+1)); (pr_ind_str ind ("|||\n")); (print_block c2s (ind+1));
| Atom a -> (pr_ind_str ind ("Atom: \n")); (print_block a (ind+1));
| IfElse (b, b1, b2) -> (pr_ind_str ind ("If " ^ str_of_bool(b) ^ "\n")); (print_block b1 (ind+1)); (pr_ind_str ind ("Else \n")); (print_block b2 (ind+1));
| Loop (b, b1) -> (pr_ind_str ind ("Loop " ^ str_of_bool(b))); (print_block b1 (ind+1));

and print_block cs indent = match cs with
| [] -> ()
| c1::c2s -> (print_cmd  c1 indent); (print_block c2s indent);
;;

let rec print_ast ast = match ast with
| [] -> ()
| c1::cs -> (print_cmd c1 0); (print_ast cs)
;;


(*print_ast ast;;*)


(* Checking static semantics (symbol table) *)
(*
  Symbol table is declared at each node.
  |-----> Symbol table contains the variable name and a pointer to the heap added later.
  We will create an "enhanced" AST with symbol tables.
  Traverse through the AST.
  For every declaration, add variable
*)

(* Takes decl expr, returns var *)
let get_decl_id decl = match decl with
| Id id -> id
| _ -> raise (Unexpected "get_decl_id")
;;

(* Checks if id string exists in decl list *)
let rec scope_id id decls = match decls with
| [] -> false
| el::rem -> (match !el with
  | (decls_id, frame) -> if(decls_id = id) then true else (scope_id id rem)
  )
;;

(* Checks *)
let rec scope_expr e decls = match e with
| Proc (Id id, cs) -> let new_decls = ((ref (id, Init_Frame))::decls) in En_Proc (Id id, (scope_ast cs new_decls), new_decls)
| Id id -> if(scope_id id decls) then (Id id) else raise (NotDeclared id)
| LocExpr (obj, field) -> (scope_expr obj decls)
| ArithExpr (op, e1, e2) -> (scope_arith_expr (op, e1, e2) decls)
| Int i -> e
| Field f -> e
| Null -> e
| _ -> raise (Unexpected "scope_expr")

and scope_arith_expr (op, e1, e2) decls = ArithExpr (
  op,
  (scope_expr e1 decls),
  (scope_expr e2 decls)
)

and scope_bool_expr b decls = match b with
| True -> b
| False -> b
| BoolExpr (op, e1, e2) -> BoolExpr (
    op,
    (scope_expr e1 decls),
    (scope_expr e2 decls)
  )

and scope_cmd cmd decls = match cmd with
(* add a new association *)
| Decl decl -> En_Cmd (Decl decl, (ref (get_decl_id(decl), (Init_Frame)))::decls)
(* check sub-expression scope *)
| Asmt (var, e) -> En_Cmd ((Asmt ((scope_expr var decls), (scope_expr e decls))), decls)
(* check sub-expression scope *)
| ProcCall (id, arg) -> En_Cmd (ProcCall ((scope_expr id decls), (scope_expr arg decls)), decls)
(* perform check for sub-tree *)
| Block cmds -> En_Block (scope_ast cmds decls)
(* check if assoc for obj and exp *)
| FieldAsmt (obj, field, e) -> En_Cmd(FieldAsmt ((scope_expr obj decls), (scope_expr field decls), (scope_expr e decls)), decls)
(* check if assoc for var *)
| Malloc var -> En_Cmd(Malloc (scope_expr var decls), decls)
(* no checks *)
| Skip -> En_Cmd(Skip, decls)
(* recursively check ast of blocks, both inherit decls *)
| Parallel (cs1, cs2) -> En_Parallel((scope_ast cs1 decls), (scope_ast cs2 decls))
(* recursively check ast of block, which inherits decls *)
| Atom cs -> En_Atom (scope_ast cs decls)
(* recursively check ast of blocks, both inherit decls *)
| IfElse (b, cs1, cs2) -> En_IfElse ((scope_bool_expr b decls), (scope_ast cs1 decls), (scope_ast cs2 decls), decls)
(* recursively check ast of block, which inherits decls *)
| Loop (b, cs) -> En_Loop ((scope_bool_expr b decls), (scope_ast cs decls), decls)

and scope_ast ast decls = match ast with
| [] -> []
| c1::cs -> 
  match (scope_cmd c1 decls) with
  | En_Cmd (c2, decls2) -> (En_Cmd (c2, decls2))::(scope_ast cs decls2)
  | _ -> (scope_cmd c1 decls)::(scope_ast cs decls)
;;

let rec print_decls decls ind = match decls with
| [] -> ()
| (decl)::rem_decls -> match !decl with
  (id, frame) -> (print_string ("decl: " ^ id ^ " "));  (print_decls rem_decls ind)

let rec print_en_cmd c ind = match c with
| En_Cmd (cmd, decls) -> ((print_cmd cmd ind); (print_string " [ "); (print_decls decls ind)); (print_string " ]\n")
| En_Block(cs) -> (print_en_block cs (ind+1))
| En_Parallel(c1s, c2s) -> (print_en_block c1s (ind+1)); (pr_ind_str ind ("|||\n")); (print_en_block c2s (ind+1));
| En_Atom(cs) -> (pr_ind_str (ind) ("atom:\n")); (print_en_block cs (ind+1));
| En_IfElse(b, cs1, cs2, decls) -> (pr_ind_str (ind) ("if:\n")); (print_en_block cs1 (ind+1));(pr_ind_str (ind) ("else:\n"));  (print_en_block cs2 (ind+1));
| En_Loop(b, cs, decls) ->(pr_ind_str (ind) ("loop:\n")); (print_en_block cs (ind+1));

and print_en_block cs indent = match cs with
| [] -> ()
| c1::c2s -> (print_en_cmd c1 indent); (print_en_block c2s indent);
;;

let rec print_en_ast ast = match ast with
| [] -> ()
| c1::cs -> (print_en_cmd c1 0); (print_en_ast cs)
;;