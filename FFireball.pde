class FFireball extends FGameObject {


  FFireball(float x, float y) {
    super(3*gridSize, 3*gridSize);
    setName("fireball");
    setPosition(x, y);
    attachImage(fireball);
    setSensor(true);
    setVelocity(5000, getY()-300);
  }

  void act() {
    if (istouching("brick")) {
      world.remove(this);
      world.remove(this);
    }
    if (istouching("player")) {
      lives--;
      world.remove(this);
      world.remove(this);
      player.setVelocity(500000, player.getX()-50);
    }
  }
}
