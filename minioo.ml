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
  
let rec map f l = match l with 
| [] -> []
| el::rem -> (f el)::(map f rem)
;;

let rec print_indent count = match count with
| 0 -> (print_string "")
| num -> (print_string " "); (print_indent (num-1))
;;

let rec print_indent_string indent str = 
  print_indent(indent);
  print_string(str)
;; 

let rec print_cmd c indent = match c with
| Decl d -> (print_indent_string indent ("Decl of " ^ d ^ "\n"));
| Asmt (id, expr) -> (print_indent_string indent ("Asmt " ^ " to " ^ id ^ "\n"));
| ProcCall pc -> (print_indent_string indent ("Proc call " ^ pc.id ^ "(" ^ pc.arg ^ ")\n"));
| Block b -> (print_block b (indent+1));
| FieldAsmt fa -> (print_indent_string indent ("Field assigment: " ^ fa.obj ^ "." ^ fa.field ^ " = " ^ fa.value));
| Malloc m -> (print_indent_string indent ("Malloc " ^ m.id));
| Skip -> (print_indent_string indent ("Skip"));
| Parallel (c1s, c2s) -> (print_block c1s (indent+1)); (print_indent_string indent ("|||\n")); (print_block c2s (indent+1));
| Atom a -> (print_indent_string indent ("Atom: ")); (print_block a (indent+1));
| IfElse (b, b1, b2) -> (print_indent_string indent ("If " ^ str_of_bool(b) ^ "\n")); (print_block b1 (indent+1)); (print_indent_string indent ("Else \n")); (print_block b2 (indent+1));
| Loop (b, b1) -> (print_indent_string indent ("Loop " ^ str_of_bool(b))); (print_block b1 (indent+1));
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


type variable = {
  name: string;
}

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