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

%type <Ast.cmd list> program
%type <int> if_else loop 
%type <bln> boolean
%type <Ast.cmd list> commands block
%type <Ast.cmd list> command
%type <Ast.expr> expression

(* Start symbol *)
%start program

(* Operator precendence and associativity *)
%left MINUS
%left DOT

%%
(* Context-free Grammar *)

program : 
|   cs = commands EOL                                        { cs }

commands :              
|   c1s = command SEMICOLON c2s = commands               { 
                                                            (c1s@c2s)
                                                        }
|   c = command                                         { c }
|   c = command SEMICOLON                               { c }

command :
(* Declaration and assignment must be done separately *)
|   VAR id = IDENTIFIER                                 { [Decl {id;}] }
|   id = IDENTIFIER ASSIGN expr = expression            { [Asmt {id=id; value=Ast.str_of_expr(expr);}] }
|   e1 = expression LEFT_PAREN e2 = expression RIGHT_PAREN        { [ProcCall ("\nCommand proc call:" ^ str_of_expr(e1) ^ " (" ^ str_of_expr(e2) ^ ")")] }
|   e1 = expression DOT e2 = expression ASSIGN e3 = expression  { [FieldAsmt {field=(Ast.str_of_expr(e1)^"."^Ast.str_of_expr(e2)); value=Ast.str_of_expr(e3)}] }
|   MALLOC LEFT_PAREN id = IDENTIFIER RIGHT_PAREN       { [Malloc {id;}] }
|   SKIP                                                { [Skip] }
|   b = block                                           { [Block b] }
|   c1 = block PARALLEL c2 = block                      { [Parallel (c1, c2)] }
|   ATOM c = block RIGHT_PAREN                          { [Atom (c)] }
|   if_else                                             { [ProcCall ("")] }
|   loop                                                { [ProcCall ("")] }

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

(* To avoid parsing ambiguity of dangling statements, each block is delimited by curly braces *)

if_else :
|   IF boolean block ELSE block                         { print_string ("\nIf else command"); (3) }

loop :
|   WHILE boolean block                                 { print_string ("\nWhile command"); (3) }