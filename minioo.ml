(*let ast = *)
open Ast;;
open List;;

exception NotDeclared of string;;
exception Redeclared of string;;
exception Unexpected;;

let ast = 
  let lexbuf = Lexing.from_channel stdin in
    Parse.program Lex.token lexbuf
;;


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
| Decl id -> (pr_ind_str ind ("Decl of " ^ Ast.str_of_expr(id) ^ "\n"));
| Asmt (id, expr) -> (pr_ind_str ind ("Asmt " ^ " to " ^ Ast.str_of_expr(id) ^ "\n"));
| ProcCall (e1, e2) -> (pr_ind_str ind ("Proc call " ^ Ast.str_of_expr(e1) ^ "(" ^ Ast.str_of_expr(e2) ^ ")\n"));
| Block b -> (print_block b (ind+1));
| FieldAsmt (e1, e2, e3) -> (pr_ind_str ind ("Field assigment: " ^ Ast.str_of_expr(e1) ^ "." ^ Ast.str_of_expr(e2) ^ " = " ^ Ast.str_of_expr(e3)));
| Malloc e -> (pr_ind_str ind ("Malloc " ^ Ast.str_of_expr(e)));
| Skip -> (pr_ind_str ind ("Skip"));
| Parallel (c1s, c2s) -> (print_block c1s (ind+1)); (pr_ind_str ind ("|||\n")); (print_block c2s (ind+1));
| Atom a -> (pr_ind_str ind ("Atom: ")); (print_block a (ind+1));
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

print_ast ast
;;


(* Checking static semantics (symbol table) *)
(*
  Symbol table is declared at each node.
  |-----> Symbol table contains the variable name and a pointer to the heap added later.
  We will create an "enhanced" AST with symbol tables.
  Traverse through the AST.
  For every declaration, add variable    
  Good luck, be brave and don't have fear
  You can do this
*)

(* Small step operational semantics *)