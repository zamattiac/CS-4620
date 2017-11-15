package ast_visitors;

/** 
 * CheckTypes
 * 
 * This AST visitor traverses a MiniJava Abstract Syntax Tree and checks
 * for a number of type errors.  If a type error is found a SymanticException
 * is thrown
 * 
 * CHANGES to make next year (2012)
 *  - make the error messages between *, +, and - consistent <= ??
 *
 * Bring down the symtab code so that it only does get and set Type
 *  for expressions
 */

import ast.node.*;
import ast.visitor.DepthFirstVisitor;
import java.util.*;

import symtable.*;
import exceptions.InternalException;
import exceptions.SemanticException;

public class CheckTypes extends DepthFirstVisitor {

	private SymTable mCurrentST;

	public CheckTypes(SymTable st) {
		if (st == null) {
			throw new InternalException("unexpected null argument");
		}
		mCurrentST = st;
	}

	//========================= Overriding the visitor interface

	public void defaultOut(Node node) {
		System.err.println("Node not implemented in CheckTypes, " + node.getClass());
	}

	/*
	
	PA4
	New, this
	Call statement/expression
	Method declaration
	
	*/

	public void outNewExp(NewExp node) {
		// TODO: change to expression type set (PA5)
		this.mCurrentST.pushClassScope(node.getId());
	}

	public void outThisExp(ThisLiteral node) {
		// TODO: change to expression type set (PA5)
		Scope first = mCurrentST.mScopeStack.pop();
		String className = mCurrentST.mScopeStack.peek().name;
		mCurrentST.mScopeStack.push(first);
		this.mCurrentST.pushClassScope(className);
	}

	public void visitCallStatement(CallStatement node) {
		// TODO: push scope of class type of the node.getExp() (PA5)
		// Set class based on type of expression, load scope
		node.getExp().accept(this);

		// Change to scope of method
		// Error handling provided within symbol table
		this.mCurrentST.pushMethodScope(node.getId());

		// Assign params types
		for (IExp param : node.getArgs()) {
			param.accept(this);
		}

		// Verify parameters fit the formal params
		LinkedList<IExp> actuals = (LinkedList<IExp>) node.getArgs().clone();
		IExp arg;
		for (VarSTE param : ((MethodScope) this.mCurrentST.mScopeStack.peek()).getFormals()) {
			// Pop the next actual parameter off this list.
			arg = actuals.poll();
			// Check that there are sufficient arguments.
			if (arg == null) {
				throw new SemanticException("Method call " + node.getId() + " has too few arguments",
						node.getExp().getLine(), node.getExp().getPos());
			}

			// Check that the next actual param matches the formal param.
			if (this.mCurrentST.getExpType(arg) != param.type) {
				// Let bytes posing as ints pass
				if (param.type == Type.INT && this.mCurrentST.getExpType(arg) == Type.BYTE)
					break;
				throw new SemanticException("Method arg " + param.name + " of incorrect type. Should be " + param.type
						+ ", is " + this.mCurrentST.getExpType(arg), arg.getLine(), arg.getPos());
			}

		}

		// Remove class scope
		// Remove method scope
		this.mCurrentST.popScope();
		// Don't pop scope if called using 'this', stay in scope, kids
		//if (!(node.getExp() instanceof ThisLiteral)) this.mCurrentST.popScope();
		this.mCurrentST.popScope();
	}

