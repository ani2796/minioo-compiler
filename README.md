# minioo-compiler

## Usage

Once changes have been made, use the default `compile` rule in the makefile to build
using ocaml (>= 4.14.0) and menhir (>= 20220210):

```
make compile
```

To delete generated output files, use the `clean` rule. WARNING: This rule also deletes intermediate
files generated as part of the `compile` rule:

```
make clean
```