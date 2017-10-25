/**
 * This ast walker generates dot output for the AST.  
 *
 * 6/06 - Modified from Brian Richard's ParserTest.Java.
 *        Michelle Strout
 */
package ast_visitors;

import java.io.PrintWriter;
import java.util.Stack;

import java.io.*;
import java.lang.*;

import ast.visitor.DepthFirstVisitor;
import ast.node.*;

/**
 * We extend the DepthFirstAdapter.  
 * Visitors invoke a defaultCase method on each node they visit.  
 * We override this method so that it
 * prints out dot info about a node.
 */
public class AVRgenVisitor extends DepthFirstVisitor {
   private int nodeCount = 0;
   // Assembly jump labels
   private int labelCount = 1;
   private Stack<String> labels = new Stack<String>();
   private PrintWriter out;
   private Stack<Integer> nodeStack;
   
   // Keep epilog from printing twice
   private boolean notPrinted = true;
   
   public void print(String s) {
   		out.println("    " + s);
   }
   
   public void printLabel(String s) {
   		out.println(s);
   }
   
   // Assign an assembly label number using the labelCount
   public String getLabel() {
   		String ret = String.valueOf(labelCount);
   		labelCount++;
   		return ret;
   }
   
   /** Constructor takes a PrintWriter, and stores in instance var. */
   public AVRgenVisitor(PrintWriter out) {
      this.out = out;
      this.nodeStack = new Stack<Integer>();
   }

   
   /** Upon entering each node in AST, check of this node is the root
   to generate start of .dot file, output the dot output for the node.
   */
   public void defaultIn(Node node) {
       if (nodeStack.empty()) {
            System.out.println("Generate prolog using avrH.rtl.s");
            InputStream mainPrologue=null;
            BufferedReader reader=null;
            try {
                // The syntax for loading a text resource file 
                // from a jar file here:
                // http://www.rgagnon.com/javadetails/java-0077.html
                mainPrologue 
                    = this.getClass().getClassLoader().getResourceAsStream(
                        "avrH.rtl.s");
                reader = new BufferedReader(new 
                    InputStreamReader(mainPrologue));

                String line = null;
                while ((line = reader.readLine()) != null) {
                  out.println(line);
                }
            } catch ( Exception e2) {
                e2.printStackTrace();
            }
            finally{
                try{
                    if(mainPrologue!=null) mainPrologue.close();
                    if(reader!=null) reader.close();
                }
                catch (IOException e) {
                   e.printStackTrace();
                }
            }
       }
//        nodeDescend(node);
       
       // store this node id on the nodeStack
       // the call to nodeDotOutput increments for
       // the next guy so we have to decrement here
       nodeStack.push(nodeCount-1);    
   }
   
   // Check for the root again - print the epilog of the assembly code to the file
   public void defaultOut(Node node) {
       nodeStack.pop();
       if (nodeStack.empty() && notPrinted) {
			System.out.println("Generate epilog using avrF.rtl.s");
            InputStream mainPrologue=null;
            BufferedReader reader=null;
            try {
                // The syntax for loading a text resource file 
                // from a jar file here:
                // http://www.rgagnon.com/javadetails/java-0077.html
                mainPrologue 
                    = this.getClass().getClassLoader().getResourceAsStream(
                        "avrF.rtl.s");
                reader = new BufferedReader(new 
                    InputStreamReader(mainPrologue));

                String line = null;
                while ((line = reader.readLine()) != null) {
                  out.println(line);
                }
            } catch ( Exception e2) {
                e2.printStackTrace();
            }
            finally{
                try{
                    if(mainPrologue!=null) mainPrologue.close();
                    if(reader!=null) reader.close();
                }
                catch (IOException e) {
                   e.printStackTrace();
                }
            }
        notPrinted = false;
       }
       out.flush();
   }
   
   /*
   
   		Meggy Statements
   
   */
   
   public void inBlockStatement(BlockStatement node) {
   		String label = getLabel();
   		print("# Block body");
   		printLabel(label + ":");
   }

