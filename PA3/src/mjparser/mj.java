
//----------------------------------------------------
// The following code was generated by CUP v0.11a beta 20060608
// Mon Oct 16 17:47:52 EDT 2017
//----------------------------------------------------

package mjparser;

import java_cup.runtime.*;
import java.util.*;
import java.io.PrintWriter;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.File;
import java.io.FileNotFoundException;
import ast.node.*;

/** CUP v0.11a beta 20060608 generated parser.
  * @version Mon Oct 16 17:47:52 EDT 2017
  */
public class mj extends java_cup.runtime.lr_parser {

  /** Default constructor. */
  public mj() {super();}

  /** Constructor which sets the default scanner. */
  public mj(java_cup.runtime.Scanner s) {super(s);}

  /** Constructor which sets the default scanner. */
  public mj(java_cup.runtime.Scanner s, java_cup.runtime.SymbolFactory sf) {super(s,sf);}

  /** Production table. */
  protected static final short _production_table[][] = 
    unpackFromStrings(new String[] {
    "\000\013\000\002\002\004\000\002\002\006\000\002\010" +
    "\002\000\002\007\022\000\002\004\005\000\002\006\004" +
    "\000\002\006\003\000\002\005\013\000\002\003\006\000" +
    "\002\003\003\000\002\003\003" });

  /** Access to production table. */
  public short[][] production_table() {return _production_table;}

  /** Parse-action table. */
  protected static final short[][] _action_table = 
    unpackFromStrings(new String[] {
    "\000\053\000\004\017\005\001\002\000\004\002\055\001" +
    "\002\000\004\046\006\001\002\000\004\044\007\001\002" +
    "\000\004\037\010\001\002\000\004\061\012\001\002\000" +
    "\004\002\000\001\002\000\004\011\013\001\002\000\004" +
    "\032\014\001\002\000\004\034\015\001\002\000\004\036" +
    "\016\001\002\000\004\016\017\001\002\000\004\007\020" +
    "\001\002\000\004\035\021\001\002\000\004\041\022\001" +
    "\002\000\004\042\023\001\002\000\004\061\024\001\002" +
    "\000\004\010\025\001\002\000\004\011\027\001\002\000" +
    "\004\012\uffff\001\002\000\004\052\032\001\002\000\006" +
    "\012\051\052\032\001\002\000\006\012\ufffb\052\ufffb\001" +
    "\002\000\004\007\033\001\002\000\010\007\036\060\035" +
    "\064\034\001\002\000\006\010\ufff7\027\ufff7\001\002\000" +
    "\006\010\ufff8\027\ufff8\001\002\000\004\015\046\001\002" +
    "\000\004\027\040\001\002\000\010\007\036\060\035\064" +
    "\034\001\002\000\004\027\042\001\002\000\010\007\036" +
    "\060\035\064\034\001\002\000\004\010\044\001\002\000" +
    "\004\044\045\001\002\000\006\012\ufffa\052\ufffa\001\002" +
    "\000\004\010\047\001\002\000\010\007\036\060\035\064" +
    "\034\001\002\000\006\010\ufff9\027\ufff9\001\002\000\004" +
    "\012\ufffd\001\002\000\006\012\ufffc\052\ufffc\001\002\000" +
    "\004\012\054\001\002\000\004\002\ufffe\001\002\000\004" +
    "\002\001\001\002" });

  /** Access to parse-action table. */
  public short[][] action_table() {return _action_table;}

  /** <code>reduce_goto</code> table. */
  protected static final short[][] _reduce_table = 
    unpackFromStrings(new String[] {
    "\000\053\000\004\002\003\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\004\007\010\001\001" +
    "\000\002\001\001\000\002\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\002\001\001\000\002\001\001" +
    "\000\004\004\025\001\001\000\004\010\052\001\001\000" +
    "\006\005\030\006\027\001\001\000\004\005\051\001\001" +
    "\000\002\001\001\000\002\001\001\000\004\003\036\001" +
    "\001\000\002\001\001\000\002\001\001\000\002\001\001" +
    "\000\002\001\001\000\004\003\040\001\001\000\002\001" +
    "\001\000\004\003\042\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\002\001\001\000\004\003" +
    "\047\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001" });

