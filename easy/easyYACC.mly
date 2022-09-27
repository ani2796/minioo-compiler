%{
    open Printf;;
%}

%token < string > ID
%start id_start
%type < string > id_start

%%

id_start:
    ID { printf "ID string: %s" $1; $1}

%%