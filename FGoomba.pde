class FGoomba extends FGameObject {

  int direction = L;
  int speed = 50;
  int frame = 0;
  int i;

  FGoomba(float x, float y) {
    super(gridSize, gridSize);
    setPosition(x, y);
    setName("goomba");
    setRotatable(false);
  }

  void act() {
    animate();
    collide();
    move();
  }

  void animate() {
    if (frame >= goomba.length) frame = 0;
    if (frameCount %5 == 0) {
      if (direction == R) attachImage(goomba[frame]);
      if (direction == L) attachImage(reverseImage(goomba[frame]));
      frame++;
    }
  }

  void collide() {
    if (istouching("stonewall")) {
      direction *= -1;
      setPosition(getX()+direction, getY());
    }
    if (istouching("player")) {
      if (player.getY() < getY()) {
        world.remove(this);
        enemies.remove(this);
        drop();
      } else {
        lives--;
        ouch();
      }
    }
  }

  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }

  void drop() {
    FHeart fh = new FHeart();
    terrain.add(fh);
    world.add(fh);
  }
}
