{
    (* Preamble *)
    open Parse;;
    exception Eof;;
}

(* Token lexing *)

rule token = parse
|   _ as t      { INPUT t }
|   eof         { raise Eof }