package symtable;

import java.util.*;
import ast.node.*;

public class ClassSTE extends STE {
	public int offsetCount;
	public ClassScope scope;

	public ClassSTE(TopClassDecl node) {
		super(node, new Type());
		this.name = node.getName();
		scope = new ClassScope(this.name);
		offsetCount = 1;
	}
	// 	
	// 	// Adds a method STE to the children list
	// 	public void addMethod(MethodSTE ste) {
	// 		//System.out.println("Adding method " + ste.name);
	// 		scope.add(ste);
	// 	}
	// 	
	// 	// Adds a var STE to the children list
	// 	public void addVar(VarDecl node) {
	// 		scope.add(new VarSTE((VarDecl)node, this.offsetCount));
	// 		//System.out.println("Adding " + node.getName() + " at offset " + this.offsetCount);
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
		return "\tClass STE " + this.name + " of type " + "TYPE" + "\n" + this.scope;
	}
}
