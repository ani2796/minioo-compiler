%token FOO
%token NEWLINE
%token <string> OTHER
%type <unit> prog
%type <unit> cmd
%start prog

%%

prog :
    cmd {}
    
cmd :
    FOO NEWLINE cmd { print_string "recursing"; () }
|   FOO NEWLINE { print_string "final foo"; () }
%%