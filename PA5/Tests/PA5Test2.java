// color param
import meggy.Meggy;

class PA5Test2 {
	public static void main (String [] args) {
		Meggy.setPixel((byte)1, (byte)3, new cl().fn());
	}
}

class cl {
	public Meggy.Color fn() {
		return Meggy.Color.RED;
	}
}
