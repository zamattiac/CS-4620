package symtable;

import java.util.*;
import ast.node.*;

public class MethodSTE extends STE {
	public MethodScope scope;

	public MethodSTE(MethodDecl node, Type t) {
		super(node, t);
		this.name = node.getName();

		scope = new MethodScope(this.name);
	}

	public String toString() {
		return "\t\t\t\tMethod STE " + this.name + " returns " + this.type + "\n" + scope;
	}

}
