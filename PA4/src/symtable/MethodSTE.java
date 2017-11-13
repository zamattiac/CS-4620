package symtable;

import java.util.*;
import ast.node.*;

public class MethodSTE extends STE {
	public MethodScope scope;

	public MethodSTE(MethodDecl node) {
		super(node);
		this.name = node.getName();

		if (node.getType() instanceof IntType)
			this.type = Type.INT;
		else if (node.getType() instanceof ByteType)
			this.type = Type.BYTE;
		else if (node.getType() instanceof ColorType)
			this.type = Type.COLOR;
		else if (node.getType() instanceof BoolType)
			this.type = Type.BOOL;
		else if (node.getType() instanceof VoidType)
			this.type = Type.VOID;
		else
			this.type = null;

		scope = new MethodScope(this.name);
	}
	// 	
	// 	// Adds a var STE to the children list
	// 	public void addVar(VarDecl node) {
	// 		scope.addVar(new VarSTE((VarDecl)node, this.offsetCount));
	// 		//System.out.println("Adding var " + node.getName() + " at offset " + this.offsetCount);
	// 		if (node.getType() instanceof IntType) {
	// 			//System.out.println("Allocating 2 bytes space");
	// 			this.offsetCount += 2;
	// 		}
	// 		else {
	// 			//System.out.println("Allocating 1 byte space");
	// 			this.offsetCount+=1;
	// 		}
	// 	}
	// 	
	// 	// Adds a var STE to the symbols list
	// 	public void addFormal(Formal node) {
	// 		VarSTE ste = new VarSTE((Formal)node, this.offsetCount);
	// 		scope.addFormal(ste);
	// 		//System.out.println("Adding formal " + node.getName() + " at offset " + this.offsetCount);
	// 		// Add to formal signature list for checking
	// 		if (node.getType() instanceof IntType) {
	// 			//System.out.println("Allocating 2 bytes space");
	// 			this.offsetCount += 2;
	// 		}
	// 		else {
	// 			//System.out.println("Allocating 1 byte space");
	// 			this.offsetCount+=1;
	// 		}
	// 	}

	public String toString() {
		return "\t\t\t\tMethod STE " + this.name + " returns " + this.type + "\n" + scope;
	}

}
