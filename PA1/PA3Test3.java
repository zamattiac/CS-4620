// Test Meggy.getPixel to set another pixel
import meggy.Meggy;

class PA3Test3 {
	public static void main (String [] args) {
		Meggy.setPixel((byte)1, (byte)2, Meggy.Color.VIOLET);
		// Will cast to int, must recast to byte
		Meggy.setPixel((byte)2, (byte)2, Meggy.getPixel((byte)1, (byte)2));
	}
}