	public void visitCallExp(CallExp node) {
		// TODO: push scope of class type of the node.getExp() (PA5)
		// Set class based on type of expression, load scope
		node.getExp().accept(this);

		// Change to scope of method
		// Error handling provided within symbol table
		this.mCurrentST.pushMethodScope(node.getId());

		// Assign params types
		for (IExp param : node.getArgs()) {
			param.accept(this);
		}

		// Verify parameters fit the formal params
		LinkedList<IExp> actuals = (LinkedList<IExp>) node.getArgs().clone();
		IExp arg;
		for (VarSTE param : ((MethodScope) this.mCurrentST.mScopeStack.peek()).getFormals()) {
			// Pop the next actual parameter off this list.
			arg = actuals.poll();
			// Check that there are sufficient arguments.
			if (arg == null) {
				throw new SemanticException("Method call " + node.getId() + " has too few arguments",
						node.getExp().getLine(), node.getExp().getPos());
			}

			// Check that the next actual param matches the formal param.
			if (this.mCurrentST.getExpType(arg) != param.type) {
				// Let bytes posing as ints pass
				if (param.type == Type.INT && this.mCurrentST.getExpType(arg) == Type.BYTE)
					break;
				throw new SemanticException("Method arg " + param.name + " of incorrect type. Should be " + param.type
						+ ", is " + this.mCurrentST.getExpType(arg), arg.getLine(), arg.getPos());
			}

		}

		// Remove class scope
		// Remove method scope
		this.mCurrentST.popScope();
		// Don't pop scope if called using 'this', stay in scope, kids
		//if (!(node.getExp() instanceof ThisLiteral)) this.mCurrentST.popScope();
		this.mCurrentST.popScope();
		this.mCurrentST.setExpType(node, mCurrentST.lookupSymbol(node.getId()).type);
	}

	public void outIntType(IntType node) {
	}

	public void outByteType(ByteType node) {
	}

	public void outVoidType(VoidType node) {
	}

	public void outBoolType(BoolType node) {
	}

	public void visitFormal(Formal node) {
	}

	public void outIdLiteral(IdLiteral node) {
		if (mCurrentST.lookupSymbol(node.getLexeme()) == null) {
			throw new SemanticException("Undefined symbol " + node.getLexeme(), node.getLine(), node.getPos());
		}
		this.mCurrentST.setExpType(node, this.mCurrentST.lookupSymbol(node.getLexeme()).type);
	}

	public void visitMethodDecl(MethodDecl node) {
		Type methodType = mCurrentST.lookupMethod(node.getName()).type;
		inMethodDecl(node);

		if (node.getType() != null) {
			node.getType().accept(this);
		}
		{
			List<Formal> copy = new ArrayList<Formal>(node.getFormals());
			for (Formal e : copy) {
				e.accept(this);
			}
		}
		{
			List<VarDecl> copy = new ArrayList<VarDecl>(node.getVarDecls());
			for (VarDecl e : copy) {
				e.accept(this);
			}
		}
		{
			List<IStatement> copy = new ArrayList<IStatement>(node.getStatements());
			for (IStatement e : copy) {
				e.accept(this);
			}
		}
		// Return value
		if (node.getExp() != null) {
			// Check that return value is correct type
			node.getExp().accept(this);
			Type returnType = mCurrentST.getExpType(node.getExp());
			// Allow byte expression in an int return
			if (returnType != methodType && (returnType != Type.BYTE && returnType != Type.INT)) {
				throw new SemanticException("Invalid type returned from method " + node.getName(), node.getLine(),
						node.getPos());
			}
		} else if (methodType != Type.VOID)
			throw new SemanticException("Method must return " + methodType, node.getLine(), node.getPos());
		outMethodDecl(node);
	}

	public void inMethodDecl(MethodDecl node) {
		this.mCurrentST.pushMethodScope(node.getName());
	}

	public void outMethodDecl(MethodDecl node) {
		this.mCurrentST.popScope();
	}

	public void inTopClassDecl(TopClassDecl node) {
		this.mCurrentST.pushClassScope(node.getName());
	}

	public void outTopClassDecl(TopClassDecl node) {
		this.mCurrentST.popScope();
	}

	public void outByteCast(ByteCast node) {
		if (this.mCurrentST.getExpType(node.getExp()) != Type.BYTE
				&& this.mCurrentST.getExpType(node.getExp()) != Type.INT) {
			throw new SemanticException("Invalid byte cast", node.getExp().getLine(), node.getExp().getPos());
		}
		this.mCurrentST.setExpType(node, Type.BYTE);
	}

	public void outIntegerExp(IntLiteral node) {
		this.mCurrentST.setExpType(node, Type.INT);
	}

	public void outColorExp(ColorLiteral node) {
		this.mCurrentST.setExpType(node, Type.COLOR);
	}

	public void outButtonExp(ButtonLiteral node) {
		this.mCurrentST.setExpType(node, Type.BUTTON);
	}

	public void outTrueExp(TrueLiteral node) {
		this.mCurrentST.setExpType(node, Type.BOOL);
	}

