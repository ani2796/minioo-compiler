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

type proc = {
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

type decl = {
  id: string;
}

type asmt = {
  id: string;
  value: string;
}

type field_asmt = {
  field: string;
  value: string;
}

type malloc = {
  id: string;
}