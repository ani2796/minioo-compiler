{
    open TestYACC;;
}

let CHAR = ['a'-'z'] | ['A'-'Z'] | ['0'-'9']

rule foo_rule = parse
| "foo" as x { print_string "Lexed\n"; FOO }
| CHAR* as y { print_string "WRONG!\n"; OTHER y }
| '\n' { print_string "newline...\n"; NEWLINE }