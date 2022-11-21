%{
    (* Preamble *)
    open Type;;
    open Ast;;
%}

(* Terminal and non-terminal definitions *)
%token EOL SEMICOLON COLON ASSIGN DOT PARALLEL
%token GREATER GREATER_EQ LESSER LESSER_EQ EQUALS
%token<char> PLUS_MINUS TIMES_BY
%token LEFT_PAREN RIGHT_PAREN LEFT_CURLY RIGHT_CURLY
%token VAR NULL PROC TRUE FALSE IF ELSE WHILE MALLOC SKIP ATOM
%token <string> IDENTIFIER FIELD
%token <int> INTEGER

%type <Ast.cmd list> program
%type <Ast.cmd> if_else loop
%type <bln> boolean
%type <Ast.cmd list> commands block
%type <Ast.cmd list> command
%type <Ast.expr> expression

(* Start symbol *)
%start program

(* Operator precendence and associativity *)
%left PLUS_MINUS
%left TIMES_BY
%left DOT

%%
(* Context-free Grammar *)

program : 
|   cs = commands EOL                                               { cs }

commands :              
|   c1s = command SEMICOLON c2s = commands                          { (c1s@c2s) }
|   c = command                                                     { c }
|   c = command SEMICOLON                                           { c }

command :
(* Declaration and assignment must be done separately *)
|   VAR id = IDENTIFIER                                             { [Decl (Id id)] }
|   id = IDENTIFIER ASSIGN expr = expression                        { [Asmt (Id id, expr)] }
|   e1 = expression LEFT_PAREN e2 = expression RIGHT_PAREN          { [ProcCall (e1, e2)] }
|   e1 = expression DOT e2 = expression ASSIGN e3 = expression      { [FieldAsmt (e1, e2, e3)] }
|   MALLOC LEFT_PAREN id = IDENTIFIER RIGHT_PAREN                   { [Malloc (Id id)] }
|   SKIP                                                            { [Skip] }
|   b = block                                                       { [Block b] }
|   c1 = block PARALLEL c2 = block                                  { [Parallel (c1, c2)] }
|   ATOM c = block RIGHT_PAREN                                      { [Atom (c)] }
|   ie = if_else                                                    { [ie] }
|   l = loop                                                        { [l] }

expression :
|   NULL                                                            { Null }
|   PROC arg = IDENTIFIER COLON b = block                           { Proc (Id arg, b) }
|   id = IDENTIFIER                                                 { Id id }
|   f = FIELD                                                       { Field f }
|   e1 = expression DOT e2 = expression                             { LocExpr (e1, e2) }
|   i = INTEGER                                                     { Int i }
|   LEFT_PAREN e = expression RIGHT_PAREN                           { e }
|   e1 = expression op = PLUS_MINUS e2 = expression                 { ArithExpr (op, e1, e2) }
|   e1 = expression op = TIMES_BY e2 = expression                   { ArithExpr (op, e1, e2) }

boolean :
|   TRUE                                                            { True }
|   FALSE                                                           { False }
|   e1 = expression op = EQUALS e2 = expression                     { BoolExpr (Equals, e1, e2) }
|   e1 = expression op = GREATER e2 = expression                    { BoolExpr (Greater, e1, e2) }
|   LEFT_PAREN b = boolean RIGHT_PAREN                              { b }

(* To avoid parsing ambiguity of dangling statements, each block is delimited by curly braces *)
block :
|   LEFT_CURLY cs = commands RIGHT_CURLY                            { cs }

if_else :
|   IF b = boolean b1 = block ELSE b2 = block                       { IfElse (b, b1, b2) }

loop :
|   WHILE b = boolean b1 = block                                    { Loop (b, b1) }