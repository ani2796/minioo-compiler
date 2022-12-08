open Stat_sem;;
open Small_steps;;
open Ast;;
open List;;
open Random;;
open Parsing;;

Random.init 100;;

let pretty_print_ast ast = (
  let _ = (print_string "\nPretty printing enhanced AST\n") in
  let _ = print_en_ast ast in
  let _ = (print_string "End of AST\n") in 
  let _ = (flush stdout) in
  ()
)
;;

let processor (ast: cmd list) (stack: stack_sd) (heap: heap_sd) =
  let en_ast = (scope_ast ast []) in
  let (final_cmd, final_value, final_stack, final_heap) = (get_final_cmd_state (eval_ast en_ast stack heap)) in
  let _ = (print_string "\n") in
  let _ = (print_string "Stack state:\n") in
  let _ = (print_stack final_stack) in
  let _ = (print_string "\n\nHeap state:\n") in
  let _ = (print_heap final_heap) in
  let _ = (print_string "\nResult value\n") in
  let _ = (print_value final_value) in
  let _ = (print_string "\n\n") in
  let _ = (flush stdout) in
  (final_cmd, final_value, final_stack, final_heap)


let lex_parse = 
  let old_ast = ref ([]: cmd list) in
  try while true do
    try let lexbuf = Lexing.from_channel stdin in
      let ast = Parse.program Lex.token lexbuf in
      let new_ast = !old_ast@ast in
      let _ = (old_ast := new_ast) in
      let _ = (refresh_object_counter ()) in
      let _ = (processor new_ast [] []) in
      ()
    with Lex.Eof -> (raise Exit)
  done with
  | Exit -> ()