  /** Access to <code>reduce_goto</code> table. */
  public short[][] reduce_table() {return _reduce_table;}

  /** Instance of action encapsulation class. */
  protected CUP$mj$actions action_obj;

  /** Action encapsulation object initializer. */
  protected void init_actions()
    {
      action_obj = new CUP$mj$actions(this);
    }

  /** Invoke a user supplied parse action. */
  public java_cup.runtime.Symbol do_action(
    int                        act_num,
    java_cup.runtime.lr_parser parser,
    java.util.Stack            stack,
    int                        top)
    throws java.lang.Exception
  {
    /* call code in generated class */
    return action_obj.CUP$mj$do_action(act_num, parser, stack, top);
  }

  /** Indicates start state. */
  public int start_state() {return 0;}
  /** Indicates start production. */
  public int start_production() {return 0;}

  /** <code>EOF</code> Symbol index. */
  public int EOF_sym() {return 0;}

  /** <code>error</code> Symbol index. */
  public int error_sym() {return 1;}




    public PrintWriter out; 
    
    public String programName;

    public void unrecovered_syntax_error(Symbol cur_SymbolValue) {
        report_fatal_error("Fatal syntax error", cur_SymbolValue);
    }
    
    public void report_fatal_error(String message, Object info) {
        report_error(message, info);
        done_parsing();
        Symbol SymbolValue = (Symbol)info;
        mjparser.SymbolValue tok = (mjparser.SymbolValue)SymbolValue.value;
        throw new mjparser.ParseException("Fatal parsing error", 
                                          tok.line, tok.pos);
    }
    
    public void report_error(String message, Object info) {
        Symbol SymbolValue = (Symbol)info;
        mjparser.SymbolValue tok = (mjparser.SymbolValue)SymbolValue.value;
        System.err.println("[" + tok.line + "," + tok.pos + "] " 
                               + message + " at " + tok.toString() );
    }
            

}

/** Cup generated class to encapsulate user supplied action code.*/
class CUP$mj$actions {
  private final mj parser;

  /** Constructor */
  CUP$mj$actions(mj parser) {
    this.parser = parser;
  }

