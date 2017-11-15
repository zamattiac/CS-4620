package symtable;

import java.util.*;
import ast.node.*;

public abstract class Scope {
	protected LinkedHashMap<String, STE> symbols;
	protected LinkedHashMap<String, VarSTE> vars;
	public String name;
	public int offsetCount;

	public Scope(String name) {
		this.symbols = new LinkedHashMap<String, STE>();
		this.vars = new LinkedHashMap<String, VarSTE>();
		this.name = name;
		this.offsetCount = 3;
	}

	// Return symbols to check through
	public LinkedList<STE> getSymbols() {
		LinkedList<STE> l = new LinkedList<STE>();
		l.addAll(this.symbols.values());
		return l;
	}

	// null if not found
	// Look at only elements in that scope! 
	// don't go lower
	public STE lookupSymbol(String sym) {
		return symbols.get(sym);
	}

	// Adds a var STE to the symbols list
	public void addVar(VarDecl node) {
		VarSTE newSTE = new VarSTE(node, this.offsetCount);
		this.symbols.put(newSTE.name, newSTE);
		this.vars.put(newSTE.name, newSTE);
		//System.out.println("Adding var " + node.getName() + " at offset " + this.offsetCount);
		if (node.getType() instanceof IntType) {
			//System.out.println("Allocating 2 bytes space");
			this.offsetCount += 2;
		} else {
			//System.out.println("Allocating 1 byte space");
			this.offsetCount += 1;
		}
	}

	public LinkedList<VarSTE> getVars() {
		LinkedList<VarSTE> l = new LinkedList<VarSTE>();
		l.addAll(this.vars.values());
		return l;
	}

	public VarSTE lookupVar(String sym) {
		return vars.get(sym);
	}
}