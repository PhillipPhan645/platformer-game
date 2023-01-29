class FPlayer extends FGameObject {

  int frame;
  int direction;
  boolean collide;


  FPlayer() {
    super();
    direction = R;
    setPosition(50, 1450);
    setName("player");
    setRotatable(false);
    setFillColor(red);
  }

  void act() {
    input();
    collisions();
    animate();
  }


  void collisions() {
    if (istouching("spike")) {
      ouch();
    }
    if (istouching("lava")) {
      ouch();
    }
    if (istouching("water")) {
      world.setGravity(0, 0);
    } else world.setGravity(0, 900);
    if (istouching("heart")) {
      lives++;
      enemies.remove(this);
    }
    if (istouching("chest")) {
      mode = GAMEOVER;
    }
  }




  void input() {
    float vy = getVelocityY();
    float vx = getVelocityX();

    if (abs(vy) < 0.1) {
      action = idle;
    }
    if (wkey && jump == true && collide == false) {
      player.setVelocity(vx, -500);
      action = up;
    }
    if (akey) {
      player.setVelocity(-300, vy);
      action = run;
      direction = L;
    }
    if (skey) {
      player.setVelocity(vx, 600);
    }
    if (dkey) {
      player.setVelocity(300, vy);
      action = run;
      direction = R;
    }
  }


  void animate() {
    if (frame >= action.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (direction == R) attachImage(action[frame]);
      if (direction == L) attachImage(reverseImage(action[frame]));

      frame++;
    }
  }
}