	public void outFalseExp(FalseLiteral node) {
		this.mCurrentST.setExpType(node, Type.BOOL);
	}

	public void outToneExp(ToneLiteral node) {
		this.mCurrentST.setExpType(node, Type.INT);
	}

	/*
	
		PA3
	
	*/

	public void outAndExp(AndExp node) {
		if (this.mCurrentST.getExpType(node.getLExp()) != Type.BOOL) {
			throw new SemanticException("Invalid left operand type for operator &&", node.getLExp().getLine(),
					node.getLExp().getPos());
		}

		if (this.mCurrentST.getExpType(node.getRExp()) != Type.BOOL) {
			throw new SemanticException("Invalid right operand type for operator &&", node.getRExp().getLine(),
					node.getRExp().getPos());
		}

		this.mCurrentST.setExpType(node, Type.BOOL);
	}

	// do not accept int
	public void outEqualExp(EqualExp node) {
		if (!(((this.mCurrentST.getExpType(node.getLExp()) == Type.BOOL)
				& (this.mCurrentST.getExpType(node.getRExp()) == Type.BOOL))
				|| ((this.mCurrentST.getExpType(node.getLExp()) == Type.BYTE)
						& (this.mCurrentST.getExpType(node.getRExp()) == Type.BYTE))
				|| ((this.mCurrentST.getExpType(node.getLExp()) == Type.BUTTON)
						& (this.mCurrentST.getExpType(node.getRExp()) == Type.BUTTON))
				|| ((this.mCurrentST.getExpType(node.getLExp()) == Type.COLOR)
						& (this.mCurrentST.getExpType(node.getRExp()) == Type.COLOR)))
				|| ((this.mCurrentST.getExpType(node.getLExp()) == Type.INT)
						& (this.mCurrentST.getExpType(node.getRExp()) == Type.INT))) {
			throw new SemanticException("Invalid operands aren't of the same type for operator ==",
					node.getLExp().getLine(), node.getLExp().getPos());
		}

		this.mCurrentST.setExpType(node, Type.BOOL);
	}

	public void outLtExp(LtExp node) {
		Type xexpType = this.mCurrentST.getExpType(node.getLExp());
		Type yexpType = this.mCurrentST.getExpType(node.getRExp());
		if ((xexpType == Type.INT || xexpType == Type.BYTE) && (yexpType == Type.INT || yexpType == Type.BYTE)) {
			this.mCurrentST.setExpType(node, Type.COLOR);
		} else {
			throw new SemanticException("Operands to < operator must be of numeric types", node.getLExp().getLine(),
					node.getRExp().getPos());
		}
		this.mCurrentST.setExpType(node, Type.BOOL);
	}

	public void outNotExp(NotExp node) {
		if (this.mCurrentST.getExpType(node.getExp()) != Type.BOOL) {
			throw new SemanticException("Invalid operand type for operator ~", node.getExp().getLine(),
					node.getExp().getPos());
		}
		this.mCurrentST.setExpType(node, Type.BOOL);
	}

	public void outMeggyGetPixel(MeggyGetPixel node) {
		Type xexpType = this.mCurrentST.getExpType(node.getXExp());
		Type yexpType = this.mCurrentST.getExpType(node.getYExp());
		if ((xexpType == Type.INT || xexpType == Type.BYTE) && (yexpType == Type.INT || yexpType == Type.BYTE)) {
			this.mCurrentST.setExpType(node, Type.COLOR);
		} else {
			throw new SemanticException("Parameters for MeggyGetPixel must be INT or BYTE", node.getXExp().getLine(),
					node.getXExp().getPos());
		}
	}

	public void outNegExp(NegExp node) {
		if (this.mCurrentST.getExpType(node.getExp()) != Type.INT
				&& this.mCurrentST.getExpType(node.getExp()) != Type.BYTE) {
			throw new SemanticException("Invalid operand type for the operator - (negative)", node.getExp().getLine(),
					node.getExp().getPos());
		}
		this.mCurrentST.setExpType(node, Type.INT);
	}

