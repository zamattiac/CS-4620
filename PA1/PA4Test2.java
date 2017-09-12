// byte into int param
import meggy.Meggy;


class PA4Test2 {
	public static void main (String [] args) {
		(new methodClass()).method((byte)2);
	}
}

class methodClass {
	public void method(int i) {
	}
}