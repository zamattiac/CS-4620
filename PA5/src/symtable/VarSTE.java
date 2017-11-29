package symtable;

import ast.node.*;

public class VarSTE extends STE {
	public int offset;

	public VarSTE(Node node, int offset, Type t) {
		super(node, t);
		this.offset = offset;
	}

	public String toString() {
		String retVal = "\t\t\t\t\t\t var \t";
		retVal += this.name + " " + this.type + " " + this.offset + "\n";
		return retVal;
	}
}
