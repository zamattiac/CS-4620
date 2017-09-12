// Has a function declared inside a class, function calls
import meggy.Meggy;


class PA4Test1 {
	public static void main (String [] args) {
		Meggy.setPixel((byte)1, (byte)2, Meggy.Color.VIOLET);
		(new methodClass()).method();
	}
}

class methodClass {
	public void method() {
	}
}