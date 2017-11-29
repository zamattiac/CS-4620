
/*
 * MJDriver.java
 *
 * usage: 
 *   java MJ [ --two-pass-interpret | --two-pass-mips ] infile
 *
 * This driver either calls a MiniJava interpreter or generates MIPS
 * code to execute the MiniJava program.
 * The default is the interpreter.
 *
 */
import java.io.FileReader;

import java.io.FileWriter;
import java.io.PrintWriter;
// needed because we DON'T parse (see below)
import java_cup.runtime.*;

import mjparser.*;
import ast_visitors.*;
import ast.node.*;
import ast.visitor.*;
import symtable.*;
import exceptions.*;

public class MJDriver {

    private static void usage() {
        System.err.println("MJ: Specify input file in program arguments");
    }

    public static void main(String args[]) {

        if (args.length < 1) {
            usage();
            System.exit(1);
        }

        // filename should be the last command line option
        String filename = args[args.length - 1];

        try {
            // construct the lexer, 
            // the lexer will be the same for all of the parsers
            Yylex lexer = new Yylex(new FileReader(filename));

            mj parser = new mj(lexer);
            //parser.debug_parse();
            ////  create the parser
            int lastInPath = filename.lastIndexOf('/');
            parser.programName = filename.substring(lastInPath + 1);
            System.out.println("Driver finds input filename: " + parser.programName);

            // and parse to ast
            ast.node.Node ast_root = (ast.node.Node) parser.parse().value;

            // Main class must match program name
            MainClass mc = ((Program) ast_root).getMainClass();
            if (!(mc.getName() + ".java").equals(parser.programName)) {
                throw new SemanticException("Main class name must match program name", mc.getLine(), mc.getPos());
            }

            // print ast to file
            java.io.PrintStream astout = new java.io.PrintStream(new java.io.FileOutputStream(filename + ".ast.dot"));
            ast_root.accept(new DotVisitor(new PrintWriter(astout)));
            System.out.println("Printing AST to " + filename + ".ast.dot");

            //create the symbol table
            BuildSymTable stVisitor = new BuildSymTable();
            ast_root.accept(stVisitor);
            symtable.SymTable globalST = stVisitor.getSymTable();

            //print ast to file
            java.io.PrintStream STout = new java.io.PrintStream(new java.io.FileOutputStream(filename + ".ST.txt"));
            System.out.println("Printing symbol table to " + filename + ".ST.txt");
            globalST.outputDot(STout);

            //perform type checking 
            ast_root.accept(new CheckTypes(globalST));

            // //Determine whether to do register allocation or not.
            //           if ( args.length == 2 && args[0].equals("--regalloc") ) {
            //               //trying out register allocation
            //               AVRregAlloc regVisitor = new AVRregAlloc(globalST);
            //               ast_root.accept(regVisitor);
            //               
            //               //print info about temps to a file
            //               java.io.PrintStream asttempout =
            //                   new java.io.PrintStream(
            //                       new java.io.FileOutputStream(filename + ".ast.temp.dot"));
            //                 ast_root.accept(new DotVisitorWithMap(new PrintWriter(asttempout),
            //                         regVisitor.getTempMap()));
            //                 System.out.println("Printing AST to " + filename + ".ast.temp.dot");
            //             
            //           } else {
            //             //determine how to layout variables in AVR program
            //             ast_root.accept(new AVRallocVars(globalST));
            //           }

            // generate AVR code that evaluates the program
            java.io.PrintStream avrsout = new java.io.PrintStream(new java.io.FileOutputStream(filename + ".s"));
            ast_root.accept(new AVRgenVisitor(new PrintWriter(avrsout), globalST));
            System.out.println("Printing Atmel assembly to " + filename + ".s");

        } catch (exceptions.SemanticException e) {
            System.err.println(e.getMessage());
            System.exit(1);

        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }
    }

}
