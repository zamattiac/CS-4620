// variable declaration and assignment
import meggy.Meggy;

class PA5Test1 {
	public static void main (String [] args) {
		Meggy.setPixel(new cl().function(), (byte)2, Meggy.Color.VIOLET);
	}
}

class cl {
	public byte function() {
		byte i; 
		i = (byte)1;
		return i;
	}
}