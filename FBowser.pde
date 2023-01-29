class FBowser extends FGameObject {

  boolean alive = true;

  FBowser(float x, float y) {
    super(3*gridSize, 3*gridSize);
    setPosition(x, y);
    setName("bowser");
    setStatic(true);
    setRotatable(false);
    attachImage(bowser);
  }

  void act() {
    if (frameCount %150 == 0 && alive == true) fireball();
    if (istouching("player")) {
      if (player.getY() < getY()) {
        world.remove(this);
        enemies.remove(this);
        alive = false;
      }
    }
  }




  void fireball() {
    FFireball fb = new FFireball(getX(), getY());
    terrain.add(fb);
    world.add(fb);
  }
}
