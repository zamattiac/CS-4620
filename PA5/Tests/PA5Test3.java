// assign a byte expression to an int
import meggy.Meggy;

class PA5Test3 {
	public static void main (String [] args) {
		Meggy.setPixel((byte)1, (byte)new cl().fn(), Meggy.Color.GREEN);
	}
}

class cl {
	public int fn() {
		return (byte)4;
	}
}