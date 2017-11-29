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

	// // List all classes and their methods
	// public void inProgram(Program node) {
	// 	for (TopClassDecl c : node.getClassDecls()) {
	// 		// Check for double class declaration
	// 		if (mCurrentST.lookupInnermostSymbol(c.getName() != null)) {
	// 			throw new SemanticException("Redefined symbol " + node.getName(), node.getLine(), node.getPos());
	// 		}
	// 		mCurrentST.insertClass(c);
	// 		mCurrentST.pushClassScope(c.getName());
	// 		for (VarDecl var : c.getVarDecls()) {
	// 			mCurrentST.insertMemberVar(var);
	// 		}
	// 		mCurrentST.popScope();
	// 	}
	// }

	public void visitTopClassDecl(TopClassDecl node) {
		//System.out.println("Adding class " + ste.name);
		// Check for double class declaration
		if (mCurrentST.lookupInnermostSymbol(node.getName()) != null) {
			throw new SemanticException("Redefined symbol " + node.getName(), node.getLine(), node.getPos());
		}
		mCurrentST.insertClass(node);
		// Bring class to current scope
		mCurrentST.pushClassScope(node.getName());
		for (VarDecl var : node.getVarDecls()) {
			// Check for double var/method declaration
			if (mCurrentST.lookupInnermostSymbol(var.getName()) != null) {
				throw new SemanticException("Redefined symbol " + var.getName(), var.getLine(), var.getPos());
			}
			mCurrentST.insertMemberVar(var);
		}
		for (MethodDecl method : node.getMethodDecls()) {
			// Check for double var/method declaration
			if (mCurrentST.lookupInnermostSymbol(method.getName()) != null) {
				throw new SemanticException("Redefined symbol " + method.getName(), method.getLine(), method.getPos());
			}
			mCurrentST.insertMethod(method);
			mCurrentST.pushMethodScope(method.getName());
			for (Formal formal : method.getFormals()) {
				// Check for double formal/local var declaration
				if (mCurrentST.lookupInnermostSymbol(formal.getName()) != null) {
					throw new SemanticException("Redefined symbol " + formal.getName(), formal.getLine(),
							formal.getPos());
				}
				mCurrentST.insertFormal(formal);
			}
			for (VarDecl var : method.getVarDecls()) {
				// Check for double formal/local var declaration
				if (mCurrentST.lookupInnermostSymbol(var.getName()) != null) {
					throw new SemanticException("Redefined symbol " + var.getName(), var.getLine(), var.getPos());
				}
				mCurrentST.insertLocalVar(var);
			}
			mCurrentST.popScope();
		}
		// Iterate through class scope
		int classSize = 0;
		for (MemberVarSTE var: ((ClassScope)mCurrentST.mScopeStack.peek()).getMemberVars()) {
			classSize += var.type.getAVRTypeSize();
		}
		((ClassScope)mCurrentST.mScopeStack.peek()).classSize = classSize;
		mCurrentST.popScope();
	}
}
