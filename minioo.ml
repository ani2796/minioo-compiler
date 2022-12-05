open Stat_sem;;
open Small_steps;;
open Ast;;
open List;;

let enhanced_ast = scope_ast ast []
;;

print_string "Pretty printing enhanced AST\n";;
print_en_ast enhanced_ast;;
print_string "End of AST\n";;

let stack = [];;
let heap = [];;



(eval_ast enhanced_ast stack heap)
;;