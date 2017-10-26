import meggy.Meggy;

class delay {
	public static void main(String[] whatever){
		while (true) {
		// Set center color

			if (Meggy.checkButton(Meggy.Button.A)) {
				Meggy.setPixel((byte)4,(byte)4,Meggy.Color.VIOLET);
			}
			if (Meggy.checkButton(Meggy.Button.B)) {
				Meggy.setPixel((byte)4,(byte)4,Meggy.Color.BLUE);
			}
 			//Copycats
 			if (Meggy.checkButton(Meggy.Button.Up)) {
 				Meggy.setPixel((byte)4,(byte)5,Meggy.Color.RED);
 				Meggy.setPixel((byte)4,(byte)4,Meggy.Color.DARK);
 			}
			if (Meggy.checkButton(Meggy.Button.Down)) {
				Meggy.setPixel((byte)4,(byte)3,Meggy.Color.RED);
// 				Meggy.setPixel(4,4,Meggy.Color.DARK);
			}
			if (Meggy.checkButton(Meggy.Button.Left)) {
				Meggy.setPixel((byte)3,(byte)4,Meggy.Color.RED);
// 				Meggy.setPixel(4,4,Meggy.Color.DARK);
			}
			if (Meggy.checkButton(Meggy.Button.Right)) {
				Meggy.setPixel((byte)5,(byte)4,Meggy.Color.RED);
// 				Meggy.setPixel(4,4,Meggy.Color.DARK);
			}
		}
	}
}