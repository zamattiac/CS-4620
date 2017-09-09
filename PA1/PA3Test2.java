// Test arithmetic expressions, 
//check that byte is promoted to int
import meggy.Meggy;

class PA3Test2 {
	public static void main (String [] args) {
		Meggy.setPixel((byte)((byte)1 + (byte)1), (byte)2, Meggy.Color.VIOLET);
	}
}
