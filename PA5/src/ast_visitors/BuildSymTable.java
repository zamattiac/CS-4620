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
	public void inProgram(Program node) {
		// Go through once for all class names
		for (IClassDecl ic : node.getClassDecls()) {
			// All decls will be top:
			TopClassDecl c = (TopClassDecl)ic;
			if (mCurrentST.lookupInnermostSymbol(c.getName()) != null) {
				throw new SemanticException("Redefined symbol " + c.getName(), c.getLine(), c.getPos());
			}
			mCurrentST.insertClass(c);
		}
		// Go through again to get method and member var names
		for (IClassDecl ic : node.getClassDecls()) {
			// All decls will be top:
			TopClassDecl c = (TopClassDecl)ic;						
			// Bring class to current scope
			mCurrentST.pushClassScope(c.getName());
			for (VarDecl var : c.getVarDecls()) {
				// Check for double var/method declaration
				if (mCurrentST.lookupInnermostSymbol(var.getName()) != null) {
					throw new SemanticException("Redefined symbol " + var.getName(), var.getLine(), var.getPos());
				}
				mCurrentST.insertMemberVar(var);
			}
			for (MethodDecl method : c.getMethodDecls()) {
				// Check for double var/method declaration
				if (mCurrentST.lookupInnermostSymbol(method.getName()) != null) {
					throw new SemanticException("Redefined symbol " + method.getName(), method.getLine(),
							method.getPos());
				}
				mCurrentST.insertMethod(method);
			}
			mCurrentST.popScope();
		}
	}

	public void visitTopClassDecl(TopClassDecl node) {
		//System.out.println("Adding class " + ste.name);
		// Check for double class declaration
		// if (mCurrentST.lookupInnermostSymbol(node.getName()) != null) {
		// 	throw new SemanticException("Redefined symbol " + node.getName(), node.getLine(), node.getPos());
		// }
		// mCurrentST.insertClass(node);
		// // Bring class to current scope
		// mCurrentST.pushClassScope(node.getName());
		// for (VarDecl var : node.getVarDecls()) {
		// 	// Check for double var/method declaration
		// 	if (mCurrentST.lookupInnermostSymbol(var.getName()) != null) {
		// 		throw new SemanticException("Redefined symbol " + var.getName(), var.getLine(), var.getPos());
		// 	}
		// 	mCurrentST.insertMemberVar(var);
		// }
		// for (MethodDecl method : node.getMethodDecls()) {
		// 	// Check for double var/method declaration
		// 	if (mCurrentST.lookupInnermostSymbol(method.getName()) != null) {
		// 		throw new SemanticException("Redefined symbol " + method.getName(), method.getLine(), method.getPos());
		// 	}
		// 	mCurrentST.insertMethod(method);
		// 	mCurrentST.pushMethodScope(method.getName());
		// 	for (Formal formal : method.getFormals()) {
		// 		// Check for double formal/local var declaration
		// 		if (mCurrentST.lookupInnermostSymbol(formal.getName()) != null) {
		// 			throw new SemanticException("Redefined symbol " + formal.getName(), formal.getLine(),
		// 					formal.getPos());
		// 		}
		// 		mCurrentST.insertFormal(formal);
		// 	}
		// 	for (VarDecl var : method.getVarDecls()) {
		// 		// Check for double formal/local var declaration
		// 		if (mCurrentST.lookupInnermostSymbol(var.getName()) != null) {
		// 			throw new SemanticException("Redefined symbol " + var.getName(), var.getLine(), var.getPos());
		// 		}
		// 		mCurrentST.insertLocalVar(var);
		// 	}
		// 	mCurrentST.popScope();
		// }
		// Iterate through class scope

		mCurrentST.pushClassScope(node.getName());

		int classSize = 0;
		for (MemberVarSTE var : ((ClassScope) mCurrentST.mScopeStack.peek()).getMemberVars()) {
			classSize += var.type.getAVRTypeSize();
		}
		((ClassScope) mCurrentST.mScopeStack.peek()).classSize = classSize;

		for (MethodDecl method : node.getMethodDecls()) {
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

		mCurrentST.popScope();
	}
}
