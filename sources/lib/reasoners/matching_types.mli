(******************************************************************************)
(*                                                                            *)
(*     The Alt-Ergo theorem prover                                            *)
(*     Copyright (C) 2006-2013                                                *)
(*                                                                            *)
(*     Sylvain Conchon                                                        *)
(*     Evelyne Contejean                                                      *)
(*                                                                            *)
(*     Francois Bobot                                                         *)
(*     Mohamed Iguernelala                                                    *)
(*     Stephane Lescuyer                                                      *)
(*     Alain Mebsout                                                          *)
(*                                                                            *)
(*     CNRS - INRIA - Universite Paris Sud                                    *)
(*                                                                            *)
(*     This file is distributed under the terms of the Apache Software        *)
(*     License version 2.0                                                    *)
(*                                                                            *)
(*  ------------------------------------------------------------------------  *)
(*                                                                            *)
(*     Alt-Ergo: The SMT Solver For Software Verification                     *)
(*     Copyright (C) 2013-2017 --- OCamlPro SAS                               *)
(*                                                                            *)
(*     This file is distributed under the terms of the Apache Software        *)
(*     License version 2.0                                                    *)
(*                                                                            *)
(******************************************************************************)

type gsubst = {
  sbs : Term.t Term.Subst.t;
  sty : Ty.subst;
  gen : int ;     (* l'age d'une substitution est l'age du plus vieux
		     terme qu'elle contient *)
  goal : bool;    (* vrai si la substitution contient un terme ayant un lien
		     avec le but de la PO *)
  s_term_orig : Term.t list;
  s_lem_orig : Formula.t;
}

type trigger_info = {
  trigger : Formula.trigger;
  trigger_age : int ;  (* age d'un trigger *)
  trigger_orig : Formula.t ; (* lemme d'origine *)
  trigger_formula : Formula.t ; (* formule associee au trigger *)
  trigger_dep : Explanation.t ;
}

type term_info = {
  term_age : int ;        (* age du terme *)
  term_from_goal : bool ;   (* vrai si le terme provient du but de la PO *)
  term_from_formula : Formula.t option; (* lemme d'origine du terme *)
  term_from_terms : Term.t list;
}

type info = {
  age : int ; (* age du terme *)
  lem_orig : Formula.t list ; (* lemme d'ou provient eventuellement le terme *)
  t_orig : Term.t list;
  but : bool  (* le terme a-t-il un lien avec le but final de la PO *)
}

