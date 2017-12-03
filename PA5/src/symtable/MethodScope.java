package symtable;

import java.util.*;
import ast.node.*;

public class MethodScope extends Scope {
	public LinkedHashMap<String, FormalSTE> formals;
	public LinkedHashMap<String, LocalVarSTE> locals;

	public MethodScope(String name) {
		super(name);
		this.formals = new LinkedHashMap<String, FormalSTE>();
		this.locals = new LinkedHashMap<String, LocalVarSTE>();
		this.offsetCount = 3;
	}

	// // Adds a formal STE to the symbols list
	// // Adds a formal STE to the formals list
	// public void addFormal(Formal node) {

	// }

	public FormalSTE lookupFormal(String sym) {
		return formals.get(sym);
	}

	// Return formals to check through
	public LinkedList<VarSTE> getFormals() {
		LinkedList<VarSTE> l = new LinkedList<VarSTE>();
		l.addAll(this.formals.values());
		return l;
	}

	// public void addLocalVar(VarDecl node) {

	// }

	public LocalVarSTE lookupLocalVar(String sym) {
		return locals.get(sym);
	}

	public String toString() {
		String result = "\t\t\t\t Scope of method " + this.name + ":\n";
		result += "\t\t\t\t\tFormals:\n";
		for (FormalSTE ste : formals.values()) {
			result += ste.toString() + "\n";
		}
		result += "\t\t\t\t\tVariables:\n";
		for (LocalVarSTE ste : locals.values()) {
			result += ste.toString() + "\n";
		}
		return result;
	}

}