/**
 * This ast walker generates dot output for the AST.  
 *
 * 6/06 - Modified from Brian Richard's ParserTest.Java.
 *        Michelle Strout
 */
package ast_visitors;

import java.io.PrintWriter;
import java.util.Stack;

import ast.visitor.DepthFirstVisitor;
import ast.node.*;

import symtable.*; 
import exceptions.*;

/**
 * We extend the DepthFirstAdapter.  
 * Visitors invoke a defaultCase method on each node they visit.  
 * We override this method so that it
 * prints out dot info about a node.
 */
public class BuildSymTable extends DepthFirstVisitor {
   
   private SymTable mCurrentST;
   
   
   /** Constructor takes a PrintWriter, and stores in instance var. */
   public BuildSymTable() {
   		mCurrentST = new SymTable();
   }
   
   public SymTable getSymTable() {
   		return mCurrentST;
   }
   
   public void inTopClassDecl(TopClassDecl node) {
   		//System.out.println("Adding class " + ste.name);
   		// Add to 0 scope
   		 if (mCurrentST.lookupInnermostSymbol(node.getName()) != null) {
    		throw new SemanticException(
			"Redefined symbol " + node.getName(),
				node.getLine(), node.getPos());
		}
   		mCurrentST.insertClass(node);
   		// Bring class to current scope
   		mCurrentST.pushClassScope(node.getName());
   		for (VarDecl var: node.getVarDecls()) {
   		    if (mCurrentST.lookupInnermostSymbol(var.getName()) != null) {
    		throw new SemanticException(
			"Redefined symbol " + var.getName(),
				var.getLine(), var.getPos());
			}
   			mCurrentST.insertVar(var);
   		}
   		for (MethodDecl method: node.getMethodDecls()) {
   			 if (mCurrentST.lookupInnermostSymbol(method.getName()) != null) {
    		throw new SemanticException(
			"Redefined symbol " + method.getName(),
				method.getLine(), method.getPos());
			}
   			mCurrentST.insertMethod(method);
   			mCurrentST.pushMethodScope(method.getName());
   			for (Formal formal: method.getFormals()) {
				if (mCurrentST.lookupInnermostSymbol(formal.getName()) != null) {
					throw new SemanticException(
					"Redefined symbol " + formal.getName(),
						formal.getLine(), formal.getPos());
				}
   				mCurrentST.insertFormal(formal);
   			}
   			for (VarDecl var: method.getVarDecls()) {
				if (mCurrentST.lookupInnermostSymbol(var.getName()) != null) {
					throw new SemanticException(
					"Redefined symbol " + var.getName(),
						var.getLine(), var.getPos());
				}
   				mCurrentST.insertVar(var);
   			}
   			mCurrentST.popScope();
   		}
   		mCurrentST.popScope();
   }
   
//    public void outMethodDecl(MethodDecl node) {
//    		mCurrentST.insert(new MethodSTE(node));
//    }
//    
//    public void outFormal(Formal node) {
//    		mCurrentST.insert(new VarSTE(node));
//    }

//    
//    /** Upon entering each node in AST, check of this node is the root
//    to generate start of .dot file, output the dot output for the node.
//    */
//    public void defaultIn(Node node) {
//        if (nodeStack.empty()) {
//            out.println("digraph ASTGraph {");
//        }
// 
//        nodeDotOutput(node);
//        
//        // store this node id on the nodeStack
//        // the call to nodeDotOutput increments for
//        // the next guy so we have to decrement here
//        nodeStack.push(nodeCount-1);    
//    }
//    
//    public void defaultOut(Node node) {
//        nodeStack.pop();
//        if (nodeStack.empty()) {
//            out.println("}");
//        }
//        out.flush();
//    }
//    
//    /* A helper output routine that generates the
//     * dot node and the dot edges from the parent
//     * to the node.
//     */
//    private void nodeDotOutput(Node node)
//    {
//        // dot node
//        out.print(nodeCount);
//        out.print(" [ label=\"");
//        printNodeName(node);
//        if (node instanceof ILiteral) {
//            out.print("\\n");
//            out.print(node.toString());
//        }
//        out.println("\" ];");
//        
//        // print dot edge to parent
//        if (!nodeStack.empty()) {
//            out.print(nodeStack.peek());
//            out.print(" -> ");
//            out.println(nodeCount);
//        }
//        
//        // increment for ourseves
//        nodeCount++;
//    }
// 
//    /** A helper that trims a node's class name before printing it.
//     * (E.g., "node.Token" --> "Token".) 
//     */
//    private void printNodeName(Node node) {
//       String fullName = node.getClass().getName();
//       String name = fullName.substring(fullName.lastIndexOf('.')+1);
//       
//       out.print(name);
//    }
   
}
