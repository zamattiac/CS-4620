package symtable;

import java.util.*;
import ast.node.*;

import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.PrintStream;

import exceptions.InternalException;

/** 
 * SymTable
 * ....
 * The symbol table also keeps a mapping of expression nodes to
 * types because that information is needed elsewhere especially
 * when looking up method call information.
 * 
 * @author mstrout
 * WB: Simplified to only expression types
 */
public class SymTable {
    private HashMap<Node, Type> mExpType;
    // Access the nesting level 0 scope here 
    public MainScope main;
    public Stack<Scope> mScopeStack;

    public SymTable() {
        mScopeStack = new Stack<Scope>();
        mExpType = new HashMap<Node, Type>();
        main = new MainScope();
        mScopeStack.push(main);
    }

    public void print() {
        System.out.println(main);
    }

    // TODO: implement DOT output
    public void outputDot(PrintStream stream) {
        stream.println(main);
    }

    public void printStack() {
        Stack<Scope> copy = (Stack<Scope>) mScopeStack.clone();
        while (!copy.empty()) {
            System.out.println(copy.pop().name);
        }
    }

    /** LOOKUPS
    *   Has a general, as well as specialized lookups
    *   using unique methods in each scope type
    */

    // For general, global and local symbols
    // Search from local to global
    public STE lookupSymbol(String sym) {
        Stack<Scope> clone = (Stack<Scope>) this.mScopeStack.clone();
        Scope currentScope = clone.pop();
        STE result = currentScope.lookupSymbol(sym);
        while (result == null) {
            if (clone.empty())
                return null;
            currentScope = clone.pop();
            result = currentScope.lookupSymbol(sym);
        }
        return result;
    }

    // Used to check for redeclaration within a scope
    public STE lookupInnermostSymbol(String sym) {
        Scope currentScope = mScopeStack.peek();
        return currentScope.lookupSymbol(sym);
    }

    // For classes
    // Classes are globally accessible
    public ClassSTE lookupClass(String sym) {
        return main.lookupClass(sym);
    }

    /** Lookup a symbol in innermost scope only.
     * Must be in class scope currently!
     * return null if the symbol is not found
     */

    // Only a class scope may call a method
    public MethodSTE lookupMethod(String sym) {
        ClassScope currentScope = (ClassScope) mScopeStack.peek();
        return currentScope.lookupMethod(sym);
    }
    //     
    //     // For general, global and local variables
    //     // Search from local to global
    //     public VarSTE lookupVar(String sym) {
    // 		Stack<Scope> clone = (Stack<Scope>)this.mScopeStack.clone();
    // 		Scope currentScope = clone.pop();
    // 		VarSTE result = currentScope.lookupVar(sym);
    // 		while (result == null) {
    // 			if (clone.empty()) return null;
    // 			currentScope = clone.pop();
    // 			result = currentScope.lookupVar(sym);
    // 		}
    // 		return result;
    //     }

    // For formals of a method
    // Must be in method scope to access them
    public VarSTE lookupFormal(String sym) {
        MethodScope currentScope = (MethodScope) mScopeStack.peek();
        return currentScope.lookupFormal(sym);
    }

    // Used to get offset with local formals
    public VarSTE lookupInnermostVar(String sym) {
        Scope currentScope = mScopeStack.peek();
        return (VarSTE) currentScope.lookupVar(sym);
    }

    public boolean isVar(String sym) {
        Scope currentScope = mScopeStack.peek();
        return (currentScope.lookupVar(sym) != null);
    }

    /** 
    
    *		INSERT INTO TABLE
    
     */

    // Variable (any scope can add)
    public void insertVar(VarDecl node) {
        Scope top = mScopeStack.peek();
        top.addVar(node);
    }

    // Formal (only insertable into MethodScope)
    public void insertFormal(Formal node) {
        MethodScope top = (MethodScope) mScopeStack.peek();
        top.addFormal(node);
    }

    // Method (only insertable into ClassScope)
    public void insertMethod(MethodDecl node) {
        ClassScope top = (ClassScope) mScopeStack.peek();
        top.addMethod(node);
    }

    // Class (only insertable into MainScope) {
    public void insertClass(TopClassDecl node) {
        MainScope top = (MainScope) mScopeStack.peek();
        top.addClass(node);
    }

    /**
    
     * Lookup the given scope and make it the innermost
    
     * scope.  That is, make it the top of the scope stack.
    
     */

    public void pushClassScope(String id) {
        /* WRITE ME */
        // Can be from any scope
        ClassSTE ste = lookupClass(id);
        if (ste == null) {
            System.err.println("Class " + id + " undefined.");
            System.exit(1);
        }
        this.mScopeStack.push(ste.scope);
    }

    public void pushMethodScope(String id) {
        /* WRITE ME */
        // Must be from the current scope
        MethodSTE ste = lookupMethod(id);
        if (ste == null) {
            System.err.println("Method " + id + " undefined for class " + mScopeStack.peek().name + ".");
            System.exit(1);
        }
        this.mScopeStack.push(ste.scope);
    }

    public void popScope() {
        /* WRITE ME */
        this.mScopeStack.pop();
    }

    public void setExpType(Node exp, Type t)

    {

        this.mExpType.put(exp, t);

    }

    public Type getExpType(Node exp)

    {

        return this.mExpType.get(exp);

    }

}