LEXER=lex
PARSER=parse
STAT_SEM = stat_sem
EXEC=minioo
AST=ast

compile:	${LEXER}.mll ${PARSER}.mly ${AST}.ml ${STAT_SEM}.ml ${EXEC}.ml
	
	ocamlc -c ${AST}.ml
	@echo "Generated ${AST}.cmo\n"

	ocamllex ${LEXER}.mll
	@echo "Generated ${LEXER}.ml"
	menhir ${PARSER}.mly
	@echo "Generated ${PARSER}.ml, ${PARSER}.mli\n"

	ocamlc -c ${PARSER}.mli	
	@echo "Generated ${PARSER}.cmi\n"

	ocamlc -c ${LEXER}.ml 
	@echo "Generated ${LEXER}.cmo\n"
	ocamlc -c ${PARSER}.ml 
	@echo "Generated ${PARSER}.cmo\n"
	ocamlc -c ${STAT_SEM}.ml
	@echo "Generated ${STAT_SEM}.cmo\n"
	ocamlc -c ${EXEC}.ml
	@echo "Generated ${EXEC}.cmo\n"
	ocamlc -o minioo ${AST}.cmo ${LEXER}.cmo ${PARSER}.cmo ${STAT_SEM}.cmo ${EXEC}.cmo
	@echo "Generated final executable ./${EXEC}"

trace:	${LEXER}.mll ${PARSER}.mly ${AST}.ml ${EXEC}.ml

	ocamlc -c ${AST}.ml
	@echo "Generated ${AST}.cmo\n"

	ocamllex ${LEXER}.mll
	@echo "Generated ${LEXER}.ml"
	menhir --explain ${PARSER}.mly
	@echo "Generated ${PARSER}.ml, ${PARSER}.mli\n"

	ocamlc -c ${PARSER}.mli	
	@echo "Generated ${PARSER}.cmi\n"

	ocamlc -c ${LEXER}.ml 
	@echo "Generated ${LEXER}.cmo\n"
	ocamlc -c ${PARSER}.ml 
	@echo "Generated ${PARSER}.cmo\n"
	ocamlc -c ${STAT_SEM}.ml
	@echo "Generated ${STAT_SEM}.cmo\n"
	ocamlc -c ${EXEC}.ml
	@echo "Generated ${EXEC}.cmo\n"
	ocamlc -o minioo ${AST}.cmo ${LEXER}.cmo ${PARSER}.cmo ${STAT_SEM}.cmo ${EXEC}.cmo
	@echo "Generated final executable ./${EXEC}"

clean:
	rm -f *.cmo
	rm -f *.cmi
	rm -f ${LEXER}.ml ${PARSER}.ml ${PARSER}.mli
	rm -f ${EXEC}
