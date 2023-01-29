class FHammerbro extends FGameObject {

  int direction = L;
  int speed = 50;
  int frame = 0;
  int timer = 0;

  FHammerbro(float x, float y) {
    super();
    setPosition(x, y);
    setName("hammerbro");
    setRotatable(false);
  }

  void act() {
    animate();
    collide();
    move();
    if (frameCount %100 == 0) hammerthrow();
  }

  void animate() {
    if (frame >= hammerbro.length) frame = 0;
    if (frameCount %5 == 0) {
      if (direction == R) attachImage(hammerbro[frame]);
      if (direction == L) attachImage(reverseImage(hammerbro[frame]));
      frame++;
    }
  }

  void collide() {
    if (istouching("stonewall")) {
      direction *= -1;
      setPosition(getX()+direction, getY());
    }
    if (istouching("lava")) {
      enemies.remove(this);
      world.remove(this);
    }
    if (istouching("player")) {
      if (player.getY() < getY()) {
        world.remove(this);
        enemies.remove(this);
        drop();
      } else {
        ouch();
      }
    }
  }

  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }

  void hammerthrow() {
    FHammer fh = new FHammer(getX(), getY());
    terrain.add(fh);
    world.add(fh);
  }

  void drop() {
    FHeart fh = new FHeart();
    terrain.add(fh);
    world.add(fh);
  }
}