	public void outMeggySetPixel(MeggySetPixel node) {
		// Pop the bytes from color, y, x into the param registers
		// r25 is used as a dummy register for the high bytes of each value (= 0)
		print("/* Meggy Set Pixel */");
		print("pop r20");
		print("pop r25");
		print("pop r22");
		print("pop r25");
		print("pop r24");	
		print("pop r25");	
// 		out.println("ldi r24, lo8(" + node.getXExp() + ")");
// 		out.println("ldi r22, lo8(" + node.getYExp() + ")");
// 		out.println("ldi r20, lo8(" + node.getColor() + ")");
		print("call   _Z6DrawPxhhh");
    	print("call   _Z12DisplaySlatev");
	}
	
	public void outMeggyDelay(MeggyDelay node) {
		// Pop the bytes from color, y, x into the param registers
		// r25 is used as a dummy register for the high bytes of each value (= 0)
		print("### Meggy Delay function");
		print("# Load parameter - 2 byte expression off stack");
		print("pop    r24");
    	print("pop    r25");
    	print("call   _Z8delay_msj");

	}
	
	/*
	
		Conditional statements
		
	*/
	
	public void inWhileStatement(WhileStatement node) {
		String l0 = getLabel();
		labels.push(l0);
		print("#### while statement");
		printLabel("MJ_L" + l0 + ":");
		print("");
	}
	
	public void outWhileStatement(WhileStatement node) {
		print("# jump to while test");
		print("    jmp    MJ_L" + labels.pop());
		print("");
		print("    # end of while");
		print("MJ_L2:");
		print("");
	}
	
	
	
// 	public void outIfStatement(IfStatement node) {
// 		// Pop the bytes from color, y, x into the param registers
// 		// r25 is used as a dummy register for the high bytes of each value (= 0)
// 		print("### Meggy Delay function");
// 		print("# Load parameter - 2 byte expression off stack");
// 		print("pop    r24");
//     	print("pop    r25");
//     	print("call   _Z8delay_msj");
// 
// 	}

/*

		Logical / mathematical operations

*/
	public void outPlusExp(PlusExp node) {
		print("# Do add operation");
		print("    add    r24, r18");
		print("    adc    r25, r19");
		print("    # push two byte expression onto stack");
		print("    push   r25");
		print("    push   r24");
		print("");
	}
	
	public void outMinusExp(MinusExp node) {
		print("# Do INT sub operation");
		print("    sub    r24, r18");
		print("    sbc    r25, r19");
		print("    # push hi order byte first");
		print("    # push two byte expression onto stack");
		print("    push   r25");
		print("    push   r24");
		print("");
	}

	public void outMulExp(MulExp node) {
		print("# MulExp");
		print("    # load a one byte expression off stack");
		print("    pop    r18");
		print("    # load a one byte expression off stack");
		print("    pop    r22");
		print("    # move low byte src into dest reg");
		print("    mov    r24, r18");
		print("    # move low byte src into dest reg");
		print("    mov    r26, r22");
		print("");
		print("    # Do mul operation of two input bytes");
		print("    muls   r24, r26");
		print("    # push two byte expression onto stack");
		print("    push   r1");
		print("    push   r0");
		print("    # clear r0 and r1, thanks Brendan!");
		print("    eor    r0,r0");
		print("    eor    r1,r1");
		print("");
	}

	public void outEqualExp(EqualExp node) {
		String l3 = getLabel();
		String l4 = getLabel();
		String l5 = getLabel();
		print("# equality check expression");
		print("    # load a two byte expression off stack");
		print("    pop    r18");
		print("    pop    r19");
		print("    # load a two byte expression off stack");
		print("    pop    r24");
		print("    pop    r25");
		print("    cp    r24, r18");
		print("    cpc   r25, r19");
		print("    breq MJ_L" + l4);
		print("");
		print("    # result is false");
		printLabel("MJ_L" + l3 + ":");
		print("    ldi     r24, 0");
		print("    jmp      MJ_L" + l5);
		print("");
		print("    # result is true");
		printLabel("MJ_L" + l4 + ":");
		print("    ldi     r24, 1");
		print("");
		print("    # store result of equal expression");
		printLabel("MJ_L" + l5 + ":");
		print("    # push one byte expression onto stack");
		print("    push   r24");
		print("");
		print("    # load condition and branch if false");
		print("    # load a one byte expression off stack");
		print("    pop    r24");
		print("    #load zero into reg");
		print("    ldi    r25, 0");
		print("");
		print("    #use cp to set SREG");
		print("    cp     r24, r25");
		print("");
	}

