void play() {
  background(#62D4FF);
  drawWorld();
  textAlign(CENTER);
  fill(black);
  textSize(30);
  text("Lives:"+lives, 50, 780);
  actWorld();
  if (touch(player) == true) {
    jump = true;
  } else jump = false;

  if (lives == 0) {
    mode = GAMEOVER;
  }
}
