/**
 * PA4Test1.java
 * 
 * Test the toneStart statement for the PA4 grammar 
 *
 * CNR 9/12/2017
 */

import meggy.Meggy;

class PA4Test5 {

    public static void main(String[] id) {
            new Diagonal().Move((byte)0, (byte)0);
        }
}
 
class Diagonal {
    public void Move(byte x, byte y) {
	    if (Meggy.getPixel((byte)7,(byte)7) == Meggy.Color.DARK) {
	      Meggy.setPixel((byte)(x), (byte)(y), Meggy.Color.BLUE);
	      Meggy.toneStart(Meggy.Tone.F3, 100);
	      Meggy.delay(1000);
	      this.Move((byte)(x+1),(byte)(y+1));
	    }
	}
}