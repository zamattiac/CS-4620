import meggy.Meggy;

class expressionsAndDelay {
	public static void main(String[] whatever){
		while (true) {
			Meggy.setPixel(0*7, (4+1), Meggy.Color.GREEN);
						Meggy.delay(1000);
			Meggy.setPixel(0+1, (4+1), Meggy.Color.GREEN);
						Meggy.delay(1000);
			Meggy.setPixel(2, (4+1), Meggy.Color.GREEN);
						Meggy.delay(1000);
			Meggy.setPixel(3, (4+1), Meggy.Color.GREEN);
						Meggy.delay(1000);
			Meggy.setPixel((byte)(byte)4, (4+1), Meggy.Color.GREEN);
						Meggy.delay(1000);
			Meggy.setPixel((byte)3+2, (4+1), Meggy.Color.GREEN);
						Meggy.delay(1000);
			Meggy.setPixel((byte)4+(byte)2, (4+1), Meggy.Color.GREEN);
						Meggy.delay(1000);
			Meggy.setPixel(9 - (byte)2, (4+1), Meggy.Color.GREEN);
						Meggy.delay(1000);
		
			
		}
	}
}