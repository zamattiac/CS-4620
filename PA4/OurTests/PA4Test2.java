/**
 * PA4Test1.java
 * 
 * Test 'this' and the initialization of int variables using
 * for the PA4 grammar
 *
 * CNR 9/12/2017
 */

import meggy.Meggy;

class PA4Test2 {

    public static void main(String[] id) {
            new Diagonal().Move((byte)0,0);
        }
        }
        
class Diagonal {
    public void Move(byte x, int y) {
	    if (Meggy.getPixel((byte)7,(byte)7) == Meggy.Color.DARK) {
	      Meggy.setPixel((byte)(x), (byte)(y), Meggy.Color.VIOLET);
	      Meggy.delay(1000);     
	      this.Move((byte)(this.incX((byte)x)), (byte)y);
	    }
	}
	
      public int incX(byte a) {
	    return (a+1);
	}
}
