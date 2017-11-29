import meggy.Meggy;

class trial {
	public static void main(String[] whatever){
// 		if (-(byte)3 < (byte)2) Meggy.toneStart(Meggy.Tone.C3, 3);
		Meggy.toneStart(Meggy.Tone.C3, 3);
		new c2().c2f1((byte)1, (byte)2, 3);
// 		new c3().c3f1(new c2().c2f1((byte)2));
		//new c3().c3f2(1, (byte)2);
	}
}

class c2 {
	int a;
// 	 c2 a;
	public byte c2f1(byte d, int b, int c) {
		d = (byte)2;
		a = 2;
		return d;
	}
// 	
// 	
// 	public void c2f2() {
// 		Meggy.toneStart(Meggy.Tone.C3, 3);
// 	}
}

// class c3 {
// 	public int c3f1(int i) {
// 		Meggy.toneStart(Meggy.Tone.C3, 3);
// 		return i;
// 	}
// 	
// 	public byte c3f2(int o, byte p) {
// 		Meggy.toneStart(Meggy.Tone.C3, 3);
// 		return p;
// 	}
//}