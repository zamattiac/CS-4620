/* This file was generated by SableCC (http://www.sablecc.org/). 
 * Then modified.
 */

package ast.node;

import ast.visitor.*;

@SuppressWarnings("nls")
public final class IntType extends IType
{

    public IntType(int _line_, int _pos_)
    {
        super(_line_, _pos_);
    }
    
    public String toString() {
		return "int";
	}

    @Override
    public int getNumExpChildren() { return 0; }
    
    @Override
    public Object clone()
    {
        return new IntType(this.getLine(),this.getPos());
    }

    public void accept(Visitor v)
    {
        v.visitIntType(this);
    }

    @Override
    void removeChild(Node child)
    {
        // Remove child
        throw new RuntimeException("Not a child.");
    }

    @Override
    void replaceChild(Node oldChild, Node newChild)
    {
        // Replace child
        throw new RuntimeException("Not a child.");
    }
}
