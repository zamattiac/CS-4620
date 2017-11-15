package symtable;

import java.util.*;
import ast.node.*;

public class ClassScope extends Scope {
	private LinkedHashMap<String, MethodSTE> methods;

	public ClassScope(String name) {
		super(name);
		this.methods = new LinkedHashMap<String, MethodSTE>();
		this.offsetCount = 1;
	}

	// Adds a method to the class Scope
	public void addMethod(MethodDecl node) {
		MethodSTE newSTE = new MethodSTE(node);
		this.symbols.put(node.getName(), newSTE);
		this.methods.put(node.getName(), newSTE);
	}

	public MethodSTE lookupMethod(String sym) {
		return methods.get(sym);
	}

	// Return formals to check through
	public LinkedList<MethodSTE> getMethods() {
		LinkedList<MethodSTE> l = new LinkedList<MethodSTE>();
		l.addAll(this.methods.values());
		return l;
	}

	public String toString() {
		String result = "\t\t Scope of class " + this.name + ":\n";
		result += "\t\t\tVariables:\n";
		for (VarSTE ste : vars.values()) {
			result += ste.toString() + "\n";
		}
		result += "\t\t\tMethods:\n";
		for (MethodSTE ste : methods.values()) {
			result += ste.toString() + "\n";
		}
		return result;
	}

}