package symtable;

import java.util.*;
import ast.node.*;

public class MethodScope extends Scope {
	private LinkedHashMap<String, VarSTE> formals;

	public MethodScope(String name) {
		super(name);
		this.formals = new LinkedHashMap<String, VarSTE>();
	}

	// Adds a formal STE to the symbols list
	// Adds a formal STE to the formals list
	public void addFormal(Formal node) {
		VarSTE newSTE = new VarSTE((Formal) node, this.offsetCount);
		symbols.put(node.getName(), newSTE);
		formals.put(node.getName(), newSTE);
		//System.out.println("Adding formal " + node.getName() + " at offset " + this.offsetCount);
		// Add to formal signature list for checking
		if (node.getType() instanceof IntType) {
			//System.out.println("Allocating 2 bytes space");
			this.offsetCount += 2;
		} else {
			//System.out.println("Allocating 1 byte space");
			this.offsetCount += 1;
		}
	}

	public VarSTE lookupFormal(String sym) {
		return formals.get(sym);
	}

	// Return formals to check through
	public LinkedList<VarSTE> getFormals() {
		LinkedList<VarSTE> l = new LinkedList<VarSTE>();
		l.addAll(this.formals.values());
		return l;
	}

	public String toString() {
		String result = "\t\t\t\t Scope of method " + this.name + ":\n";
		result += "\t\t\t\t\tFormals:\n";
		for (VarSTE ste : formals.values()) {
			result += ste.toString() + "\n";
		}
		result += "\t\t\t\t\tVariables:\n";
		for (VarSTE ste : vars.values()) {
			result += ste.toString() + "\n";
		}
		return result;
	}

}