%{
    (* Preamble *)    
%}

(* Terminal and non-terminal definitions *)
%token EOL MINUS SEMICOLON COLON ASSIGN GREATER EQUALS DOT
%token LEFT_PAREN RIGHT_PAREN LEFT_CURLY RIGHT_CURLY
%token VAR NULL PROC TRUE FALSE IF ELSE WHILE MALLOC
%token <string> IDENTIFIER FIELD
%token <int> INTEGER

%type <unit> program commands command block if_else loop
%type <int> expression boolean

(* Start symbol *)
%start program

(* Operator precendence and associativity *)
%left MINUS

%%
(* Context-free Grammar *)

program : 
|   commands EOL                        { () }

commands :
|   command SEMICOLON commands          { () }
|   command                             { () }
|   command SEMICOLON                   { () }

command :
(* Declaration and assignment must be done separately *)
|   VAR IDENTIFIER                      { print_string ("\nCommand: var " ^ ($2)); () }
|   IDENTIFIER ASSIGN expression        { print_string ("\nCommand: " ^ ($1) ^ " = " ^ string_of_int($3)); () }
|   expression LEFT_PAREN expression RIGHT_PAREN    { print_string ("\nCommand proc call: " ^ string_of_int($1) ^ "(" ^ string_of_int($3) ^ (")")); () }
|   expression DOT expression ASSIGN expression     { print_string ("\nCommand field assignment: " ^ string_of_int($1) ^ "." ^ string_of_int($3) ^ "=" ^ string_of_int($5)); () }
|   MALLOC LEFT_PAREN IDENTIFIER RIGHT_PAREN        { print_string ("\nCommand malloc: " ^ ($3)); () }
|   block                               { () }
|   if_else                             { () }
|   loop                                { () }

expression :
|   NULL                                { print_string ("\nnull"); (0) }
|   PROC IDENTIFIER COLON block         { print_string ("\nProcedure: " ^ ($2)); (-1) }
|   IDENTIFIER                          { print_string ("\nIdentifier: " ^ ($1)); (1) }
|   FIELD                               { print_string ("\nField: " ^ ($1)); (2) }
|   expression DOT expression           { print_string ("\nLocation expression: " ^ string_of_int($1) ^ "." ^ string_of_int($3)); ($3) }
|   INTEGER                             { print_string ("\nInteger: " ^ string_of_int($1)); ($1) }
|   LEFT_PAREN expression RIGHT_PAREN   { print_string ("\nExpression: " ^ string_of_int($2)); ($2) }
|   expression MINUS expression         { print_string ("\nExpression: " ^ string_of_int($1) ^ " - " ^ string_of_int($3)); ($3) }

boolean :
|   TRUE                                { print_string ("\nBoolean expr: true"); (1) }
|   FALSE                               { print_string ("\nBoolean expr: false"); (0) }
|   expression EQUALS expression        { print_string ("\nBoolean expr: " ^ string_of_int($1) ^ " == " ^ string_of_int($3)); ($3) }
|   expression GREATER expression       { print_string ("\nBoolean expr: " ^ string_of_int($1) ^ " > " ^ string_of_int($3)); ($3) }
|   LEFT_PAREN boolean RIGHT_PAREN      { print_string ("\nBoolean expr: " ^ string_of_int($2)); ($2) }

block :
|   LEFT_CURLY commands RIGHT_CURLY     { print_string ("\nBlock"); () }

(* To avoid parsing ambiguity of dangling statements, each block is delimited by blocks (curly braces) *)

if_else :
|   IF boolean block ELSE block         { print_string ("\nIf else command"); () }

loop :
|   WHILE boolean block                 { print_string ("\nWhile command"); () }