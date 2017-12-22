Author: Francisco Rovelo     

Index:  
    1.0 Running Code
        Executing 'make all' will compile all the source files and allow you to run source code.
        A script has been provided that will run spam.

        Just run something like:
            ./dpl yourcode.fran
                .fran is the file extension for this langauge because I'm conceded.

    2.0 Comments
        2.1 one line comments are declared with '#' and ended with a '#'
            # This is a comment about why Taco Casa is bad #

        2.2 multiline comments are declared with '#-->' and with '<--#'
            #-->
                Why do people
                            eat
                        at

                        that

                                            place????
            <--#


    3.0 Types
        There are 3 types in SPAM

             Strings
             Integers
             Booleans
             (null)

    4.0 Variables
        4.1 Assignment
            Variables are typless and defined using the "var" keyword
                var varExample = "fran";
                var varExample2 = 45;
        4.2 ReAssignment
            Then they can be assigned new values by using just their name:
                varExample2 = varExample2 + 1;

    5.0 Functions
        5.1
            Functions are first class objects. They can be assigned to variables and manipulated.
            An example of a function definition:
                define newFunction() {
                    println("HEY");
                }

        5.2
            Using this function as a variable:

            var fran = fibOf(3);
            fran();
            var fran2 = fibOf(fran());

    6.0 Anonymous 
        define useLambda() {
            return define () {
                println(":)");
            }
        }

    7.0 Built-in Functions
        print() - prints a value on the current line
        println() - prints a value on the current line then adds a new line
        length(object) - returns the length of a string or array
        add(array, item) - add an object to an array; objects get added to the back of the array
        remove(array, index) - remove an item from the index of an array

    8.0 Arrays
        Arrays are defined like this:
        var array = ["this", "is", "a", "array", 1000];
        var zero = 0;
        var tacocasa = ["This", "food", "is very", "bad.", "I give it a:", zero];
            Arrays can hold different types.

    9.0 Conditionals
        Here's an example of a conditional block:
        if (40 > 50) {
            println("Nope");
        } whatelse if (4 < 2) {
            println("Still nope");
        } whatelse {
            println("This will print!");
        }
    10.0  Loops
        10.1 While
            while (i <= 10) {
                print(i);
                i = i + 1;
            }
        #--> 10.2 For
            for( i = 0; i < 100; i++) {
                print(i);
            }
            Implemented but breaks terribly
        <--#

    11.0 Operators
        11.1 Conditional Operators
             '==' -> Check equality
             '!=' -> Check non equality
             '>' -> Greater than
             '<' -> Less than
             '>=' -> Greater than or equal to
             '<=' -> Less than or equal to

        11.2 Normal Operators
             '+' -> Addition
             '-' -> Subtraction
             '*' -> Multiplication
             '/' -> Division

             ~ not implemented yet(11/25/2017) :
             ~ '+=' -> subtraction assignment
             ~ '-=' -> subtraction assignment
             ~ '--' -> decrementer 
             ~ '++' -> incrementer
