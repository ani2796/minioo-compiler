%{
    (* Preamble *)
    open Type;;
    open Ast;;
%}

(* Terminal and non-terminal definitions *)
%token EOL MINUS SEMICOLON COLON ASSIGN GREATER EQUALS DOT PARALLEL
%token LEFT_PAREN RIGHT_PAREN LEFT_CURLY RIGHT_CURLY
%token VAR NULL PROC TRUE FALSE IF ELSE WHILE MALLOC SKIP ATOM
%token <string> IDENTIFIER FIELD
%token <int> INTEGER

%type <unit> program 
%type <int> if_else loop 
%type <bln> boolean
%type <Ast.cmd list> commands block
%type <Ast.cmd> command
%type <Ast.expr> expression

(* Start symbol *)
%start program

(* Operator precendence and associativity *)
%left MINUS
%left DOT

%%
(* Context-free Grammar *)

program : 
|   commands EOL                                        { () }

commands :              
|   c1 = command SEMICOLON c2s = commands               { 
                                                            (c1::c2s) 
                                                        }
|   c = command                                         { [c] }
|   c = command SEMICOLON                               { [c] }

command :
(* Declaration and assignment must be done separately *)
|   VAR id = IDENTIFIER                                 { Decl {id;} }
|   id = IDENTIFIER ASSIGN expr = expression            { Asmt {id=id; value=Ast.str_of_expr(expr);} }
|   expression LEFT_PAREN expression RIGHT_PAREN        { ProcCall ("\nCommand proc call: ()") }
|   e1 = expression DOT e2 = expression ASSIGN e3 = expression  { FieldAsmt {field=(Ast.str_of_expr(e1)^"."^Ast.str_of_expr(e2)); value=Ast.str_of_expr(e3)} }
|   MALLOC LEFT_PAREN id = IDENTIFIER RIGHT_PAREN       { Malloc {id;} }
|   SKIP                                                { Skip }
|   b = block                                           { Block b }
|   LEFT_CURLY cs1 = commands PARALLEL cs2 = commands RIGHT_CURLY   { Parallel (cs1, cs2) }
|   ATOM LEFT_PAREN cs = commands RIGHT_PAREN           { Atom (cs) }
|   if_else                                             { ProcCall ("") }
|   loop                                                { ProcCall ("") }

expression :
|   NULL                                                { Null }
|   PROC arg = IDENTIFIER COLON b = block               { Proc ({arg}, b) }
|   id = IDENTIFIER                                     { Id {id; value="";} }
|   f = FIELD                                           { Field {id=f;} }
|   e1 = expression DOT e2 = expression                 { LocExpr ({obj=str_of_expr(e1); field=str_of_expr(e2);}, e1, e2) }
|   i = INTEGER                                         { Int i }
|   LEFT_PAREN e = expression RIGHT_PAREN               { e }
|   e1 = expression MINUS e2 = expression               { MinusExpr ({arg1=str_of_expr(e1); arg2=str_of_expr(e2);}, e1, e2) }

boolean :
|   TRUE                                                { True }
|   FALSE                                               { False }
|   e1 = expression op = EQUALS e2 = expression         { BoolExpr (e1, Equals, e2) }
|   e1 = expression op = GREATER e2 = expression        { BoolExpr (e1, Greater, e2) }
|   LEFT_PAREN b = boolean RIGHT_PAREN                  { b }

block :
|   LEFT_CURLY cs = commands RIGHT_CURLY                     { cs }

(* To avoid parsing ambiguity of dangling statements, each block is delimited by blocks (curly braces) *)

if_else :
|   IF boolean block ELSE block                         { print_string ("\nIf else command"); (3) }

loop :
|   WHILE boolean block                                 { print_string ("\nWhile command"); (3) }