%{
    (* Preamble *)    
%}

(* Terminal and non-terminal definitions *)
%token EOL MINUS SEMICOLON VAR ASSIGN
%token <string> IDENTIFIER
%token <int> INTEGER
%type <unit> commands command
%type <int> expression
%type <unit> program
%start program
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

expression :
|   IDENTIFIER                          { print_string ("\nIdentifier: " ^ ($1)); (1) }
|   INTEGER                             { print_string ("\nInteger: " ^ string_of_int($1)); ($1) }
|   expression MINUS expression         { print_string ("\nExpression: " ^ string_of_int($1) ^ " - " ^ string_of_int($3)); ($3) }