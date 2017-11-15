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

	public String toString() {
		return "\t\t\t\tMethod STE " + this.name + " returns " + this.type + "\n" + scope;
	}

}
