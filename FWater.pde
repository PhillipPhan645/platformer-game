class FWater extends FGameObject {

  int f = (int) random(0, 4);

  FWater(float x, float y) {
    super();
    setPosition(x, y);
    setName("water");
    setStatic(true);
    setSensor(true);
  }




  void act() {
    attachImage(water[f]);
    if (frameCount % 10 == 0) f = f + 1;
    if (f == fram) f = 0;
  }
}
