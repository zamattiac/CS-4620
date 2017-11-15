# PA4
# Group name: PIZZA
# Group members: Matthew Keitelman, Caymen Rexrode
#
mak2vr
cnr7ka

We also fixed missing aspects of PA3 including checking int equality and filename match.

Our test files for PA4 can be found in the OurTests folder, these include the given tests PA4bluedot.java, 
PA4DoubleDef.java, PA4MazeSolver.java, PA4NoDef.java, PA4raindrop.java, and our own test files PA4Test1.java 
which tests the function definition  and the creation of variables using an identifier for the PA4 grammar, 
PA4Test2.java which tests 'this' and the initialization of int variables using for the PA4 grammar, PA4Test3
which tests the less than operator, PA4Test4 which tests promoting bytes to ints, and finally PA4Test5 which
tests the toneStart statement for the PA4 grammar.

As for our file structure for PA4 we added files to create our symbol table.  These included SymTable.java, 
Scope.java, and STE.java.  Our symtable.java contains all of the functions needed to access and change information 
within the symbol table, these include lookupSymbol, lookupInnermostSymbol, lookupClass, lookupMethod, lookupVar,
lookupFormal, lookupInnermostVar, insertVar, insertFormal, insertMethod, insertClass, pushClassScope, 
pushMethodScope, and popScope.  Each of these functions utilized the Scope.java and STE.java files and their 
extensions.  STE is extended for Vars, Methods, and Classes, while scope is extended for Classes, Main, and 
Methods.  Within SymTable.java we implemented a check for undefined methods and classes. Also, we added a file 
that simulates a visitor for the SymTable.java file which goes through all of the information within the created 
symbol table and prints to a file with the proper symbol table format so that is can be easily read.  In addition 
to this, we edited our AVRgenVisitor to utilize the symbol table we have now created to get values and information 
concerning the input file.  For instance, it now uses the offset that is stored in the symbol table as well as the 
scoping information to appropriately generate the assembly code. 