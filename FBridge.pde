class FBridge extends FGameObject {

  FBridge(float x, float y) {
    super();
    setPosition(x, y);
    setName("bridge");
    attachImage(bridge);
    setStatic(true);
  }

  void act() {
    if (istouching("player")) {
      setStatic(false);
      setSensor(true);
    }
  }
}
