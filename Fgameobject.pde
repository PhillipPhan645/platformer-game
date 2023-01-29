class FGameObject extends FBox {

  final int L = -1;
  final int R = 1;

  FGameObject() {
    super(gridSize, gridSize);
    world.setGravity(0, 900);
  }

  FGameObject(float w, float h) {
    super(w, h);
  }


  void act() {
  }

  boolean istouching(String n) {
    ArrayList<FContact> contacts = getContacts();
    for (int i = 0; i < contacts.size(); i++) {
      FContact fc = contacts.get(i);
      if (fc.contains(n)) {
        return true;
      }
    }
    return false;
  }
}
