package symtable;

import ast.node.*;

public class MemberVarSTE extends VarSTE {

	public MemberVarSTE(VarDecl node, int heapOffset, Type t) {
		super(node, heapOffset, t);
		this.name = node.getName();
	}
}