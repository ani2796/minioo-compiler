(*let ast = *)
open Ast;;
open List;;

exception NotDeclared of string;;
exception Failed of string;;

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
| Decl d -> (print_indent_string indent ("Decl of " ^ d.id ^ "\n"));
| Asmt a -> (print_indent_string indent ("Asmt of " ^ a.value ^ " to " ^ a.id ^ "\n"));
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

(* Checking static semantics (symbol table) *)

type symbolTableType = { 
  decls: string list; 
  blocks: symbolTableType list; 
  parent: symbolTableType option;
};;

let symbolTable = { 
  decls = []; 
  blocks = []; 
  parent = None;
};;

let rec exists var decls = match decls with
| [] -> false
| el::rem -> if(var = el) then true else (exists var rem)
;;

let rec staticScopeCheck var symtab = 
  if(exists var symtab.decls) then true else
    match symtab with
    | {decls; blocks; parent} -> match parent with
      | None -> false
      | Some p -> (staticScopeCheck var p)
;;

let asmtStaticScopeCheck asmt s = match asmt with 
| Asmt a -> if(staticScopeCheck a.id s) then true else false
| _ -> false
;;

let rec buildSymbolTable ast s = match ast with
| [] -> s (* no cmd, no action *)
| el::rem -> (* depending on the cmd, you do different things *)
  (* Analyze el and mutate symbol table *)
  (* Recurse on rem *)
  match el with
  | Decl decl -> (buildSymbolTable rem {decls=(decl.id::s.decls); blocks=s.blocks; parent=Some s})
  | Block b -> (buildSymbolTable rem {decls=s.decls; blocks=((buildSymbolTable b {decls=[];blocks=[];parent=None})::s.blocks); parent = Some s})
  | Asmt a -> (* Run a static scope check on variables, if any, before recursing *) 
    (print_string "Running static scope checker...\n");
    if(asmtStaticScopeCheck el s) then
      (buildSymbolTable rem {decls=s.decls; blocks=s.blocks; parent= Some s})
    else 
      raise (NotDeclared a.id)
  | _ -> (buildSymbolTable rem {decls=s.decls; blocks=s.blocks; parent=Some s})
;;

let rec print_declarations decls = match decls with
| [] -> ()
| el::rem -> (print_string (el ^ " ")); (print_declarations rem)
;;

let rec print_symbol_table s indent = 
  (print_indent indent);
  (print_string "Decls: ");
  (print_declarations s.decls)
;;


print_symbol_table (buildSymbolTable ast {decls=[]; blocks=[];parent=None}) 0;;
(*
print_string "\n\n";;
(Ast.num_cmds ast 1);;
*)