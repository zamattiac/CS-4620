package symtable;

import java.util.*;
import ast.node.*;

public class ClassScope extends Scope {
	public LinkedHashMap<String, MemberVarSTE> vars;
	public LinkedHashMap<String, MethodSTE> methods;
	public int classSize;

	public ClassScope(String name) {
		super(name);
		this.methods = new LinkedHashMap<String, MethodSTE>();
		this.vars = new LinkedHashMap<String, MemberVarSTE>();
		this.offsetCount = 0;
		this.classSize = 0;
	}

	// // Adds a member var STE to the symbols list
	// public void addMemberVar(VarDecl node) {

	// }

	public MemberVarSTE lookupMemberVar(String sym) {
		return vars.get(sym);
	}

	public LinkedList<MemberVarSTE> getMemberVars() {
		LinkedList<MemberVarSTE> l = new LinkedList<MemberVarSTE>();
		l.addAll(this.vars.values());
		return l;
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