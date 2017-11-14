/**
 * PA4Test1.java
 * 
 * Test the function definition  and the creation of variables using
 * an identifier for the PA4 grammar
 * CNR 9/12/2017
 */

import meggy.Meggy;

class PA4Test1 {

    public static void main(String[] id) {
            Meggy.setPixel((byte)0, (byte)0, Meggy.Color.BLUE);
            Meggy.delay(1000);
            new Diagonal().Move((byte)0,(byte)0);
        }
}
        
class Diagonal {
    public void Move(byte x, byte y) {
	    if (Meggy.getPixel((byte)7,(byte)7) == Meggy.Color.DARK) {
	      Meggy.setPixel((byte)(x+1), (byte)(y+1), Meggy.Color.BLUE);
	      Meggy.delay(1000);
	      this.Move((byte)(x+1),(byte)(y+1));
	    }
	}
}

