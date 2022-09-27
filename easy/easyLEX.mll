{
    open EasyYACC;;
    exception Eof;;
}

let digit = ['0'-'9']
let character = ['a'-'z']|['A'-'Z']
let id = (character)(character | digit)*

rule token = parse
|   id as ID    { printf "Input ID: %s\n" ID; }
|   eof         { raise Eof }