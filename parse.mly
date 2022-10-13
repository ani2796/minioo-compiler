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
%type <int> expression boolean
%type <Ast.cmd list> commands block
%type <Ast.cmd> command

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
|   id = IDENTIFIER ASSIGN expr = expression            { Asmt {id=id; value=string_of_int(expr);} }
|   expression LEFT_PAREN expression RIGHT_PAREN        { FuncCall ("\nCommand proc call: " ^ string_of_int($1) ^ "(" ^ string_of_int($3) ^ (")")) }
|   e1 = expression DOT e2 = expression ASSIGN e3 = expression  { FieldAsmt {field=(string_of_int(e1)^"."^string_of_int(e2)); value=string_of_int(e3)} }
|   MALLOC LEFT_PAREN id = IDENTIFIER RIGHT_PAREN       { Malloc {id;} }
|   SKIP                                                { Skip }
|   b = block                                           { Block b }
|   LEFT_CURLY cs1 = commands PARALLEL cs2 = commands RIGHT_CURLY   { Parallel (cs1, cs2) }
|   ATOM LEFT_PAREN cs = commands RIGHT_PAREN           { Atom (cs) }
|   if_else                                             { FuncCall ("") }
|   loop                                                { FuncCall ("") }

expression :
|   NULL                                                { print_string ("\nnull"); (0) }
|   PROC IDENTIFIER COLON block                         { print_string ("\nProcedure: " ^ ($2)); (0) }
|   IDENTIFIER                                          { print_string ("\nIdentifier: " ^ ($1)); (0) }
|   FIELD                                               { print_string ("\nField: " ^ ($1)); (0) }
|   expression DOT expression                           { print_string ("\nLocation expression: " ^ string_of_int($1) ^ "." ^ string_of_int($3)); (0) }
|   INTEGER                                             { print_string ("\nInteger: " ^ string_of_int($1)); (0) }
|   LEFT_PAREN expression RIGHT_PAREN                   { print_string ("\nExpression: " ^ string_of_int($2)); (0) }
|   expression MINUS expression                         { print_string ("\nExpression: " ^ string_of_int($1) ^ " - " ^ string_of_int($3)); (0) }

boolean :
|   TRUE                                                { print_string ("\nBoolean expr: true"); (1) }
|   FALSE                                               { print_string ("\nBoolean expr: false"); (1) }
|   expression EQUALS expression                        { print_string ("\nBoolean expr: " ^ string_of_int($1) ^ " == " ^ string_of_int($3)); (1) }
|   expression GREATER expression                       { print_string ("\nBoolean expr: " ^ string_of_int($1) ^ " > " ^ string_of_int($3)); (1) }
|   LEFT_PAREN boolean RIGHT_PAREN                      { print_string ("\nBoolean expr: " ^ string_of_int($2)); (1) }

block :
|   LEFT_CURLY cs = commands RIGHT_CURLY                     { cs }

(* To avoid parsing ambiguity of dangling statements, each block is delimited by blocks (curly braces) *)

if_else :
|   IF boolean block ELSE block                         { print_string ("\nIf else command"); (3) }

loop :
|   WHILE boolean block                                 { print_string ("\nWhile command"); (3) }