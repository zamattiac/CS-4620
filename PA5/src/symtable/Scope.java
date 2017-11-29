package symtable;

import java.util.*;
import ast.node.*;

public abstract class Scope {
	public LinkedHashMap<String, STE> symbols;
	public String name;
	public int offsetCount;

	public Scope(String name) {
		this.symbols = new LinkedHashMap<String, STE>();
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

}