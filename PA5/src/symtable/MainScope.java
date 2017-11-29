package symtable;

import java.util.*;
import ast.node.*;

public class MainScope extends Scope {
	private LinkedHashMap<String, ClassSTE> classes;

	//private HashMap<String, STE> methods;
	public MainScope() {
		super("main");
		this.classes = new LinkedHashMap<String, ClassSTE>();
		//this.methods = new HashMap<String, STE>();
		this.offsetCount = 1;
	}

	// Adds a method to the class Scope
	public void addClass(TopClassDecl node) {
		ClassSTE newSTE = new ClassSTE(node);
		this.symbols.put(node.getName(), newSTE);
		this.classes.put(node.getName(), newSTE);
		
	}

	public ClassSTE lookupClass(String sym) {
		return classes.get(sym);
	}

	// Return classes to check through
	public LinkedList<ClassSTE> getClasses() {
		LinkedList<ClassSTE> l = new LinkedList<ClassSTE>();
		l.addAll(this.classes.values());
		return l;
	}

	public String toString() {
		String result = "Main scope of program:\n";
		result += "\tVariables:\n";

		result += "\tClasses:\n";
		for (ClassSTE ste : classes.values()) {
			result += ste.toString() + "\n";
		}
		return result;
	}
}