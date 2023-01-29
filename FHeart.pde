class FHeart extends FGameObject {

  FHeart() {
    super();
    setName("heart");
    setPosition(player.getX(), player.getY()-100);
    attachImage(heart);
    setRotatable(false);
    setStatic(false);
  }

  void act() {
    if (istouching("player")) {
      enemies.remove(this);
      world.remove(this);
    }
    if (istouching("lava")) {
      enemies.remove(this);
      world.remove(this);
    }
  }
}
