package symtable;
import ast.node.*;

public class VarSTE extends STE {
	public int offset;
	
	// For formals
	public VarSTE(Formal node, int offset) {
		super(node);
		this.name = node.getName();
		
		if (node.getType() instanceof IntType) this.type = Type.INT;
		else if (node.getType() instanceof ByteType) this.type = Type.BYTE;
		else if (node.getType() instanceof ColorType) this.type = Type.COLOR;
		else if (node.getType() instanceof BoolType) this.type = Type.BOOL;
		else if (node.getType() instanceof VoidType) this.type = Type.VOID;
		else this.type = null;
		
		this.offset = offset;
	}
	
	// For var decls
	public VarSTE(VarDecl node, int offset) {
		super(node);
		this.name = node.getName();

		if (node.getType() instanceof IntType) this.type = Type.INT;
		else if (node.getType() instanceof ByteType) this.type = Type.BYTE;
		else if (node.getType() instanceof ColorType) this.type = Type.COLOR;
		else if (node.getType() instanceof BoolType) this.type = Type.BOOL;
		else if (node.getType() instanceof VoidType) this.type = Type.VOID;
		else this.type = null;

		this.offset = offset;
	}
	
	public String toString() {
		String retVal = "\t\t\t\t\t\t var \t";
		retVal += this.name + " " + this.type + " " + this.offset + "\n";
		return retVal;
	}
}
