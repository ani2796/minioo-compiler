%{
    (* Preamble *)    
%}

(* Terminal and non-terminal definitions *)
%token EOL MINUS SEMICOLON
%token <string> IDENTIFIER
%token <int> INTEGER
%type <int> expressions
%type <int> expression
%type <unit> program
%start program

%%

program : 
|   expressions EOL                 { () }

expressions :
|   expression SEMICOLON expressions{ print_string ("\nExpressions ending in: " ^ string_of_int($3)); ($3) }
|   expression                      { print_string ("\nExpression: " ^ string_of_int($1)); ($1) }

expression :
|   IDENTIFIER                      { print_string ("\nIdentifier: " ^ ($1)); (1) }
|   INTEGER                         { print_string ("\nInteger: " ^ string_of_int($1)); ($1) }
|   expression MINUS expression     { print_string ("\nExpression: " ^ string_of_int($1) ^ " - " ^ string_of_int($3)); ($3) }


