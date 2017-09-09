// Test new control flow block
import meggy.Meggy;

class PA3Test1 {
	public static void main (String [] args) {
		if (true) {
			Meggy.setPixel((byte)1, (byte)2, Meggy.Color.BLUE);
		}
	}
}
