class FHammer extends FGameObject {


  FHammer(float x, float y) {
    super();
    setName("throw");
    setPosition(x, y);
    attachImage(hammer);
    setSensor(true);
    setVelocity(random(-300, 300), -400);
    setAngularVelocity(50);
  }

  void act() {
    if (istouching("lava")) {
      world.remove(this);
      world.remove(this);
    }
    if (istouching("player")) {
      lives--;
      world.remove(this);
      world.remove(this);
    }
  }
}