	public void outAndExp(AndExp node) {
		String l3 = getLabel();
		String l4 = getLabel();
		print("#### short-circuited && operation");
		print("    # &&: left operand");
		print("");
		print("    # True/1 expression");
		print("    ldi    r22, 1");
		print("    # push one byte expression onto stack");
		print("    push   r22");
		print("");
		print("    # &&: if left operand is false do not eval right");
		print("    # load a one byte expression off stack");
		print("    pop    r24");
		print("    # push one byte expression onto stack");
		print("    push   r24");
		print("    # compare left exp with zero");
		print("    ldi r25, 0");
		print("    cp    r24, r25");
		print("    # Want this, breq MJ_L3");
		print("    brne  MJ_L" + l4);
		print("    jmp   MJ_L" + l3);
		print("");
		printLabel("MJ_L" + l4 + ":");
		print("    # right operand");
		print("    # load a one byte expression off stack");
		print("    pop    r24");
		print("");
		print("    # True/1 expression");
		print("    ldi    r22, 1");
		print("    # push one byte expression onto stack");
		print("    push   r22");
		print("    # load a one byte expression off stack");
		print("    pop    r24");
		print("    # push one byte expression onto stack");
		print("    push   r24");
		print("");
		printLabel("MJ_L" + l3 + ":");
		print("");
		print("    # load condition and branch if false");
		print("    # load a one byte expression off stack");
		print("    pop    r24");
		print("    #load zero into reg");
		print("    ldi    r25, 0");
		print("");
		print("    #use cp to set SREG");
		print("    cp     r24, r25");
		print("");
	}



/*

		Unary operators

*/

	
	public void outByteCast(ByteCast node) {
		// pop the int off the stack, place the lower byte back on
		print("/* Byte cast */");
		print("pop r24");
		print("pop r25");
		print("ldi r25, lo8(0)");
		print("push r25");
		print("push r24");
	}
	
	public void outNotExp(NotExp node) {
		print("# Not operation");
		print("pop r24");
		print("ldi r22, 1");
		print("eor r24, r22");
		print("push r24");						
	}
	
	public void outNegExp(NegExp node) {
		print("	# neg int");
		print("# load a two byte expression off stack");
		print("pop r24");
		print("pop r25");
		print("ldi r22, 0");
		print("ldi r23, 0");
		print("sub r22, r24");
		print("sbc r23, r25");
		print("# push two byte expression onto stack");
		print("push   r23");
		print("push   r22");
		print("");
	}
	
	
	/*
	
			Literal expressions
	
	*/
	
	public void outMeggyCheckButton(MeggyCheckButton node) {
		String l3 = getLabel();
		String l5 = getLabel();
		print("### MeggyCheckButton");
		print("call   _Z16CheckButtonsDownv");
		print("lds   r24, Button_Up");
		print("# if button value is zero, push 0 else push 1");
		print("tst   r24");
		print("breq   MJ_L" + l3);
		printLabel("MJ_L4:");
		print("ldi   r24, 1");
		print("jmp   MJ_L" + l5);
		printLabel("MJ_L" + l3 + ":");
		printLabel("MJ_L" + l5 + ":");
		print("# push one byte expression onto stack");
		print("push   r24");
		print("");
	}
	
	public void inIntegerExp(IntLiteral node) {
		// Push the high byte first
		// Push the low byte second (top of stack)		
		print("/* Load constant */");
		print("ldi r25, hi8(" + node.getIntValue() + ")");
		print("ldi r24, lo8(" + node.getIntValue() + ")");
		print("/* Push constant onto stack */");
		print("push r25");
		print("push r24");
		print("");
	}
	
	public void inColorExp(ColorLiteral node) {
		// Push the high byte first
		// Push the low byte second (top of stack)
		print("/* Color literal */");
		print("ldi r25, hi8(" + node.getIntValue() + ")");
		print("ldi r24, lo8(" + node.getIntValue() + ")");
		print("/* Push color literal onto stack */");
		print("push r25");
		print("push r24");
		print("");
	}

	public void inTrueExp(TrueLiteral node) {
		// Push the high byte first
		// Push the low byte second (top of stack)
		print("/* True/1 expression */");
		print("ldi r22, 1");
		print("push r22");
	}
	
		public void inFalseExp(TrueLiteral node) {
		// Push the high byte first
		// Push the low byte second (top of stack)
		print("/* False/0 expression */");
		print("ldi r22, 0");
		print("push r22");
	}
	
}
