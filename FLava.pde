class FLava extends FGameObject {

  int f = (int) random(0, 6);

  FLava(float x, float y) {
    super();
    setPosition(x, y);
    setName("lava");
    setStatic(true);
    setSensor(true);
  }




  void act() {
    attachImage(lava[f]);
    if (frameCount % 10 == 0) f = f + 1;
    if (f == numberOfFrames) f = 0;
  }
}
