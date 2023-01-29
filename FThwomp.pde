class FThwomp extends FGameObject {

  boolean stat;


  FThwomp(float x, float y) {
    super(1.8*gridSize, 2*gridSize);
    setPosition(x, y);
    setName("thwomp");
    setRotatable(false);
    attachImage(sleepthowmp);
    stat = true;
    setFriction(4);
    setStatic(true);
  }






  void act() {
    animate();
    collide();
  }

  void animate() {
    if (player.getY() >= getY() && player.getY() <= getY()+6*gridSize && player.getX() <= getX()+gridSize && player.getX() >= getX()-gridSize) {
      attachImage(awakethowmp);
      setStatic(false);
      stat = false;
    }
  }

  void collide() {
    if (istouching("dirt")) {
      setStatic(true);
      stat = true;
    }
    if (istouching("player") && stat == false) {
      if (player.getY() > getY() ) {
        ouch();
      }
    }
  }

  void movement() {
  }
}
