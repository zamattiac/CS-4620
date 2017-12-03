package symtable;

import java.util.*;
import ast.node.*;

import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.PrintStream;

import exceptions.*;

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
    // allows the parent node to choose to load scope of this,new,ID node for call statements, expressions
    public String childClassName;

    public int heapOffset = 0;

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

    // For member vars of a class
    // May be in method or class scope to access
    public MemberVarSTE lookupMemberVar(String sym) {
        MemberVarSTE ret;
        Scope currentScope = mScopeStack.pop();
        if (currentScope instanceof MethodScope)  {
            ret = ((ClassScope)mScopeStack.peek()).lookupMemberVar(sym);
        }
        else {
            ret = ((ClassScope)mScopeStack.peek()).lookupMemberVar(sym);
        }
        mScopeStack.push(currentScope);
        return ret;
    }

    // Only a class scope may call a method
    public MethodSTE lookupMethod(String sym) {
        ClassScope currentScope = (ClassScope) mScopeStack.peek();
        return currentScope.lookupMethod(sym);
    }

    // For formals of a method
    // Must be in method scope to access them
    public FormalSTE lookupFormal(String sym) {
        MethodScope currentScope = (MethodScope) mScopeStack.peek();
        return currentScope.lookupFormal(sym);
    }

    // For local vars of a method
    // Must be in method scope to access them
    public LocalVarSTE lookupLocalVar(String sym) {
        // System.out.println(mScopeStack.peek());
        MethodScope currentScope = (MethodScope) mScopeStack.peek();
        return currentScope.lookupLocalVar(sym);
    }

    // Used for assign statements, to verify correct type
    // Doesn't care if local or member or formal
    public VarSTE lookupVar(String sym) {
        VarSTE ret = lookupLocalVar(sym);
        if (ret == null) ret = lookupFormal(sym);
        if (ret == null) ret = lookupMemberVar(sym);
        return ret;
    }
    public boolean varIsLocal(String sym) {
        return (lookupLocalVar(sym) != null || lookupFormal(sym) != null);
    }

    /** 
    
    *		INSERT INTO TABLE
    
     */

    public Type getIDType(Node node) {
        // if (n instanceof VarDecl) {
        //     VarDecl node = (VarDecl) n;
        // }
        // if (n instanceof Formal) {
        //     Formal node = (Formal) n;
        // }
        // if (n instanceof MethodDecl) {
        //     MethodDecl node = (MethodDecl) n;
        // }
		IType t = node.getType();
		if (t instanceof IntType)
			return Type.INT;
		else if (t instanceof ByteType)
			return Type.BYTE;
		else if (t instanceof ColorType)
			return Type.COLOR;
		else if (t instanceof BoolType)
			return Type.BOOL;
		else if (t instanceof VoidType)
            return Type.VOID;
        else if (t instanceof ToneType) 
            return Type.TONE;
		// Class variable declaration
		else if (t instanceof ClassType) {
            ClassType type = (ClassType) t;
			ClassSTE c = lookupClass(type.getName()); 
			if (c == null) throw new SemanticException("Class " + type.getName() + " undeclared.", t.getLine(), t.getPos());
			return c.type;
		}
		else 
			return null;
    }

    // MAIN INSERTS
    // only class

    // Class (only insertable into MainScope) {
        public void insertClass(TopClassDecl node) {
            MainScope top = (MainScope) mScopeStack.peek();
            top.addClass(node);
        }
    
    // CLASS INSERTS
    // member var and method decl

    // Member variable (only insertable into ClassScope)
    public void insertMemberVar(VarDecl node) {
        Type type = getIDType(node);
        ClassScope top = (ClassScope) mScopeStack.peek();
        MemberVarSTE newSTE = new MemberVarSTE(node, top.offsetCount, type);
        if (node.getType() instanceof ClassType) newSTE.classTypeName = ((ClassType)node.getType()).getName();
		top.symbols.put(newSTE.name, newSTE);
		top.vars.put(newSTE.name, newSTE);
		top.offsetCount += type.getAVRTypeSize();
    }

    // Method (only insertable into ClassScope)
    public void insertMethod(MethodDecl node) {
        ClassScope top = (ClassScope) mScopeStack.peek();
        MethodSTE newSTE = new MethodSTE(node, getIDType(node));
        top.symbols.put(node.getName(), newSTE);
        top.methods.put(node.getName(), newSTE);
    }

    // METHOD INSERTS
    // formal and local var

    // Local (only insertable into MethodScope)
    public void insertLocalVar(VarDecl node) {
        Type type = getIDType(node);
        MethodScope top = (MethodScope)mScopeStack.peek();
        LocalVarSTE newSTE = new LocalVarSTE(node, top.offsetCount, type);
        if (node.getType() instanceof ClassType) newSTE.classTypeName = ((ClassType)node.getType()).getName();
		top.symbols.put(node.getName(), newSTE);
		top.locals.put(node.getName(), newSTE);
		top.offsetCount += type.getAVRTypeSize();
    }

    // Formal (only insertable into MethodScope)
    public void insertFormal(Formal node) {
        Type type = getIDType(node);
        MethodScope top = (MethodScope) mScopeStack.peek();
        FormalSTE newSTE = new FormalSTE(node, top.offsetCount, type);
		top.symbols.put(node.getName(), newSTE);
		top.formals.put(node.getName(), newSTE);
		top.offsetCount += type.getAVRTypeSize();
    }


    /**
    
     * Lookup the given scope and make it the innermost
    
     * scope.  That is, make it the top of the scope stack.
    
     */

    public void pushClassScope(String id) {
        // Can be from any scope
        ClassSTE ste = lookupClass(id);
        if (ste == null) {
            System.err.println("Class " + id + " undefined.");
            System.exit(1);
        }
        this.mScopeStack.push(ste.scope);
    }

    public void pushMethodScope(String id) {
        // Must be from a class scope scope
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