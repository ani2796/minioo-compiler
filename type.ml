(*
  Expressions   
*)

type iden = {
  id: string;
  value: string;
}

type field = {
  id: string;
}

type proc_arg = {
  arg: string;
} 

type loc_expr = {
  obj: string;
  field: string;
}

type minus_expr = {
  arg1: string;
  arg2: string;
}

(*
  Commands   
*)

type asmt = {
  id: string;
  value: string;
}

type field_asmt = {
  obj: string;
  field: string;
  value: string;
}

type malloc = {
  id: string;
}

type proc_call = {
  id: string;
  arg: string;
}