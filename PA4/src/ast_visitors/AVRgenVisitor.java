/**
 * This ast walker generates dot output for the AST.  
 *
 * 6/06 - Modified from Brian Richard's ParserTest.Java.
 *        Michelle Strout
 */
package ast_visitors;

import java.io.PrintWriter;

import java.io.*;
import java.lang.*;

import ast.visitor.DepthFirstVisitor;
import ast.node.*;

import ast.node.*;
import ast.visitor.DepthFirstVisitor;
import java.util.*;

import symtable.*;
import exceptions.InternalException;
import exceptions.SemanticException;
/**
 * We extend the DepthFirstAdapter.  
 * Visitors invoke a defaultCase method on each node they visit.  
 * We override this method so that it
 * prints out dot info about a node.
 */
public class AVRgenVisitor extends DepthFirstVisitor {
   private int nodeCount = 0;
   // Assembly jump labels
   private int labelCount = 0;
   private PrintWriter out;
   private Stack<Integer> nodeStack;
   private SymTable mCurrentST;
   
   // Keep epilog from printing twice
   private boolean notPrinted = true;
   
   // Prints with indent
   public void print(String s) {
   		out.println("    " + s);
   }
   
   // Prints without indent
   public void printFunction(String s) {
   		out.println(s);
   }
   
   public void printLabel(String s) {
   		out.println("MJ_L" + s + ":");
   }
   
   // Assign an assembly label number using the labelCount
   public String getLabel() {
   		String ret = String.valueOf(labelCount);
   		labelCount++;
   		return ret;
   }
   
   /** Constructor takes a PrintWriter, and stores in instance var. */
   public AVRgenVisitor(PrintWriter out, SymTable st) {
      this.out = out;
      this.nodeStack = new Stack<Integer>();
      this.mCurrentST = st;
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
   }
   
