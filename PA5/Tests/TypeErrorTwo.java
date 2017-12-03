// Error: assignment of integer to byte
import meggy.Meggy;

class TypeErrorTwo {
	public static void main(String[] whatever){
        new C().set();
    }
}

class C {
	int i;
	public byte set() {
		byte j;
		j = i;
		return (byte)2;
	}
}