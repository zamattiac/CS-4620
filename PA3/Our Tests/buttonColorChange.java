import meggy.Meggy;

class buttonColorChange {
	public static void main(String[] whatever){
		while (true) {
			if (Meggy.checkButton(Meggy.Button.Up)) {
				Meggy.setPixel((byte)3, (byte)3, Meggy.Color.GREEN);
			}
			else {
				Meggy.setPixel((byte)3, (byte)3, Meggy.Color.BLUE);
			}
		}
	}
}