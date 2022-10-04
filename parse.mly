%{
    (* Preamble *)    
%}

(* Terminal and non-terminal definitions *)
%token EOL MINUS SEMICOLON COLON ASSIGN
%token LEFT_PAREN RIGHT_PAREN LEFT_CURLY RIGHT_CURLY
%token VAR NULL PROC
%token <string> IDENTIFIER
%token <int> INTEGER

%type <unit> commands command block
%type <int> expression
%type <unit> program

(* Start symbol *)
%start program

(* Operator precendence *)
%left MINUS

%%

program : 
|   commands EOL                        { () }

commands :
|   command SEMICOLON commands          { () }
|   command                             { () }
|   command SEMICOLON                   { () }

command :
|   VAR IDENTIFIER                      { print_string ("\nCommand: var " ^ ($2)); () }
|   VAR IDENTIFIER ASSIGN expression    { print_string ("\nCommand: var " ^ ($2) ^ " = " ^ string_of_int($4)); () }
|   IDENTIFIER ASSIGN expression        { print_string ("\nCommand: " ^ ($1) ^ " = " ^ string_of_int($3)); () }
|   block                               { () }

expression :
|   NULL                                { print_string ("\nnull"); (0) }
|   PROC IDENTIFIER COLON block         { print_string ("\nProcedure: " ^ ($2)); (-1) }
|   IDENTIFIER                          { print_string ("\nIdentifier: " ^ ($1)); (1) }
|   INTEGER                             { print_string ("\nInteger: " ^ string_of_int($1)); ($1) }
|   LEFT_PAREN expression RIGHT_PAREN   { print_string ("\nExpression: " ^ string_of_int($2)); ($2) }
|   expression MINUS expression         { print_string ("\nExpression: " ^ string_of_int($1) ^ " - " ^ string_of_int($3)); ($3) }

block :
|   LEFT_CURLY commands RIGHT_CURLY     { print_string ("\nBlock"); () }