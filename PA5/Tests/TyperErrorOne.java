// Error: can't return int instead of byte
import meggy.Meggy;

class TyperErrorOne {
	public static void main(String[] whatever){
        new C().set();
    }
}

class C {
	int i;
	public byte set() {
		return i;
	}
}