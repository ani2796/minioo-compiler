{
    (* Preamble *)
    open Parse;;
    exception Eof;;
}

(* Some definitions *)
let digit = ['0'-'9']
let upper = ['A'-'Z']
let lower = ['a'-'z']
let char = (upper | lower)

(* Token lexing *)

rule token = parse
|   '\n'                        { EOL }
|   char (char|digit)* as id    { IDENTIFIER id }
|   digit+ as integer           { INTEGER (int_of_string(integer)) }
|   [^'\n']* as input           { INPUT input; }
|   eof                         { raise Eof }