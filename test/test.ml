open Parsing;;

try
  let file = "test_test" in
    let in_channel = open_in file in
      let lexbuf = Lexing.from_channel in_channel in 
        while true do
          try
            TestYACC.prog TestLEX.foo_rule lexbuf
          with Parse_error ->
            print_string "syntax error...";
          clear_parser ()
          done
  with End_of_file -> ()