   public void outProgram(Program node) {
	  //if (nodeStack.empty() && notPrinted) {
	  if (notPrinted) {
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
   		PA4 - Method Decls, Method calls
   */
   public void inTopClassDecl(TopClassDecl node) { 
   		mCurrentST.pushClassScope(node.getName());
   }
   public void outTopClassDecl(TopClassDecl node) { 
   		mCurrentST.popScope();
   }
    public void visitMethodDecl(MethodDecl node)
    {
    	int pushes = 0;
    	mCurrentST.pushMethodScope(node.getName());
    	
        String methodName = node.getName();
   		String parent = ((TopClassDecl)node.parent()).getName();
   		
   		String labelName = parent + "_" + methodName;
   		int register = 22;
   		
   		print(".text");
		printFunction(".global " + labelName);
		print(".type  " + labelName + ", @function");
		printFunction(labelName + ":");
		print("push   r29");
		print("push   r28");
		print("# make space for locals and params");
		print("ldi    r30, 0");
		// Variable this
		print("push   r30");
		print("push   r30");
        if(node.getType() != null)
        {
            node.getType().accept(this);
        }
        for (VarSTE ste: ((MethodScope)mCurrentST.mScopeStack.peek()).getFormals()) {
        	print("push r30");
        	pushes++;
        	if (ste.type == Type.INT) {
        		print("push r30");
        		pushes++;
        	}
        	
        }
		print("");
		print("# Copy stack pointer to frame pointer");
		print("in     r28,__SP_L__");
		print("in     r29,__SP_H__");
		print("");
		print("# save off parameters");
		
		print("std    Y + 2, r25");
		print("std    Y + 1, r24");
		
		for (VarSTE ste: ((MethodScope)mCurrentST.mScopeStack.peek()).getFormals()) {
			if (ste.type == Type.INT) {
				print("std    Y + " + String.valueOf(ste.offset + 1) + ", r" + String.valueOf(register + 1));
				print("std    Y + " + String.valueOf(ste.offset) + ", r" + String.valueOf(register));
				register -= 2;
			}
			else {
				print("std    Y + " + String.valueOf(ste.offset) + ", r" + String.valueOf(register));
				register -= 2;
			}
		}

	/*	
    std    Y + 2, r25
    std    Y + 1, r24
    // std Y +    r23
    std    Y + 3, r22
    std    Y + 5, r21
    std    Y + 4, r20 */
		printFunction("/* done with function " + labelName + " prologue */");
		print("");
		print("");
        List<VarDecl> vars = new ArrayList<VarDecl>(node.getVarDecls());
        for(VarDecl e : vars) e.accept(this);
        
        {
            List<IStatement> copy = new ArrayList<IStatement>(node.getStatements());
            for(IStatement e : copy)
            {
                e.accept(this);
            }
        }
        // Return statement if not void
        if(node.getExp() != null)
        {
            node.getExp().accept(this);
        }
        printFunction("/* epilogue start for " + labelName + " */");
		// Return statement if not void
        if(node.getExp() != null)
        {
        	String l0 = getLabel();
        	String l1 = getLabel();
        	print("# load expression off stack");
            print("# handle return value");
            if (node.getType() instanceof IntType && mCurrentST.getExpType(node.getExp()) == Type.BYTE){
            	print("# promoting a byte to an int");
				print("tst     r24");
				print("brlt     MJ_L" + l0);
				print("ldi    r25, 0");
				print("jmp    MJ_L" + l1);
				printLabel(l0);
				print("ldi    r25, hi8(-1)");
				printLabel(l1);
            }
			else {
				if (node.getType() instanceof IntType) {
					print("pop    r25");
				}
				print("pop r24");
			}
        }
		print("# pop space off stack for parameters and locals");
		print("pop    r30");
		print("pop    r30");
        for(int i = 0; i < pushes; i++) print("pop    r30");
		
		print("# restoring the frame pointer");
		print("pop    r28");
		print("pop    r29");
		print("ret");
		print(".size " + labelName + ", .-" + labelName);
		print("");
		
		mCurrentST.popScope();
    }
    
    // Leave empty
    // In particular, do not call visit on the id type lest we manipulate the stack
    public void visitFormal(Formal node) {}

	public void outCallStatement(CallStatement node) {
		LinkedList<IExp> args = node.getArgs();
		// What register to start at
		int register = 24 - 2 * args.size();
		
		if (!(node.getExp() instanceof NewExp)) System.err.println("Not calling method on a new exp!!");
		// Class/method
		String cl = ((NewExp)(node.getExp())).getId();
		mCurrentST.pushClassScope(cl);
		
		print("#### function call");
		print("# put parameter values into appropriate registers");
		// If ARG is BYTE going into INT make it an INT
		LinkedList<VarSTE> formals = mCurrentST.lookupMethod(node.getId()).scope.getFormals();
		Iterator<VarSTE> formalItr = formals.listIterator();
		Iterator<IExp> argItr = args.listIterator();
		IExp arg;
		VarSTE formal;
		while (formalItr.hasNext()) {
			arg = argItr.next();
			formal = formalItr.next();
			
			if (formal.type == Type.BYTE) {
				print("# load a one byte expression off stack");
				print("pop    r" + register);
			}
		
			else {
				if (mCurrentST.getExpType(arg) == Type.BYTE) {
					String l0 = getLabel();
					String l1 = getLabel();
					print("pop    r" + String.valueOf(register));
					register++;
					print("# promoting a byte to an int");
					print("tst     r22");
					print("brlt     MJ_L" + l0);
					print("ldi    r2" + String.valueOf(register) + ", 0");
					print("jmp    MJ_L" + l1);
					printLabel(l0);
					print("ldi    r2" + String.valueOf(register) + ", hi8(-1)");
					printLabel(l1);
				}
				print("pop    r" + String.valueOf(register));
				register++;
				print("pop    r" + String.valueOf(register));
			}
			register++;
		}
		print("# receiver will be passed as first param");
		print("# load a two byte expression off stack");
		print("pop    r24");
		print("pop    r25");
		print("");
		print("call    " + cl + "_" + node.getId());
		// Pop class scope
		mCurrentST.popScope();
	}
	
	public void outCallExp(CallExp node) {
		LinkedList<IExp> args = node.getArgs();
		// What register to start at
		int register = 24 - 2 * args.size();
		
		if (!(node.getExp() instanceof NewExp)) System.err.println("Not calling method on a new exp!!");
		// Class/method
		String cl = ((NewExp)(node.getExp())).getId();
		
		print("#### function call");
		print("# put parameter values into appropriate registers");
		// If ARG is BYTE going into INT make it an INT
		LinkedList<VarSTE> formals = ((MethodScope)mCurrentST.mScopeStack.peek()).getFormals();
		Iterator<VarSTE> formalItr = formals.listIterator();
		Iterator<IExp> argItr = args.listIterator();
		IExp arg;
		VarSTE formal;
		while (formalItr.hasNext()) {
			arg = argItr.next();
			formal = formalItr.next();
			
			if (formal.type == Type.BYTE) {
				print("# load a one byte expression off stack");
				print("pop    r" + register);
			}
		
			else {
				if (mCurrentST.getExpType(arg) == Type.BYTE) {
					String l0 = getLabel();
					String l1 = getLabel();
					print("pop    r" + String.valueOf(register));
					register++;
					print("# promoting a byte to an int");
					print("tst     r22");
					print("brlt     MJ_L" + l0);
					print("ldi    r2" + String.valueOf(register) + ", 0");
					print("jmp    MJ_L" + l1);
					printLabel(l0);
					print("ldi    r2" + String.valueOf(register) + ", hi8(-1)");
					printLabel(l1);
				}
				print("pop    r" + String.valueOf(register));
				register++;
				print("pop    r" + String.valueOf(register));
			}
			register++;
		}

		print("# receiver will be passed as first param");
		print("# load a two byte expression off stack");
		print("pop    r24");
		print("pop    r25");
		print("");
		print("call    " + cl + "_" + node.getId());
		
		if (mCurrentST.lookupSymbol(node.getId()).type == Type.INT) {
			print("# handle return value");
			print("# push two byte expression onto stack");
			print("push   r25");
			print("push   r24");
			print("");
		}
		else {
			print("# handle return value");
			print("# push one byte expression onto stack");
			print("push   r24");
			print("");
		}

	}

	
	public void outNewExp(NewExp node) {
		print("# NewExp");
		print("ldi    r24, lo8(0)");
		print("ldi    r25, hi8(0)");
		print("# allocating object of size 0 on heap");
		print("call    malloc");
		print("# push object address");
		print("# push two byte expression onto stack");
		print("push   r25");
		print("push   r24");
		print("");
	}

   
   /*
   
   		Meggy Statements
   
   */
   
   public void inBlockStatement(BlockStatement node) {
   		print("# Block body");
   }
	
   public void outBlockStatement(BlockStatement node) {
   		print("# End of block");
   }

	// ONLY ACCEPTS BYTE
	public void outMeggySetPixel(MeggySetPixel node) {
		print("### Meggy.setPixel(x,y,color) call");
		print("# load a one byte expression off stack");
		print("pop    r20");
		print("# load a one byte expression off stack");
		print("pop    r22");
		print("# load a one byte expression off stack");
		print("pop    r24");
		print("call   _Z6DrawPxhhh");
		print("call   _Z12DisplaySlatev");
		print("");
	}
	
	// Only accepts tone, int
	public void outMeggyToneStart(MeggyToneStart node) {
		print("### Meggy.toneStart(tone, time_ms) call");
		print("# load a two byte expression off stack");
		print("pop    r22");
		print("pop    r23");
		print("# load a two byte expression off stack");
		print("pop    r24");
		print("pop    r25");
		print("call   _Z10Tone_Startjj");
	}

	
	// ONLY ACCEPTS INT
	public void outMeggyDelay(MeggyDelay node) {
		print("### Meggy.delay() call");
		print("# load delay parameter");
		print("# load a two byte expression off stack");
		print("pop    r24");
		print("pop    r25");
		print("call   _Z8delay_msj");
		print("");
	}
	
	/*
	
		Conditional statements
		
	*/
	
	
	// WHILE STATEMENT
	
	public void visitWhileStatement(WhileStatement node)
    {
        String l0 = getLabel();
		// Save beginning to jump back to in outWhileStatement
		print("#### while statement");
		printLabel(l0);
		print("");
        if(node.getExp() != null)
        {
            node.getExp().accept(this);
        }
		String l1 = getLabel();
		// End of while loop
		String l2 = getLabel();
        print("# if not(condition)");
        print("# load a one byte expression off stack");
        print("pop    r24");
        print("ldi    r25,0");
        print("cp     r24, r25");
        // Jump to end, L2
        print("# WANT breq MJ_L" + l2);
        // Jump to body, L1
        print("brne   MJ_L" + l1);
        print("jmp    MJ_L" + l2);
        print("");
        print("# while loop body");
        printLabel(l1);
        print("");
        if(node.getStatement() != null)
        {
            node.getStatement().accept(this);
        }
		print("# jump to while test");
		// L0
		print("jmp    MJ_L" + l0);
		print("");
		print("# end of while");
		// L2
		printLabel(l2);
		print("");
    }
	
	
	// IF STATEMENT
	
    public void visitIfStatement(IfStatement node)
    {
        print("#### if statement");
        print("");
        if(node.getExp() != null)
        {
            node.getExp().accept(this);
        }
        // Place the labels for statement == true or false
		// Else
		String l0 = getLabel();
		// Then
		String l1 = getLabel();
        print("# load condition and branch if false");
        print("# load a one byte expression off stack");
        print("pop    r24");
        print("#load zero into reg");
        print("ldi    r25, 0");
        print("");
        print("#use cp to set SREG");
        print("cp     r24, r25");
        print("#WANT breq MJ_L" + l0);
        print("brne   MJ_L" + l1);
        print("jmp    MJ_L" + l0);
        print("");
        print("# then label for if");
        printLabel(l1);
        print("");
        if(node.getThenStatement() != null)
        {
            node.getThenStatement().accept(this);
        }
        // Place the label to jump over else to the end of the statement
        // End of if statement
        String l2 = getLabel();
        
        print("jmp MJ_L" + l2);
        print("");
        print("# else label for if");
        printLabel(l0);

        if(node.getElseStatement() != null)
        {
            node.getElseStatement().accept(this);
        }
		print("# done label for if");
		printLabel(l2);
    }

	
	
/*

		Logical / mathematical operations

*/

	// Promotes bytes to ints
	public void outPlusExp(PlusExp node) {
        print("# ADD");
        if (mCurrentST.getExpType(node.getLExp()) == Type.BYTE) {
        	String l4 = getLabel();
        	String l5 = getLabel();
        	print("pop	r18");
        	print("# promoting a byte to an int");
			print("tst     r18");
			print("brlt     MJ_L" + l4);
			print("ldi    r19, 0");
			print("jmp    MJ_L" + l5);
			printLabel(l4);
			print("ldi    r19, hi8(-1)");
			printLabel(l5);
        }
        else {
            print("# load a two byte expression off stack");
        	print("pop    r18");
        	print("pop    r19");

        }
        if (mCurrentST.getExpType(node.getRExp()) == Type.BYTE) {
        	String l4 = getLabel();
        	String l5 = getLabel();
        	print("pop	r24");
        	print("# promoting a byte to an int");
			print("tst     r24");
			print("brlt     MJ_L" + l4);
			print("ldi    r25, 0");
			print("jmp    MJ_L" + l5);
			printLabel(l4);
			print("ldi    r25, hi8(-1)");
			printLabel(l5);
        }
        else {
            print("# load a two byte expression off stack");
        	print("pop    r24");
        	print("pop    r25");
        }
		print("# Do add operation");
		print("add    r24, r18");
		print("adc    r25, r19");
		print("# push two byte expression onto stack");
		print("push   r25");
		print("push   r24");
		print("");
	}
	

	// RESULT IS INT
	public void outMinusExp(MinusExp node) {
        print("# SUBTRACT");
        if (mCurrentST.getExpType(node.getLExp()) == Type.BYTE) {
        	String l4 = getLabel();
        	String l5 = getLabel();
        	print("pop	r18");
        	print("# promoting a byte to an int");
			print("tst     r18");
			print("brlt     MJ_L" + l4);
			print("ldi    r19, 0");
			print("jmp    MJ_L" + l5);
			printLabel(l4);
			print("ldi    r19, hi8(-1)");
			printLabel(l5);
        }
        else {
            print("# load a two byte expression off stack");
        	print("pop    r18");
        	print("pop    r19");

        }
        if (mCurrentST.getExpType(node.getRExp()) == Type.BYTE) {
        	String l4 = getLabel();
        	String l5 = getLabel();
        	print("pop	r24");
        	print("# promoting a byte to an int");
			print("tst     r24");
			print("brlt     MJ_L" + l4);
			print("ldi    r25, 0");
			print("jmp    MJ_L" + l5);
			printLabel(l4);
			print("ldi    r25, hi8(-1)");
			printLabel(l5);
        }
        else {
            print("# load a two byte expression off stack");
        	print("pop    r24");
        	print("pop    r25");
        }
        print("# Do INT sub operation");
		print("sub    r24, r18");
		print("sbc    r25, r19");
		print("# push hi order byte first");
		print("# push two byte expression onto stack");
		print("push   r25");
		print("push   r24");
		print("");

	}


	// BYTE * BYTE ONLY
	// RESULT IS INT
	public void outMulExp(MulExp node) {
		print("# MulExp");
		print("# load a one byte expression off stack");
		print("pop    r18");
		print("# load a one byte expression off stack");
		print("pop    r22");
		print("# move low byte src into dest reg");
		print("mov    r24, r18");
		print("# move low byte src into dest reg");
		print("mov    r26, r22");
		print("");
		print("# Do mul operation of two input bytes");
		print("muls   r24, r26");
		print("# push two byte expression onto stack");
		print("push   r1");
		print("push   r0");
		print("# clear r0 and r1, thanks Brendan!");
		print("eor    r0,r0");
		print("eor    r1,r1");
		print("");
	}

	// Must be same type
	public void outEqualExp(EqualExp node) {
		String l3 = getLabel();
		String l4 = getLabel();
		String l5 = getLabel();
		// two-byte int type
		if (mCurrentST.getExpType(node.getLExp()) == Type.INT) {
			print("# equality check expression");
			print("# load a two byte expression off stack");
			print("pop    r18");
			print("pop    r19");
			print("# load a two byte expression off stack");
			print("pop    r24");
			print("pop    r25");
			print("cp    r24, r18");
			print("cpc   r25, r19");
		} // And for one-byte types:
		else {
			print("# equality check expression");
			print("# load a one byte expression off stack");
			print("pop    r18");
			print("# load a one byte expression off stack");
			print("pop    r24");
			print("cp    r24, r18");
		}
		print("breq MJ_L" + l4);
		print("");
		print("# result is false");
		printLabel(l3);
		print("ldi     r24, 0");
		print("jmp      MJ_L5");
		print("");
		print("# result is true");
		printLabel(l4);
		print("ldi     r24, 1");
		print("");
		print("# store result of equal expression");
		printLabel(l5);
		print("# push one byte expression onto stack");
		print("push   r24");
		print("");
	}
	
	
	public void visitAndExp(AndExp node) {
		String l3 = getLabel();
		String l4 = getLabel();
		print("#### short-circuited && operation");
		print("# &&: left operand");
		print("");
        if(node.getLExp() != null)
        {
            node.getLExp().accept(this);
        }
		print("# &&: if left operand is false do not eval right");
		print("# load a one byte expression off stack");
		print("pop    r24");
		print("# push one byte expression onto stack");
		print("push   r24");
		print("# compare left exp with zero");
		print("ldi r25, 0");
		print("cp    r24, r25");
		print("# Want this, breq MJ_L" + l3);
		print("brne  MJ_L" + l4);
		print("jmp   MJ_L" + l3);
		print("");
		printLabel(l4);
		print("# right operand");
		print("# load a one byte expression off stack");
		print("pop    r24");
		print("");
        if(node.getRExp() != null)
        {
            node.getRExp().accept(this);
        }
        print("# load a one byte expression off stack");
		print("pop    r24");
		print("# push one byte expression onto stack");
		print("push   r24");
		print("");
		printLabel(l3);
		print("");
	}

	public void outLtExp(LtExp node) {
		String l3 = getLabel();
		String l4 = getLabel();
		String l5 = getLabel();
		print("# less than expression");
		if (mCurrentST.getExpType(node.getLExp()) == Type.INT) {
			print("# load a two byte expression off stack");
			print("pop    r18");
			print("pop    r19");
			print("# load a two byte expression off stack");
			print("pop    r24");
			print("pop    r25");
			print("cp    r24, r18");
			print("cpc   r25, r19");
		}
		else {
			print("# load a one byte expression off stack");
			print("pop    r18");
			print("# load a one byte expression off stack");
			print("pop    r24");
			print("cp    r24, r18");
		}
		print("brlt MJ_L" + l4);
		print("");
		print("# load false");
		printLabel(l3);
		print("ldi     r24, 0");
		print("jmp      MJ_L" + l5);
		print("");
		print("# load true");
		printLabel(l4);
		print("ldi    r24, 1");
		print("");
		print("# push result of less than");
		printLabel(l5);
		print("# push one byte expression onto stack");
		print("push   r24");
		print("");

	}


/*

		Unary operators

*/

	
	public void outByteCast(ByteCast node) {
		if (mCurrentST.getExpType(node) == Type.BYTE) return;
		print("# Casting int to byte by popping");
		print("# 2 bytes off stack and only pushing low order bits");
		print("# back on.  Low order bits are on top of stack.");
		print("pop    r24");
		print("pop    r25");
		print("push   r24");
		print("");

	}
	
	public void outNotExp(NotExp node) {
		print("# not operation");
		print("# load a one byte expression off stack");
		print("pop    r24");
		print("ldi     r22, 1");
		print("eor     r24,r22");
		print("# push one byte expression onto stack");
		print("push   r24");
		print("");
					
	}
	
	// TODO: check for bytes too
	public void outNegExp(NegExp node) {
		print("# neg int");
		print("# load a two byte expression off stack");
		print("pop    r24");
		print("pop    r25");
		print("ldi     r22, 0");
		print("ldi     r23, 0");
		print("sub     r22, r24");
		print("sbc     r23, r25");
		print("# push two byte expression onto stack");
		print("push   r23");
		print("push   r22");
		print("");

	}
	
	public void inMeggyCheckButton(MeggyCheckButton node) {
		print("### MeggyCheckButton");
		print("call   _Z16CheckButtonsDownv");
		out.print("    lds   r24, ");
	}
	
	public void outMeggyCheckButton(MeggyCheckButton node) {
		String l3 = getLabel();
		String l5 = getLabel();
		String l4 = getLabel();
		print("# if button value is zero, push 0 else push 1");
		print("tst   r24");
		print("breq   MJ_L" + l3);
		printLabel(l4);
		print("ldi   r24, 1");
		print("jmp   MJ_L" + l5);
		printLabel(l3);
		printLabel(l5);
		print("# push one byte expression onto stack");
		print("push   r24");
		print("");
	}
	
	public void outMeggyGetPixel(MeggyGetPixel node) {
		print("### Meggy.getPixel(x,y) call");
		print("# load a one byte expression off stack");
		print("pop    r22");
		print("# load a one byte expression off stack");
		print("pop    r24");
		print("call   _Z6ReadPxhh");
		print("# push one byte expression onto stack");
		print("push   r24");
		print("");
	}
	
	
	/*
	
			Literal expressions
	
	*/
	

	
	public void inIntegerExp(IntLiteral node) {
		// Push the high byte first
		// Push the low byte second (top of stack)		
		print("/* Load constant */");
		print("ldi r24, lo8(" + node.getIntValue() + ")");
		print("ldi r25, hi8(" + node.getIntValue() + ")");
		print("/* Push constant onto stack */");
		print("push r25");
		print("push r24");
		print("");
	}
	
	public void inColorExp(ColorLiteral node) {
		print("# Color expression");
		print("ldi    r22, " + node.getIntValue());
		print("# push one byte expression onto stack");
		print("push   r22");
		print("");

	}
	
	public void outButtonExp(ButtonLiteral node) {
		String button = "";
		switch(node.getIntValue()) {
			case 1:
				button = "Button_B";
			break;
			case 2:
				button = "Button_A";
			break;
			case 4:
				button = "Button_Up";
			break;
			case 8:
				button = "Button_Down";
			break;
			case 16:
				button = "Button_Left";
			break;
			case 32:
				button = "Button_Right";
			break;
		}
		print(button);
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
	
	public void inToneExp(ToneLiteral node) {
		print("# Push " + node.getLexeme() + " onto the stack.");
		print("ldi    r25, hi8(" + node.getIntValue() + ")");
		print("ldi    r24, lo8(" + node.getIntValue() + ")");
		print("# push two byte expression onto stack");
		print("push   r25");
		print("push   r24");
		print("");
	}
	
	// TODO: check through scopes for id
	// TODO: check for all scopes
	public void inIdLiteral(IdLiteral node) {
		print("# IdExp");
		print("# load value for variable " + node.getLexeme());
		VarSTE symbol = this.mCurrentST.lookupInnermostVar(node.getLexeme());
		if (symbol != null) {
			print("# variable is a local or param variable");
			print("");

			if (symbol.type == Type.INT) {
				print("# load a two byte variable from base+offset");
				print("ldd    r25, Y + " + String.valueOf(symbol.offset+1));
				print("ldd    r24, Y + " + String.valueOf(symbol.offset)); 
				print("# push two byte expression onto stack");
				print("push   r25");
				print("push   r24");
				print("");
			}
			else {
				print("# load a one byte variable from base+offset");
				print("ldd    r24, Y + " + String.valueOf(symbol.offset));
				print("# push one byte expression onto stack");
				print("push   r24");
				print("");
			}
		}
		// Lookup globally
		else System.err.println("Implement loading non-local variables please :=)");
	}
	
}
