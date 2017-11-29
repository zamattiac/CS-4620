package symtable;

import ast.node.*;

public class FormalSTE extends VarSTE {

	public FormalSTE(Formal node, int stackOffset, Type t) {
		super(node, stackOffset, t);
		this.name = node.getName();
	}
}