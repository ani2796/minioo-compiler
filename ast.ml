type cmd = 
| Cmds of int * cmd
| Cmd of int

let rec indent num = match num with
| 0 -> ()
| n -> print_string " "; (indent (num - 1))

let rec num_cmds c i = match c with 
| Cmds (c1, c2) -> (indent i); (print_string (string_of_int(c1) ^ "\n")); (1 + (num_cmds c2 (i)))
| Cmd c -> (indent i); (print_string (string_of_int(c) ^ "\n")); (1)
;;