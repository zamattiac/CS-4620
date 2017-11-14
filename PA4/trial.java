import meggy.Meggy;

class trial {
	public static void main(String[] whatever){
// 		if (-(byte)3 < (byte)2) Meggy.toneStart(Meggy.Tone.C3, 3);
		new c2().c2f2();
		new c3().c3f1((byte)2, 3);
		new c3().c3f2(1, (byte)2);
	}
}

class c2 {
	public int c2f1(byte i, byte n) {
		Meggy.toneStart(Meggy.Tone.C3, 3);
		return i + n;
	}
	
	public void c2f2() {
		Meggy.toneStart(Meggy.Tone.C3, 3);
	}
}

class c3 {
	public int c3f1(byte i, int n) {
		Meggy.toneStart(Meggy.Tone.C3, 3);
		return i;
	}
	
	public byte c3f2(int o, byte p) {
		Meggy.toneStart(Meggy.Tone.C3, 3);
		return p;
	}
}