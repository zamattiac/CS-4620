// Make separate classes
// Use linked list
package symtable;

import java.util.*;
import ast.node.*;

import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.PrintStream;

import exceptions.InternalException;

public abstract class STE {
	public Node node;
	public String name;
	public Type type;

	public STE(Node node, Type t) {
		this.node = node;
		this.type = t;
	}

	public String toString() {
		return this.name;
	}
}