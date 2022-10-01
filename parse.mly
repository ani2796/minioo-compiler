%{
    (* Preamble *)    
%}

(* Terminal and non-terminal definitions *)
%token <char> INPUT
%type <unit> program
%start program

%%

program :
    INPUT { () }