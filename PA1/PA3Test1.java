// Test new control flow block and boolean expressions and else
import meggy.Meggy;

class PA3Test1 {
	public static void main (String [] args) {
		if (true && true) {
			Meggy.setPixel((byte)1, (byte)2, Meggy.Color.BLUE);
		}
		else {
			Meggy.setPixel((byte)1, (byte)2, Meggy.Color.RED);
		}
	}
}
