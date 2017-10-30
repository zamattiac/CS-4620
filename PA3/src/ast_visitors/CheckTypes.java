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

import symtable.SymTable;
import symtable.Type;
import exceptions.InternalException;
import exceptions.SemanticException;

public class CheckTypes extends DepthFirstVisitor
{
    
   private SymTable mCurrentST;
   
   public CheckTypes(SymTable st) {
     if(st==null) {
          throw new InternalException("unexpected null argument");
      }
      mCurrentST = st;
   }
   
   //========================= Overriding the visitor interface

   public void defaultOut(Node node) {
       System.err.println("Node not implemented in CheckTypes, " + node.getClass());
   }
   
   public void outByteCast(ByteCast node) {
   		if (this.mCurrentST.getExpType(node.getExp()) != Type.BYTE && this.mCurrentST.getExpType(node.getExp()) != Type.INT) {
   			throw new SemanticException(
         "Invalid byte cast",
         node.getExp().getLine(), 
         node.getExp().getPos());
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
   
    public void outAndExp(AndExp node)
    {
      if(this.mCurrentST.getExpType(node.getLExp()) != Type.BOOL) {
        throw new SemanticException(
          "Invalid left operand type for operator &&",
          node.getLExp().getLine(), 
          node.getLExp().getPos());
      }
 
      if(this.mCurrentST.getExpType(node.getRExp()) != Type.BOOL) {
        throw new SemanticException(
          "Invalid right operand type for operator &&",
          node.getRExp().getLine(), 
          node.getRExp().getPos());
      }
 
      this.mCurrentST.setExpType(node, Type.BOOL);
    }
    
    // do not accept int
    public void outEqualExp(EqualExp node)
    {
      if (!(((this.mCurrentST.getExpType(node.getLExp()) == Type.BOOL) &
	 (this.mCurrentST.getExpType(node.getRExp()) == Type.BOOL)) ||
		 ((this.mCurrentST.getExpType(node.getLExp()) == Type.BYTE) &
	 (this.mCurrentST.getExpType(node.getRExp()) == Type.BYTE)) ||
	 ((this.mCurrentST.getExpType(node.getLExp()) ==Type.BUTTON) &
	 (this.mCurrentST.getExpType(node.getRExp()) == Type.BUTTON)) ||
	 ((this.mCurrentST.getExpType(node.getLExp()) == Type.COLOR) &
	 (this.mCurrentST.getExpType(node.getRExp()) == Type.COLOR)))) {
	        throw new SemanticException(
          "Invalid operands aren't of the same type for operator ==",
          node.getLExp().getLine(), node.getLExp().getPos());
      }
 
 
      this.mCurrentST.setExpType(node, Type.BOOL);
    }
    
   public void outNotExp(NotExp node) {
   	if (this.mCurrentST.getExpType(node.getExp()) != Type.BOOL) {
   		throw new SemanticException(
          "Invalid operand type for operator ~",
          node.getExp().getLine(),
          node.getExp().getPos());
   	}
   	this.mCurrentST.setExpType(node, Type.BOOL);
   }
   
    public void outMeggyGetPixel(MeggyGetPixel node)
    {
        Type xexpType = this.mCurrentST.getExpType(node.getXExp());
        Type yexpType = this.mCurrentST.getExpType(node.getYExp());
        if ((xexpType==Type.INT  || xexpType==Type.BYTE) &&
            (yexpType==Type.INT  || yexpType==Type.BYTE)
           ){
            this.mCurrentST.setExpType(node, Type.COLOR);
        } else {
            throw new SemanticException(
                    "Parameters for MeggyGetPixel must be INT or BYTE",
                    node.getXExp().getLine(),
                    node.getXExp().getPos());
        }
    }
	
    public void outNegExp(NegExp node) {
	if (this.mCurrentST.getExpType(node.getExp()) != Type.INT && this.mCurrentST.getExpType(node.getExp()) != Type.BYTE) {
		throw new SemanticException(
	    "Invalid operand type for the operator - (negative)",
	    node.getExp().getLine(),
	    node.getExp().getPos());
	    }
		this.mCurrentST.setExpType(node, Type.INT);
	}
	
    public void outMeggyCheckButton(MeggyCheckButton node) {
	if (this.mCurrentST.getExpType(node.getExp()) != Type.BUTTON) {
		throw new SemanticException(
	    "Invalid button expression for MeggyGetButton",
	    node.getExp().getLine(),
 	    node.getExp().getPos());
	    }
	this.mCurrentST.setExpType(node, Type.BOOL);
	}
   
    public void outPlusExp(PlusExp node)
    {
        Type lexpType = this.mCurrentST.getExpType(node.getLExp());
        Type rexpType = this.mCurrentST.getExpType(node.getRExp());
        if ((lexpType==Type.INT  || lexpType==Type.BYTE) &&
            (rexpType==Type.INT || rexpType==Type.BYTE)
           ){
            this.mCurrentST.setExpType(node, Type.INT);
        } else {
            throw new SemanticException(
                    "Operands to + operator must be INT or BYTE",
                    node.getLExp().getLine(),
                    node.getLExp().getPos()
        	);
        }
    }
    
    public void outMinusExp(MinusExp node)
    {
        Type lexpType = this.mCurrentST.getExpType(node.getLExp());
        Type rexpType = this.mCurrentST.getExpType(node.getRExp());
        if ((lexpType==Type.INT  || lexpType==Type.BYTE) &&
            (rexpType==Type.INT  || rexpType==Type.BYTE)
           ){
            this.mCurrentST.setExpType(node, Type.INT);
        } else {
            throw new SemanticException(
                    "Operands to - operator must be INT or BYTE",
                    node.getLExp().getLine(),
                    node.getLExp().getPos());
        }
    }
    
    public void outMulExp(MulExp node)
    {
        Type lexpType = this.mCurrentST.getExpType(node.getLExp());
        Type rexpType = this.mCurrentST.getExpType(node.getRExp());
        if ((lexpType==Type.BYTE) &&
            (rexpType==Type.BYTE)
           ){
            this.mCurrentST.setExpType(node, Type.INT);
        } else {
            throw new SemanticException(
                    "Operands to * operator must be BYTE",
                    node.getLExp().getLine(),
                    node.getLExp().getPos());
        }
        this.mCurrentST.setExpType(node, Type.INT);
    }

	public void outMeggySetPixel(MeggySetPixel node)
	{
		Type xexpType = this.mCurrentST.getExpType(node.getXExp());
		Type yexpType = this.mCurrentST.getExpType(node.getYExp());
		Type cexpType = this.mCurrentST.getExpType(node.getColor());
		if ((xexpType != Type.BYTE) &
			(yexpType != Type.BYTE)) 
			{ throw new SemanticException(
					"Parameter for MeggySetPixel must be of type BYTE",
					node.getXExp().getLine(),
					node.getXExp().getPos());
			}
		if ((cexpType != Type.COLOR)) {
			throw new SemanticException(
					"Parameter for MeggySetPixel must be of type COLOR",
					node.getColor().getLine(),
					node.getColor().getPos());
			}
	}
	
	public void outMeggyDelay(MeggyDelay node) {
		if ((this.mCurrentST.getExpType(node.getExp()) != Type.INT)) 
		{
			 throw new SemanticException(
			 "Parameter for MeggyDelay must be of type INT",
			 node.getExp().getLine(),
			 node.getExp().getPos());
			 }
		}
		
	public void outIfStatement(IfStatement node) {
		if (this.mCurrentST.getExpType(node.getExp()) != Type.BOOL) 
		{
			throw new SemanticException(
			"Parameter for IfStatement must be of type BOOL",
			node.getExp().getLine(),
			node.getExp().getPos());
			}
	}
	
	public void outWhileStatement(WhileStatement node) {
		if (this.mCurrentST.getExpType(node.getExp()) != Type.BOOL) 
		{
			throw new SemanticException(
			"Parameter for WhileStatement must be of type BOOL",
			node.getExp().getLine(),
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