  /** Method with the actual generated action code. */
  public final java_cup.runtime.Symbol CUP$mj$do_action(
    int                        CUP$mj$act_num,
    java_cup.runtime.lr_parser CUP$mj$parser,
    java.util.Stack            CUP$mj$stack,
    int                        CUP$mj$top)
    throws java.lang.Exception
    {
      /* Symbol object for return from actions */
      java_cup.runtime.Symbol CUP$mj$result;

      /* select the action based on the action number */
      switch (CUP$mj$act_num)
        {
          /*. . . . . . . . . . . . . . . . . . . .*/
          case 10: // exp ::= COLOR_LITERAL 
            {
              IExp RESULT =null;
		int cleft = ((java_cup.runtime.Symbol)CUP$mj$stack.peek()).left;
		int cright = ((java_cup.runtime.Symbol)CUP$mj$stack.peek()).right;
		SymbolValue c = (SymbolValue)((java_cup.runtime.Symbol) CUP$mj$stack.peek()).value;
		 RESULT = new ColorLiteral(c.line, c.pos, c.lexeme, c.value); 
              CUP$mj$result = parser.getSymbolFactory().newSymbol("exp",1, ((java_cup.runtime.Symbol)CUP$mj$stack.peek()), ((java_cup.runtime.Symbol)CUP$mj$stack.peek()), RESULT);
            }
          return CUP$mj$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 9: // exp ::= INT_LITERAL 
            {
              IExp RESULT =null;
		int nleft = ((java_cup.runtime.Symbol)CUP$mj$stack.peek()).left;
		int nright = ((java_cup.runtime.Symbol)CUP$mj$stack.peek()).right;
		SymbolValue n = (SymbolValue)((java_cup.runtime.Symbol) CUP$mj$stack.peek()).value;
		 RESULT = new IntLiteral(n.line, n.pos, n.lexeme, n.value); 
              CUP$mj$result = parser.getSymbolFactory().newSymbol("exp",1, ((java_cup.runtime.Symbol)CUP$mj$stack.peek()), ((java_cup.runtime.Symbol)CUP$mj$stack.peek()), RESULT);
            }
          return CUP$mj$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 8: // exp ::= LPAREN BYTE RPAREN exp 
            {
              IExp RESULT =null;
		int opleft = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-2)).left;
		int opright = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-2)).right;
		SymbolValue op = (SymbolValue)((java_cup.runtime.Symbol) CUP$mj$stack.elementAt(CUP$mj$top-2)).value;
		int eleft = ((java_cup.runtime.Symbol)CUP$mj$stack.peek()).left;
		int eright = ((java_cup.runtime.Symbol)CUP$mj$stack.peek()).right;
		IExp e = (IExp)((java_cup.runtime.Symbol) CUP$mj$stack.peek()).value;
		 RESULT = new ByteCast(op.line, op.pos, e); 
              CUP$mj$result = parser.getSymbolFactory().newSymbol("exp",1, ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-3)), ((java_cup.runtime.Symbol)CUP$mj$stack.peek()), RESULT);
            }
          return CUP$mj$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 7: // statement ::= MEGGYSETPIXEL LPAREN exp COMMA exp COMMA exp RPAREN SEMI 
            {
              IStatement RESULT =null;
		int opleft = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-8)).left;
		int opright = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-8)).right;
		SymbolValue op = (SymbolValue)((java_cup.runtime.Symbol) CUP$mj$stack.elementAt(CUP$mj$top-8)).value;
		int aleft = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-6)).left;
		int aright = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-6)).right;
		IExp a = (IExp)((java_cup.runtime.Symbol) CUP$mj$stack.elementAt(CUP$mj$top-6)).value;
		int bleft = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-4)).left;
		int bright = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-4)).right;
		IExp b = (IExp)((java_cup.runtime.Symbol) CUP$mj$stack.elementAt(CUP$mj$top-4)).value;
		int cleft = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-2)).left;
		int cright = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-2)).right;
		IExp c = (IExp)((java_cup.runtime.Symbol) CUP$mj$stack.elementAt(CUP$mj$top-2)).value;
		 RESULT = new MeggySetPixel(op.line, op.pos, a, b, c); 
              CUP$mj$result = parser.getSymbolFactory().newSymbol("statement",3, ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-8)), ((java_cup.runtime.Symbol)CUP$mj$stack.peek()), RESULT);
            }
          return CUP$mj$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 6: // statement_list ::= statement 
            {
              ArrayList<IStatement> RESULT =null;
		int sleft = ((java_cup.runtime.Symbol)CUP$mj$stack.peek()).left;
		int sright = ((java_cup.runtime.Symbol)CUP$mj$stack.peek()).right;
		IStatement s = (IStatement)((java_cup.runtime.Symbol) CUP$mj$stack.peek()).value;
		 ArrayList<IStatement> l = new ArrayList<IStatement>(); l.add(s); RESULT = l; 
              CUP$mj$result = parser.getSymbolFactory().newSymbol("statement_list",4, ((java_cup.runtime.Symbol)CUP$mj$stack.peek()), ((java_cup.runtime.Symbol)CUP$mj$stack.peek()), RESULT);
            }
          return CUP$mj$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 5: // statement_list ::= statement_list statement 
            {
              ArrayList<IStatement> RESULT =null;
		int listleft = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-1)).left;
		int listright = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-1)).right;
		ArrayList<IStatement> list = (ArrayList<IStatement>)((java_cup.runtime.Symbol) CUP$mj$stack.elementAt(CUP$mj$top-1)).value;
		int sleft = ((java_cup.runtime.Symbol)CUP$mj$stack.peek()).left;
		int sright = ((java_cup.runtime.Symbol)CUP$mj$stack.peek()).right;
		IStatement s = (IStatement)((java_cup.runtime.Symbol) CUP$mj$stack.peek()).value;
		 list.add(s);
	 RESULT = list; 
              CUP$mj$result = parser.getSymbolFactory().newSymbol("statement_list",4, ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-1)), ((java_cup.runtime.Symbol)CUP$mj$stack.peek()), RESULT);
            }
          return CUP$mj$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 4: // block_statement ::= LBRACE statement_list RBRACE 
            {
              BlockStatement RESULT =null;
		int slistleft = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-1)).left;
		int slistright = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-1)).right;
		ArrayList<IStatement> slist = (ArrayList<IStatement>)((java_cup.runtime.Symbol) CUP$mj$stack.elementAt(CUP$mj$top-1)).value;
		 RESULT = new BlockStatement(0, 0, slist); 
              CUP$mj$result = parser.getSymbolFactory().newSymbol("block_statement",2, ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-2)), ((java_cup.runtime.Symbol)CUP$mj$stack.peek()), RESULT);
            }
          return CUP$mj$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 3: // main_class ::= CLASS ID LBRACE PUBLIC STATIC VOID MAIN LPAREN STRING LBRACKET RBRACKET ID RPAREN block_statement NT$0 RBRACE 
            {
              MainClass RESULT =null;
              // propagate RESULT from NT$0
                RESULT = (MainClass) ((java_cup.runtime.Symbol) CUP$mj$stack.elementAt(CUP$mj$top-1)).value;
		int nameleft = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-14)).left;
		int nameright = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-14)).right;
		SymbolValue name = (SymbolValue)((java_cup.runtime.Symbol) CUP$mj$stack.elementAt(CUP$mj$top-14)).value;
		int paramleft = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-4)).left;
		int paramright = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-4)).right;
		SymbolValue param = (SymbolValue)((java_cup.runtime.Symbol) CUP$mj$stack.elementAt(CUP$mj$top-4)).value;
		int blkleft = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-2)).left;
		int blkright = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-2)).right;
		BlockStatement blk = (BlockStatement)((java_cup.runtime.Symbol) CUP$mj$stack.elementAt(CUP$mj$top-2)).value;
		
            parser.out.flush();
          
              CUP$mj$result = parser.getSymbolFactory().newSymbol("main_class",5, ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-15)), ((java_cup.runtime.Symbol)CUP$mj$stack.peek()), RESULT);
            }
          return CUP$mj$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 2: // NT$0 ::= 
            {
              MainClass RESULT =null;
		int nameleft = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-12)).left;
		int nameright = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-12)).right;
		SymbolValue name = (SymbolValue)((java_cup.runtime.Symbol) CUP$mj$stack.elementAt(CUP$mj$top-12)).value;
		int paramleft = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-2)).left;
		int paramright = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-2)).right;
		SymbolValue param = (SymbolValue)((java_cup.runtime.Symbol) CUP$mj$stack.elementAt(CUP$mj$top-2)).value;
		int blkleft = ((java_cup.runtime.Symbol)CUP$mj$stack.peek()).left;
		int blkright = ((java_cup.runtime.Symbol)CUP$mj$stack.peek()).right;
		BlockStatement blk = (BlockStatement)((java_cup.runtime.Symbol) CUP$mj$stack.peek()).value;

          	RESULT = new MainClass(0, 0, name.lexeme, param.lexeme, blk);
          
              CUP$mj$result = parser.getSymbolFactory().newSymbol("NT$0",6, ((java_cup.runtime.Symbol)CUP$mj$stack.peek()), ((java_cup.runtime.Symbol)CUP$mj$stack.peek()), RESULT);
            }
          return CUP$mj$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 1: // program ::= IMPORT MEGGY SEMI main_class 
            {
              Object RESULT =null;

              CUP$mj$result = parser.getSymbolFactory().newSymbol("program",0, ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-3)), ((java_cup.runtime.Symbol)CUP$mj$stack.peek()), RESULT);
            }
          return CUP$mj$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 0: // $START ::= program EOF 
            {
              Object RESULT =null;
		int start_valleft = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-1)).left;
		int start_valright = ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-1)).right;
		Object start_val = (Object)((java_cup.runtime.Symbol) CUP$mj$stack.elementAt(CUP$mj$top-1)).value;
		RESULT = start_val;
              CUP$mj$result = parser.getSymbolFactory().newSymbol("$START",0, ((java_cup.runtime.Symbol)CUP$mj$stack.elementAt(CUP$mj$top-1)), ((java_cup.runtime.Symbol)CUP$mj$stack.peek()), RESULT);
            }
          /* ACCEPT */
          CUP$mj$parser.done_parsing();
          return CUP$mj$result;

          /* . . . . . .*/
          default:
            throw new Exception(
               "Invalid action number found in internal parse table");

        }
    }
}

