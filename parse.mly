%{
    (* Preamble *)    
%}

(* Terminal and non-terminal definitions *)
%token EOL
%token <string> IDENTIFIER
%token <int> INTEGER
%type <unit> program ids_or_ints
%start program

%%

program : 
|   ids_or_ints EOL             { () }

ids_or_ints :
|   IDENTIFIER                  { print_string ("\nIdentifier: " ^ $1); () }
|   INTEGER                     { print_string ("\nInteger: " ^ string_of_int($1)); () }
|   ids_or_ints ids_or_ints     { () }