	public void outMeggyCheckButton(MeggyCheckButton node) {
		if (this.mCurrentST.getExpType(node.getExp()) != Type.BUTTON) {
			throw new SemanticException("Invalid button expression for MeggyGetButton", node.getExp().getLine(),
					node.getExp().getPos());
		}
		this.mCurrentST.setExpType(node, Type.BOOL);
	}

	public void outMeggyToneStart(MeggyToneStart node) {
		if (this.mCurrentST.getExpType(node.getToneExp()) != Type.INT) {
			throw new SemanticException("Tone: Invalid argument type for method MeggyToneStart",
					node.getToneExp().getLine(), node.getToneExp().getPos());
		}
		if (this.mCurrentST.getExpType(node.getDurationExp()) != Type.INT) {
			throw new SemanticException("Duration: Invalid argument type for method MeggyToneStart",
					node.getDurationExp().getLine(), node.getDurationExp().getPos());
		}
	}

	public void outPlusExp(PlusExp node) {
		Type lexpType = this.mCurrentST.getExpType(node.getLExp());
		Type rexpType = this.mCurrentST.getExpType(node.getRExp());
		if ((lexpType == Type.INT || lexpType == Type.BYTE) && (rexpType == Type.INT || rexpType == Type.BYTE)) {
			this.mCurrentST.setExpType(node, Type.INT);
		} else {
			throw new SemanticException("Operands to + operator must be INT or BYTE", node.getLExp().getLine(),
					node.getLExp().getPos());
		}
	}

	public void outMinusExp(MinusExp node) {
		Type lexpType = this.mCurrentST.getExpType(node.getLExp());
		Type rexpType = this.mCurrentST.getExpType(node.getRExp());
		if ((lexpType == Type.INT || lexpType == Type.BYTE) && (rexpType == Type.INT || rexpType == Type.BYTE)) {
			this.mCurrentST.setExpType(node, Type.INT);
		} else {
			throw new SemanticException("Operands to - operator must be INT or BYTE", node.getLExp().getLine(),
					node.getLExp().getPos());
		}
	}

	public void outMulExp(MulExp node) {
		Type lexpType = this.mCurrentST.getExpType(node.getLExp());
		Type rexpType = this.mCurrentST.getExpType(node.getRExp());
		if ((lexpType == Type.BYTE) && (rexpType == Type.BYTE)) {
			this.mCurrentST.setExpType(node, Type.INT);
		} else {
			throw new SemanticException("Operands to * operator must be BYTE", node.getLExp().getLine(),
					node.getLExp().getPos());
		}
		this.mCurrentST.setExpType(node, Type.INT);
	}

	public void outMeggySetPixel(MeggySetPixel node) {
		Type xexpType = this.mCurrentST.getExpType(node.getXExp());
		Type yexpType = this.mCurrentST.getExpType(node.getYExp());
		Type cexpType = this.mCurrentST.getExpType(node.getColor());
		if ((xexpType != Type.BYTE) & (yexpType != Type.BYTE)) {
			throw new SemanticException("Parameter for MeggySetPixel must be of type BYTE", node.getXExp().getLine(),
					node.getXExp().getPos());
		}
		if ((cexpType != Type.COLOR)) {
			throw new SemanticException("Parameter for MeggySetPixel must be of type COLOR", node.getColor().getLine(),
					node.getColor().getPos());
		}
	}

	public void outMeggyDelay(MeggyDelay node) {
		if ((this.mCurrentST.getExpType(node.getExp()) != Type.INT)) {
			throw new SemanticException("Parameter for MeggyDelay must be of type INT", node.getExp().getLine(),
					node.getExp().getPos());
		}
	}

	public void outIfStatement(IfStatement node) {
		if (this.mCurrentST.getExpType(node.getExp()) != Type.BOOL) {
			throw new SemanticException("Parameter for IfStatement must be of type BOOL", node.getExp().getLine(),
					node.getExp().getPos());
		}
	}

	public void outWhileStatement(WhileStatement node) {
		if (this.mCurrentST.getExpType(node.getExp()) != Type.BOOL) {
			throw new SemanticException("Parameter for WhileStatement must be of type BOOL", node.getExp().getLine(),
					node.getExp().getPos());
		}
	}

	public void outBlockStatement(BlockStatement node) {
	}

	public void outMainClass(MainClass node) {
	}

	public void outProgram(Program node) {
	}

}