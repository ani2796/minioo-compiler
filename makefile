LEXER=lex
PARSER=parse
EXEC=minioo
AST=ast
SD=semantic_domain

compile:	${LEXER}.mll ${PARSER}.mly ${AST}.ml ${SD}.ml ${EXEC}.ml
	
	ocamlc -c ${AST}.ml
	@echo "Generated ${AST}.cmo\n"

	ocamlc -c ${SD}.ml
	@echo "Generated ${SD}.cmo\n"

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
	ocamlc -c ${EXEC}.ml
	@echo "Generated ${EXEC}.cmo\n"
	ocamlc -o minioo ${AST}.cmo ${SD}.cmo ${LEXER}.cmo ${PARSER}.cmo ${EXEC}.cmo
	@echo "Generated final executable ./${EXEC}"

trace:	${LEXER}.mll ${PARSER}.mly ${AST}.ml ${SD}.ml ${EXEC}.ml

	ocamlc -c ${AST}.ml
	@echo "Generated ${AST}.cmo\n"

	ocamlc -c ${SD}.ml
	@echo "Generated ${SD}.cmo\n"

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
	ocamlc -c ${EXEC}.ml
	@echo "Generated ${EXEC}.cmo\n"
	ocamlc -o minioo ${AST}.cmo ${SD}.cmo ${LEXER}.cmo ${PARSER}.cmo ${EXEC}.cmo
	@echo "Generated final executable ./${EXEC}"

clean:
	rm -f *.cmo
	rm -f *.cmi
	rm -f ${LEXER}.ml ${PARSER}.ml ${PARSER}.mli
	rm -f ${EXEC}
