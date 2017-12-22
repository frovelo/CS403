
all: Lexeme.class Lexer.class Parser.class Environment.class Evaluator.class Main.class
	chmod 755 dpl

Lexeme.class: Lexeme.java
	javac Lexeme.java

Lexer.class: Lexer.java
	javac Lexer.java

Parser.class: Parser.java
	javac Parser.java

Environment.class: Environment.java
	javac Environment.java

Evaluator.class: Evaluator.java
	javac Evaluator.java

Main.class: Main.java
	javac Main.java

clean:
	rm -f *.class

error1:
	cat test/error1.fran
error1x:
	./dpl test/error1.fran

error2:
	cat test/error2.fran
error2x:
	./dpl test/error2.fran

error3:
	cat test/error3.fran
error3x:
	./dpl test/error3.fran

error4:
	cat test/error4.fran
error4x:
	./dpl test/error4.fran

arrays:
	cat test/arrays.fran
arraysx:
	./dpl test/arrays.fran

conditionals:
	cat test/conditionals.fran
conditionalsx:
	./dpl test/conditionals.fran

operators:
	cat test/operators.fran
operatorsx:
	./dpl test/operators.fran

recursion:
	cat test/recursion.fran
recursionx:
	./dpl test/recursion.fran

iteration:
	cat test/iteration.fran
iterationx:
	./dpl test/iteration.fran

functions:
	cat test/functions.fran
functionsx:
	./dpl test/functions.fran

lambda:
	cat test/lambda.fran
lambdax:
	./dpl test/lambda.fran

dictionary:
	cat test/dictionary.fran
dictionaryx:
	./dpl test/dictionary.fran

problem:
	cat test/problem.fran
problemx:
	./dpl test/problem.fran
