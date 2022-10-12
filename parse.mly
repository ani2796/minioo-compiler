%{
    (* Preamble *)
    open Ast;;
%}

(* Terminal and non-terminal definitions *)
%token EOL MINUS SEMICOLON COLON ASSIGN GREATER EQUALS DOT PARALLEL
%token LEFT_PAREN RIGHT_PAREN LEFT_CURLY RIGHT_CURLY
%token VAR NULL PROC TRUE FALSE IF ELSE WHILE MALLOC SKIP ATOM
%token <string> IDENTIFIER FIELD
%token <int> INTEGER

%type <int> command block if_else loop
%type <int> expression boolean
%type <Ast.cmd> commands

(* Start symbol *)
%start <Ast.cmd> program

(* Operator precendence and associativity *)
%left MINUS
%left DOT

%%
(* Context-free Grammar *)

program : 
|   commands EOL                                        { ($1) }

commands :              
|   c1 = command SEMICOLON c2s = commands               { Cmds (c1, c2s) }
|   c = command                                         { Cmd (c) }
|   c = command SEMICOLON                               { Cmd (c) }

command :
(* Declaration and assignment must be done separately *)
|   VAR IDENTIFIER                                      { print_string ("\nCommand: var " ^ ($2)); (2) }
|   IDENTIFIER ASSIGN expression                        { print_string ("\nCommand: " ^ ($1) ^ " = " ^ string_of_int($3)); (2) }
|   expression LEFT_PAREN expression RIGHT_PAREN        { print_string ("\nCommand proc call: " ^ string_of_int($1) ^ "(" ^ string_of_int($3) ^ (")")); (2) }
|   expression DOT expression ASSIGN expression         { print_string ("\nCommand field assignment: " ^ string_of_int($1) ^ "." ^ string_of_int($3) ^ "=" ^ string_of_int($5)); (2) }
|   MALLOC LEFT_PAREN IDENTIFIER RIGHT_PAREN            { print_string ("\nCommand malloc: " ^ ($3)); (2) }
|   SKIP                                                { print_string ("\nCommand skip"); (2) }
|   block                                               { (2) }
|   LEFT_CURLY commands PARALLEL commands RIGHT_CURLY   { print_string ("\nCommands parallel"); (2) }
|   ATOM LEFT_PAREN commands RIGHT_PAREN                { print_string ("\nCommands atomic"); (2) }
|   if_else                                             { (2) }
|   loop                                                { (2) }

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
|   LEFT_CURLY commands RIGHT_CURLY                     { print_string ("\nBlock"); (2) }

(* To avoid parsing ambiguity of dangling statements, each block is delimited by blocks (curly braces) *)

if_else :
|   IF boolean block ELSE block                         { print_string ("\nIf else command"); (3) }

loop :
|   WHILE boolean block                                 { print_string ("\nWhile command"); (3) }