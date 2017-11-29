package symtable;

import ast.node.*;

public class LocalVarSTE extends VarSTE {

	public LocalVarSTE(VarDecl node, int stackOffset, Type t) {
		super(node, stackOffset, t);
		this.name = node.getName();
	}
}