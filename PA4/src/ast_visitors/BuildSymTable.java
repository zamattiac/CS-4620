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
			throw new SemanticException("Redefined symbol " + node.getName(), node.getLine(), node.getPos());
		}
		mCurrentST.insertClass(node);
		// Bring class to current scope
		mCurrentST.pushClassScope(node.getName());
		for (VarDecl var : node.getVarDecls()) {
			if (mCurrentST.lookupInnermostSymbol(var.getName()) != null) {
				throw new SemanticException("Redefined symbol " + var.getName(), var.getLine(), var.getPos());
			}
			mCurrentST.insertVar(var);
		}
		for (MethodDecl method : node.getMethodDecls()) {
			if (mCurrentST.lookupInnermostSymbol(method.getName()) != null) {
				throw new SemanticException("Redefined symbol " + method.getName(), method.getLine(), method.getPos());
			}
			mCurrentST.insertMethod(method);
			mCurrentST.pushMethodScope(method.getName());
			for (Formal formal : method.getFormals()) {
				if (mCurrentST.lookupInnermostSymbol(formal.getName()) != null) {
					throw new SemanticException("Redefined symbol " + formal.getName(), formal.getLine(),
							formal.getPos());
				}
				mCurrentST.insertFormal(formal);
			}
			for (VarDecl var : method.getVarDecls()) {
				if (mCurrentST.lookupInnermostSymbol(var.getName()) != null) {
					throw new SemanticException("Redefined symbol " + var.getName(), var.getLine(), var.getPos());
				}
				mCurrentST.insertVar(var);
			}
			mCurrentST.popScope();
		}
		mCurrentST.popScope();
	}
}
