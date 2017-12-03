package symtable;

import ast.node.*;

public class VarSTE extends STE {
	public int offset;
	// For class instances, track type name
	public String classTypeName;

	public VarSTE(Node node, int offset, Type t) {
		super(node, t);
		this.offset = offset;
		classTypeName = "";
	}

	public String toString() {
		String retVal = "\t\t\t\t\t\t var \t";
		retVal += this.name + " " + this.type + " " + this.offset + "\n";
		return retVal;
	}
}
