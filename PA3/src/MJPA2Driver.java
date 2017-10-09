/*
 * MJDriver.java for just the scanner
 *
 */
import java.io.FileReader;

import java.io.FileWriter;
import java.io.PrintWriter;
// needed because we DON'T parse (see below)
import java_cup.runtime.*;

import mjparser.*;
//import ast_visitors.*;

public class MJPA2Driver {

      private static void usage() {
          System.err.println(
            "MJPA2: Specify input file in program arguments");
      }
      
      public static java_cup.runtime.Symbol getNextToken(Yylex lexer) throws Exception {
      	java_cup.runtime.Symbol symbol = lexer.next_token();
      	System.out.print("symbol: " + symbol + "  symbolValue: ");
              if(symbol.value!=null) {
                SymbolValue symval = (SymbolValue)symbol.value;
                System.out.println(" [" + symval.lexeme + "]");
              } else {
                System.out.println(" null value");
              }
    	return symbol;
      } 
     
      public static void main(String args[]) 
      {
        
        if(args.length < 1)
        {         
            usage();
            System.exit(1);
        }

        // filename should be the last command line option
        String filename = args[args.length-1];
        
        String prologue = "    .file  \"main.java\"\n__SREG__ = 0x3f\n__SP_H__ = 0x3e\n__SP_L__ = 0x3d\n__tmp_reg__ = 0\n__zero_reg__ = 1\n    .global __do_copy_data\n    .global __do_clear_bss\n    .text\n.global main\n    .type   main, @function\nmain:\n    push r29\n    push r28\n    in r28,__SP_L__\n    in r29,__SP_H__\n/* prologue: function */\n    call _Z18MeggyJrSimpleSetupv \n    /* Need to call this so that the meggy library gets set up */\n";
        String epilogue = "\n\n/* epilogue start */\n    endLabel:\n    jmp endLabel\n    ret\n    .size   main, .-main\n\n";
        

        try {
        // Assembly outfile
          PrintWriter outfile = new PrintWriter(new FileWriter(filename + ".s"));
          outfile.print(prologue);

          // construct the lexer, 
          // the lexer will be the same for all of the parsers
          Yylex lexer = new Yylex(new FileReader(filename));
          
          // Lines of AVR to fill out
          String line = "";
          
          // Exercise the lexer: print out all of the tokens 
          java_cup.runtime.Symbol symbol = getNextToken(lexer);
          while (symbol.sym != sym.EOF) {
    		  if (symbol.sym == 40) {
    		    line += "\tldi r24,lo8(";
    		      for (int i = 0; i < 4; i++) getNextToken(lexer);
    		      String s = getNextToken(lexer).value.toString();
    		      line += s.substring(s.lastIndexOf("value:")+7,s.length()) + ")\n\tldi r22, lo8(";
    		      for (int i = 0; i < 4; i++) getNextToken(lexer);
    		      s = getNextToken(lexer).value.toString();
    		      line += s.substring(s.lastIndexOf("value:")+7,s.length()) + ")\n\tldi r20, lo8(";
    		      getNextToken(lexer);
    		      s = getNextToken(lexer).value.toString();
    		      line += s.substring(s.lastIndexOf("value:")+7,s.length()) + ")\n\tcall   _Z6DrawPxhhh\n\tcall   _Z12DisplaySlatev\n";
    		  }
              symbol = getNextToken(lexer);
          }
          outfile.print(line);
          outfile.print(epilogue);
          outfile.close();
          
        }catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }  
      }

}
