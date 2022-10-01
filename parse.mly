%{
    (* Preamble *)    
%}

(* Terminal and non-terminal definitions *)
%token EOL
%token <string> INPUT IDENTIFIER
%token <int> INTEGER
%type <unit> program
%start program

%%

program :
    INPUT EOL       { print_string ("Unidentified: " ^ $1); () }
|   IDENTIFIER EOL  { print_string ("Identifier: " ^ $1); () }
|   INTEGER EOL     { print_string ("Integer: " ^ string_of_int($1)); () }