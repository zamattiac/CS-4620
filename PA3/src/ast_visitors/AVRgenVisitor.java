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
   private PrintWriter out;
   private Stack<Integer> nodeStack;
   
   public void print(String s) {
   		out.println("    " + s);
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
       if (nodeStack.empty()) {
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
       }
       out.flush();
   }

	public void outMeggySetPixel(MeggySetPixel node) {
		// Pop the bytes from color, y, x into the param registers
		// r17 is used as a dummy register for the high bytes of each value (= 0)
		print("/* Meggy Set Pixel */");
		print("pop r20");
		print("pop r17");
		print("pop r22");
		print("pop r17");
		print("pop r24");	
		print("pop r17");	
// 		out.println("ldi r24, lo8(" + node.getXExp() + ")");
// 		out.println("ldi r22, lo8(" + node.getYExp() + ")");
// 		out.println("ldi r20, lo8(" + node.getColor() + ")");
		print("call   _Z6DrawPxhhh");
    	print("call   _Z12DisplaySlatev");
	}
	
	public void outByteCast(ByteCast node) {
		// pop the int off the stack, place the lower byte back on
		print("/* Byte cast */");
		print("pop r16");
		print("pop r17");
		print("ldi r17, lo8(0)");
		print("push r17");
		print("push r16");
	}
	
	public void inIntegerExp(IntLiteral node) {
		// Push the high byte first
		// Push the low byte second (top of stack)
		print("/* Int literal */");
		print("ldi r17, hi8(" + node.getIntValue() + ")");
		print("ldi r16, lo8(" + node.getIntValue() + ")");
		print("push r17");
		print("push r16");
	}
	
	public void inColorExp(ColorLiteral node) {
		// Push the high byte first
		// Push the low byte second (top of stack)
		print("/* Color literal */");
		print("ldi r17, hi8(" + node.getIntValue() + ")");
		print("ldi r16, lo8(" + node.getIntValue() + ")");
		print("push r17");
		print("push r16");
	}


// 	public void nodeDescend(Node node) {
// 		if (node instanceof BlockStatement);
// 		else if (node instanceof MeggySetPixel) {
// 			
// 		};
// 		else if (node instanceof BlockStatement);
// 		else if (node instanceof BlockStatement);
// 		out.println(node.toString());
// 	}
   
}
