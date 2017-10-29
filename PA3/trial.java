import meggy.Meggy;

class delay {
	public static void main(String[] whatever){
		//Meggy.setPixel((byte) (-1+2), (byte)2, Meggy.Color.BLUE);
		if ( (byte)4 * (byte)(3+2) == 4) {}
// 		Meggy.delay(((byte)2)+2);
		Meggy.setPixel((byte)2, (byte)2, Meggy.Color.BLUE);
		//Meggy.delay(((byte)2)*(byte)2+2);
		Meggy.setPixel((byte)4, (byte)4, Meggy.getPixel((byte)2, (byte)2));
	}
}