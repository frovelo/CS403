Author: Francisco Rovelo
About: 
    This is a c++ styled DPL
    So inside joke-> I originally had all builtin functions(while, for etc) 
    named as foods such as 'tacos','burritos' becuase in your 201 class I would
    name random variables in my code as food items... in hindsight it wasnt as funny
    as my group of friends made it out to be... But I didn't do that because you probably
    would have failed me if you had to initialize variables like:
        tacos arr = [....];
        burrito x = 3;
        tacosauce(1) {
            println("tacos are amazing");
        }

My rant and comments:
    Bare with me->
    I barely knew Java but everyone told me to write it in Java because it was "easier" and "10/10 would recommend writing it in Java"
    but Jesus H. Christ, Eclipse is trash so I wrote this all in Notepad++. It probably looks like cancer but who the heck decided that
    printing should be this huge statement: system.out.println("WHY IS IT LIKE THIS") like idk why not make it just println("....")...
    OHHHH!!! and reading in-> It took me like an hour just to find what "PushbackReader" does in layman terms. 
    PushbackReader -> 
        "A character-stream reader that allows characters to be pushed back into the stream."
    Why not just be like->"It's kind of the equivalant to ungetwc in c++ or something like..."

    But, biting my cheek... It was easier than how far I got in my c++ version of this. I guess im just stubborn and want to code in
    c++ all my life.... even though Java lets you do case statements with strings which I didn't find out until like 2 weeks into 
    writing this so I had nested if statements when I could've just done a switch... so thats nice I guess... And the memory
    management.. Which I guess is good and as a programmar, technically, memory management is important but like my gaming PC has 64GBs
    of RAM so like memory leaks dont really bother me but I guess people using a Mac and stuck with like 8GBs and it's propietary and 
    you can't change anything so they need to worry about memory management... even though I use a Mac but that's only because the 
    battery life last like 2 weeks.

    Anyway, Dr. J i've enjoyed having you as a teacher and I transferred in from another, smaller school and can def. say I've learned 
    more here and from you then I did there. Especially in regards to programming. I didn't even know what a terniary operator was before I came here(Though, is that such a bad thing?).

    So, if you've made it this far then, nice, you probably realized I'm drunk ranting so I'm amazed you're still reading so here's the 
    index of how this stuff works(it may or may not be the updated to match the syntax of my code, yikes, no im kidding it is):

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